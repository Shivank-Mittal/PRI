Class snext.SubscriberEntity Extends %Persistent [ Abstract ]
{

Property snextSubscriber As snext.Subscriber;

ForeignKey snextSubscFK(snextSubscriber) References snext.Subscriber() [ OnDelete = cascade ];

Index subscriberIndex On snextSubscriber [ Type = bitmap ];

Storage Default
{
<Data name="SubscriberEntityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>snextSubscriber</Value>
</Value>
</Data>
<DataLocation>^snext.SubscriberEntityD</DataLocation>
<DefaultData>SubscriberEntityDefaultData</DefaultData>
<IdLocation>^snext.SubscriberEntityD</IdLocation>
<IndexLocation>^snext.SubscriberEntityI</IndexLocation>
<StreamLocation>^snext.SubscriberEntityS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
