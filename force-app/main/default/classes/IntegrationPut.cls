@RestResource(urlMapping='/ContactPUT/*')
global  class IntegrationPut {
    // PUT Method
    @HTTPPut
    global static Contact upsertContact(String firstName, String lastName, String leadSource) 
    {
        /*
            RestRequest req = RestContext.request;
            String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);	
        */
        RestRequest contactRequest = RestContext.request;
        
        String contactRequestURI = contactRequest.requestURI;
        
        String contactId = contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1);
        
        Contact contact = new Contact();
        
        if(String.isNotEmpty(contactId))//true 
        {
            contact.Id = contactId;
        }
		system.debug('ANS - '+String.isNotEmpty(contactId) );        
        system.debug('Contact id = ' + contactId);
        
        contact.FirstName  = firstName;
        contact.LastName   = lastName;
        contact.LeadSource = leadSource;
        
        upsert contact;
        
        return contact;
    }
}