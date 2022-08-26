({
	doOrder : function(component, event, helper) {
        
        var ID =  component.get('v.beerId');
        var pageReference = component.find("navigation");
        var pageReferenceNav = 
            {    
            "type": "standard__component",
            "attributes": 
                {
                    "componentName": "c__createBeerOrder"    
                },    
            state: 
            {
          			beerId__c:ID
            }
        };
        pageReference.navigate(pageReferenceNav);
	}
,
    doOrder1 : function(component, event, helper) 
    {
        
        var pageReference = component.find("navigationLib");
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": 
            {
                "componentName": "c__createBeerOrder"    
            },    
            "state": {
                beerId: component.get('v.beerId') ,
                "beerName" : component.get('v.beerName')
            }
        };
        pageReference.navigate(pageReferenceNav);
        
    }
    
})