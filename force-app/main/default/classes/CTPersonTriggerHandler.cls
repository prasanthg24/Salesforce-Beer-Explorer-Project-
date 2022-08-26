public class CTPersonTriggerHandler {
    public static void beforeInsert(List<Person__c>newRecord)
    {
        for(Person__c person:newRecord)
        {
            person.Health_Status__c = 'Green';
            person.Token__c = CTPersonController.getToken(person.Mobile__c) ;
            
        }
    }
    public static void beforeUpdate(List<Person__c>newRecord ,Map<Id,Person__c>oldRecordMap)
    {
        for(person__c person : newRecord)
        {//when the status updates update  
            //also update Status_update_Date__c
            if(person.Health_Status__c!= oldRecordMap.get(person.Id).Health_Status__C)
            {
                person.Status_Update_Date__c = Date.today();
                
            }
        }
    }
}