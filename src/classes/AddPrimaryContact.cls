public with sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {

        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {

        //System.assert(false, 'llegue al execute');

        List<Contact> contacts = new List<Contact> ();

        List<Account> accounts = [SELECT Id,
                                        Name,

                                        (SELECT
                                            Id,
                                            FirstName,
                                            LastName
                                        FROM Contacts)

                                    FROM Account
                                    WHERE BillingState = : state 
                                    LIMIT 200];

        for (Account account: accounts) {

            Contact newContact = contact.clone();
            newContact.AccountId = account.Id;

            contacts.add(newContact);
        }

        if (!contacts.isEmpty()) {
            insert contacts;
        }

    }
}


