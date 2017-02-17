public with sharing class DummyClass {
	public DummyClass() {
		
	}

	public static Account insertar (){
		// Create the account sObject
		Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
		
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
}