public class DMLClass4 
{
    public static void upsertmethod()
    {
        List<Account> ac = new List<Account>();// upsert = 1,upsert = 20 ,...etc Podanur upsert operation
        For(integer i = 1 ;i<=5;i++)
        {
            Account ac1 = new Account(); 
            ac1.Name = 'Upsert = ' + i ;
            
            ac.add(ac1);
        }
        Account a = [select name from Account where name like 'Cyn%'limit 1 ];
        a.name = 'Podanur Upsert Operation';
        ac.add(a);
        system.debug(ac);  
        upsert ac;
        
        
        
    }
    public static void insertmethod()
    {
        List<Account> ac = new List<Account>();
        for(integer i=0;i<20;i++)
        {
            Account a = new Account();
            a.name= 'Test Account Today '+ i ;
            ac.add(a);
            
        }
        
        insert ac;
    }
    Public static void deletemethod()
    {
        List<Account> acList= [select Id,name From Account where createdDate = Today LIMIT 5];
        delete acList;
    }
    Public static void undeletemethod()
    {
        List<sobject> acList= [ SELECT name ,ID FROM Account WHERE createdDate = Today and isDeleted=true ALL ROWS];
        undelete acList;
    }
    public static void deletemethod1()
    {
        List<Account> ac = [select name from Account where name like 'upsert%'];
        system.debug(ac);
        delete ac;
    }
    
    public static void undeletemethod1()
    {
        List<Account> ac = [select name from Account where name  like 'upsert%' AND  isDeleted =True ALL ROWS ];
        
        undelete ac;
    }
}