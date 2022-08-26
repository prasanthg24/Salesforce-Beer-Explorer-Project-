public class whileinApex {
    public static void whileLoop()
    {
       /*integer i = 123; //             answer = 321
        integer r;
        //123>0 T   12>0 T  1>0  T 0>0 F
        do 
        {
            r = math.MOD(i,10); //123%10 - 3  12%10 - 2  1%10 = 1
            system.debug(r);//321 
            i = i / 10; // 123/10 = 12   12 /10 = 1  1/10 = 0.1
            
            System.debug(' i = '+ i );
        } while(i>0);
        
        system.debug(' i value ' + i);//12 !!SNR Ans -12 { shiva - 12}  12[ 0 ]
        system.debug('r value '+ r);//1*/
        integer n =12;
        
        for( integer i =1 ;i<=10 ; i++) // 1 ;1<=10 T 2<=10 T --11<=10 F
        {
            System.debug( n + '*' + i + ' = ' + n*i ); //2*1 = 2  //2*2 = 4
            System.debug('\n');
        }
    }
}