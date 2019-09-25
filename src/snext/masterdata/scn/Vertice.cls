Class snext.masterdata.scn.Vertice Extends %Persistent [ Abstract ]
{

Property source As snext.masterdata.scn.Node;

Property destination As snext.masterdata.scn.Node;

Index destinationIdx On destination [ Unique ];

Index sourceIdx On source [ Unique ];

Storage Default
{
<Data name="VerticeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>source</Value>
</Value>
<Value name="3">
<Value>destination</Value>
</Value>
</Data>
<DataLocation>^snext.masterdata.scn.VerticeD</DataLocation>
<DefaultData>VerticeDefaultData</DefaultData>
<IdLocation>^snext.masterdata.scn.VerticeD</IdLocation>
<IndexLocation>^snext.masterdata.scn.VerticeI</IndexLocation>
<StreamLocation>^snext.masterdata.scn.VerticeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
