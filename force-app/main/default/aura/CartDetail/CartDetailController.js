({
    doCheckout : function(component, event, helper)
    {

        component.set('v.isCheckout', true);

    },
    homePage : function(component, event, helper)
    {
        var pageReference = component.find("navigation");
        var pageReferenceNav = 
        {    
            "type": "standard__navItemPage",
            "attributes": 
            {
                "apiName": "BeerExplorer"    
            }
        };
        pageReference.navigate(pageReferenceNav, true);
    },
    
    doInit : function(component, event, helper) 
    {
         
      /*  component.find('recordCreator').getNewRecord(
            'Address_Book__c',
            null,
            false,
            $A.getCallback(function(){
                var record = component.get('v.record');
                var error = component.get('v.recordError');
                if(error || (record === null)){
                    console.log(' Error while creating the template ',error);
                }else{
                    console.log(' Successfuly Created');
                    //alert('Templated Initiated');
                }
            })
        );*/




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
    
    },
    doApplyCoupon : function(component, event, helper) 
    {
        var CouponNo = component.find('CouponNo').get('v.value');
        var cartId = component.get('v.cartId');
       // alert(CouponNo);
      //  alert(cartId);
        if(CouponNo){
            var action = component.get('c.checkCoupon');
            action.setParams({
                Name : CouponNo,
                CartId : cartId
            });
            action.setCallback(this, function(response){
                var state = response.getState();
               // alert(state);
                if(state === 'SUCCESS' || state ==='DRAFT'){
                    var resultData = response.getReturnValue();
                    if(resultData){
                        component.set('v.discountAmount', resultData);

                        component.set('v.errorDiscount',null);
                        component.set('v.isCouponSuccess', true);
                        var discount = resultData;
                        var subtotal = component.get('v.subTotal') - discount;
                        component.set('v.subTotal',subtotal);
                    }else{
                        component.set('v.errorDiscount','Coupon is not Valid OR Expired.');
                        component.set('v.discountAmount',null);
                         component.set('v.isCouponSuccess', false);
                    }
                }
            });
            $A.enqueueAction(action);
        }else{
            alert('Please Enter your Coupon No');
        }
    }

})