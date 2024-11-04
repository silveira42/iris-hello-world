Class helloWorld.bp.math.Calculator Extends Ens.BusinessProcess
{

ClassMethod Add(num1, num2) As %Library.Integer
{
    Return num1 + num2
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
