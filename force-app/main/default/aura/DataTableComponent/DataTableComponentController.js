({
    doInit : function(component, event, helper) {

        component.set('v.columns', [
            {label: 'Beer Order ID', fieldName: 'Name', type: 'text'},
            {label: 'Amount', fieldName: 'Order_Amount__c', type: 'text'},
            {label: 'Billing City', fieldName: 'Billing_City__c', type: 'text'},
            {label: 'Country', fieldName: 'Billing_Country__c', type: 'text'},
            {label: 'Postal Code', fieldName: 'Shipping_Postal_Code__c', type: 'text'},
           
           

            
        ]);

        var action = component.get('c.getdatatable');
        action.setCallback(this, function(response){
            var state = response.getState();
            //alert(state);
            if(state === 'SUCCESS' || state==='DRAFT' ){
                var responseValue = response.getReturnValue();
                console.log('responseValue ', responseValue)
                component.set('v.data', responseValue);
            }
        });
        $A.enqueueAction(action);
    },
    doSelectRecord : function(component, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        console.log('selectedRows ', selectedRows);
    },
})
