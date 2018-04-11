({
	handleClick : function(component, event, helper) {
        var editRecordEvent =$A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId" : component.get("v.workItem.Id")
        });
        editRecordEvent.fire();
	}
})