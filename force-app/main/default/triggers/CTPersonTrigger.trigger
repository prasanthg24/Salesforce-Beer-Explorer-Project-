trigger CTPersonTrigger on Person__c (before insert,before update,before delete,after insert ,after update,after delete,after undelete ) 
{
    switch on Trigger.operationType
    {
        when BEFORE_INSERT
        {
            //todo update the health status to green
            //todo generate unique token to the person record 
            CTPersonTriggerHandler.BeforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE
        {
            CTPersonTriggerHandler.beforeUpdate(Trigger.new,Trigger.oldMap);
        }
    }
}