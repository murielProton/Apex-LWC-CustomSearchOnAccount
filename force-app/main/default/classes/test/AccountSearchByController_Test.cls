@isTest
private class AccountSearchByController_Test {
    @testSetup
    static void setup() {
        List<Account> listOfAccountsToInsert = new List<Account>();
        listOfAccountsToInsert.add(new Account(Name = 'Dickenson plc', ShippingPostalCode='66045'));
        listOfAccountsToInsert.add(new Account(Name = 'Austen plc', ShippingPostalCode='OX1 3EX', BillingPostalCode ='RG1'));
        listOfAccountsToInsert.add(new Account(Name = 'Wilde plc', ShippingPostalCode='OX1 3EX', BillingPostalCode ='OX1 3EX'));
        listOfAccountsToInsert.add(new Account(Name = 'Christie plc', BillingPostalCode ='OX1 3EX'));
        listOfAccountsToInsert.add(new Account(Name = 'United Oil & Gas, UK'));
        listOfAccountsToInsert.add(new Account(Name = 'United Oil & Gas Corp.'));
        listOfAccountsToInsert.add(new Account(Name = 'United Oil & Gas, Singapore', BillingPostalCode ='569933'));
        upsert listOfAccountsToInsert;
    }

    @isTest
    private static void getListOfAccountsByNameTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String accountName1 = 'Dickenson plc';
        String accountName2 = 'Oil & Gas';
        List<Account> newListOfAccounts1 = AccountSearchByController.getListOfAccountsByName(listOfAllAccountsToSort, accountName1);
        List<Account> newListOfAccounts2 = AccountSearchByController.getListOfAccountsByName(listOfAllAccountsToSort, accountName2);
        System.assertEquals(1,newListOfAccounts1.size());
        System.assertEquals(3,newListOfAccounts2.size());
    }
    @isTest
    private static void getListOfAccountsByBillingPCTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String billingPostalCode = '569933';
        List<Account> newListOfAccounts = AccountSearchByController.getListOfAccountsByBillingPostCode(listOfAllAccountsToSort, billingPostalCode);
        System.assertEquals(1,newListOfAccounts.size());
    }
    @isTest
    private static void getListOfAccountsByShippingPCTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String shippingPostalCode = '66045';
        List<Account> newListOfAccounts = AccountSearchByController.getListOfAccountsByShippingPostCode(listOfAllAccountsToSort, shippingPostalCode);
        System.assertEquals(1,newListOfAccounts.size());
    }
    @isTest
    private static void getListOfAccountsByPostCodeTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String postalCode = 'OX1 3EX';
        List<Account> newListOfAccounts = AccountSearchByController.getListOfAccountsByPostCode(listOfAllAccountsToSort, postalCode);
        System.assertEquals(3,newListOfAccounts.size());
    }
    @isTest
    private static void accountSearchByNoParamTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String accountName= null;
        String postalCode = null;
        List<Account> newListOfAccounts = AccountSearchByController.accountSearchBy(accountName, postalCode);
        System.assertEquals(7,newListOfAccounts.size());
    }
    @isTest
    private static void accountSearchByNameAndPCTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String accountName = 'ited O';
        String postalCode = '569933';
        List<Account> newListOfAccounts = AccountSearchByController.accountSearchBy(accountName, postalCode);
        System.assertEquals(1,newListOfAccounts.size());
    }
    @isTest
    private static void accountSearchByNameTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String accountName = 'ited O';
        String postalCode = null;
        List<Account> newListOfAccounts = AccountSearchByController.accountSearchBy(accountName, postalCode);
        System.assertEquals(3,newListOfAccounts.size());
    }
    @isTest
    private static void accountSearchByPCTest() {
        List<Account> listOfAllAccountsToSort = AccountUtility.getListOfAllAccounts();
        String accountName = null;
        String postalCode = 'OX1 3EX';
        List<Account> newListOfAccounts = AccountSearchByController.accountSearchBy(accountName, postalCode);
        System.assertEquals(3,newListOfAccounts.size());
    }
}
