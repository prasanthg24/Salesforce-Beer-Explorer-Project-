trigger AccountAfterTrigger on Account (after update) 
{
    
   
    if(trigger.isafter && trigger.isupdate) // Using context variables.
    {
        AccountHelperClass.updatephone(trigger.new); //calling apex class method
    }
}