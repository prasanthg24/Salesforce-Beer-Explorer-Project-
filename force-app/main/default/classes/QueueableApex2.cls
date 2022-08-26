public class QueueableApex2 implements queueable
{
	public void execute(QueueableContext c)
    {
        delete [select name FROM Account Where NAME LIKE 'UPSERT%' ];
        system.debug('Delete Job');
        system.enqueueJob(new QueueableApex1());
    }
    
    
}