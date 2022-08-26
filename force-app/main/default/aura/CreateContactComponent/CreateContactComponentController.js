({
            handleReview : function(component, event, helper) 
            {        alert("Fired")
                var componetEvent = component.getEvent('CreateContacts');
                componetEvent.setParams({
                    'ContactEvent' : component.get('v.ContactRecord')
                });
                componetEvent.fire();
        
            }
    
})