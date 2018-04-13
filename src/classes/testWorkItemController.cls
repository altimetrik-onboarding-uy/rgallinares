@isTest
public class testWorkItemController {
    @isTest static void TestWorkItemsLast30Days(){
        List<Work_Item__c> myItems = new List<Work_Item__c>();
        Contact c = new Contact(FirstName='Test Apex Controller',LastName='Last 30 Days');
        insert c;
        for(Integer i =0;i<5;i++){
            myItems.add(new Work_Item__c(Type__c='Idea',Title__c='Test Apex Controller ' +i,
                                         Start_Date__c = Date.today().addDays(-5),
                                         Difficulty__c='3',Status__c='Ready',Assignee__c=c.Id
            ));
        }
        insert myItems;
        Test.startTest();
        	List<Work_Item__c> testItems = workItemController.getWorkItems();
        Test.stopTest();
     	System.assertEquals([SELECT Name, Title__c,Difficulty__c,Type__c,Status__c FROM Work_Item__c WHERE Start_Date__c = LAST_N_DAYS:30],testItems);
    }
    @isTest static void TestWorkItemsForAssignee(){
        Contact cc = new Contact(FirstName='Diff Contact',LastName='Test');
        insert cc;
        List<Work_Item__c> itemsWithDiffContact = new List<Work_Item__c>();
        for(Integer j =0;j<5;j++){
            itemsWithDiffContact.add(new Work_Item__c(Type__c='Fix',Title__c='Test Apex Controller ' +j,
                                         Start_Date__c = Date.today().addDays(-5),
                                         Difficulty__c='3',Status__c='Ready',Assignee__c=cc.Id
            ));
        }
        insert itemsWithDiffContact;
        Test.startTest();
        List<Work_Item__c> testItems = workItemController.getWorkItemsAssigned(cc.Id);
        Test.stopTest();
        System.assertEquals([SELECT Name, Title__c, Difficulty__c, Type__c, Status__c FROM Work_Item__c 
                             WHERE Assignee__c =: cc.Id AND Start_Date__c = LAST_N_DAYS:30],testItems);
    }
}