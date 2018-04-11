public class workItemController {
	@AuraEnabled
    public static List<Work_Item__c> getWorkItems(){
        return [SELECT Name, Title__c, Difficulty__c, Type__c, Status__c FROM Work_Item__c 
               WHERE Start_Date__c = LAST_N_DAYS:30];
    }
    @AuraEnabled
    public static list<Work_Item__C> getWorkItemsAssigned(String contactId){
        return [SELECT Name, Title__c, Difficulty__c, Type__c, Status__c FROM Work_Item__c
               WHERE Assignee__c =: contactId AND Start_Date__c = LAST_N_DAYS:30];
    }
}