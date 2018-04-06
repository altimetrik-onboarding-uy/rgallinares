trigger workNotification on Work_Item__c (after insert) {
    for(Work_Item__c w : Trigger.New){
        String workItemURL = URL.getSalesforceBaseUrl().toExternalForm() +'/'+ w.id;
        Contact c = [SELECT Email FROM Contact WHERE id =:w.Assignee__c LIMIT 1];
        if(c.Email != null)
        	EmailManager.sendMail(c.Email,'Work Item','Name: ' +w.Name+'\nTitle: ' +w.Title__c+
                              	'\nDescription: '+w.Description__c+'\nWork Item Record: ' + workItemURL);
    }
}