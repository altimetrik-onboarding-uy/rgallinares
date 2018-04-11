({
	doInit : function(component, event, helper) {
		var action = component.get("c.getWorkItems");
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state==="SUCCESS"){
                var myItem = [];
                component.set("v.workItems",response.getReturnValue());
                myItem = response.getReturnValue();
              	debugger;
                var newItem = component.get("v.newItems");
                var readyItem = component.get("v.readyItems");
                var inProgressItem = component.get("v.inProgressItems");
                var doneItem = component.get("v.doneItems");
                myItem.forEach(function(myItem){
                    if(myItem.Status__c == "New"){                        
                        newItem.push(myItem);
						console.log("Entro en status new");                        
                    }
                    if(myItem.Status__c == "Ready"){                        
                        readyItem.push(myItem);
						console.log("Entro en status ready");                        
                    }
                    if(myItem.Status__c == "In Progress"){                        
                        inProgressItem.push(myItem);
						console.log("Entro en status in progress");                        
                    }
                    if(myItem.Status__c == "Done"){                        
                        doneItem.push(myItem);
						console.log("Entro en status done");                        
                    }
                });
                
                component.set("v.newItems",newItem);
                component.set("v.readyItems",readyItem);
                component.set("v.inProgressItems",inProgressItem);
                component.set("v.doneItems",doneItem);
            }else{
                console.log("Failed with state: " +state);
            }
        });
        $A.enqueueAction(action);
	},
    
})