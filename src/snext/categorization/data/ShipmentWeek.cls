Class snext.categorization.data.ShipmentWeek extends %Persistent
{
	property week as %String;
	property shipmentDate as %Date;
	property productCode as %Integer;
	property productDesc as %String;
	property quantity as %Integer;
	
	classmethod ISOWeek(date as %Date) as %String [SqlProc]
	{
		set ISOWeek = ##class(%DeepSee.Time.WeekYear).ISOWEEK(date,.pWeek,.pYear)
		return ISOWeek
	}
	
	//** SQL INSERT
	//** INSERT INTO snext_categorization_data.ShipmentWeek ("week", shipmentDate, productCode, productDesc, quantity)
	//** select {fn week(DatedeSortieMarchandise)}, DatedeSortieMarchandise, ProduitCode, ProduitDesignation, SUM(Quantite)
	//** from snext_categorization_ExpeditionRM.Record
	//** group by {fn week(DatedeSortieMarchandise)}, ProduitCode
 
	classMethod populate()
	{
		&sql(DELETE FROM snext_categorization_data.ShipmentWeek)
		&sql(
			INSERT INTO snext_categorization_data.ShipmentWeek (week, shipmentDate, productCode, productDesc, quantity)
			SELECT snext_categorization_data.ShipmentWeek_ISOWeek(DatedeSortieMarchandise), DatedeSortieMarchandise, ProduitCode, ProduitDesignation, SUM(Quantite)
			FROM snext_categorization_ExpeditionRM.Record
			GROUP BY snext_categorization_data.ShipmentWeek_ISOWeek(DatedeSortieMarchandise), ProduitCode)
	}
	
	


Storage Default
{
<Data name="ShipmentWeekDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>week</Value>
</Value>
<Value name="3">
<Value>shipmentDate</Value>
</Value>
<Value name="4">
<Value>productCode</Value>
</Value>
<Value name="5">
<Value>productDesc</Value>
</Value>
<Value name="6">
<Value>quantity</Value>
</Value>
</Data>
<DataLocation>^snext.categor7D44.ShipmentWeekD</DataLocation>
<DefaultData>ShipmentWeekDefaultData</DefaultData>
<IdLocation>^snext.categor7D44.ShipmentWeekD</IdLocation>
<IndexLocation>^snext.categor7D44.ShipmentWeekI</IndexLocation>
<StreamLocation>^snext.categor7D44.ShipmentWeekS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}