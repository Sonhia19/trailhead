@isTest
private class AddPrimaryContactTest {

    private static Account[] accounts = null;
    private static final Integer N = 100;
    private static final String CALIFORNIA = 'CA';
    private static final String NEW_YORK = 'NY';

    @isTest
    public static void addPrimaryContactTest() {

        setup();

        Contact contact = new Contact();
        contact.FirstName = 'MyFirstName';
        contact.LastName = 'MyLastName';
        insert contact;

        Test.startTest();

        AddPrimaryContact job = new AddPrimaryContact(contact, CALIFORNIA);
        System.enqueueJob(job);

        Test.stopTest();

        assert();
    }

    private static void setup() {

        accounts = new Account[] {};

        for (Integer i = 1; i <= N; i++) {

            Account account = new Account();
            account.Name = 'SomeAccountName-' + i;
            account.BillingState = (Math.Mod(i, 2) == 0) ? NEW_YORK : CALIFORNIA;
            accounts.add(account);
        }

        insert accounts;
    }

    private static void assert() {

        accounts = new Account[] {};

        accounts = [SELECT 
                        Id, 
                        BillingState, 
                        (SELECT Id 
                            FROM Contacts) 
                    FROM Account];

        for (Account account :accounts) {

            if (account.BillingState == CALIFORNIA) {
                System.assertEquals(account.Contacts.size(), 1);
            }
        }

    }

}
