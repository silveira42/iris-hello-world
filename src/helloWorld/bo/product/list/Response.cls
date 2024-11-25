Class helloWorld.bo.product.list.Response Extends Ens.Response
{

Property Products As list Of helloWorld.obj.product.Product;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>products</Value>
</Value>
<Value name="2">
<Value>Products</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
