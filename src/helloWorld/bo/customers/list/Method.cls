Include Ensemble

Class helloWorld.bo.customers.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.customers.Operation, pRequest As helloWorld.bo.customers.list.Request, Output pResponse As helloWorld.bo.customers.list.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at list method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpRequest = ##class(%Net.HttpRequest).%New()

	Set httpRequest.ContentCharset	= "UTF-8"
	Set httpRequest.ContentType		= "application/json"

    Set url = "https://run.mocky.io/v3/b780cff1-b40c-484f-95c4-ba44e1b78be5"

    Try {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "GET", httpRequest , "", , url))
    } Catch(exception) {
        $$$LOGERROR("Error sending request at list method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set httpResponseBody = ""

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at list method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set iterator = dynamicResponse.%GetIterator()
    While iterator.%GetNext(.key, .value)
    {
        Set customer = ##class(helloWorld.obj.customers.Customer).%New()

        Set customer.Id = value.id
        Set customer.Name = value.name
        Set customer.Document = value.document

        Do pResponse.Customers.Insert(customer)
    }

    Return $$$OK
}

}
