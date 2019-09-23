Class snext.common.EventFact Extends %Persistent
{
	//RelationShip event as snext.common.Event [Cardinality = one, Inverse = relatedTo ];
	//RelationShip fact as snext.common.Fact [Cardinality = one, Inverse = relatedTo ];
	//Index eventIndex on event;
	//Index factIndex on fact;
	

Storage Default
{
<Data name="EventFactDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^snext.common.EventFactD</DataLocation>
<DefaultData>EventFactDefaultData</DefaultData>
<IdLocation>^snext.common.EventFactD</IdLocation>
<IndexLocation>^snext.common.EventFactI</IndexLocation>
<StreamLocation>^snext.common.EventFactS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}