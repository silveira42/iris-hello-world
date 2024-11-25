Class helloWorld.bo.customers.update.Response Extends Ens.Response
{

Property Customer As helloWorld.obj.customers.Customer;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Customer</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
