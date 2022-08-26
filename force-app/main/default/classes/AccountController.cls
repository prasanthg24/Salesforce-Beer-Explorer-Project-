public class AccountController 
{

    public static List <Account> insertAccounts(List<Account>accountToInsert)    
    {
        insert accountToInsert;
        return accountToInsert;
    }
    public static List<Account> getAllAccounts()
    {
        List<Account>accounts = [SELECT Name,Phone FROM Account];
        return accounts;
    }
    public static void printAllAccounts()
    {
        List<Account>accounts = getAllAccounts();
        for(Account acc :Accounts)
        {
            System.debug('Account Name = ' +acc.Name);
            System.debug('Phone = ' +acc.Phone);

        }
     
    }
}