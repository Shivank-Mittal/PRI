Class snext.categorization.data.Shipment Extends (snext.common.Fact, snext.SubscriberEntity)
{
	property shipmentDate as %Date;
	property product as snext.masterdata.Product;
	property quantity as %Integer;
	property originator as snext.masterdata.Customer;
	
	
	foreignkey productFK(product) references snext.masterdata.Product() [OnDelete = cascade];
	foreignkey originatorFK(product) references snext.masterdata.Customer() [OnDelete = cascade];
	
	index productIdx on product [type = bitmap];
	index originatorIdx on originator [type = bitmap];

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
<Value name="5">
<Value>quantity</Value>
</Value>
<Value name="6">
<Value>originator</Value>
</Value>
</Data>
<DefaultData>ShipmentDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}