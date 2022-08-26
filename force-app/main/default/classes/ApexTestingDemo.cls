public class ApexTestingDemo 
{
    public static integer add(integer a,integer b) // classname.add(10,10);
    {
        return a+b;
    }
    public static integer sub(integer a,integer b)
    {
        integer ans = a - b;
        system.debug(ans);
         return ans;
    }
    public static integer mul(integer a,integer b)
    {
        integer ans = a * b;
        system.debug(ans);
         return ans;
    }
    public static decimal div(integer a,integer b)
    {
        integer ans = a / b;
        system.debug(ans);
         return ans;
    }
}