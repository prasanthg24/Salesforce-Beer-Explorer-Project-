public class BatchClass1 implements database.Batchable<Sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext c)
    {
        return database.getQueryLocator('select id,name from Account LIMIT 10');
    }
    public void execute(Database.BatchableContext BC ,List<Account> a )
    {
        for(Account g : a)
        {
            g.Name = g.name + ' schedulable Apex Test';
        }
        update a;
    }
    public void finish(Database.BatchableContext BC)
    {
        system.debug('batch apex executed successfully');
    }
}