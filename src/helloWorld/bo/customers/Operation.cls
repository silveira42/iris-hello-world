Class helloWorld.bo.customers.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

XData MessageMap
{
<MapItems>
	<MapItem MessageType="helloWorld.bo.customers.list.Request">
		<Method>List</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.customers.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.customers.update.Request">
		<Method>Update</Method>
	</MapItem>
</MapItems>
}

Method List(pRequest As helloWorld.bo.customers.list.Request, Output pResponse As helloWorld.bo.customers.list.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.customers.list.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As helloWorld.bo.customers.create.Request, Output pResponse As helloWorld.bo.customers.create.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.customers.create.Method).Execute(##this, pRequest, .pResponse)
}

Method Update(pRequest As helloWorld.bo.customers.update.Request, Output pResponse As helloWorld.bo.customers.update.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.customers.update.Method).Execute(##this, pRequest, .pResponse)
}

}
