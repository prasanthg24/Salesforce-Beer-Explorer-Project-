trigger newAccountTrigger1 on Account (before insert) 
{
    List<Account> result = Trigger.new; //[select id,name from account where id ='aru8974935673'];
    AccountTriggerHandler.triggerMethod1(result);
}