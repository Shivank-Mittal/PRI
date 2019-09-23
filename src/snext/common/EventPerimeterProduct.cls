Class snext.common.EventPerimeterProduct Extends %Persistent
{
	Property perimeter as snext.common.EventPerimeter;
	property product as snext.masterdata.Product;
	
	Foreignkey productFK(product) references snext.masterdata.Product() [OnDelete = cascade ];
	Foreignkey perimeterFK(perimeter) references snext.common.EventPerimeter() [OnDelete = cascade ];
	
	index perimeterIdx on perimeter [type = bitmap];
	index productIdx on product [type = bitmap];
	
	
Storage Default
{
<Data name="EventPerimeterProductDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>perimeter</Value>
</Value>
<Value name="3">
<Value>product</Value>
</Value>
</Data>
<DataLocation>^snext.common.EventPerimeC79ED</DataLocation>
<DefaultData>EventPerimeterProductDefaultData</DefaultData>
<IdLocation>^snext.common.EventPerimeC79ED</IdLocation>
<IndexLocation>^snext.common.EventPerimeC79EI</IndexLocation>
<StreamLocation>^snext.common.EventPerimeC79ES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}