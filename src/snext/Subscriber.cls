Class snext.Subscriber Extends %Persistent
{

Property name As %String [ Required ];

Property active As %Boolean;

Property docDBs As array Of %DocDB.Database;

Method %OnNew(initvalue As %String) As %Status
{
    If $get(initvalue)="" Quit $$$ERROR($$$GeneralError,"Must supply a name")
    Set ..name=initvalue
    Quit $$$OK
}

Method initDocDBs() As %Status
{
	#dim exp as ##class(%Exception.AbstractException)

	set status = $$$OK
	try {
		set ptr = 0
		set prefix = ""
		set ..docDBs = ##class(%Library.ArrayOfDataTypes).%New()
		$$$ThrowOnError(..getDocDBConfig(.list, .isPrefixed))
		set:$get(isPrefixed, 0) prefix = ..generatePrefix()
		$$$ThrowOnError(..createRelatedDocDBs(prefix, list))
	} catch exp {
		do exp.Log()
		set status = exp.AsStatus()
	}
	quit status
}

Method dropDocDBs() As %Status
{
	set status = $$$OK
	try {
		set key = ..docDBs.Next("")
		while (key '= "") {
			do ##class(%DocDB.Database).%DropDatabase(..docDBs.GetAt(key).Name)
			set key = ..docDBs.Next(key)
		}
		$$$ThrowOnError(..docDBs.Clear())
		
	} catch exp {
		do exp.Log()
		set status = exp.AsStatus()
	}
	quit status
}

Method getDocDBConfig(Output list As %String, Output isPrefixed As %Boolean) As %Status [ Internal ]
{
	set status = $$$OK
	try {
		set list = $listbuild("PointOfDelivery",
			"StorageSite",
			"Supplier",
			"PointOfSales",
			"Customer",
			"DeliveryRequest",
			"ShipmentRequest",
			"ShipOut",
			"Order")
		set isPrefixed = 1
	} catch exp {
		do exp.Log()
		set status = exp.AsStatus()
	}
	quit status
}

Method generatePrefix() As %String [ Internal ]
{
	quit ("snext.docdb."_..name)
}

Method createRelatedDocDBs(prefix As %String, list As %String) As %Status [ Internal ]
{
	set status = $$$OK
	try {
		set ptr = 0
		while $listnext(list, ptr, docDb) {
			set db = ##class(%DocDB.Database).%CreateDatabase(prefix_docDb)
			$$$ThrowOnError(..docDBs.SetAt(db, docDb))
		}
	} catch exp {
         do exp.Log()
		 set status = exp.AsStatus()
	}
	quit status
}

Index nameIdx On name [ Unique ];

// relationship events as snext.SubcriberEvent [Cardinality = children, Inverse = subscriber ];

Storage Default
{
<Data name="SubscriberDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>active</Value>
</Value>
<Value name="4">
<Value>docDBs</Value>
</Value>
</Data>
<DataLocation>^snext.SubscriberD</DataLocation>
<DefaultData>SubscriberDefaultData</DefaultData>
<IdLocation>^snext.SubscriberD</IdLocation>
<IndexLocation>^snext.SubscriberI</IndexLocation>
<StreamLocation>^snext.SubscriberS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
