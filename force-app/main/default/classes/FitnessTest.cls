@isTest
public class FitnessTest {
    @isTest
        public static void test()
        {
            Fitness f = new Fitness();
           //	Decimal res = Fitness.calculateBMI(35,5.11);
            //System.assertEquals('2E+1',res,'Not Equal');
            
            Decimal paceResult = Fitness.calculatePace(10, 30);
            System.assertEquals(20, paceResult , 'not Equal');
        }

}