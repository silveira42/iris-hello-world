Class helloWorld.bo.customers.list.Response Extends Ens.Response
{

Property Customers As list Of helloWorld.obj.customers.Customer;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Customers</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
