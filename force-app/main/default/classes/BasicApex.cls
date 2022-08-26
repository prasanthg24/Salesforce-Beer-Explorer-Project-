public class BasicApex 
{
    public static void main()
    {
        Integer a = 34566;
        system.debug('Integer = ' + a);
        Long b = 32589535L;
        system.debug('Long = '+b);
        Decimal c = 3235.43;
        System.debug('Decimal = '+c);
        Double d = 953453683;
        System.debug('Double =  '+d);
        
        Date e = Date.newInstance(1999,05,24);
        System.debug('Date =  '+e);
        String  f = 'Salesforce Developer';
        System.debug('String = '+ f);
        
        ID recordId = 'a015j00000Cpe2vAAB';
        System.debug('ID = '+ recordId);
        Datetime dt = Datetime.newInstance(1999,5,24,12,3,3);
        System.debug('dt = '+ dt);
        
    }
    
    
}