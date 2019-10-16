Class snext.masterdata.scn.Customer Extends snext.masterdata.scn.Node
{

Property name As %String;

Storage Default
{
<Data name="CustomerDefaultData">
<Subscript>"Customer"</Subscript>
<Value name="1">
<Value>name</Value>
</Value>
</Data>
<DefaultData>CustomerDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
