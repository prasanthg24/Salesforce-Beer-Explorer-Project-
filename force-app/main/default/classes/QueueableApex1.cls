public class QueueableApex1 implements queueable
{
	public void execute(QueueableContext context)
    {
        undelete [select name FROM Account Where NAME LIKE 'UPSERT%' AND isdeleted =true ALL Rows ];
        system.debug('Undelete JOb');
    }
    
    
}