public class BeerSearchAuraClass {

    @AuraEnabled
    public static List<Beer_c__c> searchBeer(string a)
    {
        
        system.debug(a);
        string search1 = a;
        if(a == null)
        {
          List<Beer_c__c> aclist = [SELECT Id, Name, Alcohol__c, Tags__c, brewery_Name__c, Total_Quantity__c, Price__c,Image__c  FROM Beer_c__c];             
            return aclist;
        }
        else
        {
          List<Beer_c__c> aclist = [SELECT Id, Name, Alcohol__c, Tags__c, brewery_Name__c, Total_Quantity__c, Price__c,Image__c  FROM Beer_c__c WHERE Name LIKE :search1+'%'];            
            return aclist;
        }
        
        //system.debug(aclist);
        //return aclist;
    }
}