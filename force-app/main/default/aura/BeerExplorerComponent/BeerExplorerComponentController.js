({

	dohandle : function(component, event, helper) {
		var searchParam = event.getParam("searchText");
        
        console.log(searchParam);
        //alert(searchParam)
      var action = component.get('c.searchBeer');
        action.setParams({
            a : searchParam
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var responseValue = response.getReturnValue();
                console.log(' responseValue ', responseValue);
                component.set('v.beerList', responseValue);
            }else{
                console.log(response.getError())
            }
        });
        $A.enqueueAction(action);
    }
        
})