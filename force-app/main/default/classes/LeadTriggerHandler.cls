public class LeadTriggerHandler 
{
    public static boolean  alreadyExecuted = false;
    
    public static void beforeInsertHandler(List<lead> newRecords)
    {
        for(Lead ac : newRecords)
        {
            if(String.isBlank(ac.LeadSource))
            {
                ac.LeadSource = 'Partner Referral';
            }
            if(String.isBlank(ac.Industry))
            {
                ac.addError('The Industry cannot be Blank');
            }
        } 
    }
    public static void beforeUpdateHandler(List<lead> newRecords,Map<Id,Lead>oldRecordMap)
    {
        for(Lead ac : newRecords)
        {
            if((ac.Status=='Closed - Converted' ||ac.Status=='Closed - Not Converted') && oldRecordMap.get(ac.Id).Status =='Open - Not Contacted' )
            {
                ac.Status.addError('you cannot close the opened lead record');
            }
        }
    }
    public static void afterInsertHandler(List<lead> newRecords)
    {
        for(Lead ac : newRecords)
        {
            Task LeadTask = new Task(Subject ='Follow up on Lead Source');
            
            LeadTask.WhoId =ac.Id;
            
            
            insert LeadTask;
        }
       	//inserting another lead record
        // this will call the trigger recursively
        if(LeadTriggerHandler.alreadyExecuted==false){
                 LeadTriggerHandler.alreadyExecuted=true;
        Lead anotherLead = new Lead(LastName='Test Lead Single', Status='Open - Not Contacted', Company='SFDCFacts', Industry='Finance');
            insert anotherLead;
   
        }
    }
}