@isTest
public class testWorkNotification {
    @isTest static void TestWorkNotification(){
        List<Work_Item__c> myItems = new List<Work_Item__c>();
        Contact c = new Contact(FirstName='Test Work Notification', LastName='Trigger', Email='rgallinares@altimetrik.com');
        insert c;
        for(Integer i=0;i<3;i++){
            myItems.add(new Work_Item__c(Type__c='Idea',
                       Title__c='Test Work Notification '+i, Assignee__c = c.Id,
                       Difficulty__c='3',Status__c='Done'
            ));
        }
        Test.startTest();
        insert myItems;
        Integer j = Limits.getEmailInvocations();
        Test.stopTest();
        System.assertEquals(3,j);
    }
}