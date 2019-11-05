ARG IMAGE=store/intersystems/iris-community:2019.2.0.107.0
ARG IMAGE=intersystems/iris:2019.3.0-stable
ARG IMAGE=store/intersystems/iris-community:2019.3.0.309.0
ARG IMAGE=store/intersystems/iris-community:2019.4.0.379.0
FROM $IMAGE

USER root

WORKDIR /opt/app
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/app
RUN chmod g+w /opt/app

USER ${ISC_PACKAGE_MGRUSER}

COPY  ./Installer.cls ./
COPY ./swagger-client-generated ./swagger-client-generated/
COPY ./src ./src/ 

COPY ./iris-password/password.txt /durable/password/password.txt

RUN iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyId=sys,sys && \
    /bin/echo -e "sys\nsys\n" \
            " Do ##class(Security.Users).UnExpireUserPasswords(\"*\")\n" \
            # Activate ISO 8601 counting for weeks
            # https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=RSQL_week
            " SET ^%SYS(\"sql\",\"sys\",\"week ISO8601\")=1\n" \
            " Do \$system.OBJ.Load(\"/opt/app/Installer.cls\",\"ck\")\n" \
            " Set sc = ##class(App.Installer).setup(, 3)\n" \
            " If 'sc do \$zu(4, \$JOB, 1)\n" \
            " halt" \
    | iris session $ISC_PACKAGE_INSTANCENAME && \
    /bin/echo -e "sys\nsys\n" \
    | iris stop $ISC_PACKAGE_INSTANCENAME quietly

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
