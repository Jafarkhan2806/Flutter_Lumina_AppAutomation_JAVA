@DRDashBoard @Comfort 
Feature: Verify DR status on Dashboard and primary card
	As a user, I want to verify DR status on the dashboard and primary card

@VerifyDREventOnDashboardAndPrimaryCard @Automated 
Scenario: Verify Saving Event Schedule Message 
	As a user, I should be able to identify thermostats with DR events on my multistat account dashboard
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "4" minutes and "3" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application 
	Then user "should be displayed" with the "DR event label on dashboard" option 
	When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	Then user "should be displayed" with the "DR event label on primary card" option 
	And user logs out of the app 
	
