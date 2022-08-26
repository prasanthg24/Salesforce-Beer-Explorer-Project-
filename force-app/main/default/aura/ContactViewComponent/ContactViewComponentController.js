({
    doHandleEvent : function(component, event, helper) 
    {
        alert('Event Handled ');
   var conRecord = event.getParam('ContactEvent');
        console.log('conRecord ', conRecord);
        var contactList = component.get('v.contactList');

        if(contactList){
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
           
       
        }else{
            contactList = [];
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
           
       
        }
    }
})