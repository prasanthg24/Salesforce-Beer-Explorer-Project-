public class ApexCollection 
{
    public  void collect()
    {
        List<String> con = new List <String>();
            con.add('Prasanth');
            con.add('Raja');
            con.add('Lala');
            system.debug('Con List = ' + con);
            system.debug('Contains = ' + con.Contains('Prasanth'));
        
        set<Integer>RollNo = new set<Integer>();
            RollNo.add(101);
            RollNo.add(102);
            RollNo.add(103);
            RollNo.add(104);
            system.debug('Roll no =  '+ RollNo);
        
        set<String> Name = new set<String> {'Prasanth','Gopi','Kaala','Shivaraj' };
            system.debug('Names = '+ Name);
            system.debug('Contains = ' + Name.Contains('Prasanth'));
        
        
        Map<Integer,String> Col = new map<Integer,String>();
            Col.put(1,'Lala');
            col.put(2,'Vino');
            col.put(3,'Shana');
            system.debug('Get Col key '+ col.keyset());
            system.debug('Get Col Value '+ col.values());
            System.debug('Get Col = '+ col);
            col.remove(1);
            System.debug('Get Col = '+ col);
        
    
        
    }
}