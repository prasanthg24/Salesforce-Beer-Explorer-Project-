public class StudentClass
{
    @InvocableMethod
    public static void updateStudentName (List<Id> ids )
    {
        List<Student__c> stud  = new List <Student__c>();
        List<Student__c> student = [SELECT Name FROM Student__c WHERE Id IN :ids ];
        
        for(Student__c sc :student )
        {
            sc.Name = sc.Name + ' MCA Karpagam ';
            stud.add(sc);
        }
        update stud;
    }
  
}