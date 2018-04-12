({
	doInit : function(component, event, helper) {
        var action;
        console.log(component.get("v.contactId"));
        if(component.get("v.contactId")){
            action = component.get("c.getWorkItemsAssigned");
            action.setParams({
                "contactId" : component.get("v.contactId") 
            });
        }else{
            action = component.get("c.getWorkItems");
        }
		action.setCallback(this,function(response){
            helper.loadLists(component,response);
        });
        $A.enqueueAction(action);        
	},
    
})