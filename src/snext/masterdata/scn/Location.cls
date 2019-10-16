Class snext.masterdata.scn.Location Extends %Persistent
{

Property name As %String;

Property coordinate As snext.geocoder.Coordinate;

Storage Default
{
<Data name="LocationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>coordinate</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
</Data>
<DataLocation>^snext.masterdata.scn.LocationD</DataLocation>
<DefaultData>LocationDefaultData</DefaultData>
<IdLocation>^snext.masterdata.scn.LocationD</IdLocation>
<IndexLocation>^snext.masterdata.scn.LocationI</IndexLocation>
<StreamLocation>^snext.masterdata.scn.LocationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
