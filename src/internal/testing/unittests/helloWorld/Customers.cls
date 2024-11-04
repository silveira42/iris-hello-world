Class internal.testing.unittests.helloWorld.Customers Extends %UnitTest.TestProduction
{

Parameter PRODUCTION = "HELLOuWORLDPKG.Production";

Parameter IGNOREPRODUCTIONERRORS = 1;

Method OnAfterProductionStart() As %Library.Status
{
    Do ..ListCustomersTest()

    Return $$$OK
}

Method ListCustomersTest()
{
    Set listCustomerRequest = ##class(helloWorld.bo.customers.list.Request).%New()

    Set listCustomerStatus = ..SendRequest("Customers", listCustomerRequest, .listCustomerResponse, 1)
    #Dim listCustomerResponse As helloWorld.bo.customers.list.Response

    Do $$$AssertStatusOK(listCustomerStatus)

    Do $$$AssertNotEquals(listCustomerResponse.Customers.Count(), 0, "listCustomerResponse.Customers.Count = 0")

    For i=1:1:listCustomerResponse.Customers.Count()
    {
        #Dim customer As helloWorld.obj.customers.Customer = listCustomerResponse.Customers.GetAt(i)
        Do $$$AssertNotEquals(customer.Id, "", "customer.Id=''")
        Do $$$AssertNotEquals(customer.Name, "", "customer.Name=''")
        Do $$$AssertNotEquals(customer.Document, "", "customer.Document=''")
    }
}

}
