Include Ensemble

Class helloWorld.bo.customers.update.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.customers.Operation, pRequest As helloWorld.bo.customers.update.Request, Output pResponse As helloWorld.bo.customers.update.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at update method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpRequest = ##class(%Net.HttpRequest).%New()

	Set httpRequest.ContentCharset	= "UTF-8"
	Set httpRequest.ContentType		= "application/json"

    Set customer = pRequest.Customer

	$$$ThrowOnError(customer.%JSONExportToString(.httpRequestBody))

    Set customer = httpRequestBody

    Set url = "https://run.mocky.io/v3/b780cff1-b40c-484f-95c4-ba44e1b78be5/" _ pRequest.Customer.Id

    Try {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "PUT", httpRequest , "", customer, url))
    } Catch(exception) 
    {
        $$$LOGERROR("Error sending request at update method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpResponseBody = ""

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at update method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set customer = ##class(helloWorld.obj.customers.Customer).%New()

    Set customer.Id = dynamicResponse.id
    Set customer.Name = dynamicResponse.name
    Set customer.Document = dynamicResponse.document

    Set pResponse.Customer = customer

    Return $$$OK
}

}
