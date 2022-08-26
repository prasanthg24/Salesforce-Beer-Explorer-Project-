({
    dynamicHandler : function(component, event, helper)
    {
        //createComponent(String type, Object attributes, function callback)
        $A.createComponent(
            "Lightning:button",
            {
                "label":"Dynamic button",
                "onclick": component.getReference("c.test"),
                "variant":"brand"
            },
            function(newButton, status, errorMessage)
            {
                if (status === "SUCCESS") {
                    var bodyjs = component.get("v.body");
                    bodyjs.push(newButton);
                    component.set("v.body", bodyjs);
                }
            }
                
            )
},
    
    test : function(component, event, helper) 
    {
        component.set('v.message',"Hello Salesforce")
    }
})