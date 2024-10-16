Class helloWorld.bo.math.Operation Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
	<MapItem MessageType="helloWorld.bo.math.sum.Request">
		<Method>Sum</Method>
	</MapItem>
    <MapItem MessageType="helloWorld.bo.math.multiply.Request">
        <Method>Multiply</Method>
    </MapItem>
</MapItems>
}

Method Sum(pRequest As helloWorld.bo.math.sum.Request, Output pResponse As helloWorld.bo.math.sum.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.math.sum.Method).Execute(##this, pRequest, .pResponse)
}

Method Multiply(pRequest As helloWorld.bo.math.multiply.Request, Output pResponse As helloWorld.bo.math.multiply.Response) As %Library.Status
{
    Return ##class(helloWorld.bo.math.multiply.Method).Execute(##this, pRequest, .pResponse)
}

}
