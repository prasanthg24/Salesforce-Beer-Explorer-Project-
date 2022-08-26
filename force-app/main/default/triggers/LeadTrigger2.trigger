trigger LeadTrigger2 on Lead (before insert,before update,after insert) 
{
    
    system.debug('Trigger Size ' + Trigger.size);
    system.debug('is Trigger ' + Trigger.isExecuting);
    system.debug('Operation : type : ' + Trigger.operationType);
    
    switch on Trigger.operationType
    {
        when BEFORE_INSERT 
        {
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);
        }
        
        when BEFORE_UPDATE
        {
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new,Trigger.oldMap);
        }
        when AFTER_INSERT
        {
            LeadTriggerHandler.afterInsertHandler(Trigger.new);
        }
    }
    
    
}