trigger datesToCurrentDate on Work_Item__c (before insert, before update) {
    for(Work_Item__c w : Trigger.New){
        if(w.Status__c == 'Ready')
            w.Start_Date__c = System.today();
        if(w.Status__c == 'Done')
            w.End_Date__c = System.today();
    }
}