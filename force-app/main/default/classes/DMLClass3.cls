public class DMLClass3 
{
    Public static void method1()
    {
        List<Contact> newConList = new List<Contact>();
        List<Contact> conList = [select firstname, lastname from contact LIMIT 3];
        Integer i = 1;
        for(Contact cc : conList)
        {
            String s = cc.Lastname;
            if(s.contains('June'))
            {
                cc.phone = '1234';
                newConList.add(cc);
            }
            else
            {
                Contact c1 = new Contact(lastname='Contact'+i);
                I++;
                newConList.add(cc);
            }
        }
        upsert newconList;
    }
    
}