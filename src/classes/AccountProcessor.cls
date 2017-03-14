public with sharing class AccountProcessor {

	@future 
	public static void countContacts (List<Id> accsID){
		List<Account> accts = [select id, Number_of_Contacts__c , (select id from contacts) from account where id in: accsID];
		for (Account acc : accts){
			List <Contact> cnts = acc.contacts;
			acc.Number_of_Contacts__c = cnts.size();
		}
		update accts;

	}
}