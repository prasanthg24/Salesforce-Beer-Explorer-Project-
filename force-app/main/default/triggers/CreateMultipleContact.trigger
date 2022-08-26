trigger CreateMultipleContact on Account (after insert)
{
    List <Contact> ListContact = new List <Contact>();
    map <id,decimal> mapAcc = new map <id,decimal>();
    for(Account ac : Trigger.new)
    {
        mapAcc.put(ac.id ,ac.Active_Contacts__c);
        if(mapAcc.size()>0 && mapAcc!=null)
        {
            for(Id accId : mapAcc.keySet())
            {
                for(Integer i = 0 ;i<mapAcc.get(accId);i++)
                {
                    Contact con = new Contact();
                    con.AccountId = accId;
                    con.LastName = 'Contact '+ i;
                    ListContact.add(con);
                }
            }
        }
        
    }
    
   insert  ListContact;
}