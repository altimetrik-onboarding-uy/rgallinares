global class emailBatch implements Database.Batchable<sObject>, Database.Stateful{
    global Integer recordsProcessed = 0;
    global String body = '';
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT Name FROM Work_Item__c WHERE Estimated_End_Date__c <= TODAY AND Status__c <> \'Done\''
        );
    }
    global void execute(Database.BatchableContext bc, List<Work_Item__c> scope){
        for(Work_Item__c w : scope){
            recordsProcessed = recordsProcessed + 1;
            body += '\nName: '+w.Name+'\n-----';
        }
    }
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed.');
        EmailManager.sendMail('rgallinares@altimetrik.com','Work Items Overdue','Amount of Work Items Overdue: '+recordsProcessed+body);
    }
}