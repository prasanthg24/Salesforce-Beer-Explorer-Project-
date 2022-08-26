public class AccountTriggerHandler
{
	public static void triggerMethod1(List<Account> ac)
    {
        for(Account a : ac)
        {
            a.name = 'Mr.'+a.name;
        }
    }
}