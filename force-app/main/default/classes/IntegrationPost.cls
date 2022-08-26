@RestResource (urlMapping = '/insert/v1/*')
global class IntegrationPost
{
    @HttpPatch
    global static Account postAccount(string name)
    {
        RestRequest req = RestContext.request;
        String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug(accountid);
        Account acc = new Account();
        acc.Name =name;
      
        
        acc.id = accountId;
        system.debug( acc.id );
        
        update acc;
        return acc;
    }
    
    @Httpdelete
    global static void deleteAccount(){
          RestRequest req = RestContext.request;
         String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [Select id,Name,Phone from Account Where Id=:accountId];
        delete acc;
    }

    
}