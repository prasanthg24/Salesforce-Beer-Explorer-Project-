public class DMLClass2 
{
    public Static void UpdateMethod1()
    {
        Account a = [select name from Account where name like 'Pras%'limit 1 ];
        a.name = 'Cyntexa';
        Update a;
        
    }
    public Static void UpdateMethod2()
    {
       List<Account> a = [select name from Account where name like 'Pras%' ];
        for(Account aj : a)
        {
            aj.name = aj.Name + ' June';
        }
        
        Update a;
        
    }
}