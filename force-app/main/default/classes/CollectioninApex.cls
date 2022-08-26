public class CollectioninApex
{
    public static void Collectionin()
    {      
        Map<Integer, String> m = new Map<Integer, String>();
        m.put(1, 'Bhavna');
        m.put(2, 'Sapna');
        m.put(3, 'Divya');
        m.put(4, 'Bhavya');
        System.debug(m);
        m.remove(1);
       
        List <string > names = new List <string>();
        names = m.values();
        
        
        set <integer > key1 =   new Set <integer>();
        key1 = m.keyset();
        
           System.debug(names);
           System.debug(key1);
        
        
        
        
    }
}
        /*   set<String> s1 = new Set<String>();

s1.add('Ashi');
s1.add('Neela');
s1.add('Anu');
s1.add('Zinta');
system.debug('Set = ' + s1);

List <sTring> L1 = new List<string>();
L1.add('Anu');
L1.add('Zinta');

s1.retainAll(l1);

System.debug('L1 = ' + L1);
System.debug('s1 =  ' + s1);












List<String> L1 = new List <String>();

L1.add('List1');
L1.add('List2');
L1.add('Anu');

s1.addAll(L1);

system.debug('Set = ' + s1);

//Set<String> n = new Set<String>{'value1', 'value2'};









//List
List <string> shivaList = new List <String> ();
shivaList.add('kannur');
shivaList.add('Kochi');
shivaList.add('kannur'); 
shivaList.add('Bangalore');
shivaList.add('Coimbatore');
shivaList.add('Kochi');

system.debug(shivaList);

List<string> ListClone = shivaList.Clone();
System.debug('CLone ' + ListClone);
ListClone.sort();
system.debug(ListClone);



shivaList.set(0,'Bangalore Back to Form!');
system.debug(shivaList);


system.debug(shivaList.get(2));
system.debug(shivaList.size());
system.debug(shivaList);
shivaList.remove(3);
system.debug(shivaList);
shivaList.clear();   
system.debug(shivaList);*/