public class SoslClass3
{
    public static void clause()
    {
        List<List<sObject>> results = [FIND 'Uni*' IN NAME FIELDS RETURNING Account(Name, BillingCountry WHERE Annualrevenue > 50)];
        system.debug(results[0]);
    }
    
    public static void orderby()
    {
        List<List<sobject>> res = [Find 'Prasanth' Returning Account(Name, Phone  WHERE website!=null ORDER BY Name DESC), Contact(Name ORDER BY Name)];
	
        List <sobject> acc = res[0];
        
        for(Sobject a : acc)
        {
            system.debug(a);
        }
        for(sobject c : res[1])
        {
            System.debug(c);
        }
    }
}