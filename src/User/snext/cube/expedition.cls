/// 
Class User.snext.cube.expedition Extends %DeepSee.CubeDefinition [ DependsOn = snext.categorization.ExpeditionRM.Record, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="snext.cube.expedition" displayName="snext.cube.expedition" disabled="false" abstract="false" sourceClass="snext.categorization.ExpeditionRM.Record" countMeasureName="%Count" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Product" displayName="Product" disabled="false" hasAll="false" allCaption="All ProduitCode" allDisplayName="ProduitCode" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ProductCode" displayName="Product Code" disabled="false" sourceProperty="ProduitCode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="ProductName" displayName="Product Name" disabled="false" sourceProperty="ProduitDesignation" hidden="false" sort="asc" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <dimension name="originator" displayName="originator" disabled="false" hasAll="false" allCaption="All DonneurdOrdreNom" allDisplayName="DonneurdOrdreNom" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="DonneurdOrdreNom" displayName="Originator name" disabled="false" sourceProperty="DonneurdOrdreNom" list="false" useDisplayValue="true" sort="asc" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Period" displayName="Period" disabled="false" hasAll="false" allCaption="All DatedeSortieMarchandise" allDisplayName="DatedeSortieMarchandise" sourceProperty="DatedeSortieMarchandise" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Quarter" disabled="false" timeFunction="QuarterNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Month" disabled="false" timeFunction="MonthNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Dates" disabled="false" hasAll="true" allCaption="All" allDisplayName="All" sourceProperty="DatedeSortieMarchandise" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="Calendar" disabled="false" hidden="false">
      <level name="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="QuarterYear" displayName="Quarter per year" disabled="false" timeFunction="QuarterYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="MonthYear" displayName="Month per year" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Date" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="WeekYear" disabled="false" hasAll="false" allCaption="All DatedeSortieMarchandise" allDisplayName="DatedeSortieMarchandise" sourceProperty="DatedeSortieMarchandise" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Week" disabled="false" timeFunction="WeekYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Date" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Week" disabled="false" hasAll="false" allCaption="All DatedeSortieMarchandise" allDisplayName="DatedeSortieMarchandise" sourceProperty="DatedeSortieMarchandise" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Week" disabled="false" timeFunction="WeekNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Quantite" displayName="Quantity" disabled="false" sourceProperty="Quantite" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <calculatedMember name="2 weeks moving sum" disabled="false" dimension="Measures" valueExpression="SUM(%TimeRange(WeekYear.currentMember,WeekYear.CurrentMember.lead($variable.shipmentdelay)),Measures.Quantite)" hidden="false">
  </calculatedMember>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="DatedeSortieMarchandise,DonneurdOrdreNom,ProduitCode,ProduitDesignation,Quantite">
  </listing>
</cube>
}

Parameter DOMAIN;

}
