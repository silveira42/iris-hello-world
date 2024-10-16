Class helloWorld.bo.math.sum.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "helloWorld.bo.math.sum.Response";

Property A As %Library.Numeric;

Property B As %Library.Numeric;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>A</Value>
</Value>
<Value name="2">
<Value>B</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
