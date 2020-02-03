@Katana_CT_MiniCT_Alarms
Feature: DAS Alarms
As a user I want to be notified when my sensors and system are intruded

  Background: 
    Given user sets the entry/exit timer to "60" seconds
      And reset relay as precondition
      And user is set to "Home" mode through CHIL
  
  @RFDoorsensor_InAwayExitDelay_OpenDoor_NoAlarm 				@P2 				@KATANA_RF_DoorSensor 		@--xrayid:ATER-99027			@Automated
  Scenario: 06 As a user when I open the RF door Sesnor during exit delay i should not get alarm  
    Given user launches and logs in to the Lyric application
  #And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
      And user "RF door sensor" access sensor "opened" 
     Then user should be displayed with the "No Entry delay" screen
     When user "RF door sensor" access sensor "closed"
     Then user should be displayed with the "No Entry delay" screen
     When timer ends on user device
     Then user should be displayed with the "No Entry delay" screen
      And user should be displayed with the "No Alarm" screen
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "closed" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromPushNotification_DoorNotClosedInEntryDelay			 @P1		@--xrayid:ATER-99058		 @KATANA_RF_DoorSensor 			 @Automated
  Scenario: 07 As a user when I open the door and left open in armed away state on my arrival to home I should be able to switch to home from push notification and should be shown with current door status
  #Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Away" mode through CHIL
      And timer ends on user device
      And user "opens RF door with app" in background
      And user selects the "Switch to Home from RF Door Open" push notification
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "open" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | Switched to Home by app     | 
      And user "closes" activity log
     When user "RF door sensor" access sensor "closed"
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromEntryDelay_DoorNotClosedInEntryDelay			@P3 	@--xrayid:ATER-99067		@Automated				@P1			 @KATANA_RF_DoorSensor 			
  Scenario: 08 As a user when I open the RF door and left open in armed away state on my arrival to home I should be able to switch to home from entry delay screen and should be shown with current door status
    Given user launches and logs in to the Lyric application
      And user is set to "Away" mode through CHIL
  #And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF door with app" in background
      And user selects the "RF Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "open" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | Switched to Home by app     | 
      And user "closes" activity log
     When user "RF door sensor" access sensor "closed"
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromPushNotification_DoorClosedInEntryDelay				@P3		@--xrayid:ATER-99069	@Automated		@KATANA_RF_DoorSensor 				   
  Scenario:  09 As a user when I open the RF door in armed away on my arrival and I should be able to switch to home from pn 
    Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF door with app" in background
      And user selects the "Switch to Home from RF Door Open" push notification
      And user "RF door sensor" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "closed" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | Switched to Home by app     | 
      And user "closes" activity log
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromEntryDelay_DoorClosedInEntryDelay				 @P1 		@--xrayid:ATER-99933			@KATANA_RF_DoorSensor 					@Automated
  Scenario: 10 As a user when I open the door in armed away on my arrival and I should be able to switch to home from entry delay screen 
    Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
  #And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF door with app" in background
      And user selects the "RF Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
      And user "RF door sensor" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "closed" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | Switched to Home by app     | 
      And user "closes" activity log
     When user "RF door sensor" access sensor "closed"
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInEntryDelay_NoAlarm 				@P2 		@--xrayid:ATER-99571		@KATANA_RF_DoorSensor 					@Automated
  Scenario: 11 As a user when I open the door I should be able to switch to Night from door open push notification on my arrival to home after closing the door
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF door with app" in background
      And user "RF door sensor" access sensor "closed"
      And user selects the "Switch to Night from RF Door open" push notification
      And timer ends on user device
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | RF Door Closed at Away mode | 
      | Switched to Night by app    | 
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorClosedInEntryDelay_NoAlarm 		@--xrayid:ATER-99934			@P2			@Automated			 @KATANA_RF_DoorSensor 			
  Scenario: 12 As a user when I open the door I should be able to switch to Night from entry delay screen on my arrival to home after closing the door
    Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF door with app" in background
      And user "RF door sensor" access sensor "closed"
      And user selects the "RF Door opened" push notification
      And user selects "Switch to Night" from "Entry delay" screen 
     Then user status should be set to "Night"
      And timer ends on user device
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door opened at Away mode | 
      | RF Door Closed at Away mode | 
      | Switched to Night by app    | 
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorNotClosedInEntryDelay_Alarm  @--xrayid:ATER-99935			@P2			@Automated		 @DAS_DoorSensor
  Scenario: 13 As a user when I open the door in away mode I should be able to switch to Night from push notification but failed to close the door in entry delay waiting should be taken to alarm
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
  #And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And  user "RF door sensor" access sensor "opened"
      And user selects the "Switch to Night from RF Door Open" push notification
     Then user should be displayed with the "Waiting to close" screen
     When user "RF door sensro" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
  #When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                          | 
      | RF DOOR SENSOR ALARM AT AWAY MODE | 
      | ALARM AT AWAY MODE                | 
      | Alarm Dismissed                   | 
      | Switched to Home by app           | 
     When user "closes" activity log
      And user "RF door sensor" access sensor "closed"
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorNotClosedInEntryDelay_Alarm		@--xrayid:ATER-		  @P3 			@DAS_DoorSensor 			@Automated
  Scenario: 14 As a user when I open the door in away mode I should be able to switch to Night from Entry Delay but failed to close the door in entry delay waiting should be taken to alarm
    Given user is set to "Away" mode through CHIL
     When user launches and logs in to the Lyric application
      And user clears all push notifications
     When user "RF door sensor" access sensor "opened"
     Then user selects the "RF Door Opened" push notification
     When user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
     When user "RF door sensor" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
  #And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                          | 
      | RF DOOR SENSOR ALARM AT AWAY MODE | 
      | ALARM AT AWAY MODE                | 
      | Alarm Dismissed                   | 
      | Switched to Home by app           | 
     When user "closes" activity log
      And user "RF door sensor" access sensor "closed"
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInWaiting_NoAlarm 		@--xrayid:ATER-			@P1 				@DAS_DoorSensor 				@Automated
  Scenario: 15 As a user when I open the door in away mode I should be able to switch to Night from door open push notification and close the door in entry delay waiting should be shown no alarm
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
     When timer ends on user device 
      And user clears all push notifications
      And user minimizes the app
      And user "RF door sensor" access sensor "opened"
      And user selects the "Switch to Night from RF Door open" push notification
     Then user should be displayed with the "Waiting to close" screen
      And user "RF door sensor" access sensor "closed"
     When timer ends on user device
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door Opened at Away mode | 
      | RF Door Closed at Away mode | 
      | Switched to Night by app    | 
  
  @RFDoorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorOpenedInEntryDelay_NoAlarm 		@--xrayid:ATER-			@P3  		@DAS_DoorSensor 			@Automated
  Scenario: 16 As a user when I open the door in away mode I should be able to switch to Night from entry delay screen and close the door in entry delay waiting should be shown no alarm
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
      And user is set to "Away" mode through CHIL
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user minimizes the app
      And user "RF door sensor" access sensor "opened"
      And user selects the "RF Door opened" push notification
      And user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
      And user "RF door sensor" access sensor "closed"
     When timer ends on user device
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                    | 
      | RF Door Opened at Away mode | 
      | RF Door Closed at Away mode | 
      | Switched to Night by app    | 
  
  @RFDoorsensor_ArmedNight_OpenDoor_AttentionInEntryDelay 				@P1 					@DAS_DoorSensor 	@--xrayid:ATER-				@Automated
  Scenario: 17 As a user when the door is opened in night mode I should be able to initiate attention alarm from entry delay screen on observing intruder in premises
    Given user sets the entry/exit timer to "60" seconds
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
      And user "opens RF door with app" in background
      And user selects the "Door Opened" push notification
      And user selects "Attention" from "Entry Delay" screen
     Then user should be displayed with the "Alarm" screen
  #And user navigates to "Alarm history" screen from the "Alarm" screen
  #Then verify the following alarm history:
      | Elements            | 
      | ALARM AT Night MODE | 
  #Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
  #Then user receives a "Alarm cancelled" email
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "RF door sensor" status as "open" on the "Sensor Status"
      And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
     When user "opens" activity log
  #Then verify the following activity log:
      | Elements                     | 
      | SIREN SOUNDED BY ACTUAL USER | 
      | ALARM AT NIGHT MODE          | 
      | Alarm Dismissed              | 
      | Switched to Home by app      | 
      And user "closes" activity log
     When user "RF door sensor" access sensor "closed"
  
  @RFWindowSensor_OpenDuringAwayModeExitDelay 			@P4 				@RFDAS_WindowSensor 		@--xrayid:ATER-			@Automated
  Scenario: 18 As a user when the window is opened in Away exit delay I should be notified with alarm 
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
     When user "RF window sensor" access sensor "opened"
     Then user should be displayed with the "Alarm" screen
  #And user camera is "Live streaming"
  #view in full screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
      And user "RF window sensor" access sensor "closed"
  
  @RFWindowSensor_OpenAfterAwayModeExitDelay 			@P1 				@RFDAS_WindowSensor 			@--xrayid:ATER-		@Automated
  Scenario: 19 As a user when intruder breaches the premises through window after away exit delay I should be notified with alarm
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens RF window with app" in background
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                | 
      | ALARM AT AWAY MODE      | 
      | Alarm Dismissed         | 
      | Switched to Home by app | 
      And user "closes" activity log
      And user "RF window sensor" access sensor "closed"
  
  @RFWindowSensor_OpenDuringNightModeExitDelay  				@P4 					@RFDAS_WindowSensor 		@--xrayid:ATER-			@Automated
  Scenario: 20 As a user when intruder breaches the premises through window during night mode exit delay I should be notified with alarm 
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
     When user "RF window sensor" access sensor "opened"
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
      And user "RF window Sensor" access sensor "closed"
  
  @RFWindowSensor_OpenAfterNightModeExitDelay 				@P2 				@RFDAS_WindowSensor 			@--xrayid:ATER-			@Automated
  Scenario: 21 As a user when intruder breaches the premises through window after night mode exit delay I should be notified with alarm
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And timer ends on user device
     When user "RF window sensor" access sensor "opened"
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
      And user "RF window sensor" access sensor "closed"
  
  @RFDoorSensor_TamperDuringAwayModeExitDelay 				@P3 					@RFDAS_DoorSensor 		@--xrayid:				@Automated
  Scenario: 22 As a user when the DOOR is tampered in Away exit delay I should be notified with alarm 
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
     When user "RF door Sensor" access sensor "Tampered"
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user "RF door sensor" access sensor "Tamper Restored"
  
  @RFDoorSensor_TamperDuringNightModeExitDelay 				@P4 					@RFDAS_DoorSensor 		@--xrayid:				@Automated
  Scenario: 23 As a user when the door is tampered in Night exit delay I should be notified with alarm
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user "RF door tampered with app" in background
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user "RF door sensor" access sensor "Tamper Restored"
  
  @ManulaPanicSecurity @P2 @--xrayid:ATER-100546 @Automated
  Scenario Outline: 24 As a user when panic button is pressed from Security Card, alarm should be triggered from the panel
    Given user sets the entry/exit timer to "30" seconds
      And user is set to <Mode> mode through CHIL
     When user launches and logs in to the Lyric application
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user taps on "Panic"
      And user selects <AlarmType> from "alarm" screen
     Then user should be displayed with the "Silence Alarm" screen
      And user selects "Silence alarm" from "alarm" screen
     Then user status should be set to "Home"
    Examples: 
      | Mode  | AlarmType | 
      | Away  | Fire      | 
      | Away  | Police    | 
      | Away  | Medical   | 
      | Night | Fire      | 
      | Night | Police    | 
      | Night | Medical   | 
      | Home  | Fire      | 
      | Home  | Police    | 
      | Home  | Medical   | 
      | OFF   | Fire      | 
      | OFF   | Police    | 
      | OFF   | Medical   | 
  
  @ManulaPanicCameraSolution  @P2  @--xrayid:ATER-100547  @Automated
   Scenario Outline: 25 As a user when panic button is pressed from Camera Solution Card, alarm should be triggered from the panel
      Given user is set to <Mode> mode through CHIL
     When user launches and logs in to the Lyric application
      And user navigates to "DAS CAMERA SOLUTION CARD" screen from the "Dashboard" screen
     Then user taps on "ATTENTION"
      And user selects <AlarmType> from "alarm" screen
     Then user should be displayed with the "Silence Alarm" screen
      And user selects "Silence alarm" from "alarm" screen
     Then user status should be set to "Home"
     Examples: 
      | Mode  | AlarmType | 
      | Away  | Fire      | 
      #| Away  | Police    | 
      #| Away  | Medical   | 
      #| Night | Fire      | 
      #| Night | Police    | 
      #| Night | Medical   | 
      #| Home  | Fire      | 
      #| Home  | Police    | 
      #| Home  | Medical   | 
      #| OFF   | Fire      | 
      #| OFF   | Police    | 
      #| OFF   | Medical   | 
  
  
