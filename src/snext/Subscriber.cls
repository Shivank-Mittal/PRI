Class snext.Subscriber Extends %Persistent
{
	property name;
	property active as %Boolean;

	//relationship events as snext.SubcriberEvent [Cardinality = children, Inverse = subscriber ];

Storage Default
{
<Data name="SubscriberDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>active</Value>
</Value>
</Data>
<DataLocation>^snext.SubscriberD</DataLocation>
<DefaultData>SubscriberDefaultData</DefaultData>
<IdLocation>^snext.SubscriberD</IdLocation>
<IndexLocation>^snext.SubscriberI</IndexLocation>
<StreamLocation>^snext.SubscriberS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}