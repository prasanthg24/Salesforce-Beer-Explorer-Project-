({
    homePage : function(component, event, helper){

        /*var pageReference = component.find("navigation");
        var pageReferenceNav = 
        {    
            "type": "standard__component",
            "attributes":
            {
                "componentName": "c__BeerExplorer"    
            }
        };
       
        pageReference.navigate(pageReferenceNav, true);*/
        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__navItemPage",
            "attributes": {
                "apiName": "BeerExplorer"    
            }
        };
        pageReference.navigate(pageReferenceNav, true);
    },
    
    doInit : function(component, event, helper) 
    {
       
        var pageReference = component.get('v.pageReference');
        
        var state = pageReference.state;
        if(state.cartId__c){
            console.log(' cartId ' ,state.cartId__c);
            component.set('v.cartId',state.cartId__c );
            var action = component.get('c.getCartItems');
            action.setParams({
                'CartId' : state.cartId__c
            });
            action.setCallback(this, function(response)
                               {
                                   var stateResponse = response.getState();
                                    
                                   if(stateResponse === 'SUCCESS' || stateResponse === 'DRAFT')
                                   {
                                    
                                       var ResultData =response.getReturnValue();
                                       console.log("ResultData value - ", ResultData)
                                    /*
                                        var items = [];
                                       for(var key in ResultData)
                                       {
                                           items.push(ResultData[key]);
                                       }
                                       
                                       component.set('v.cartItemList', items);
                                       console.log( items);
                                    */
                                  
                                       var items = [];
                        var subTotal;
                        for(var key in ResultData){

                            items.push(ResultData[key]);

                            if(subTotal)
                                subTotal = subTotal + ResultData[key].Total_Amount1__c
                            else
                                subTotal = ResultData[key].Total_Amount1__c
                        }
                        component.set('v.subTotal', subTotal);
                                       
                                       component.set('v.cartItemList', items);
                                       console.log( "items" , items);
                                    
                                       
                                   }
                                   else if(stateResponse === 'INCOMPLETE')
                                   {
                                       console.log('User is offline System does not support offline');
                                   }
                                       else if(stateResponse ==='ERROR')
                                       {
                                           var errors = response.getError();
                                           
                                           if(errors || errors[0].pageMessage)
                                           {
                                               console.log(' page Error ', errors[0].pageMessage);
                                           }
                                           if(errors || errors[0].duplicateResults){
                                               console.log(' duplicate Error ', errors[0].duplicateResults);
                                           }
                                       }
                                           else{
                                               
                                           }
                               });
            $A.enqueueAction(action);
        } 
        
    },
    applyCoupon :  function(component, event, helper) 
    {
        component.set('v.isCouponAplied', true);
    
    }

})