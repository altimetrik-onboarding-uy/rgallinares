@isTest
public class testEmailBatch {
    static testMethod void TestEmailBatchMethod(){
        List<Work_Item__c> myItems = new List<Work_Item__c>();
        List<Contact> myContacts = new List<Contact>();
        for(Integer j=0;j<200;j++){
            myContacts.add(new Contact(FirstName='Test Batch',LastName='Email '+j
            ));
        }
        insert myContacts;
        for(Integer i=0;i<200;i++){
            	myItems.add(new Work_Item__c(Type__c='Idea',Title__c='Test Batch Email ' +i,
                                         Estimated_End_Date__c=Date.today().addDays(-3),
                                         Difficulty__c='3',Status__c='Ready',Assignee__c=myContacts.get(i).Id
            	));
        }
        insert myItems;
        Test.startTest();
        emailBatch b = new emailBatch();
        Database.executeBatch(b);   
        Test.stopTest();
        AsyncApexJob jobInfo = [SELECT Status FROM AsyncApexJob LIMIT 1];
        System.assertEquals('Completed',jobInfo.Status);
    }
}