public with sharing class CreateContactComp {
    public CreateContactComp( List<Contact> con) 
    {
        system.debug(con);
        insert con;
        
    }
}