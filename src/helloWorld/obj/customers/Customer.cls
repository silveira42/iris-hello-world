Class helloWorld.obj.customers.Customer Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String;

Property Name As %Library.String;

Property Document As %Library.String;

Storage Default
{
<Data name="CustomerState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Document</Value>
</Value>
</Data>
<State>CustomerState</State>
<StreamLocation>^helloWorld.obj.cu7DB8.CustomerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
