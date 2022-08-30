({
    doInit : function(component, event, helper) {

        component.set('v.columns', [
            {label: 'Beer Order ID', fieldName: 'opportunityName', type: 'text'},
           
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
