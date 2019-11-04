/// Management of snext's subscribers<br/>
/// Business logic class defined by OpenAPI in snext.admin.spec<br/>
/// Updated Nov 4, 2019 14:50:38
Class snext.admin.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// By passing in the appropriate options, you can search for
/// available inventory in the system
ClassMethod getSubscribers() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// create a subscriber into the system<br/>
/// The method arguments hold values for:<br/>
///     subscriber, subcriber to add<br/>
ClassMethod createSubscriber(subscriber As %String) As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
