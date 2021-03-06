Class App.Installer
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="NAMESPACE" Value="SNEXT"/>
  <Default Name="DBNAME" Value="SNEXT"/>
  <Default Name="APPPATH" Dir="/opt/app"/>
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" />
  <Default Name="SourceDir" Value="${APPPATH}src"/>
  <Default Name="SwaggerDir" Value="${APPPATH}swagger-client-generated"/>

  <Resource Description="Ressource pour l'accès aux applications d'administration snext" Name="%SNEXT_ADMIN" Permission=""/>

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="yes" Resource="${RESOURCE}-CODE"/>
      <Database Name="${DBNAME}-DATA" Dir="${APPPATH}${DBNAME}-DATA" Create="yes" Resource="${RESOURCE}-DATA"/>
    </Configuration>
    <Import File="${SourceDir}" Flags="ck" Recurse="1" IgnoreErrors="1"/>
    <Invoke Class="%REST.API" Method="CreateApplication" CheckStatus="1">
        <Arg Value="snext.admin"/>
        <Arg Value="${SwaggerDir}/swagger.json"/>
    </Invoke>
  </Namespace>
  <Namespace Name="%SYS">
    <Invoke Class="App.Installer" Method="createRESTApp" CheckStatus="1">
      <Arg Value="${NAMESPACE}"/>
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

ClassMethod createCoreAPIs(swaggerFile As %String) As %Status
{
  quit ##class(%REST.API).CreateApplication("snext.admin", swaggerFile)
}

}
