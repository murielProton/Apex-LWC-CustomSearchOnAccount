@isTest
private class AccountUtility_Test {
    @isTest static void getListOfAllAccountsTest(){
        List<Account> listOfAccountsToTest = AccountUtility.getListOfAllAccounts();
        Test.startTest();
        listOfAccountsToTest = AccountUtility.getListOfAllAccounts();
        Test.stopTest();
        System.assert(listOfAccountsToTest.size() > 0);
        
    }
}
