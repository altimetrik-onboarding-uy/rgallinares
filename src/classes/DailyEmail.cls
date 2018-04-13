global class DailyEmail implements Schedulable{
    global void execute(SchedulableContext ctx){
        emailBatch b = new emailBatch();
        database.executeBatch(b);
        System.schedule('Work Items Overdue','0 00 00 * * ?',new DailyEmail());
    }
}