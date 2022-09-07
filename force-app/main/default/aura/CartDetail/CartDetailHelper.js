({
    validate : function(component, event, helper) {
        var isValid = component.find('address').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            inputCmp.set('v.validity', {valid:false, badInput :true});
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        return isValid; 
	}
})