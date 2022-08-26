public class DMLClass1 
{
    Public static void InsertMethod1()
    {
        List<Account> ac = new List<ACcount>();
        Account a = new Account();
        a.Name = ' Account From Apex 2';
        a.Active__c = 'true';
        a.AnnualRevenue = 45000;
        a.Phone ='98753545';
        ac.add(a);
        insert ac;
        
    }
    Public static void InsertMethod2()
    {
        Account b = new Account( Name ='Apex Account 2',Annualrevenue = 52000);
        insert b;
    }
    public static void InsertMethod3()
    {
        List<Contact> conList = [SELECT Name,Phone FROM Contact WHERE Name LIKE 'Nithi%'];
        List<Account> acList = new List <Account>();
        for(Contact c : ConList)
        {
            Account ac = new Account();
            ac.Name = c.Name;
            ac.Phone = c.Phone;
            acList.add(ac);
        }
        insert acList;
        SYSTEM.debug(acList);
    }
    public static void InsertMethod4()
    {
        List<Contact> conList = [SELECT Name,Phone,Lastname FROM Contact WHERE Name LIKE 'And%'];
        List<Account> acList = new List <Account>();
        for(Contact c : ConList)
        {
            Account ac = new Account(Name = c.Lastname,Phone =c.Phone );
            acList.add(ac);
        }
        insert acList;
        SYSTEM.debug(acList);
    }
    public static void InsertMethod5()
    {
        List<Account> accList = [select Name , Phone ,Annualrevenue,id  FROM Account WHERE NAME LIKE '%bond%'];
        List<Contact> newCon = new List <contact>();
        for(Account obj : accList)
        {
			contact c = new Contact ();
                c.Lastname = obj.name;
            	c.Accountid = obj.id;   
           		newCon.add(C);
        }
        insert newCon;
    }
    
}