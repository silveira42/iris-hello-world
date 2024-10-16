Include Ensemble

Class helloWorld.bo.math.sum.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.math.Operation, pRequest As helloWorld.bo.math.sum.Request, Output pResponse As helloWorld.bo.math.sum.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at Sum method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set pResponse.Result = pRequest.A + pRequest.B

    Return $$$OK
}

}
