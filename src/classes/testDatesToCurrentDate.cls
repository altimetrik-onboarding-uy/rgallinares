@isTest
public class testDatesToCurrentDate {
    @isTest static void TestStatusDone(){
        Work_Item__c w = new Work_Item__c(Type__c='Idea',
                                         Title__c='Test Trigger Done', Assignee__c='0036A00000Ru25rQAB',
                                         Difficulty__c='3',Status__c='Done');       
        Test.startTest();
        Database.SaveResult result = Database.insert(w);
        Test.stopTest();
    }
    @isTest static void TestStatusReady(){
        Work_Item__c w = new Work_Item__c(Type__c='Fix',
                                         Title__c='Test Trigger Ready', Assignee__c='0036A00000Ru25rQAB',
                                         Difficulty__c='5',Status__c='Ready');       
        Test.startTest();
        insert w;
        Test.stopTest();        
    }
}