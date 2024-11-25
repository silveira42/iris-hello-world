Class helloWorld.obj.product.Product Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String;

Property Details As %Library.String;

Property Price As %Library.String;

Property Stock As %Library.String;

Property Status As %Library.String;

Property Name As %Library.String;

Property Description As %Library.String;

Property CreatedAt As %TimeStamp;

Property UpdatedAt As %TimeStamp;

Property CategoryId As %Library.Integer;

Storage Default
{
<Data name="ProductState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>Details</Value>
</Value>
<Value name="3">
<Value>Price</Value>
</Value>
<Value name="4">
<Value>Stock</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
<Value name="6">
<Value>Name</Value>
</Value>
<Value name="7">
<Value>Description</Value>
</Value>
<Value name="8">
<Value>CreatedAt</Value>
</Value>
<Value name="9">
<Value>UpdatedAt</Value>
</Value>
<Value name="10">
<Value>CategoryId</Value>
</Value>
</Data>
<State>ProductState</State>
<StreamLocation>^helloWorld.obj.proC1C0.ProductS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
