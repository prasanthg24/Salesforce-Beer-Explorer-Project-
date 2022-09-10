({
	validateForm : function(component, event, helper) {
		var isValid = component.find('bOrder').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            inputCmp.set('v.validity', {valid:false, badInput :true});
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        return isValid; 
	},
     
    updateBeerQty : function(component, event, totalQnty, recordId){
        var beetQnty = component.get('v.simpleRecord.Total_Quantity__c');
       // alert(beetQnty)
       // alert(recordId)
        var remainingQnty = parseInt(beetQnty) - parseInt(totalQnty)
        console.log(remainingQnty)
        component.set('v.simpleRecord.Total_Quantity__c',remainingQnty);
        component.find("recordEditor").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var pageReference = component.find("navigation");
                var pageReferenceNav = 
                    {    
                        "type": "standard__component",
                        "attributes": 
                        {
                            "componentName": "c__OrderDetails"    
                        },    
                        state: 
                        {
                            c__orderId:recordId
                        }
                    };
                pageReference.navigate(pageReferenceNav); 
                
            } 
        });
    }
})