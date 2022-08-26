public class ReverseNumber
{

    public static string reverse()
    {
        integer a = 123 , b = 414;
        integer r ,d = 0 ;
        while(a>0)
        {
            r = Math.mod(a,10); 
            d = (d*10)+r; // 3 =30+2 = 32 , 321
            a = a / 10 ; 
        }
        if(d == b)
        {
            return 'It is Palindrome ' ;
        }
        else
        {
            return 'It is not Palindrome' ;
        }
    }
    
    
}