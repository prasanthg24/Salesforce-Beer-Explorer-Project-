public class futureClass {
	
    public  futureclass()
    {
        system.debug('Constructor');
        takeshower();
        eatingBreakfast();
        carservicing();
        moviewithfamily();
    }
    public static void takeshower()
    {
        system.debug('takeshower');
    }
    public static void eatingBreakfast()
    {
        system.debug('eating');
    }
    @future
    public static void carservicing()
    {
        system.debug('Car servicing');
    }
    public static void Moviewithfamily()
    {
        system.debug('Vikram ');
    }
}