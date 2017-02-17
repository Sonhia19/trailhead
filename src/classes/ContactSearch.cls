public with sharing class ContactSearch {
	public ContactSearch() {
		
	}

	public static List<Contact> searchForContacts(String last, String postalCode){
		Contact [] cnts = [SELECT Name FROM Contact WHERE lastName = :last AND MailingPostalCode = :postalCode];
		return cnts;
		

	}
}