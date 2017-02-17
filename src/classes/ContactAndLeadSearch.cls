public with sharing class ContactAndLeadSearch {
	public ContactAndLeadSearch() {
		
	}

	public static List<List<SObject>> searchContactsAndLeads (String last){
		List<List<SObject>> objs = [FIND :last IN ALL FIELDS RETURNING Lead(Name), Contact(FirstName,LastName,Department)];
		return objs;
	}
}