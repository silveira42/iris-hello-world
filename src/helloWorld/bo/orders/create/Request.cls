Class helloWorld.bo.orders.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bo.orders.create.Response";

Property Order As helloWorld.obj.orders.Order;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Order</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
