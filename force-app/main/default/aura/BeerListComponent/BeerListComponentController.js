({
    showInfo : function(component, event, helper) 
    {
        var eventSource = event.getSource();
        var beerObj = eventSource.get('v.name');
        var beerName = eventSource.get('v.value');
        console.log('beerName ', beerObj);
        component.set('v.beerId', beerObj);
        // <c:BeerDetail beerId="{!v.beerId}" />
        //createComponent(String type, Object attributes, function callback)
        $A.createComponent(
            "c:BeerDetail",
            {
                beerId:beerObj
            },
            function(beerDetails, status, errorMessage)
            {
                if (status === "SUCCESS")   
                {   
                    component.find("overlayLib").showCustomModal({
                        header: "Beer Detail ",
                        body: beerDetails,
                        footer:"Footer Test",
                        closeCallback: function() 
                        {
                            
                        }
                    });
                    
                }
            }
            
        )
        
        
    },
    AddToCart : function(component, event, helper) 
    {
        
        var addToCartEvent = component.getEvent('addToCart');
        
        var eventSource = event.getSource();
        var beerId = eventSource.get('v.name');
        var index = eventSource.get('v.value');
        var selectedBeer = component.get('v.recordList')[index];
        console.log(' selectedBeer '+ selectedBeer.Id);
        
        console.log(' selectedBeer '+ selectedBeer.Name);
        console.log(' selectedBeer '+ selectedBeer.Alcohol__c);
        console.log(' selectedBeer '+ selectedBeer.Price__c);
        
        
        addToCartEvent.setParams({  cartRecord: selectedBeer  });
        addToCartEvent.fire();
        
        alert("addToCartEvent fired")
        
        
    }
})