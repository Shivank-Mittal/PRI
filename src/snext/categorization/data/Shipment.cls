Class snext.categorization.data.Shipment Extends (snext.common.Fact, snext.SubscriberEntity)
{
	property shipmentDate as %Date;
	property product as snext.masterdata.Product;
	
	foreignkey productFK(product) references snext.masterdata.Product();
	index productIDX on product [type = bitmap];

Storage Default
{
<Data name="ShipmentDefaultData">
<Subscript>"Shipment"</Subscript>
<Value name="1">
<Value>snextSubscriber</Value>
</Value>
<Value name="2">
<Value>shipmentDate</Value>
</Value>
<Value name="3">
<Value>product</Value>
</Value>
<Value name="4">
<Value>snextcustomer</Value>
</Value>
</Data>
<DefaultData>ShipmentDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}