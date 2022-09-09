({
    helperMethod : function() {

    },
    navService : function(component, pageReference, replace){
    let _replace = replace || false;
    let navService  = component.getSuper().find('navigation');
    navService.navigate(pageReference, _replace);

},

delayedRefresh : function(milliseconds){
    let ms = milliseconds || 500;
    window.setTimeout($A.getCallback(function(){
        $A.get('e.force:refreshView').fire();
    }),ms);
},
})