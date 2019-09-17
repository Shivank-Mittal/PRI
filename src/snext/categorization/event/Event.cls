Class snext.common.Event Extends %Persistent
{
	Property type as %String;
	RelationShip relatedTo as snext.common.EventFact [Cardinality = many, Inverse =  event]; 

Storage Default
{
<Data name="EventDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
</Data>
<DataLocation>^snext.common.EventD</DataLocation>
<DefaultData>EventDefaultData</DefaultData>
<IdLocation>^snext.common.EventD</IdLocation>
<IndexLocation>^snext.common.EventI</IndexLocation>
<StreamLocation>^snext.common.EventS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}