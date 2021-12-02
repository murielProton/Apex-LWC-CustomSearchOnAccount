public with sharing class AccountUtility {
    @AuraEnabled
    public static List<Account> getListOfAllAccounts(){
        List<Account> listOfAllAccounts = new List<Account>();
        try {
            listOfAllAccounts = [SELECT Id, Name, BillingPostalCode, ShippingPostalCode
                                            FROM Account
                                            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return listOfAllAccounts;
    }
}
