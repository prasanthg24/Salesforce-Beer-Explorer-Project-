public with sharing class BeerDataTable {
    @AuraEnabled
    public List<Beer_Order__c> getdatatable() 
    {
        List<Beer_Order__c> beerlist = [SELECT Billing_Street__c, Shipping_Postal_Code__c, Shipping_Street__c, Beer__c, Status__c, Order_Amount__c, Name, Id FROM Beer_Order__c];
        System.debug(beerlist);
        return beerlist;
        
    }
}
