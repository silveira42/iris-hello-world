Class helloWorld.bo.product.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bo.product.create.Response";

Property Product As helloWorld.obj.product.Product;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Product</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
