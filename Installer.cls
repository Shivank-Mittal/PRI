Class App.Installer
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="NAMESPACE" Value="SNEXT"/>
  <Default Name="DBNAME" Value="SNEXT"/>
  <Default Name="APPPATH" Dir="/opt/app/" />
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" />

  <Resource Description="Ressource pour l'accès aux applications d'administration snext" Name="%SNEXT_ADMIN" Permission=""/>

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="yes" Resource="${RESOURCE}-CODE"/>
      <Database Name="${DBNAME}-DATA" Dir="${APPPATH}${DBNAME}-DATA" Create="yes" Resource="${RESOURCE}-DATA"/>
    </Configuration>
  </Namespace>
  <Namespace Name="${NAMESPACE}-ADMIN" Code="${DBNAME}-CODE" Data="${DBNAME}-ADMIN-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="no" Resource="${RESOURCE}-CODE"/>
      <Database Name="${DBNAME}-ADMIN-DATA" Dir="${APPPATH}${DBNAME}-ADMIN-DATA" Create="yes" Resource="${RESOURCE}-ADMIN-DATA"/>
      <Database Name="${DBNAME}-ADMIN-CODE" Dir="${APPPATH}${DBNAME}-ADMIN-CODE" Create="yes" Resource="${RESOURCE}-ADMIN-CODE"/>
      <ClassMapping Package="snext.admin" From="${DBNAME}-ADMIN-CODE"/>
      <Invoke Class="%REST.API" Method="CreateApplication" CheckStatus="1">
        <Arg Value="snext.admin"/>
        <Arg Value="/opt/app/src/swagger-client-generated/swagger.json"/>
      </Invoke>
    </Configuration>
  </Namespace>
  <Namespace Name="%SYS">
    <Invoke Class="App.Installer" Method="createRESTApp" CheckStatus="1">
      <Arg Value="${NAMESPACE}-ADMIN"/>
      <Arg Value="/api/admin"/>
      <Arg Value="snext.admin.disp"/>
    </Invoke>
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "MyInstall")
}

ClassMethod createRESTApp(namespace As %String, URL As %String, dispatchClass As %String, grant As %String) As %Status
{
  write "Create web application ...",!
  set webProperties("NameSpace") = namespace
  set webName = URL
  set webProperties("Enabled") = 1
  set webProperties("AutheEnabled") = 32
  set webProperties("DispatchClass") = dispatchClass
  set status = ##class(Security.Applications).Create(webName, .webProperties)
  quit:$$$ISERR(status) status
  write "Web application """_webName_""" was created!",!
  quit $$$OK
}

}
