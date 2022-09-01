({
    goToCart : function(component, event, helper) {
        var pageReference = component.find("navigation");
                var pageReferenceNav = {    
                    "type": "standard__component",
                    "attributes": {
                        "componentName": "c__CartDetail"    
                    },    
                    "state": {
                       
                    }
                };
                pageReference.navigate(pageReferenceNav, true);

    }
})