({
    ContactCreation : function(component, event, helper) 
    {
        var action = component.get('c.createQuickContact');//createQuickContact
        
        action.setParams(
            {
                con:component.get('v.CreateContact'),
                AccId :component.get('v.accountId')
                
            });
        
        action.setCallback (this,function(response){
            var state = response.getState();
            var responsevalue  =  response.getReturnValue(); 
            if( state == "SUCCESS"){
               // alert('Success');
                var cmpEvent = component.getEvent('Quickcontact');
                cmpEvent.setParams(
                    {
                        contactRecord : responsevalue
                    });
                cmpEvent.fire(); 
            }
            else {
                console.log('There was a problem : '+response.getError());
                alert('There was a problem ');
            }        }  );
        
        $A.enqueueAction(action);
        
    }
    
})