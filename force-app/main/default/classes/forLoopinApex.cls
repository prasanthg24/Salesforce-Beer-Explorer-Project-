public class forLoopinApex
{
    public  void main()
    {
       integer n,r,sum = 0 ;
        n=489; //21
        while(n>0)
        {
            	r = math.mod(n,10);
                n =n/10; 
            
            	sum = r + sum; 
        }
        system.debug('sum = '+ sum);
        
        
        
        /*   List<String> name = new List<String>();
name.add('Dhanush');
name.add('Shiva');
name.add('Gowtham');
name.add('Saravana');
name.add('Abi');
name.add('Nithish');



for(integer i=5; i>=0; i--)      //5 4 3 2 1 0 
{
system.debug(name.get(i)); //Nithish Abi Saravana Gowtham Shiva Dhanush
}


set<integer> rollNo = new set<integer>();
rollNo.add(101);
rollNo.add(102);
rollNo.add(103);
rollNo.add(104);
rollNo.add(105);
rollNo.add(106);
rollNo.add(107);

//system.debug('roll 1' + rollNo.get(101));
//system.debug(rollNo);

map<integer,string> empData = new Map <integer,String>();


//empData.put(rollNo.get('101'),name.get(0));*/
        
     
    }
}