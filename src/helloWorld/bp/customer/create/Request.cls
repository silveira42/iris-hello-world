Class helloWorld.bp.customer.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bp.customer.create.Response";

Property Customer As helloWorld.obj.customers.Customer;

Property action As %String;

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
