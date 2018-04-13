@isTest
public class testDatesToCurrentDate {
    @isTest static void TestStatusDone(){
        Contact c = new Contact(FirstName='Test Status', LastName='Done');
        insert c;
        Work_Item__c w = new Work_Item__c(Type__c='Idea',
                                         Title__c='Test Trigger Done', Assignee__c=c.Id,
                                         Difficulty__c='3',Status__c='Done');       
        Test.startTest();
        Database.SaveResult result = Database.insert(w);
        Test.stopTest();
        System.assert(result.isSuccess());
    }
    @isTest static void TestStatusReady(){
        Contact c = new Contact(FirstName='Test Status', LastName='Ready');
        insert c;
        Work_Item__c w = new Work_Item__c(Type__c='Fix',
                                         Title__c='Test Trigger Ready', Assignee__c=c.Id,
                                         Difficulty__c='5',Status__c='Ready');       
        Test.startTest();
        Database.SaveResult result = Database.insert(w);
        Test.stopTest();
		System.assert(result.isSuccess());        
    }
}