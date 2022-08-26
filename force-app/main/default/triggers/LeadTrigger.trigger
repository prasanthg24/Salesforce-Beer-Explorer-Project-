trigger LeadTrigger on Lead (before insert) 
{

    //System.debug('Lead Trigger is Called');
    
  /*  for(Lead LeadRecord : Trigger.new)
    {
            if(String.isBlank(LeadRecord.LeadSource))
            {
                LeadRecord.LeadSource = 'other';
            }
            
            if(String.isBlank(LeadRecord.Industry))
            {
               LeadRecord.addError('The Industry cannot be Blank');
            }
        
    }*/
    
    
}