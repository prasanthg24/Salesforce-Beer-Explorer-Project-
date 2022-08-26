({
    createContact : function(component, event, helper) 
    {
        var createRecord = $A.get('e.force:createRecord');
        createRecord.setParams
        ({
            "entityApiName" : "Contact",
            "defaultFieldValues":
            {
                'AccountId' : component.get('v.recordId'),
                'Email' : 'salesforcebatch1@gmail.com'
            }
        })
        createRecord.fire();
    } ,
    
    editRecord : function(component, event, helper) 
    {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.recordId")
        });
        editRecordEvent.fire();
    },
    
    handleChange: function (cmp, event) {
        // This will contain an array of the "value" attribute of the selected options
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
    }
})