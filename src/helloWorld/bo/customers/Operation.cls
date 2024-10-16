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
</MapItems>
}

Method List(pRequest As helloWorld.bo.customers.list.Request, Output pResponse As helloWorld.bo.customers.list.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.customers.list.Method).Execute(##this, pRequest, .pResponse)
}

}
