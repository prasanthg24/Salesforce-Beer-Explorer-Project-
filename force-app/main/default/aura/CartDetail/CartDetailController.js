({
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
                                   $A.get('e.force:refreshView').fire(); 
                                   if(stateResponse === 'SUCCESS' || stateResponse === 'DRAFT')
                                   {
                                       var ResultData =response.getReturnValue();
                                       console.log("ResultData value - ", ResultData)
                                       console.log("Return length - ", ResultData.length)
                                       
                                       var items = [];
                                       for(var key in ResultData)
                                       {
                                           items.push(ResultData[key]);
                                       }
                                       
                                       component.set('v.cartItemList', items);
                                       console.log( items);
                                      
                                       
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
        
    }
})