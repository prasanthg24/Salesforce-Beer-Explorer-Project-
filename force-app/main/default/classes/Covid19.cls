public class Covid19 {
    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;

    // parameterized constructor to set class variables value
    public Covid19(Integer recoveredInArea){
       
            this.recoveredInArea = recoveredInArea;
            recoveredInCountry += recoveredInArea;
    }

    // increment the count of recoveredInArea and recoveredInCountry by 1
    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }

    // return the value of recoveredInArea
    public Integer getTreated() {
        return recoveredInArea;
    }
}