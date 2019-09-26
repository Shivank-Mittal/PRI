Class snext.masterdata.scn.Supplier Extends snext.masterdata.scn.Node
{

Property isInternal As %Boolean;

Storage Default
{
<Data name="SupplierDefaultData">
<Subscript>"Supplier"</Subscript>
<Value name="1">
<Value>isInternal</Value>
</Value>
</Data>
<DefaultData>SupplierDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
