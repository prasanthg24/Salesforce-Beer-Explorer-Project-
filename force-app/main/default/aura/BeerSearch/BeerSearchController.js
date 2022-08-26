({  dosearch : function(component, event, helper) 
    {  

        var componentEvent = component.getEvent('BeerEvent');      
        console.log(componentEvent);
        var searchParam = component.find('searchInp').get('v.value');     

        console.log(searchParam)     
        componentEvent.setParams({searchText : searchParam});     
        componentEvent.fire();  
    }     
})