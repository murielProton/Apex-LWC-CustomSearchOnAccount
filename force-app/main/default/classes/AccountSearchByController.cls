public with sharing class AccountSearchByController {
    public AccountSearchByController(){}
    @AuraEnabled(cacheable=true)
    public static List<Account> accountSearchBy(String inputName, String inputPostalCode) {
        System.debug('Input Name -> '+inputName);
        System.debug('Input PostalCode -> '+inputPostalCode);
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        list<Account> sortedListOfAccounts = new list<Account>();
        List<Account> newListOfAccounts = new List<Account>();
        System.debug('Size of the List of All Accounts -> '+listOfAllAccountsToSort.size());
        if((inputName != Null && !String.isBlank(inputName)) && 
        (inputPostalCode != Null && !String.isBlank(inputPostalCode))){
            sortedListOfAccounts = getListOfAccountsByName(listOfAllAccountsToSort, inputName);
            sortedListOfAccounts = getListOfAccountsByPostCode(sortedListOfAccounts, inputPostalCode);
            System.debug('AliZayd size -> '+sortedListOfAccounts.size());
            return sortedListOfAccounts;
        }else if((inputName != Null || !String.isBlank(inputName)) && 
        (inputPostalCode == Null || String.isBlank(inputPostalCode))){
            sortedListOfAccounts = getListOfAccountsByName(listOfAllAccountsToSort, inputName);
            System.debug('Dara size -> '+sortedListOfAccounts.size());
            return sortedListOfAccounts;
        }else if((inputName == Null || String.isBlank(inputName)) && 
        (inputPostalCode != Null || !String.isBlank(inputPostalCode))){
            sortedListOfAccounts = getListOfAccountsByPostCode(listOfAllAccountsToSort, inputPostalCode);
            System.debug('Nahir size -> '+sortedListOfAccounts.size());
            return sortedListOfAccounts;
        }
        System.debug('Zaynam size -> '+listOfAllAccountsToSort.size());
        return listOfAllAccountsToSort;
    }
    @AuraEnabled
    public static List<Account> getListOfAccountsByPostCode(List<Account> listOfAccountsToSort, String postCode){
        List<Account> listOfAccountsSortedByPosteCodes = new List<Account>();
        listOfAccountsSortedByPosteCodes = getListOfAccountsByShippingPostCode(listOfAccountsToSort, postCode);
        List<Account> listOfAllAccountsSortedByBillingPC =getListOfAccountsByBillingPostCode(listOfAccountsToSort, postCode);
        for(Account currentAccount : listOfAllAccountsSortedByBillingPC ){
            if(currentAccount.BillingPostalCode == postCode){
                listOfAccountsSortedByPosteCodes.add(currentAccount);
                System.debug('Valid current Account -> '+ currentAccount.ShippingPostalCode +' - ' +currentAccount.BillingPostalCode);
            } else {
                System.debug('Discarded current Account -> '+ currentAccount.ShippingPostalCode +' - ' +currentAccount.BillingPostalCode);
                continue;
            }
        }
        System.debug('Size of current Account List sorted by Billing Address Post Code -> '+ listOfAccountsSortedByPosteCodes.size());
        return listOfAccountsSortedByPosteCodes;
    }
    @AuraEnabled
    public static List<Account> getListOfAccountsByName(List<Account> listOfAccountsToSort, String accountName){
        List<Account> listOfAllAccountsSortedByName = new List<Account>();
        System.debug('Account Name -> '+accountName);
        for(Account currentAccount : listOfAccountsToSort){
            if(currentAccount.Name.contains(accountName)){
                listOfAllAccountsSortedByName.add(currentAccount);
            } else {
                continue;
            }
        }
        System.debug('listOfAllAccountsSortedByName Size -> '+listOfAllAccountsSortedByName.size());
        return listOfAllAccountsSortedByName;
    }

    @AuraEnabled
    public static List<Account> getListOfAccountsByBillingPostCode(List<Account> listOfAccountsToSort, String billingPostCode){
        List<Account> listOfAllAccountsSortedByBillingPC = new List<Account>();
        for(Account currentAccount : listOfAccountsToSort){
            if(currentAccount.BillingPostalCode == billingPostCode){
                listOfAllAccountsSortedByBillingPC.add(currentAccount);
            } else {
                continue;
            }
        }
        return listOfAllAccountsSortedByBillingPC;
    }

    @AuraEnabled
    public static List<Account> getListOfAccountsByShippingPostCode(List<Account> listOfAccountsToSort, String shippingPostCode){
        List<Account> listOfAllAccountsSortedByShippingPC = new List<Account>();
        for(Account currentAccount : listOfAccountsToSort){
            if(currentAccount.ShippingPostalCode == shippingPostCode){
                listOfAllAccountsSortedByShippingPC.add(currentAccount);
            } else {
                continue;
            }
        }
        return listOfAllAccountsSortedByShippingPC;
    }

}
