/// RECORDMAP: Modified during compilation of RecordMap 'snext.categorization.ExpeditionRM'
/// on 2019-09-14 at 22:44:24.387 [2019-09-14 22:44:24.387 UTC]
/// by user Admin
Class snext.categorization.ExpeditionRMBatch Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "snext_categorization_ExpeditionRMBatch";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm;

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As snext.categorization.ExpeditionRM.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "snext_categorization_ExpeditionRMBatch";

Storage Default
{
<Data name="ExpeditionRMBatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>BatchHeader</Value>
</Value>
<Value name="4">
<Value>BatchTrailer</Value>
</Value>
</Data>
<DataLocation>^snext.cateE894.ExpeditionR8776D</DataLocation>
<DefaultData>ExpeditionRMBatchDefaultData</DefaultData>
<IdLocation>^snext.cateE894.ExpeditionR8776D</IdLocation>
<IndexLocation>^snext.cateE894.ExpeditionR8776I</IndexLocation>
<StreamLocation>^snext.cateE894.ExpeditionR8776S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
