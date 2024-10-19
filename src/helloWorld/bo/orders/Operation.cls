Class helloWorld.bo.orders.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

XData MessageMap
{
<MapItems>
	<MapItem MessageType="helloWorld.bo.orders.list.Request">
		<Method>List</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.orders.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.orders.update.Request">
		<Method>Update</Method>
	</MapItem>
</MapItems>
}

Method List(pRequest As helloWorld.bo.orders.list.Request, Output pResponse As helloWorld.bo.orders.list.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.orders.list.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As helloWorld.bo.orders.create.Request, Output pResponse As helloWorld.bo.orders.create.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.orders.create.Method).Execute(##this, pRequest, .pResponse)
}

Method Update(pRequest As helloWorld.bo.orders.update.Request, Output pResponse As helloWorld.bo.orders.update.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.orders.update.Method).Execute(##this, pRequest, .pResponse)
}

}
