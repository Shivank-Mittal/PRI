Class snext.masterdata.scn.ShipOut Extends snext.masterdata.scn.Vertice
{

Method %OnNew(source As snext.masterdata.scn.Node, destination As snext.masterdata.scn.PointOfDelivery) As %Status
{
    If $get(source)="" Quit $$$ERROR($$$GeneralError,"Must Supply source and destination")
    If $get(destination)="" Quit $$$ERROR($$$GeneralError,"Must Supply source and destination")
    if '(source.%IsA("snext.masterdata.scn.StorageSite")) && '(source.%IsA("snext.masterdata.scn.Supplier")) {
        Quit $$$ERROR($$$GeneralError,"Must Supply StorageSite or Supplier as source node")
    }
    set ..source = source
    set ..destination = destination
    quit $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
