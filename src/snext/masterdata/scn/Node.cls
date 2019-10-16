Class snext.masterdata.scn.Node Extends snext.SubscriberEntity [ Abstract ]
{

Property name As %String;

Property location As snext.masterdata.scn.Location;

Property document As %DocDB.Document;

ForeignKey locationFK(location) References snext.masterdata.scn.Location();

ForeignKey documentFK(document) References %DocDB.Document();

Index locationIdx On location [ Type = bitmap ];

Storage Default
{
<Data name="NodeDefaultData">
<Subscript>"Node"</Subscript>
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>location</Value>
</Value>
<Value name="3">
<Value>document</Value>
</Value>
</Data>
<DefaultData>NodeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
