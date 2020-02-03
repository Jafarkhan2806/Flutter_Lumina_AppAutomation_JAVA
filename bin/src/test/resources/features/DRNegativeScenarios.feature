@DRNegativeScenarios
Feature: Verify DR Status for Negative Scenarios
As a user, I want to verify DR status on the for negative Scenarios

  @VerifyDREventWhenNoNetwork
  Scenario Outline: Verify DR Event when no network
  As a user, I should not be able to opt out of DR when there is no network
    Given user <Thermostat> is enrolled with DR
      And user has triggered DR event with "duty cycle" and "is" opt-out able
	  And DR event has started on the user device
     When user logs in to the Lyric application
     Then user should be displayed with a "Saving event until" green label on the Dashboard
     When user naviagtes to "Primary card" screen 
     Then user should be displayed with a "saving event until" green label on the primary card
	 When user cancels saving event by tapping on the green label
     Then user "receives" a cancel saving event message with a "Yes and No" option
	 And user device has "no network" connection
	 When user taps on the "Yes" option
	 Then "error occured" message pop up is displayed on the primary card
	 When user device has "network" connection
	 And user cancels saving event by tapping on the green label
     Then user "receives" a cancel saving event message with a "Yes and No" option
	 When user taps on the "Yes" option
	 Then user should not be displayed with a DR event label on the primary card
     Then user logs out of the application
     Examples:
     |Thermostat|
     |HB|
     |JasperNA|	 