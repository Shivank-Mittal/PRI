Class snext.SubscriberService Extends snext.SubscriberEntity
{

Property service As snext.masterdata.Service;

Property enabled As %Boolean [ InitialExpression = 1 ];

Property serviceParameters As snext.docdb.serviceParameters;

ForeignKey serviceParametersFK(serviceParameters) References snext.docdb.serviceParameters() [ OnDelete = cascade ];

ForeignKey serviceFK(service) References snext.masterdata.Service() [ OnDelete = cascade ];

Index serviceIdx On service [ Type = bitmap ];

Index serviceParamIdx On serviceParameters [ Type = bitmap ];

Storage Default
{
<Data name="SubscriberServiceDefaultData">
<Subscript>"SubscriberService"</Subscript>
<Value name="1">
<Value>service</Value>
</Value>
<Value name="2">
<Value>enabled</Value>
</Value>
<Value name="3">
<Value>serviceParameters</Value>
</Value>
</Data>
<DefaultData>SubscriberServiceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
