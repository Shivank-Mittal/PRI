Class snext.common.EventPerimeter Extends %Persistent
{
	property event as snext.common.Event;
	property coordinate as snext.geocoder.Coordinate;
	
	foreignkey eventFK(event) references snext.common.Event() [OnDelete = cascade ];
	index eventIdx on event [type = bitmap];


Storage Default
{
<Data name="EventPerimeterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>event</Value>
</Value>
<Value name="3">
<Value>coordinate</Value>
</Value>
</Data>
<DataLocation>^snext.common.EventPerimeterD</DataLocation>
<DefaultData>EventPerimeterDefaultData</DefaultData>
<IdLocation>^snext.common.EventPerimeterD</IdLocation>
<IndexLocation>^snext.common.EventPerimeterI</IndexLocation>
<StreamLocation>^snext.common.EventPerimeterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}