Class helloWorld.bp.customer.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bp.customer.create.Response";

Property Customer As helloWorld.obj.customers.Customer;

Property action As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Customer</Value>
</Value>
<Value name="2">
<Value>action</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
