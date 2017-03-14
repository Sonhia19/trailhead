@isTest
public with sharing class TestVerifyDate {

	@isTest static void testCheckDates() {
		date date1 = date.newInstance(2017, 5, 15);
		date date2 = date.newInstance(2017, 5, 21);
        Date dateCheck = VerifyDate.CheckDates(date1, date2);
        System.debug(dateCheck);
    }

    @isTest static void testCheckDates2() {
		date date1 = date.newInstance(2017, 5, 21);
		date date2 = date.newInstance(2017, 5, 15);
        Date dateCheck = VerifyDate.CheckDates(date1, date2);
        System.debug(dateCheck);
    }
}