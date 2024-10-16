Class helloWorld.obj.orders.Order Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String;

Property Details As %Library.String;

Property ProductId As %Library.String;

Property Quantity As %Library.Integer;

Property CustomerId As %Library.String;

Storage Default
{
<Data name="OrderState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>Details</Value>
</Value>
<Value name="3">
<Value>ProductId</Value>
</Value>
<Value name="4">
<Value>Quantity</Value>
</Value>
<Value name="5">
<Value>CustomerId</Value>
</Value>
</Data>
<State>OrderState</State>
<StreamLocation>^helloWorld.obj.orders.OrderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
