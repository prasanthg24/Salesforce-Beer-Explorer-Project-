public class foreach {
    public static void store()
    {
       /* List<product2> ProdRecord = [SELECT Id, Name, ProductCode, Description, IsActive FROM Product2];
       
        for(product2 aj : ProdRecord )
        {
           aj.Name = aj.Name + ' KCE ';

        }
        
        system.debug(ProdRecord);
        
        update ProdRecord;*/
        
        
        
        
        
        
        
        List<Account> ac = [select Name,Id From ACcount];
        
        for( Account kce : ac)
        {
            system.debug(kce.Name + ' ' + kce.Id);
        }
        
        
        
        
        
        
    }
}