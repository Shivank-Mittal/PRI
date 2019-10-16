Class snext.masterdata.scn.StorageSite extends snext.masterdata.scn.Node
{
	//property nodeID as %BigInt;
	//property location as snext.geocoder.Coordinate;
	
	//Foreignkey NodeFK(nodeID) references snext.masterdata.Node(nodeIDIdx) [OnDelete = cascade];
	//index nodeIdx on nodeID [Type = bitmap ];
	




Storage Default
{
<Type>%Storage.Persistent</Type>
}

}