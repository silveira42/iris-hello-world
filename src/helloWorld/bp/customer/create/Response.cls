Class helloWorld.bp.customer.create.Response Extends Ens.Response
{

Property Customer As helloWorld.obj.customers.Customer;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>customer</Value>
</Value>
<Value name="2">
<Value>Customer</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
