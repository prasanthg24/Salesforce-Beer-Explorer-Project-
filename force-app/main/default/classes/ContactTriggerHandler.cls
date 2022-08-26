public class ContactTriggerHandler 
{
	public static void afterUpdateHandler(List<contact> newContacts)
    {
        Set<Id> uniqueIds = new Set<Id>();
            for(Contact con : newContacts)
            { 
                if(String.isNotBlank(con.AccountId))
                {
                    uniqueIds.add(con.AccountId);     
                }
             }
            
            List<AggregateResult> results =[SELECT AccountId, COUNT(Id)totalContact 
                                            FROM Contact WHERE Active__C =true 
                                            AND AccountId IN : uniqueIds
                                            GROUP BY AccountId];
           List<Account>accountsToUpdate = new List<Account>();
            for(AggregateResult result : results)
            {
                String accId = String.valueOf(result.get('AccountId'));
                Integer totalContacts = Integer.valueOf(result.get('totalContact'));
                Account acc = new Account(Id=accId,Active_Contacts__c= totalcontacts );
             	accountsToUpdate.add(acc);
            }
            update accountsToUpdate;
    }
    
    public static void afterUpdateHandler(List<contact> newContacts,Map<Id,Contact>oldContactsMap)
    {
        Set<Id> uniqueIds = new Set<Id>();
            for(Contact con : newContacts)
            { 
               if(String.isNotBlank(con.AccountId) && oldContactsMap.get(con.Id).Active__c!= con.Active__c)
                {
                    uniqueIds.add(con.AccountId);     
                }
                else if (oldContactsMap.get(con.Id).AccountId != con.AccountId)
                {
                   	uniqueIds.add(con.AccountId) ;
                    uniqueIds.add(oldContactsMap.get(con.Id).AccountId);
                }
             }
            
            List<AggregateResult> results =[SELECT AccountId, COUNT(Id)totalContact 
                                            FROM Contact WHERE Active__C =true 
                                            AND AccountId IN : uniqueIds
                                            GROUP BY AccountId];
           List<Account>accountsToUpdate = new List<Account>();
            for(AggregateResult result : results)
            {
                String accId = String.valueOf(result.get('AccountId'));
                Integer totalContacts = Integer.valueOf(result.get('totalContact'));
                Account acc = new Account(Id=accId,Active_Contacts__c= totalcontacts );
             	accountsToUpdate.add(acc);
            }
            update accountsToUpdate;
    }
    
}