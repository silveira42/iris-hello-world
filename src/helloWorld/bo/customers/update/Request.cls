Class helloWorld.bo.customers.update.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bo.customers.update.Response";

Property Customer As helloWorld.obj.customers.Customer;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Customer</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
