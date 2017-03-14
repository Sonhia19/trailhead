public with sharing class LeadProcessor implements Database.Batchable<sObject> 
{
	
	public Database.QueryLocator start (Database.BatchableContext bc) {
     	return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead]);

    }

    public void execute (Database.BatchableContext bc, List<Lead> records){

    	for (Lead l : records){
    		l.LeadSource = 'Dreamforce';
    	}
    	Update records;
    }   

    public void finish(Database.BatchableContext bc){
    	System.debug(' records processed.');

    }
}