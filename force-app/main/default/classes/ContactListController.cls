public class ContactListController {
    @AuraEnabled
    public static List<Contact> getContactList(string id)
    {
        List<Contact> conlist = [SELECT Id, Name, Department, Phone, Email FROM Contact WHERE Accountid =:id];
        return conList;
        
    }
    @AuraEnabled
    public static contact createQuickContact(Contact con ,Id AccId)
    {
        con.AccountId = AccId;
        insert con;
        system.debug('Contact = '+con);
        System.debug('Account Id = '+ AccId);
        return con;
    }
}