({
    handler : function(component, event, helper) 
    {
        component.find('overlayLib').showCustomModal
        ({
            header: "Beer List Component",
            body: "Welcome to Beer World",
            showCloseButton: true,
            footer:"Footer Test",
            
            closeCallback: function() 
            {
                alert('You closed the alert!');
            }
        })
    },
    navigationHandler:function(component, event, helper) 
    {
        var navService = component.find("navigationLib");
        
        
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Beer_c__c',
                actionName: 'list'
            },
            state: {
              filterName: "Recent"
            }
            
        };
         navService.navigate(pageReference);
        
       // alert('test')
    },
    
    
    
})