Class helloWorld.bs.customersOrders.list.Service Extends Ens.BusinessService
{

Parameter SETTINGS = "IsAsync:Basic";

Parameter ADAPTER = "Ens.InboundAdapter";

Property Adapter As Ens.InboundAdapter;

Property IsAsync As %Library.Boolean [ InitialExpression = 1 ];

Method OnProcessInput(pRequest As helloWorld.bs.customersOrders.list.Request, Output pResponse As helloWorld.bs.customersOrders.list.Response) As %Library.Status
{
    Set statusMethod = $$$OK

    Try
    {
        Set businessProcessName = "List Customers Orders"

        Set requestBp = ##class(helloWorld.bp.customersOrders.list.Request).%New()

		If (..IsAsync)
		{
	        Set statusBP = ..SendRequestAsync(businessProcessName, requestBp)
		}
		Else
		{
    	    Set statusBP = ..SendRequestSync(businessProcessName, requestBp, .responseBp)
		}

        If ($SYSTEM.Status.IsError(statusBP))
        {
            Throw ##class(%Exception.StatusException).CreateFromStatus(statusBP)
        }
    }
    Catch (exception)
    {
        Set statusMethod = exception.AsStatus()
        $$$LOGERROR($SYSTEM.Status.GetErrorText(statusMethod))
    }

    Return statusMethod
}

}
