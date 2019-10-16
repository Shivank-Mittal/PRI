Class snext.geocoder.Coordinate Extends %SerialObject
{
	property latitude as %Double;
	property longitude as %Double;
	
Storage Default
{
<Data name="CoordinateState">
<Value name="1">
<Value>latitude</Value>
</Value>
<Value name="2">
<Value>longitude</Value>
</Value>
</Data>
<State>CoordinateState</State>
<StreamLocation>^snext.geocoder.CoordinateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}