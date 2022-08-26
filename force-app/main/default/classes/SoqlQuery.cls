public class SoqlQuery {
	public static void main()
    {
  
        set<string> Phno = new set <string>();
        phno.add('9788156163');
        phno.add('7010440609');
        
        system.debug('Set ' + phno);
        
     List<Account> AccList =  [select id,name,phone from account where phone IN : phno];
        system.debug('Result = ' + AccList);
        
    }
}