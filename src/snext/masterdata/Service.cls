Class snext.masterdata.Service Extends %Persistent
{
	property name as %String;
	property productCode as %Integer;
	
	index pCode on productCode [Unique];
Storage Default
{
<Data name="ServiceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>productCode</Value>
</Value>
</Data>
<DataLocation>^snext.masterdata.ServiceD</DataLocation>
<DefaultData>ServiceDefaultData</DefaultData>
<IdLocation>^snext.masterdata.ServiceD</IdLocation>
<IndexLocation>^snext.masterdata.ServiceI</IndexLocation>
<StreamLocation>^snext.masterdata.ServiceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}