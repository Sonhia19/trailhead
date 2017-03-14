public with sharing class RandomContactFactory {

	public static List<Contact> generateRandomContacts(Integer param1, String param2){
		List<Contact> cnts = new List<Contact>();
		for (Integer i = 1; i<=param1; i++){

			Contact cnt = new Contact (FirstName = param2 + ' ' +i, LastName = param2);
			cnts.add (cnt);			
		}
		return cnts;
	}
}