@IsTest
public with sharing class AccountProcessorTest {
	@isTest
	public static  void TestAccountProcessorTest (){
		Account a = new Account ();
		a.Name = 'Jon account';
		Insert a;

		Contact c = new Contact();
		c.FirstName = 'Bob';
		c.LastName = 'Contact';
		c.AccountId = a.Id;
		Insert c;

		List<Id> accId = new List<Id> ();
		accId.add (a.Id);

		Test.startTest();
            AccountProcessor.countContacts(accId);
        Test.stopTest();


	}


}