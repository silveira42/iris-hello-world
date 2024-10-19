Class helloWorld.bp.customer.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As helloWorld.bp.customer.create.Request, Output pResponse As helloWorld.bp.customer.create.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at OnRequest method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    If (pRequest.action = "create")
    {
        Set customerRequest = ##class(helloWorld.bo.customers.create.Request).%New()
    } Else {
        Set customerRequest = ##class(helloWorld.bo.customers.update.Request).%New()
    }

    Set customerRequest.Customer = pRequest.Customer

    $$$ThrowOnError(..SendRequestSync("Customers", customerRequest, .customerResponse))
    #Dim customerResponse As helloWorld.bo.customers.create.Response

    #Dim customer As helloWorld.obj.customers.Customer = customerResponse.Customer

    Set customer = ##class(helloWorld.obj.customers.CustomerOrders).%New()
    Set customer.Id = customerResponse.Customer.Id
    Set customer.Name = customerResponse.Customer.Name
    Set customer.Document = customerResponse.Customer.Document

    Set pResponse.Customer = customer

    Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
