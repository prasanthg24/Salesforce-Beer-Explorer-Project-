({
	handleClick : function(component, event, helper)
    {
		//console.log()
       // alert(component.getName());
       // alert(component.get("v.test"));
      // component.set("v.test","Prasanth Dhanush Abinaya")
     //  alert(component.isValid());
  	var compinput = component.find('input')
    console.log(compinput.get('v.value') )
    alert(compinput.get('v.value') )


	}
})