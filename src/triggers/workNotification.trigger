trigger workNotification on Work_Item__c (after insert) {
    List<Id> myItems = new List<Id>();
    Map<Id,Id> myIds = new Map<Id,Id>();
    for(Work_Item__c w : Trigger.New){
        myItems.add(w.Assignee__c);
        myIds.put(w.id,w.Assignee__c);
    }
    Map<Id,Contact> myContacts = new Map<Id,Contact>([SELECT Email FROM Contact WHERE id in :myItems]);
    for(Work_Item__c w : Trigger.New){
        Contact c = myContacts.get(w.Assignee__c);
        
        String workItemURL = URL.getSalesforceBaseUrl().toExternalForm() +'/'+ w.id;
        
        if(c.Email != null)
        	EmailManager.sendMail(c.Email,'Work Item','Name: ' +w.Name+'\nTitle: ' +w.Title__c+
                              	'\nDescription: '+w.Description__c+'\nWork Item Record: ' + workItemURL);
    }

    
}