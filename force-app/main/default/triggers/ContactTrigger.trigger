trigger ContactTrigger on Contact (after insert,after update,after delete ,after undelete) 
{
    switch on Trigger.operationType
    {
        when AFTER_INSERT 
        {
            Set<Id> uniqueIds = new Set<Id>();
            for(Contact con : Trigger.new)
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
        when AFTER_UPDATE 
        {
            Set<Id> uniqueIds = new Set<Id>();
            for(Contact con : Trigger.new)
            { 
               if(String.isNotBlank(con.AccountId) && Trigger.oldMap.get(con.Id).Active__c!= con.Active__c)
                {
                    uniqueIds.add(con.AccountId);     
                }
                else if (Trigger.oldMap.get(con.Id).AccountId != con.AccountId)
                {
                    uniqueIds.add(con.AccountId) ;
                    uniqueIds.add(Trigger.oldMap.get(con.Id).AccountId);
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
        when AFTER_DELETE
        {
            
        }
        when AFTER_UNDELETE
        {
            
        }
    }
    
}