/// 
Class User.snext.cube.expedition Extends %DeepSee.CubeDefinition [ DependsOn = snext.categorization.ExpeditionRM.Record, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="snext.cube.expedition" displayName="snext.cube.expedition" disabled="false" abstract="false" sourceClass="snext.categorization.ExpeditionRM.Record" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="ProduitCode" displayName="Product" disabled="false" hasAll="false" allCaption="All ProduitCode" allDisplayName="ProduitCode" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ProduitCode" displayName="Product label" disabled="false" sourceProperty="ProduitCode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="ProduitDésignation" disabled="false" sourceProperty="ProduitDésignation" hidden="false" sort="asc" isName="true" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DonneurdOrdreNom" displayName="originator" disabled="false" hasAll="false" allCaption="All DonneurdOrdreNom" allDisplayName="DonneurdOrdreNom" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="DonneurdOrdreNom" displayName="Originator name" disabled="false" sourceProperty="DonneurdOrdreNom" list="false" useDisplayValue="true" sort="asc" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DatedeSortieMarchandise" displayName="Goods release date" disabled="false" hasAll="false" allCaption="All DatedeSortieMarchandise" allDisplayName="DatedeSortieMarchandise" sourceProperty="DatedeSortieMarchandise" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" displayName="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Quarter" disabled="false" timeFunction="QuarterNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Month" disabled="false" timeFunction="MonthNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Week" displayName="Week number" disabled="false" timeFunction="WeekNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Quantité" displayName="Quantity" disabled="false" sourceProperty="Quantité" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="ProduitDésignation" disabled="false" sourceProperty="ProduitDésignation" aggregate="COUNT" type="string" hidden="false" searchable="false">
  </measure>
</cube>
}

Parameter DOMAIN;

}
