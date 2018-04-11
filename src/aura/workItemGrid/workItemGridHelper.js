({
	callback : function(component, response) {
		var state = response.getState();
            if(state==="SUCCESS"){
                var myItem = [];
                component.set("v.workItems",response.getReturnValue());
                myItem = response.getReturnValue();
                var newItem = component.get("v.newItems");
                var readyItem = component.get("v.readyItems");
                var inProgressItem = component.get("v.inProgressItems");
                var doneItem = component.get("v.doneItems");
                myItem.forEach(function(myItem){
                    if(myItem.Status__c == "New"){                        
                        newItem.push(myItem);                        
                    }
                    if(myItem.Status__c == "Ready"){                        
                        readyItem.push(myItem);                        
                    }
                    if(myItem.Status__c == "In Progress"){                        
                        inProgressItem.push(myItem);                        
                    }
                    if(myItem.Status__c == "Done"){                        
                        doneItem.push(myItem);                        
                    }
                });               
                component.set("v.newItems",newItem);
                component.set("v.readyItems",readyItem);
                component.set("v.inProgressItems",inProgressItem);
                component.set("v.doneItems",doneItem);
            }else{
                console.log("Failed with state: " +state);
            }
	}
})