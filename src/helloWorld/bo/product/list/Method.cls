Include Ensemble

Class helloWorld.bo.product.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.product.Operation, pRequest As helloWorld.bo.product.list.Request, Output pResponse As helloWorld.bo.product.list.Response) As %Library.Status
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
        Set product = ##class(helloWorld.obj.product.Product).%New()

        Set product.Id = value.Id
        Set product.Details = value.Details
        Set product.Price = value.Price
        Set product.Stock = value.Stock
        Set product.Status = value.Status
        Set product.Name = value.Name
        Set product.Description = value.Description
        Set product.CreatedAt = value.CreatedAt
        Set product.UpdatedAt = value.UpdatedAt
        Set product.CategoryId = value.CategoryId

        Do pResponse.Product.Insert(product)
    }

    Return $$$OK
}

}
