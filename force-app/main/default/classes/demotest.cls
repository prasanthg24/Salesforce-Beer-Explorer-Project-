public class demotest 
{
    public static void test( string name)
    {
        System.debug(' Hello World!' + name);
        
        List<sobject> data = [SELECT Name,Id,Alcohol__c,Price__c FROM Beer_c__c];
        system.debug(' Data in List = '+data );
    }
}