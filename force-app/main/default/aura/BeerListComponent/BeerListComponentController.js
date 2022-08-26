({
    showInfo : function(component, event, helper) 
    {
        var eventSource = event.getSource();
        var beerObj = eventSource.get('v.name');
        var beerName = eventSource.get('v.value');
        console.log('beerName ', beerName);
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
                        header: "Beer List Component",
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
    handler : function(component, event, helper) 
    {
        alert('You open the alert!');
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
    AddToCart : function(component, event, helper) 
    {
        
        
           var eventSource = event.getSource();
      
        var beerId = eventSource.get('v.name');
        var index = eventSource.get('v.value');
        var selectedBeer = component.get('v.recordList')[index];
       console.log(' selectedBeer '+ selectedBeer.Id);
     //  alert("selectedBeer.Id");
        //alert(index)
       

        
         var addToCartEvent = component.getEvent('CartEvent');
        addToCartEvent.setParams
        ({
            beerRecord : selectedBeer
        });
        addToCartEvent.fire();
                alert("fire");
    }
})