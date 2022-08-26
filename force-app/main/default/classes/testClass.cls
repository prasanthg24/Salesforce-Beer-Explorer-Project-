public class testClass
{
	public void DeleteAccount()
    {
        List<Account> ac = [SELECT Name,id,type FROM Account WHERE Name LIKE 'Test%'];
        system.debug(ac);
        delete ac;
        
    }
}