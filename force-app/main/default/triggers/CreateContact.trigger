trigger CreateContact on Account (after Insert) 
{
    List<contact> cons = new List <contact>();
    for(Account ac : Trigger.new)
    {
        contact c = new contact();
        c.accountid = ac.Id;
        c.lastname = ac.Name +'Trigger';
        c.phone = ac.Phone;
        cons.add(c);
    }
    insert cons;
    
}