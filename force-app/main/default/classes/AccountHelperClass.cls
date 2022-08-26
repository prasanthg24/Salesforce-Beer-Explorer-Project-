public class AccountHelperClass {
    
    public static void updatephone(List<Account> accountList)
    {
        system.debug(accountlist);
        
        set<id> accountIdSet=new set<id>();
        
        for(Account ob  :accountList)
        {
            accountIdSet.add(ob.id); 
        }
        system.debug('id='+ accountidset);

        List<Account> AccountRecord = [Select id,Name,phone,(Select id,phone from Contacts) from Account where id IN :accountIdSet];
       	List<contact> conList=new List<contact>();
        for(Account obj: AccountRecord)
        { 
            for(contact con:obj.Contacts)
            {  
                con.phone=obj.phone; 
                conList.add(con); 
            }
        }
                  
     if(conList.size() > 0)
       { 
            update conList; 
        }
    }
}