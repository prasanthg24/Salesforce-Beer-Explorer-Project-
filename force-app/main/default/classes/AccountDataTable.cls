public class AccountDataTable {
	@AuraEnabled
    public static List<Account> fetchAccount(){
        return [Select Id, Name, Rating, Industry, Phone from Account];
    }
}