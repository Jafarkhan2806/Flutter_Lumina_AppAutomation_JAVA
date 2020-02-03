@OffsetWithOptOutableTrue @Comfort
Feature: Offset with Opt Out able true 
	As a user, I want to opt out of DR when my offset is enabled

@VerifySavingEventScheduleMessageOffset @Automated  @--xrayid:ATER-54607
Scenario: Verify Saving Event Schedule Message with DR Event Offset 
	As a user, I should receive a saving event schedule message on the primary card, alerts screen and messages screen
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "10" minutes and "3" minutes from now 
	When user launches and logs in to the Lyric application 
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	Then "saving event schedule" message pop up is displayed on the primary card 
	And user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
	And user navigates to "ACTIVITY HISTORY" screen from the "Dashboard" screen 
	And user receives and views a "saving event schedule" message on the "ACTIVITY HISTORY" screen 
	#Then user logs out of the app
	
@VerifySavingEventStartMessageOffset @Automated   @--xrayid:ATER-54609
Scenario: Verify Saving Event Start Message with DR Event Offset 
	As a user, I should receive a saving event start message on the primary card, alerts screen and messages screen
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "10" minutes and "1" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application 
	Then  user "should be displayed" with the "DR event label on dashboard" option
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
	And  user "should be displayed" with the "DR event label on primary card" option
	And user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
	And user navigates to "ACTIVITY HISTORY" screen from the "Dashboard" screen 
	Then user receives and views a "saving event started" message on the "ACTIVITY HISTORY" screen 
	#And user logs out of the app 
	
@VerifySavingEventEndMessageOffset  @Automated  @--xrayid:ATER-54610
Scenario: Verify Saving Event End Message Offset 
	As a user, I should receive a saving event end message on alerts screen and messages screen for HBB and Jasper Devices
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "6" minutes and "1" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application 
	Then user "should be displayed" with the "DR event label on dashboard" option
	When DR event has ended on user device 
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	Then user "should not be displayed" with the "DR event label on primary card" option
	When user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
	And user navigates to "ACTIVITY HISTORY" screen from the "Dashboard" screen 
	Then user receives and views a "saving event ended" message on the "ACTIVITY HISTORY" screen 
#	And user logs out of the app 
	
	
@VerifySavingEventCancelByUtilityMessageOffset  @Automated  @--xrayid:ATER-54612
Scenario: Verify Saving Event Cancel By Utility Message Offset 
	As a user, I should be able to cancel a DR Event and receive a saving event cancel message on alerts screen and messages screen for HBB and Jasper Devices
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "10" minutes and "1" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application
	 Then user "should be displayed" with the "DR event label on dashboard" option
	When DR event is cancelled by the utility provider
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	Then user "should not be displayed" with the "DR event label on primary card" option
	When user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
	Then user "should not be displayed" with the "DR event label on dashboard" option
	And user navigates to "ACTIVITY HISTORY" screen from the "Dashboard" screen 
	And user receives and views a "saving event canceled by utility" message on the "ACTIVITY HISTORY" screen 
#	And user logs out of the app 
	
@VerifySavingEventCancelByUserMessageOffset  @Automated @--xrayid:ATER-54613
Scenario: Verify Saving Event Cancel By User Message Offset 
	As a user, I should be able to cancel a DR Event and receive a saving event cancel message on alerts screen and messages screen for HBB and Jasper Devices
	Given user thermostat is enrolled with DR 
	And user has triggered DR event with "offset" and "is" opt-out able for "10" minutes and "1" minutes from now 
	And DR event has started on the user device 
	When user launches and logs in to the Lyric application 
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
	And user changes system mode to "Cool"
	Then user "should be displayed" with the " DR event label on primary card" option
	And user taps on "Down Stepper"
	Then "cancel saving event message with a Yes and No" message pop up is displayed on the primary card 
	When user "DISMISSES" the "DR CANCEL" popup
	Then user "should be displayed" with the "DR event label on primary card" option
	Then the user should be displayed with "DR" setpoint value
	When user changes system mode to "heat" 
	And user taps on "UP STEPPER"
	Then "cancel saving event message with a Yes and No" message pop up is displayed on the primary card 
	When user "ACCEPTS" the "DR CANCEL" popup
	Then user "should not be displayed" with the "DR event label on primary card" option
	And user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
	And user navigates to "ACTIVITY HISTORY" screen from the "Dashboard" screen 
	And user receives and views a "saving event canceled by user" message on the "ACTIVITY HISTORY" screen 
	#And user logs out of the app 
	
	@VerifyAdHocStatusAfterDREventEndsNoScheduleOffset @Automated @--xrayid:ATER-54614
		Scenario: Verify Ad Hoc Status After DR Event Ends No Schedule Offset 
			As a user, I should receive a ad hoc message after DR Ends for Jasper Thermostats
			Given user thermostat is enrolled with DR 
			And user thermostat is set to "no" schedule 
			And user has triggered DR event with "offset" and "is" opt-out able for "6" minutes and "1" minutes from now 
			And DR event has started on the user device 
			When user launches and logs in to the Lyric application
			And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
			Then user "SHOULD BE DISPLAYED" with the "DR event label on primary card" option
			When DR event has ended on user device 
			Then user "SHOULD BE DISPLAYED" with the "NO SCHEDULE" option
		#	And user logs out of the app 

@VerifyAdHocStatusAfterDREventEndsGeofenceBasedSchedulingOffset  @Automated  @--xrayid:ATER-54616
		Scenario: Verify Ad Hoc Status After DR Event Ends Geofence Offset 
			As a user, I should receive a ad hoc message after DR Ends for Jasper Thermostats
			Given user thermostat is enrolled with DR
			And user thermostat is set to "geofence based" schedule 
			And user has triggered DR event with "offset" and "is" opt-out able for "10" minutes and "1" minutes from now 
			And DR event has started on the user device 
			And user launches and logs in to the Lyric application
			And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
			Then user "SHOULD BE DISPLAYED" with the "DR event label on primary card" option
			And user changes system mode to "heat" 
			When user taps on "UP STEPPER"
			And "cancel saving event message with a Yes and No" message pop up is displayed on the primary card 
			And user "ACCEPTS" the "DR CANCEL" popup
			Then user "should not be displayed" with the "DR event label on primary card" option
			When user has "Temporary" status
			And DR event has ended on user device 
			Then verify the "Temporary" on the "PRIMARY CARD" screen 
			#And user logs out of the app 
	
@VerifyAdHocStatusAfterDREventEndsTimeBassedSchedulingOffset @Automated  @--xrayid:ATER-54618
Scenario Outline: Verify Ad Hoc Status After DR Event Ends Time Based Offset 
	As a user, I should receive a ad hoc message after DR Ends for Jasper Thermostats
	Given user thermostat is enrolled with DR 
	And user cancels DR Event
	And user thermostat is set to "Time Based" schedule
	When user launches and logs in to the Lyric application 
	And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
	And user has <Adhocoverride> status
	And user has triggered DR event with "offset" and "is" opt-out able for "3" minutes and "1" minutes from now
	And user taps on "DR Popup"
	And DR event has started on the user device 
	Then user "should be displayed" with the "DR event label on primary card" option 
	When DR event has ended on user device 
	Then verify the <Adhocoverride> on the "PRIMARY CARD" screen 
#	And user logs out of the app 
	
	Examples: 
		|Adhocoverride  | 
		| permanent | 
		| temporary |
		
@VerifyVacationStatusAfterDREventEndsOffset  @Automated @--xrayid:ATER-54621
		Scenario: Verify Vacation Status After DR Event Ends Vacation Offset 
			As a user, I should receive a vacation ad hoc message after DR Ends
			Given user thermostat is enrolled with DR 
			And vacation mode is "active" 
			When user launches and logs in to the Lyric application
			And user verifies vacation is "on" in "solution card"
			And user has triggered DR event with "offset" and "is" opt-out able for "3" minutes and "1" minutes from now 
			And DR event has started on the user device 
			Then user "should be displayed" with the "DR event label on primary card" option 
			When DR event has ended on user device 
			And user navigates to "DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen 
			And user should be displayed with "VACATION" status on "SOLUTION CARD"
		#	And user logs out of the app 
			

				@VerifyDRStatusWhenChangingSystemModeOffset  @Automated @--xrayid:ATER-54622
				Scenario: Verify DR Status When Changing System Mode 
					As a user, I should receive a DR Label on Cool/Heat system mode and No Label should be present on OFF mode
					Given user thermostat is enrolled with DR 
					And user has triggered DR event with "offset" and "is" opt-out able for "15" minutes and "1" minutes from now 
					And DR event has started on the user device 
					When user launches and logs in to the Lyric application
					Then user "should be displayed" with the "DR event label on dashboard" option 
					When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
					And user changes system mode to "Cool"
					Then user "should be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "heat" 
					Then user "should be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "off" 
					Then user "should not be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "heat" 
					Then user "should be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "cool" 
					Then user "should be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "off" 
					Then user "should not be displayed" with the "DR event label on primary card" option 
					When user changes system mode to "cool" 
					Then user "should be displayed" with the "DR event label on primary card" option 
			#		And user logs out of the app
				
	@VerifyGeofenceScheduleAdHocStatusAfterDREndsOffset @Automated @--xrayid:ATER-54624
		Scenario Outline: Verify Geofence Schedule Ad Hoc Status After DR Ends Offset 
			As a user, I should receive a geofence until schedule message after DR Ends in geofence crossed location
			Given user thermostat is enrolled with DR 
			And user thermostat is set to "Without sleep geofence based" schedule 
			And  user thermostat set <geofence location> with <Geofence>
			And user has triggered DR event with "offset" and "is" opt-out able for "5" minutes and "1" minutes from now 
			And DR event has started on the user device 
			When user launches and logs in to the Lyric application
			Then user "should be displayed" with the "DR event label on dashboard" option 
			When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen 
			And user thermostat set <geofence crossed location> with <UGeofence>
			And DR event has ended on user device 
			Then Verify the <geofence status> on the "PRIMARY CARD" screen
			#And user logs out of the app 
			
			Examples: 
				| geofence location | geofence crossed location | geofence status     ||UGeofence|		|Geofence|
				| Home              | Away                      | using away settings ||UserDeparted|	|UserArrived|
			#	| Away              | Home                      | using home settings ||UserArrived|	|UserDeparted|
					
				
@VerifyTimeScheduleAdHocStatusAfterDREndsOffset  @UIAutomatable  @--xrayid:ATER-54625
Scenario: 
Verify Time Schedule Ad Hoc Status After DR Ends In The Next Time Period Offset 
As a user, I should receive a following schedule message after DR Ends in next period of time schedule
Given user thermostat is enrolled with DR 
And user has time based schedule with 15 minute interval between periods 
And user puts schedule on "temporary hold" 
And user has triggered DR event with "offset" and "is" opt-out able for "15" minutes and "1" minutes from now 
And DR event has started on the user device 
When user logs in to Lyric app 
Then user should be displayed with a "saving event until green" label on the primary card 
And DR event ends on next period of the schedule 
And user should be displayed with a "following schedule" label on the primary card 
#And user logs out of the app 


@VerifyDRStatusAfterVacationStartsOffset @UIAutomatable  @--xrayid:ATER-54626
Scenario: 
Verify DR Status After Vacation Starts for Jasper Thermostats Offset 
As a user, I should receive a DR message after vacation starts
Given user thermostat is enrolled with DR 
And vacation mode is "active" 
And user has triggered DR event with "offset" and "is" opt-out able for "15" minutes and "1" minutes from now 
And DR event has started on the user device 
When user logs in to Lyric app 
Then user should be displayed with a "saving event until green" label on the primary card 
When vacation is running on user device 
Then user should be displayed with a "saving event until green" label on the primary card 
When DR event has ended on user device 
Then user should receive a "vacation" status on primary card 
And vacation mode is "yet to set" 
#And user logs out of the app 
		
		