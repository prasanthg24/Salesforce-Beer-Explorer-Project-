({
    doclick : function(component, event, helper) {
        alert(component.getName());
        //alert(component.isValid());
        //alert (component.get('v.name1'));
        //component.set('v.name1','Prasanth Gopinathan Google');
        //alert (component.get('v.name1'));
        var age = component.find('age');
        alert (age.get('v.value'));
        age.set('v.value',6786);
        
        
    },
    handleClick: function(component)
    {  //alert(component.getName());
        // alert(component.get('v.msg'));
        
        component.set("v.msg","Salesforce Batch 1");
        
    }
    
    
})