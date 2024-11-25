Include Ensemble

Class helloWorld.bo.product.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As helloWorld.bo.product.Operation, pRequest As helloWorld.bo.product.create.Request, Output pResponse As helloWorld.bo.product.create.Response) As %Library.Status
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

    Set product = pRequest.Product

	$$$ThrowOnError(product.%JSONExportToString(.httpRequestBody))

    Set product = httpRequestBody

    Set url = "https://run.mocky.io/v3/b780cff1-b40c-484f-95c4-ba44e1b78be5"

    Try {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest , "", product, url))
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

    Set product = ##class(helloWorld.obj.product.Product).%New()

    Set product.Id = dynamicResponse.Id
    Set product.Details = dynamicResponse.Details
    Set product.Price = dynamicResponse.Price
    Set product.Stock = dynamicResponse.Stock
    Set product.Status = dynamicResponse.Status
    Set product.Name = dynamicResponse.Name
    Set product.Description = dynamicResponse.Description
    Set product.CreatedAt = dynamicResponse.CreatedAt
    Set product.UpdatedAt = dynamicResponse.UpdatedAt
    Set product.CategoryId = dynamicResponse.CategoryId

    Set pResponse.Product = product

    Return $$$OK
}

}
