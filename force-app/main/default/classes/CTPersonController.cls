public with sharing class CTPersonController
{
    
    public static string getToken(String mobileNo)
    {

        Blob value =Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5',value);

        return EncodingUtil.base64Encode(hash);
    }

    public static List <Person__c>  getRecentHealthChanges()
    {
        List<Person__c> people1 =[SELECT Id, Name,Mobile__c,Status_Update_Date__c,Token__c,Health_Status__c  FROM Person__c  ORDER BY Status_Update_Date__c  DESC NULLS LAST LIMIT 100];
        return people1;
    }

    public static List <Person__c> searchPeople(String searchTerm)
    {
        searchTerm = searchTerm+'%';
        List<Person__c> searchResult= [SELECT Id, Name,Mobile__c,Status_Update_Date__c,Token__c,Health_Status__c  FROM  Person__c WHERE (Name LIKE :searchTerm  OR Mobile__c LIKE  :searchTerm OR Token__c  LIKE  :searchTerm) ORDER BY Status_Update_Date__c  ];
        return searchResult;
    }

    public static Person__c getPersonById(String personId)
    {
      List<  Person__c> get = [SELECT Name,Mobile__c,Status_Update_Date__c,Token__c,Health_Status__c  FROM Person__c WHERE Id =:personId  ];
      if (get!= null && get.size()>0) {
          return get[0];
      }  
      return null;
    }

  public static Map<String,Integer> getHealthStatusCount()
    {
        Map<String,Integer> healthCountMap = new Map<String,Integer>();
       for(AggregateResult ar:[SELECT Health_Status__c ,
                COUNT (Id) total 
                FROM Person__c 
                GROUP BY Health_Status__c ] ) 
       {
           String healthStatus = String.valueOf(ar.get('Health_Status__c'));
           Integer total1 = Integer.valueOf(ar.get('total'));

            healthCountMap.put(healthStatus,total1);
       }

       return healthCountMap;
    }
    
    
    public static Set<Id>getCohabitants(Set<Id> personIds)
    {
      List<String> healthStatuses = new List<String> {'Green','Yellow'};
      List<People_Tracing__c> peopleTraces =   [SELECT Id, Person_1__c, Person_2__c  FROM People_Tracing__c 
                                                WHERE (Person_1__c IN : personIds  OR Person_2__c IN : personIds)
                                                AND Contact_Type__c = 'Cohabitant'
                                               	AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c  IN : healthStatuses) ];
        
        											
            
        Set<Id>Cohabitans = new Set<Id>();
        for(People_Tracing__c pt: peopleTraces)
        {
            if(!personIds.contains(pt.Person_1__c))
            {
                Cohabitans.add(pt.Person_1__c);
            }
           if(!personIds.contains(pt.Person_2__c))
            {
                Cohabitans.add(pt.Person_2__c);
            }
        }
        return Cohabitans;    
    }
    
  /**    public static Set<Id> getCohabitants(Set<Id> personIds, Set<Id> alreadyProcessed){
        List<String> healthStatuses = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                    WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                    AND Contact_Type__c = 'Cohabitant'
                                                    AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN : healthStatuses)];
        Set<Id> cohabitants = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!alreadyProcessed.contains(pt.Person_1__c)){
                cohabitants.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if(!personIds.contains(pt.Person_2__c)){
                cohabitants.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }
        return cohabitants;

    }**/
        
    
    
    
    
    
    
    
    
    
}