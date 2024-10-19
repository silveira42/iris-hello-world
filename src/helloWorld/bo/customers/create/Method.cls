Include Ensemble

Class helloWorld.bo.customers.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.customers.Operation, pRequest As helloWorld.bo.customers.create.Request, Output pResponse As helloWorld.bo.customers.create.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at create method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpRequest = ##class(%Net.HttpRequest).%New()

	Set httpRequest.ContentCharset	= "UTF-8"
	Set httpRequest.ContentType		= "application/json"

    Set customer = pRequest.Customer

	$$$ThrowOnError(customer.%JSONExportToString(.httpRequestBody))

    Set customer = httpRequestBody

    Set url = "https://run.mocky.io/v3/b780cff1-b40c-484f-95c4-ba44e1b78be5"

    Try {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest , "", customer, url))
    } Catch(exception) {
        $$$LOGERROR("Error sending request at create method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpResponseBody = ""

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at create method: " _ exception.DisplayString())
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
