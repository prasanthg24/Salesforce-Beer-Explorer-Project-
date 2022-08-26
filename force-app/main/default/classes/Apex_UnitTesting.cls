@isTest
public class Apex_UnitTesting
{
    @istest
	public static  void  add1()
    {
       integer result = ApexTestingDemo.add(10, 10);
        system.assertEquals(2, result);
    }
    @istest
	public static  void  sub()
    {
       integer result = ApexTestingDemo.sub(20, 10);
        system.assertEquals(10, result);
    }
    @istest
	public static  void  mul()
    {
       integer result = ApexTestingDemo.mul(5, 5);
        system.assertEquals(25, result);
    }
    @istest
	public static  void  div()
    {
       decimal result = ApexTestingDemo.div(10, 10);
        system.assertEquals(1.0, result);
    }
}