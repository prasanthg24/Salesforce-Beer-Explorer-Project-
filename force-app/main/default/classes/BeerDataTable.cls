public with sharing class BeerDataTable {
    @AuraEnabled
    public static List<Beer_Order__c> getdatatable() 
    {
        List<Beer_Order__c> beerlist = [SELECT Billing_City__c, Shipping_Postal_Code__c, Billing_Country__c, Beer__c, Status__c, Order_Amount__c, Name, Id FROM Beer_Order__c];
        System.debug(beerlist);
        return beerlist;
        
    }
}