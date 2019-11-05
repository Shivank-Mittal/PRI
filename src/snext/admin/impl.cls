/// Management of snext's subscribers<br/>
/// Business logic class defined by OpenAPI in snext.admin.spec<br/>
/// Updated Nov 4, 2019 14:50:38
Class snext.admin.impl Extends %REST.Impl [ ProcedureBlock ]
{

Parameter SubscriberCreated = 201;

Parameter InvalidInput = 400;

Parameter SubscriberAlreadyExists = 409;

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 1;

/// By passing in the appropriate options, you can search for
/// available inventory in the system
ClassMethod getSubscribers() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    quit {}
}

/// create a subscriber into the system<br/>
/// The method arguments hold values for:<br/>
///     subscriber, subcriber to add<br/>
ClassMethod createSubscriber(subscriber As %String) As %DynamicObject
{
    // (Place business logic here)
    // Do ..%SetStatusCode(<HTTP_status_code>)
    // Do ..%SetHeader(<name>,<value>)
    // Quit (Place response here) ; response may be a string, stream or dynamic object

    set json = {}

    Try {
        If ##class(snext.Subscriber).exists(subscriber) {
            do ..%SetStatusCode(..#SubscriberAlreadyExists)
            set json = {"statusCode":(..#SubscriberAlreadyExists)}
        } else {
            $$$ThrowOnError(##class(snext.config.SubscriberInstaller).installSubscriber(subscriber))
            set json = {"statuscode":(..#SubscriberCreated)}
            do ..%SetStatusCode(..#SubscriberCreated)
        }
    } Catch ex {
        set message = ex.DisplayString()
        do ex.Log()
        set json = {"statuscode":(..#InvalidInput),"message":(message)}
    }

    quit json
}

}
