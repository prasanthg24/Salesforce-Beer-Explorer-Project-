@isTest
public class Covid19Test {
@isTest
    public static void treatPatientTest()
    {
        Covid19 cbe = new Covid19(10);
        
        Integer treated =cbe.getTreated();
        //check if the count is 10 or not
        System.assertEquals(10,treated,'Treated count not match');
        
        Covid19 podanur = new Covid19(110);
	System.assertEquals(112,podanur.getTreated(),'Treated count not match');        
        
        
    System.assertEquals(122,Covid19.recoveredInCountry,'Treated count not match');  
     	 podanur.treatPatient();
         Integer treate =podanur.getTreated();
        system.assert(treate == 11,'no match');
        System.assertEquals(123,Covid19.recoveredInCountry,'Treated count not match')  ;     
    }
}