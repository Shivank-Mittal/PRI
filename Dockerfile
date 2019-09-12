FROM store/intersystems/iris-community:2019.2.0.107.0

COPY ./iris-password/password.txt /durable/password/password.txt
