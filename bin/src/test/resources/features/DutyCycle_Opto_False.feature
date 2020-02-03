@DutyCycleWithOptOutableFalse 
Feature: Duty Cycle with OptOutable set to false 
	As a user, I should not be able to opt out of DR when my duty cycle is enabled

@VerifySavingEventCancelByUserMessage 
Scenario: Verify Saving Event Cancel By User Message 
	As a user, I should be able to cancel a DR Event and receive a saving event cancel message on Activity History screen for HBB and Jasper Devices
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "duty cycle" and "is not" opt-out able for "20" minutes and "1" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application 
	Then user "should be displayed" with the "DR event label on dashboard" option 
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	Then user "should be displayed" with the "DR event label on primary card" option
	And user selects "DR EVENT LABEL" from "Primary Card" screen
	Then "cancel saving event message with OK" message pop up is displayed on the primary card 
	When user taps on "DR CANCEL OK"
	Then user "should be displayed" with the "DR event label on primary card" option
	And set point value should not change
	And user logs out of the application
