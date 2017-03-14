trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

	Opportunity[] opps = new Opportunity[]{};
	List<Task> taskList = new List<Task>();


	for (Opportunity opp : trigger.new) {
		if (opp.StageName == 'Closed Won'){
			Task t = new Task();
			t.WhatID = opp.ID;
			t.Subject = 'Follow Up Test Task';
			taskList.add(t);
		}
	}

	if (taskList.size() > 0) {
        insert taskList;
    }


}