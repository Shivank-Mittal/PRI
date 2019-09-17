Class snext.common.Fact extends %Persistent [Abstract]
{
	RelationShip relatedTo as snext.common.EventFact [Cardinality = many, Inverse =  fact];
	
Storage Default
{
<Data name="FactDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^snext.common.FactD</DataLocation>
<DefaultData>FactDefaultData</DefaultData>
<IdLocation>^snext.common.FactD</IdLocation>
<IndexLocation>^snext.common.FactI</IndexLocation>
<StreamLocation>^snext.common.FactS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}