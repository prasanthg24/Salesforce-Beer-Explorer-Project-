({
    doInit : function(component, event, helper)
    {
        var action = component.get("c.getContactList");
        //console.log(action);
        action.setParams({ id:component.get('v.recordId')  });
        
        
        //setCallback (Object scope, function callback, String name)
        action.setCallback (this,function(response){
            
            var responsevalue  =  response.getReturnValue(); 
            // <aura:attribute name ="ContactList" type ="Contact[]"/>
            component.set('v.ContactList',responsevalue);
            //console.log(responsevalue);
            
        }
                            
                           );
        
        $A.enqueueAction(action,false);
        ///$A.enqueueAction(action);
    },
    Redirect: function(component, event, helper)
    {
        
        var eventvalue = event.getSource();
        var Id=eventvalue.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": Id,
            "slideDevName": "detail"
        });
        navEvt.fire();
        
        
    },
    handlerComponentEvent: function(component, event, helper)
    {
        var availablecontactList =    component.get('v.ContactList');
        
        var EventRecord1 = event.getParam('contactRecord');
        availablecontactList.push(EventRecord1);
        component.set('v.ContactList',availablecontactList)
        console.log(component.get('v.ContactList'));
        
    }
}
 
 
)