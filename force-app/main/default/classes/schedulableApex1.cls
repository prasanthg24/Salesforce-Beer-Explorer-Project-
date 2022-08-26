public class schedulableApex1  implements schedulable
{
	public void execute (Schedulablecontext c)
    {
        Database.executeBatch(new Batchclass1(),2);
    }
}