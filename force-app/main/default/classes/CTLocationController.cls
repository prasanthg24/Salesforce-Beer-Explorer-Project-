public with sharing class CTLocationController {
   

public static List<Location__c> getRecentStatusChanged()
{
        return [SELECT Name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c FROM Location__c ORDER BY  Status_Update_Date__c DESC NULLS LAST LIMIT 100 ];
}
public static List<Location__c> searchLocation(String searchTerm)
{
    searchTerm =searchTerm+'%';
   List<Location__c> search = [SELECT Name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c FROM Location__c WHERE   Name =:searchTerm OR Pincode__c =:searchTerm OR Address__c=:searchTerm 
    ORDER BY  Status_Update_Date__c DESC LIMIT 100 ];

    return search;
}

public static Location__c getLocationById(String locationId)
{
    List<Location__c> search = [SELECT Name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c FROM Location__c WHERE  Id=:locationId  ];

    if(search!=null && search.size()>0)
    {
    return search[0];
    }
    else 
    {
    return null;
    }
   
}


public static Map<String,Integer> getStatusCount()
{
    Map<String,Integer> LocationCountMap = new Map<String,Integer>();

   for(AggregateResult ar:
    [
       SELECT Status__c,
            COUNT (Id) total 
            FROM Location__c 
            GROUP BY Status__c 
    ] 
    ) 
   {
       String Status = String.valueOf(ar.get('Status__c'));
       Integer total1 = Integer.valueOf(ar.get('total'));

       LocationCountMap.put(Status,total1);
   }

   return LocationCountMap;
}

}