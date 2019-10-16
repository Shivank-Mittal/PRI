Class snext.common.Event Extends snext.CustomerEntity
{
	property type as %String;
	property perimeter as snext.common.EventPerimeter;

	//RelationShip relatedTo as snext.common.EventFact [Cardinality = many, Inverse =  event]; 


Storage Default
{
<Data name="EventDefaultData">
<Subscript>"Event"</Subscript>
<Value name="1">
<Value>type</Value>
</Value>
<Value name="2">
<Value>perimeter</Value>
</Value>
</Data>
<DefaultData>EventDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}