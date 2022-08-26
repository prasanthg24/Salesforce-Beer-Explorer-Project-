public with sharing class CTLocationTracingController {
    

public static List<Location_Tracing__c> getVisitors(String LocationId)
{

    return [SELECT  Id,  Person__c,Person__r.Name, Person__r.Token__c,Location__c, Visit_Date__c FROM Location_Tracing__c 
    WHERE Id=:LocationId
    ORDER BY Visit_Date__c DESC];
}


public static list<Location_Tracing__c>getLocationsByPersonalds(Set<Id>Personlds)
{
    return [SELECT  Id,Person__c,Location__c
    FROM Location_Tracing__c 
    WHERE Person__c IN :Personlds 
    AND Visit_Date__c =LAST_N_DAYS:10];
}

public static list<Location_Tracing__c> getLocationsByLocationIds(Set <Id>locationlds)
{
    return[SELECT Id, Name, Person__c, Location__c, Visit_Date__c 
    FROM Location_Tracing__c 
    WHERE Location__c IN:locationlds
     AND Person__r.Health_Status__c='Green'
     AND Visit_Date__c=LAST_N_DAYS:10 ];
}



public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c>newLocationTraces)
{
    //store unique location Ids
    Set<Id> LocationIds = new Set<Id>();
     //store unique Person Ids
    Set<Id> personIds = new Set<Id>();

    for(Location_Tracing__c trace :newLocationTraces)
    {
        LocationIds.add(trace.Location__c);
        personIds.add(trace.Person__c);
    }

    //query existing location tracing
    Map<Id,set<Id>> mapOfExistingRecords = new Map<Id,Set<Id>>();
    List<Location_Tracing__c> existingRecords =
    [
        SELECT Id,  Person__c, Location__c
        FROM Location_Tracing__c 
        WHERE Location__c IN : LocationIds
        AND Person__c IN :personIds];

//List of Duplicates
List<Location_Tracing__c>duplicates = new List<Location_Tracing__c> ();

    if(existingRecords != null && existingRecords.size()>0)
    {
        for(Location_Tracing__c trace :existingRecords)
        {
                if(!mapOfExistingRecords.containsKey(trace.Location__c))
                {
                    mapOfExistingRecords.put(trace.Location__c,new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);

            }

            for(Location_Tracing__c trace:newLocationTraces)
            {
                if(mapOfExistingRecords.containsKey(trace.Location__c)&&
                mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c))
                {
                    duplicates.add(trace);
                }
            }
    }
    

    return duplicates;

    
}











}