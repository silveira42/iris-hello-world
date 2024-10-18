Class helloWorld.bp.customersOrders.list.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As helloWorld.bp.customersOrders.list.Request, Output pResponse As helloWorld.bp.customersOrders.list.Response) As %Library.Status
{
    // Comentário :D
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at OnRequest method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set customerRequest = ##class(helloWorld.bo.customers.list.Request).%New()
    Set orderRequest = ##class(helloWorld.bo.orders.list.Request).%New()

    $$$ThrowOnError(..SendRequestSync("Customers", customerRequest, .customerResponse))
    #Dim customerResponse As helloWorld.bo.customers.list.Response

    $$$ThrowOnError(..SendRequestSync("Orders", orderRequest, .orderResponse))
    #Dim orderResponse As helloWorld.bo.orders.list.Response

    For i=1:1:customerResponse.Customers.Count()
    {
        #Dim customer As helloWorld.obj.customers.Customer = customerResponse.Customers.GetAt(i)

        Set customerOrder = ##class(helloWorld.obj.customers.CustomerOrders).%New()
        Set customerOrder.Id = customer.Id
        Set customerOrder.Name = customer.Name
        Set customerOrder.Document = customer.Document

        For j=1:1:orderResponse.Orders.Count()
        {
            #Dim order As helloWorld.obj.orders.Order = orderResponse.Orders.GetAt(j)

            If (customer.Id = order.CustomerId)
            {
                Do customerOrder.Orders.Insert(order)
            }
        }

        Do pResponse.CustomersOrders.Insert(customerOrder)
    }

    Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
