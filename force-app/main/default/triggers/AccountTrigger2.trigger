trigger AccountTrigger2 on Account (before insert, after insert, before update, after update)
{
    if(Trigger.isBefore)
    { 
        If(Trigger.isInsert) {
            
            // execute first trigger
            
            // AccTriggerHelper.firstMethod(Trigger.new);
            
            // execute second trigger
            
            //  AccTriggerHelper.secondMethod(Trigger.new);
            
            // both of these trigger will follow the execution order
            
        }
        
        Else if(Trigger.isUpdate)
            
        {
            
            // write the code for before update
            
        }
        
        Else if(Trigger.isDelete)
            
        {
            
            // write the code for before delete
            
        }
        
        Else if(Trigger.isUndelete)
            
        {
            
            // write the code for before undelete
            
        }
        
    }
    
    Else if(Trigger.isAfter)
        
    {
        
        If(Trigger.isInsert)
            
        {
            
            // write the code for after insert
            
        }
        
        Else if(Trigger.isUpdate)
            
        {
            
            // write the code for after update
            
        }
        
        Else if(Trigger.isDelete)
            
        {
            
            // write the code for after delete
            
        }
        
        Else if(Trigger.isUndelete)
            
        {
            
            // write the code for after undelete
            
        }
        
    }
}