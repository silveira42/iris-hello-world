Class helloWorld.bo.product.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

XData MessageMap
{
<MapItems>
	<MapItem MessageType="helloWorld.bo.product.list.Request">
		<Method>List</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.product.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="helloWorld.bo.product.update.Request">
		<Method>Update</Method>
	</MapItem>
</MapItems>
}

Method List(pRequest As helloWorld.bo.product.list.Request, Output pResponse As helloWorld.bo.product.list.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.product.list.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As helloWorld.bo.product.create.Request, Output pResponse As helloWorld.bo.product.create.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.product.create.Method).Execute(##this, pRequest, .pResponse)
}

Method Update(pRequest As helloWorld.bo.product.update.Request, Output pResponse As helloWorld.bo.product.update.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.product.update.Method).Execute(##this, pRequest, .pResponse)
}

}
