public with sharing class ContactSearch {

	public static List < Contact > getContact = new List < Contact > ();

    public ContactSearch() {

    	getContact = getContacts();

    }

    public static List < Contact > searchForContacts(String last, String postalCode) {

        Contact[] contacts = [SELECT Name FROM Contact WHERE lastName = : last AND MailingPostalCode = : postalCode];
        return contacts;
    }

    public static List < Contact > getContacts() {

        Contact[] contacts = [SELECT Id, FirstName, lastName FROM Contact];
        return contacts;
    }
}
