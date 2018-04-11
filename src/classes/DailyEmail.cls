global class DailyEmail implements Schedulable{
    global void execute(SchedulableContext ctx){
        emailBatch b = new emailBatch();
        database.executeBatch(b);
    }
}