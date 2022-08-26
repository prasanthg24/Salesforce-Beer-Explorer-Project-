public class SoslClass2 
{
	public static void asterisk()
    {
        List<List<sobject>> res = [ FIND 'Uni*' IN NAME FIELDS RETURNING ACCOUNT(NAME),CONTACT(NAME) ];
        List<Account> acc = res[0];
        List<contact> con = res[1];
        for(Account ac : acc)
        {
            system.debug(ac);
        }
        for(Contact c : Con )
        {
            System.debug(c);
        }
    }
    
    public static void mark()
    {
        List<List<sobject>> res = [ FIND 'Jo?n' IN NAME FIELDS RETURNING ACCOUNT(NAME),CONTACT(NAME) ];
        List<Account> acc = res[0];
        List<contact> con = res[1];
        for(Account ac : acc)
        {
            system.debug(ac);
        }
        for(Contact c : Con )
        {
            System.debug(c);
        }
    }
}