public class genericsobject 
{
    Public static void generic()
    {
       /* sObject s1 = new Account();
        
        s1.put('Name', 'KCE Student Account gdfhfd');
        insert s1;
         s1 = new Contact();

s1.put('LastName','Dhanush.kce');

insert s1;

s1 = new Account();
s1.put('Name','MCA Boys 55');
insert s1;*/
        
        /*   Account ac = new Account();
ac.Name = ' Lion Stars';
insert ac;*/
        list<Account> acc = [SELECT Name,Id FROM Account];
        
      /*  system.debug(' Account ' + acc);*/
        
        for(Account a  :  acc)
        {
            System.debug('Account Id = ' + a.Id);
			System.debug('Account Name = ' + a.Name);            
        }
        
        
    }
    
}