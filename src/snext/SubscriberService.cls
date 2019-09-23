Class snext.SubscriberService extends snext.SubscriberEntity
{
	property service as snext.masterdata.Service;
	property enabled as %Boolean [InitialExpression = 1 ];
	property serviceParameters as snext.docdb.serviceParameters;
	
	Foreignkey serviceParametersFK(serviceParameters) references snext.docdb.serviceParameters() [OnDelete = cascade];
	Foreignkey serviceFK(service) references snext.masterdata.Service() [OnDelete = cascade];
	
	index serviceIdx on service [type = bitmap ];
	index serviceParamIdx on serviceParameters [Type = bitmap ];
	
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