public class DailyLeadProcessor implements Schedulable {

	public DailyLeadProcessor() {

	}

	public static void execute (SchedulableContext ctx) {

		Lead[] leads = [SELECT Id,
									LeadSource
								FROM Lead
						 		WHERE LeadSource = null
								LIMIT 200];

		for (Lead lead : leads) {
			lead.LeadSource = 'Dreamforce';
		}

		if(!leads.isEmpty()) {
			update leads;
		}
	}
}