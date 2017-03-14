trigger AccountAddressTrigger on Account (before insert, before update) {
	
	Account[] accs = new Account[]{};

	for (Account acc : trigger.new) {

		if (acc.Match_Billing_Address__c) {
			if(acc.BillingPostalCode != null){
				acc.ShippingPostalCode = acc.BillingPostalCode;
				accs.add(acc);
			}
		}
	}

	

	/*if (!accs.isEmpty()) {

		update accs;
	}*/
		
}