public with sharing class AccountHandler {
	public AccountHandler() {
		
	}

	public static Account insertNewAccount (String name){
		// Create the account sObject
		Account acct = new Account();
		acct.name = name;
		
		try{
			// Insert the account by using DML
			insert acct;
			return acct;
		}catch(DmlException e){
			System.debug('A DML exception has occurred: ' +
						e.getMessage());
			return null;
		}
	}

	public static boolean selectAccounts (){
		Account [] accts = [SELECT Name, Phone FROM Account];

		for(Integer i = 0; i < accts.size() ; i++ ){
			System.debug(accts[i].name);
		}
		return true;
	}
}