({
    
    AddingProduct : function(component, event, helper) 
    {
        
        var names = [];
        for(var i=0; i<component.get('v.recordList').length;  i++)
        {
            names.push(component.get('v.recordList')[i].Id);
            console.log(component.get('v.recordList')[i].Id);
        }
        console.log(names);
        component.set('v.beerNameList', names);
        
        
    }
    ,
    goToCart : function(component, event, helper) 
    {
        
        var action = component.get('c.getCartId');
        
        action.setParams({
            'beerList' : component.get('v.beerNameList')
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            //debugger;
            // alert(response.getReturnValue())
            console.log("cart ID - ", response.getReturnValue())
            if(state === 'SUCCESS' || state === 'DRAFT'){
                
                var pageReference = component.find("navigation");
                var pageReferenceNav = 
                    {    
                        "type": "standard__component",
                        "attributes":
                        {
                            "componentName": "c__CartDetail"    
                        },    
                        "state": 
                        {
                            cartId__c: response.getReturnValue()
                        }
                       
                    };
                
                pageReference.navigate(pageReferenceNav, true);
                
            }else if(state === 'INCOMPLETE'){
                console.log('User is offline System does not support offline');
            }else if(state ==='ERROR'){
                var errors = response.getError();
                if(errors || errors[0].pageMessage){
                    console.log(' page Error ', errors[0].pageMessage);
                }
                if(errors || errors[0].duplicateResults){
                    console.log(' duplicate Error ', errors[0].duplicateResults);
                }
            }else{
                
            }
        });
        $A.enqueueAction(action);
        
        
    }
})