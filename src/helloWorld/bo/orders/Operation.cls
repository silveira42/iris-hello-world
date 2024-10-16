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
</MapItems>
}

Method List(pRequest As helloWorld.bo.orders.list.Request, Output pResponse As helloWorld.bo.orders.list.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.orders.list.Method).Execute(##this, pRequest, .pResponse)
}

}
