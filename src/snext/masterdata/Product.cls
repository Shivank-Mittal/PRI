Class snext.masterdata.Product Extends snext.SubscriberEntity
{
	property productCode as %String;
	property productLabel as %String (MAXLEN = 2000);
	
	index productCodeIdx on productCode [Unique];

Storage Default
{
<Data name="ProductDefaultData">
<Subscript>"Product"</Subscript>
<Value name="1">
<Value>productCode</Value>
</Value>
<Value name="2">
<Value>productLabel</Value>
</Value>
<Value name="3">
<Value>originator</Value>
</Value>
<Value name="4">
<Value>quantity</Value>
</Value>
</Data>
<DefaultData>ProductDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}