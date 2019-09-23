Class snext.common.Impact Extends %Persistent
{
	property event as snext.common.Event;
	
	foreignkey eventFK(event) references snext.common.Event() [OnDelete = cascade ];
	index enventIdx on event [type = bitmap];

Storage Default
{
<Data name="ImpactDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>event</Value>
</Value>
</Data>
<DataLocation>^snext.common.ImpactD</DataLocation>
<DefaultData>ImpactDefaultData</DefaultData>
<IdLocation>^snext.common.ImpactD</IdLocation>
<IndexLocation>^snext.common.ImpactI</IndexLocation>
<StreamLocation>^snext.common.ImpactS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}