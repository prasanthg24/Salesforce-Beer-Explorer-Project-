public class SoslClass1 {
    
    public  SoslClass1()
    {
        List<List<sobject>> soList = [Find 'Prasanth' IN ALL fields Returning Account(Name) ,Contact ];
        
        List <sobject> acList  = soList[0];
        List <sobject> conList = soList[1];
        
        for(sobject ac :acList)
        {
            system.debug(ac);
        }
        for(sobject con :conList)
        {
            system.debug(con);
        }
    }
    
    
    public static void Soslname()
    {
        
        List<List<sobject>> result = [Find 'Prasanth' IN NAME Fields RETURNING Account(Name,Phone,annualrevenue),Contact(Name)];
        
        List <Account> ListAccount= result[0];
        for(Account a : ListAccount)
        {
            system.debug(a);
        }
        
    }
    
    public static void soslemail()
    {
        List<List<sobject>> result = [Find 'Prasanth' IN Email Fields RETURNING Account(Name,Phone),Contact(Name)];
        
        List <Account> ListAccount= result[0];
        for(Account a : ListAccount)
        {
            system.debug(a);
        }
    }
    
    public static void soslphone()
    {
        List<List<sobject>> result = [Find 'Prasanth' IN Phone Fields RETURNING Account(Name,Phone),Contact(Name)];
        
        List <Account> ListAccount= result[0];
        for(Account a : ListAccount)
        {
            system.debug(a);
        }
    }
    
    public static void soslsidebar()
    {
        List<List<sobject>> result = [Find 'Prasanth' IN SIDEBAR Fields RETURNING Account(Name,Phone),Contact(Name)];
        
        List <Account> ListAccount= result[0];
        for(Account a : ListAccount)
        {
            system.debug(a);
        }
    }
    
    
}