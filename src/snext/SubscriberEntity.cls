Class snext.SubscriberEntity Extends %Persistent [Abstract]
{
	property snextSubscriber as snext.Subscriber;
	
	Foreignkey snextSubscFK(snextSubscriber) references snext.Subscriber() [OnDelete = cascade ];
	index subscriberIndex on snextSubscriber [type = bitmap];


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