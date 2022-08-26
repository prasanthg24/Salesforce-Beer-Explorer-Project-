@RestResource(urlMapping='/a/1')
global class IntegrationDemo
{
    global final static string welcome_message='Welcome to salesforce integeration';
   
 	@HttpGet
    global static string returnString()
    {   
        return welcome_message;
    }
}