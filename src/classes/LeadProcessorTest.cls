@isTest
public class LeadProcessorTest {

	@isTest	
	public static void test1(){

		List<Lead> lstLead = new List<Lead>();

		//Insert 200 records
		for (Integer i=0; i<200; i++) {

			Lead l = new Lead();
			l.FirstName = 'FirstName';
            l.LastName = 'LastName'+i;
            l.Company = 'demo'+i;
            lstLead.add(l);
		}

		insert lstLead;

		Test.startTest();
		LeadProcessor myBatch = new LeadProcessor();
		Database.executeBatch (myBatch);
		Test.stopTest();

		//System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
	}
}