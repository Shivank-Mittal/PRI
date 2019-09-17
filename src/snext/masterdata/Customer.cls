Class snext.masterdata.Customer Extends snext.SubscriberEntity
{
	
	property name as %String;

Storage Default
{
<Data name="CustomerDefaultData">
<Subscript>"Customer"</Subscript>
<Value name="1">
<Value>name</Value>
</Value>
</Data>
<DefaultData>CustomerDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}