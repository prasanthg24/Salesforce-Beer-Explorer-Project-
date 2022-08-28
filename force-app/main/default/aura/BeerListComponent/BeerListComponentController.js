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
        alert();

    }
})