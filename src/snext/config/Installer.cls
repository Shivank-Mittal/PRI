Class snext.config.SubscriberInstaller
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="CORE_DBNAME" Value="SNEXT"/>
  <Default Name="DBNAME" Value="SUBSCRIBER"/>
  <Default Name="APPPATH" Dir="/opt/app/"/>

  <Default Name="NAMESPACE" Value="${DBNAME}"/>
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" />

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="yes" Resource="${RESOURCE}"/>
      <Database Name="${DBNAME}-DATA" Dir="${APPPATH}${DBNAME}-DATA" Create="yes" Resource="${RESOURCE}"/>
      <ClassMapping Package="snext" From="${CORE_DBNAME}-CODE"/>
    </Configuration>
  </Namespace>
</Manifest>
}

ClassMethod installSubscriber(name As %String, ByRef GUID As %Binary) As %Status
{
  set sc = $$$OK
  try {
    set subscriber = ##class(snext.Subscriber).%New(name)
    $$$ThrowOnError(subscriber.%Save())
    set GUID = ##class(snext.Subscriber).%GUID(subscriber.%Oid())
    set pVars("DBNAME") = "Sub-"_GUID
    $$$ThrowOnError(##class(snext.config.SubscriberInstaller).setup(.pVars))
    $$$ThrowOnError(subscriber.initDocDBs())
  } catch exp {
    set sc = exp.AsStatus()
  }
  quit sc
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "MyInstall")
}

}
