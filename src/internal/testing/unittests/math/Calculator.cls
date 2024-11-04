Class math.Calculator Extends %UnitTest.TestCase
{

Method TestAdd()
{
    Do $$$AssertEquals(##class(helloWorld.bp.math.Calculator).Add(5,5), 10, "TestAdd(5,5)=10")
}

}
