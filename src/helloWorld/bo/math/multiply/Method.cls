Include Ensemble

Class helloWorld.bo.math.multiply.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.math.Operation, pRequest As helloWorld.bo.math.multiply.Request, Output pResponse As helloWorld.bo.math.multiply.Response) As %Library.Status
{
    Try 
    {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at Multiply method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set pResponse.Product = pRequest.A * pRequest.B

    Return $$$OK
}

}
