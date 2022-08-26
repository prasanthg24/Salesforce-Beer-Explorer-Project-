({
	 handleRemove : function(component, event, helper) 
    {
       var index = event.currentTarget.id;
        var existingRecords = component.get('v.contactList');
        existingRecords.splice(index , 1);
        component.set('v.contactList', existingRecords);
        
    },
     handleRemove : function(component, event, helper) 
    {
       var index = event.currentTarget.id;
        var existingRecords = component.get('v.contactList');
        existingRecords.splice(index , 1);
        component.set('v.contactList', existingRecords);
        
    }
    
    
})