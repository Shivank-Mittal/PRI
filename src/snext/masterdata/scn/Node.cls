Class snext.masterdata.scn.Node Extends snext.SubscriberEntity [ Abstract ]
{

Property id As %BigInt;

Index idIdx On id [ PrimaryKey ];

Storage Default
{
<Data name="NodeDefaultData">
<Subscript>"Node"</Subscript>
<Value name="1">
<Value>id</Value>
</Value>
</Data>
<DefaultData>NodeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
