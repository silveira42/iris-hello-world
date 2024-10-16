Class helloWorld.bp.customersOrders.list.Response Extends Ens.Response
{

Property CustomersOrders As list Of helloWorld.obj.customers.CustomerOrders;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>CustomersOrders</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
