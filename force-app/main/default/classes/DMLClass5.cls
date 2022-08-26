public class DMLClass5 
{
    public static void main()
    {
        List<Account> accList = [SELECT name FROM Account WHERE NAME LIKE 'Mer%' Order by name LIMIT 3];
        Account a = accList[0];//Merge Account Disney 1
        system.debug(a);
      //  Account b = accList[1];//Merge Account GreenStudio 2
      //  Account c = accList[2];//Merge Account NetFlix 3
        
       // Merge a b;
        
        List<Account> mergeList = new List<Account>();
        mergeList.add(accList[1]);
        mergeList.add(accList[2]);
       // merge a b; // for 2 records
        merge a mergeList; // for 3 records
        
    }
}