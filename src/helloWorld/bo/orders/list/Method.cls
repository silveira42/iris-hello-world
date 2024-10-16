Include Ensemble

Class helloWorld.bo.orders.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.orders.Operation, pRequest As helloWorld.bo.orders.list.Request, Output pResponse As helloWorld.bo.orders.list.Response) As %Library.Status
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

    Set url = "https://run.mocky.io/v3/5d27c152-ebf8-4e85-8852-da10852230f2"

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
        Set order = ##class(helloWorld.obj.orders.Order).%New()

        Set order.Id = value.id
        Set order.Details = value.details
        Set order.ProductId = value.productId
        Set order.Quantity = value.quantity
        Set order.CustomerId = value.customerId

        Do pResponse.Orders.Insert(order)
    }

    Return $$$OK
}

}
