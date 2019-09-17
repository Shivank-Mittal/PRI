Class snext.SubcriberEvent Extends %Persistent
{
	property subscriber as snext.Subscriber;
	
	foreignkey subscriberFK(subscriber) references snext.SubcriberEvent() [ondelete = cascade];
	index subscriberIndex on subscriber [Type = bitmap ];

//Relationship subscriber As snext.Subscriber [ Cardinality = parent, Inverse = events ];


Storage Default
{
<Data name="SubcriberEventDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>subscriberID</Value>
</Value>
<Value name="3">
<Value>subscriber</Value>
</Value>
</Data>
<DataLocation>^snext.SubcriberEventD</DataLocation>
<DefaultData>SubcriberEventDefaultData</DefaultData>
<IdLocation>^snext.SubcriberEventD</IdLocation>
<IndexLocation>^snext.SubcriberEventI</IndexLocation>
<StreamLocation>^snext.SubcriberEventS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
