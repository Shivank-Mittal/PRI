Class App.snext.Installer
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="NAMESPACE" Value="SNEXT"/>
  <Default Name="DBNAME" Value="SNEXT"/>
  <Default Name="APPPATH" Dir="/opt/app/" />
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" />

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="no" Ensemble="1">
    <Invoke Class="App.snext.Installer" Method="initDocDB" CheckStatus="1">
      <Arg Value="${}" />
    </Invoke>
  </Namespace>

</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "MyInstall")
}

ClassMethod Run(snextConfigJSONFile As %String) As %Status
{
  return $$$OK
}

}
