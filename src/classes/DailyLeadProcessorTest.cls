@isTest
public with sharing class DailyLeadProcessorTest {

    private static Lead[] leads = null;
    private static final Integer N = 200;

    // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year


    public static final String CRON_EXP = '0 0 1 * * ?';

    @isTest
    public static void scheduledJobTest() {

        setup();

        Test.startTest();

        DailyLeadProcessor job = new DailyLeadProcessor();

        String jodbId = System.schedule('DailyLeadProcessor', CRON_EXP, job);

        Test.stopTest();
    }

    private static void setup() {

        leads = new Lead[] {};
        for (Integer i = 0; i < N; i++) {

            Lead lead = new Lead();
            lead.FirstName = 'Dream force' + i;
            lead.Lastname = 'LastName';
            lead.Company = 'Company';

            leads.add(lead);
        }

        insert leads;

    }
}
