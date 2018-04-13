@isTest
private class EmailTest {	
    @isTest public static void testScheduledJob(){
        String CRON_EXP = '0 00 00 * * ?';
        Test.startTest();
        String jobId = System.schedule('Test check',CRON_EXP,new DailyEmail());
		CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id=:jobId];        
        Test.stopTest();
        System.assertEquals(CRON_EXP,ct.CronExpression);
    }
}