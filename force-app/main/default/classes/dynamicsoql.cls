public class dynamicsoql {
    
    Public static void main(String fd, String str) //account
    {
        String s1 = 'select name ' + fd +' from ' + str ; //'select name, id from account' = s1
        system.debug(s1);
        List<sObject> sList = Database.query(s1);
        for(sObject s: sList)
        {
            System.debug(s);
        }
    }
}