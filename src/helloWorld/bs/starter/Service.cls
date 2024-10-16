Class helloWorld.bs.starter.Service Extends Ens.BusinessService
{

Parameter SETTINGS = "BusinessProcessName:Basic,BusinessProcessRequestClass:Basic,IsAsync:Basic";

Parameter ADAPTER = "Ens.InboundAdapter";

Property Adapter As Ens.InboundAdapter;

Property BusinessProcessName As %Library.String(MAXLEN = "");

Property BusinessProcessRequestClass As %Library.String(MAXLEN = "");

Property IsAsync As %Library.Boolean [ InitialExpression = 1 ];

Method OnProcessInput(pRequest As helloWorld.bs.starter.Request, Output pResponse As helloWorld.bs.starter.Response) As %Library.Status
{
    Set statusMethod = $$$OK

    Try
    {
        If (..BusinessProcessName = "")
        {
            Throw ##class(%Exception.General).%New("Bussines Process Name não pode ser vazio")
        }

        If (..BusinessProcessRequestClass = "")
        {
            Throw ##class(%Exception.General).%New("Bussines Process Request Class não pode ser vazio")
        }

        Set requestBp = $CLASSMETHOD(..BusinessProcessRequestClass, "%New")

		If (..IsAsync)
		{
	        Set statusBP = ..SendRequestAsync(..BusinessProcessName, requestBp)
		}
		Else
		{
    	    Set statusBP = ..SendRequestSync(..BusinessProcessName, requestBp, .responseBp)
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
