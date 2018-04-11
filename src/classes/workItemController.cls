public class workItemController {
	@AuraEnabled
    public static List<Work_Item__c> getWorkItems(){
        return [SELECT Name, Title__c, Difficulty__c, Type__c, Status__c FROM Work_Item__c 
               WHERE Start_Date__c = LAST_N_DAYS:30];
    }
}