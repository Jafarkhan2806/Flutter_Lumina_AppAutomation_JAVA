@DAS_Alarms
Feature: DAS Alarms
As a user I want to be notified when my sensors and system are intruded

Background:
Given user sets the entry/exit timer to "60" seconds
And reset relay as precondition
And user is set to "Home" mode through CHIL
#Given "ENABLE MODE PUSH NOTIFICATION" as precondition
#And user dismisses all alerts and notification through CHIL


  @Attention_FromCamera 				@P1 					@DAS_CameraAlarm 				@Automated @--xrayid:ATER-55080
  Scenario Outline:As a user when I see any mischief acts in the live streaming I should be able to initiate the alarm from camera card 
    Given user is set to <System> mode through CHIL
      And user DAS camera is set to "ON" through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user "DAS camera" detects "Motion"  
      And user selects the "MOTION DETECTED" push notification
     Then user should be displayed with the "Camera Solution Card" screen
      And user camera is "Live streaming"
     When user selects "confirms attention" from "Camera Solution Card" screen
     Then user should be displayed with the "Alarm" screen  
     # And view the "Alarm Live streaming and progress" in full screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user should be displayed with the "Camera Solution Card" screen
      And user camera is "Live streaming"
     Then user should see the "Camera" status as "ON" on the "Camera Solution Card"
     When user selects "cancels attention" from "Camera Solution Card" screen
     Then user should be displayed with the "Camera Solution Card" screen
     Then user should see the "Camera" status as "ON" on the "Camera Solution Card"
     When user navigates to "Security Solution card" screen from the "Camera Solution Card" screen
      And user "opens" activity log
     Then verify the following activity log:
      | Elements                               | 
      | Motion Detected                        | 
      | Attention siren sounded by actual user | 
      | Alarm                                  | 
      | Alarm Dismissed                        | 
    Examples: 
      | System | 
      | Away   | 
     | Night  |
     | Home   |
     | OFF    |

@Doorsensor_InAwayExitDelay_OpenDoor_NoAlarm 				@P2 				@DAS_DoorSensor 		@--xrayid:ATER-55081			@Automated
  Scenario: As a user when I open the door during exit delay i should not get alarm  
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
      And user sets the entry/exit timer to "60" seconds
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
      And user "door" access sensor "opened" 
     Then user should be displayed with the "No Entry delay" screen
     When user "door" access sensor "closed"
     Then user should be displayed with the "No Entry delay" screen
     When timer ends on user device
     Then user should be displayed with the "No Entry delay" screen
      And user should be displayed with the "No Alarm" screen
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
 
 
@Doorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromPushNotification_DoorNotClosedInEntryDelay			 @P1		@--xrayid:ATER-55082		 @DAS_DoorSensor			 @Automated
    Scenario: As a user when I open the door and left open in armed away state on my arrival to home I should be able to switch to home from push notification and should be shown with current door status
   #Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And user is set to "Away" mode through CHIL
      And timer ends on user device
      And user "opens door with app" in background
      And user selects the "Switch to Home from Door Open" push notification
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Switched to Home by app |
      And user "closes" activity log
     When user "door" access sensor "closed"
     
     
@Doorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromEntryDelay_DoorNotClosedInEntryDelay			@P3 	@--xrayid:ATER-55083		@Automated			#N  			@P1			 @DAS_DoorSensor 			
    Scenario: As a user when I open the door and left open in armed away state on my arrival to home I should be able to switch to home from entry delay screen and should be shown with current door status
    Given user launches and logs in to the Lyric application
    And user is set to "Away" mode through CHIL
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens door with app" in background
      And user selects the "Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Switched to Home by app |
      And user "closes" activity log
     When user "door" access sensor "closed"
     
@Doorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromPushNotification_DoorClosedInEntryDelay				@P3		@--xrayid:ATER-55084	@Automated		 #N  		@DAS_DoorSensor 				   
    Scenario: As a user when I open the door in armed away on my arrival and I should be able to switch to home from pn 
    Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens door with app" in background
      And user selects the "Switch to Home from Door Open" push notification
      And user "door" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Switched to Home by app |
      And user "closes" activity log
    
@Doorsensor_ArmedAway_OpenDoor_SwitchingToHomeFromEntryDelay_DoorClosedInEntryDelay				 @P1 		@--xrayid:ATER-55085			@DAS_DoorSensor 					@Automated
    Scenario: As a user when I open the door in armed away on my arrival and I should be able to switch to home from entry delay screen 
    Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "opens door with app" in background
      And user selects the "Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
      And user "door" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Switched to Home by app |
      And user "closes" activity log
     When user "door" access sensor "closed"
 
 
@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInEntryDelay_NoAlarm 				@P2 		@--xrayid:ATER-55113		@DAS_DoorSensor 					@Automated
    Scenario: As a user when I open the door I should be able to switch to Night from door open push notification on my arrival to home after closing the door
      Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
        And user clears all push notifications
       When user navigates to "Security Solution card" screen from the "Dashboard" screen
        And timer ends on user device
        And user "opens door with app" in background
        And user "door" access sensor "closed"
        And user selects the "Switch to Night from Door open" push notification
        And timer ends on user device
       Then user status should be set to "Night"
       When user "opens" activity log
       Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Door Closed at Away mode |
       | Switched to Night by app |
       
       
@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorClosedInEntryDelay_NoAlarm 		@--xrayid:ATER-55114			@P2			@Automated		 #N			 @DAS_DoorSensor 			
    Scenario: As a user when I open the door I should be able to switch to Night from entry delay screen on my arrival to home after closing the door
      Given user is set to "Away" mode through CHIL
      Given user launches and logs in to the Lyric application
        And user clears all push notifications
       When user navigates to "Security Solution card" screen from the "Dashboard" screen
        And timer ends on user device
        And user "opens door with app" in background
        And user "door" access sensor "closed"
        And user selects the "Door opened" push notification
        And user selects "Switch to Night" from "Entry delay" screen 
       Then user status should be set to "Night"
       And timer ends on user device
       When user "opens" activity log
       Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Door Closed at Away mode |
       | Switched to Night by app |
       
@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorNotClosedInEntryDelay_Alarm  @--xrayid:ATER-55115			@P2			@Automated		 #N			 @DAS_DoorSensor
   Scenario: As a user when I open the door in away mode I should be able to switch to Night from push notification but failed to close the door in entry delay waiting should be taken to alarm
      Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And  user "door" access sensor "opened"
      And user selects the "Switch to Night from Door Open" push notification
     Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
     #When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | DOOR SENSOR ALARM AT AWAY MODE|
       | ALARM AT AWAY MODE |
       | Alarm Dismissed |
       |Switched to Home by app|
     When user "closes" activity log
      And user "door" access sensor "closed"


@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorNotClosedInEntryDelay_Alarm		@--xrayid:ATER-55116		  @P3 			@DAS_DoorSensor 			@Automated
    Scenario: As a user when I open the door in away mode I should be able to switch to Night from Entry Delay but failed to close the door in entry delay waiting should be taken to alarm
      Given user is set to "Away" mode through CHIL
      When user launches and logs in to the Lyric application
      And user clears all push notifications
      When user "door" access sensor "opened"
     Then user selects the "Door Opened" push notification
     When user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
      #And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | DOOR SENSOR ALARM AT AWAY MODE|
       | ALARM AT AWAY MODE |
       | Alarm Dismissed |
       |Switched to Home by app|
     When user "closes" activity log
      And user "door" access sensor "closed"
   
      
@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInWaiting_NoAlarm 		@--xrayid:ATER-55117			@P1 				@DAS_DoorSensor 				@Automated
    Scenario: As a user when I open the door in away mode I should be able to switch to Night from door open push notification and close the door in entry delay waiting should be shown no alarm
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
      When timer ends on user device 
      And user clears all push notifications
      And user minimizes the app
      And user "door" access sensor "opened"
      And user selects the "Switch to Night from Door open" push notification
      Then user should be displayed with the "Waiting to close" screen
      And user "door" access sensor "closed"
   When timer ends on user device
   Then user status should be set to "Night"
   When user "opens" activity log
  Then verify the following activity log:
   | Elements                 |
     | Door Opened at Away mode|
    | Door Closed at Away mode |
     | Switched to Night by app |
  
@Doorsensor_ArmedAway_OpenDoor_SwitchingToNightFromEntryDelay_DoorOpenedInEntryDelay_NoAlarm 		@--xrayid:ATER-55118			@P3 			#N 		@DAS_DoorSensor 			@Automated
    Scenario: As a user when I open the door in away mode I should be able to switch to Night from entry delay screen and close the door in entry delay waiting should be shown no alarm
      Given user launches and logs in to the Lyric application
      And user clears all push notifications
      And user is set to "Away" mode through CHIL
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user minimizes the app
      And user "door" access sensor "opened"
      And user selects the "Door opened" push notification
      And user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
      And user "door" access sensor "closed"
      When timer ends on user device
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
      | Elements                 |
      | Door Opened at Away mode|
      | Door Closed at Away mode |
      | Switched to Night by app |
 
@Doorsensor_ArmedAway_OpenDoor_AttentionInEntryDelay 			@P2 				@DAS_DoorSensor 	@--xrayid:ATER-55119					@Automated
    Scenario: As a user when the door is opened in away mode I should be able to initiate attention alarm from entry delay screen on observing intruder in premises
     Given user sets the entry/exit timer to "60" seconds
     Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
      And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
       And timer ends on user device
       And user "opens door with app" in background
       And user selects the "Door Opened" push notification
       And user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
       #And user navigates to "Alarm history" screen from the "Alarm" screen
      #Then verify the following alarm history:
       | Elements                    |
       | SIREN SOUNDED BY ACTUAL USER|
       | ALARM AT AWAY MODE          |
     #Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
     #Then user receives a "Alarm cancelled" email
     #When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
     #When user "opens" activity log
     #Then verify the following activity log:
       | Elements                 |
       | SIREN SOUNDED BY ACTUAL USER|
       | ALARM AT AWAY MODE |
       | Alarm Dismissed |
       | Switched to Home by app|
     #And user "closes" activity log
    When user "door" access sensor "closed"
   
       
@Doorsensor_ArmedAway_OpenDoor_AlarmWhenNoActionInEntryDelay 				@P2 				@DAS_DoorSensor 	@--xrayid:ATER-55120				@Automated
    Scenario: As a user when the door is opened in away mode and no commands issued from entry delay screen then system should go into alarm mode
     Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
       And timer ends on user device
     #user should be treated as intruder in this scenario
       And user "opens door with app" in background
      Then user selects the "Door Opened" push notification
      When user "door" access sensor "is not closed"
       And timer ends on user device
      Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      Then user status should be set to "Home"
      When user "opens" activity log
      Then verify the following activity log:
       | Elements                 |
       | Alarm Dismissed |
       | Switched to Home by app|
      And user "closes" activity log
     
   @Doorsensor_ArmingAway_ExitError_SwitchingToHomeInEntryDelay 			@P3 				@DAS_DoorSensor 		@--xrayid:ATER-55121			@Automated
    Scenario: As a user when i left my door open during away exit delay , I should be able to switch to home from entry delay screen to avoid the alarm
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
      And user "opens door with app" in background
     Then user selects the "Door Opened" push notification
     When user selects "Switch to Home" from "Entry delay" screen
     Then user status should be set to "Home"
     Then user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "OPEN" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      #And user "opens" activity log
     #Then verify the following activity log:
       | Elements                 |
       | Door opened at Away mode|
       | Switched to Home by app |
      #And user "closes" activity log
      When user "door" access sensor "closed"
 
 
@Doorsensor_ArmingAway_ExitError_SwitchingToNightFromEntryDelay_DoorNotClosedInEntryDelay_Alarm 			@P3 	@--xrayid:ATER-55122				@DAS_DoorSensor 				@Automated
    Scenario: As a user when I left my door open in away mode exit delay , I should be able to select switch to Night from Entry delay screen
    # But if I didn’t not close the door on time, it should get into  alarm
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And  user "door" access sensor "opened"
      And timer ends on user device
     #verify the entry delay status on dashboard
      And user selects "Switch to Night" from "Entry delay" screen
     #Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
    # When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | DOOR SENSOR ALARM AT NIGHT MODE|
       | ALARM AT NIGHT MODE |
       | Alarm Dismissed |
       |Switched to Home by app|
      When user "closes" activity log
      And user "door" access sensor "closed"
 
@Doorsensor_ArmingAway_ExitError_SwitchingToNightFromEntryDelay_DoorClosedInEntryDelay_NoAlarm 			@P4 		@--xrayid:ATER-55123		@DAS_DoorSensor 				@Automated
    Scenario: As a user when I left my door open in away mode exit delay and left door open , I should be able to get Push notification of door open and on clicking it should take to Entry delay 
    #where i can select switch to Night and close the door in entry delay waiting on my arrival to home with no alarm
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And user "door" access sensor "opened"
      And timer lapse "45" seconds
      And user "door" access sensor "closed"
      And user selects "Switch to Night" from "Entry delay" screen
      And timer ends on user device
      #And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door Opened at Night mode|
       | Door Closed at Night mode |
       | Switched to Night by app |
 
 
    @Doorsensor_ArmingAway_ExitError_AttentionInEntryDelay 				@P4 					@DAS_DoorSensor 	@--xrayid:ATER-55124					@Automated
    Scenario: As a user when the door is opened in exit delay of away mode and failed to close door, then intruder entered, I should be able to initiate attention alarm from entry delay screen 
    #on observing intruder in premises
     Given user sets the entry/exit timer to "60" seconds
       And user launches and logs in to the Lyric application
       And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
        And user switches from "Home" to "Away"
       And user "door" access sensor "opened"
        And timer ends on user device
  #   Then user should see the "Security" status as "Entry Delay" on the "Dashboard"
  #   And user navigates to "Security Solution card" screen from the "Dashboard" screen
      When user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
       #And user navigates to "alarm history" screen from the "alarm" screen
      #Then verify the following alarm history:
       | Elements                 |
       | ALARM AT AWAY MODE |
      #And user navigates to "alarm" screen from the "alarm history" screen
     #Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
     #Then user receives a "Alarm cancelled" email
     Then user status should be set to "Home"
     When user "opens" activity log
     #Then verify the following activity log:
       | Elements                 |
       | SIREN SOUNDED BY ACTUAL USER|
       | ALARM AT AWAY MODE |
       | Alarm Dismissed |
       |Switched to Home by app|
      And user "closes" activity log
     When user "door" access sensor "closed"
 
 
@Doorsensor_ArmingAway_ExitError_AlarmWhenNoActionInEntryDelay 			@P3 				@DAS_DoorSensor 	@--xrayid:ATER-55125				@Automated
    Scenario: As a user when the door is opened in exit delay and forgot to close in time then user should receive alarm event if user does not perform any action within entry delay
    # from entry delay screen then system should go into alarm mode
     Given user launches and logs in to the Lyric application
     And user clears all push notifications
     And user is set to "Away" mode through CHIL
     When user "opens door with app" in background
     And timer lapse "60" seconds 
     #exit delay 
     And timer lapse "60" seconds 
     #entry delay
     #When user "door" access sensor "is not closed" not used as app in background
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | DOOR SENSOR ALARM AT AWAY MODE|
       | ALARM AT AWAY MODE |
       | Alarm Dismissed |
       |Switched to Home by app|
      When user "closes" activity log
      And user "door" access sensor "closed"
     
  
  @Doorsensor_InNightExitDelay_OpenDoor_NoAlarm 			@P2 				@DAS_DoorSensor 		@--xrayid:ATER-55126			@Automated
  Scenario: As a user when I open the door during exit delay then i should not get alarm  
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And user "door" access sensor "opened" 
     Then user should be displayed with the "No Entry delay" screen
     When user "door" access sensor "closed"
     Then user should be displayed with the "No Entry delay" screen
     When timer ends on user device
     Then user should be displayed with the "No Entry delay" screen
      And user should be displayed with the "No Alarm" screen
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
 
 
@Doorsensor_ArmedNight_OpenDoor_SwitchingToHomeFromPushNotification_DoorNotClosedInEntryDelay 			@P2 		@--xrayid:ATER-55127			@DAS_DoorSensor 				@Automated
    Scenario: As a user when I open the door and left open in armed night state I should be able to switch to home from push notification and should be shown with current door status
    Given user launches and logs in to the Lyric application
    And user is set to "Night" mode through CHIL
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user "opens door with app" in background
      And user selects the "Switch to Home from Door Open" push notification
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Switched to Home by app |
      And user "closes" activity log
     When user "door" access sensor "closed"
     
@Doorsensor_ArmedNight_OpenDoor_SwitchingToHomeFromEntryDelay_DoorNotClosedInEntryDelay 				@P3 		@--xrayid:ATER-55128			@Automated			#N @DAS_DoorSensor 
    Scenario: As a user when I open the door and left open in armed night state I should be able to switch to home from entry delay screen and should be shown with current door status
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
      And user "opens door with app" in background
      And user selects the "Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Switched to Home by app |
      And user "closes" activity log
     When user "door" access sensor "closed"
     
@Doorsensor_ArmedNight_OpenDoor_SwitchingToHomeFromPushNotification_DoorClosedInEntryDelay 		@P3 		@--xrayid:ATER-55129			 @Automated  		#N   @DAS_DoorSensor
    Scenario: As a user when I open the door in armed night and I should be able to switch to home from push notification
     Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
      And user "opens door with app" in background
      And user selects the "Switch to Home from Door Open" push notification
       And user "door" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Switched to Home by app  |
      And user "closes" activity log
     When user "door" access sensor "closed" 
    
@Doorsensor_ArmedNight_OpenDoor_SwitchingToHomeFromEntryDelay_DoorClosedInEntryDelay 		@P2 		@--xrayid:ATER-55130		@DAS_DoorSensor 				@Automated 
    Scenario: As a user when I open the door in armed night and I should be able to switch to home from entry delay screen
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
      And user "opens door with app" in background
      And user selects the "Door Opened" push notification
      And user selects "Switch to Home" from "Entry delay" screen
      And user "door" access sensor "closed"
     Then user status should be set to "Home"
      And user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Switched to Home by app  |
      And user "closes" activity log
     When user "door" access sensor "closed"
 
@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInEntryDelay_NoAlarm 			@P2 	@--xrayid:ATER-55131				@DAS_DoorSensor 				@Automated 
    Scenario: As a user when I open the door I should be able to switch to Night from door open push notification after closing the door
      Given user is set to "Night" mode through CHIL
      Given user launches and logs in to the Lyric application
        And user clears all push notifications
       When user navigates to "Security Solution card" screen from the "Dashboard" screen
        And timer ends on user device
        And user "opens door with app" in background
        And user selects the "Switch to Night from Door open" push notification
        And user "door" access sensor "closed"
        And timer ends on user device
       Then user status should be set to "Night"
       When user "opens" activity log
       Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Door Closed at Night mode|
       | Switched to Night by app |
       
@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromEntryDelay_DoorClosedInEntryDelay_NoAlarm 				@P2 		@--xrayid:ATER-55132			@Automated 				#N @DAS_DoorSensor 
    Scenario: As a user when I open the door I should be able to switch to Night from entry delay screen after closing the door
      Given user launches and logs in to the Lyric application
        And user clears all push notifications
        And user is set to "Night" mode through CHIL
       When user navigates to "Security Solution card" screen from the "Dashboard" screen
        #And timer ends on user device
        And user "opens door with app" in background
        And user selects the "Door opened" push notification
        And user selects "Switch to Night" from "Entry delay" screen
        And user "door" access sensor "closed"
      ##### When user navigates to "Security Solution card" screen from the "Dashboard" screen
        And timer ends on user device
       Then user status should be set to "Night"
       When user "opens" activity log
       Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Door Closed at Night mode|
       | Switched to Night by app |

@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromPushNotification_DoorNotClosedInEntryDelay_Alarm  			@P3 	@--xrayid:ATER-55133				@Automated 				#N @DAS_DoorSensor 
   Scenario: As a user when I open the door in night mode I should be able to switch to Night from push notification but failed to close the door in entry delay waiting should be taken to alarm
    Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
      And user "door" access sensor "opened"
      And user selects the "Switch to Night from Door Open" push notification
     Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
     #When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                       |
       | DOOR SENSOR ALARM AT NIGHT MODE|
       | ALARM AT NIGHT MODE            |
       | Alarm Dismissed                |
       |Switched to Home by app         |
     When user "closes" activity log
      And user "door" access sensor "closed"

@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromEntryDelay_DoorNotClosedInEntryDelay_Alarm  		@P3 		@--xrayid:ATER-55134			@DAS_DoorSensor 				@Automated 
    Scenario: As a user when I open the door in night mode I should be able to switch to Night from Entry Delay but failed to close the door in entry delay waiting should be taken to alarm
      Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
      And  user "door" access sensor "opened"
     Then user selects the "Door Opened" push notification
     When user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
      And user selects "dismiss alarm" from "alarm" screen
      #And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     #When user "opens" activity log
     #Then verify the following activity log:
       | Elements                       |
       | DOOR SENSOR ALARM AT NIGHT MODE|
       | ALARM AT NIGHT MODE            |
       | Alarm Dismissed                |
       | Switched to Home by app        |
     #When user "closes" activity log
      And user "door" access sensor "closed"
      
@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromPushNotification_DoorClosedInEntryDelay_NoAlarm_Duplicate 			@P2 	@--xrayid:ATER-91021			@DAS_DoorSensor 			@Automated
    Scenario: As a user when I open the door in night mode I should be able to switch to Night from door open push notification and close the door in entry delay waiting should be shown no alarm
     Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      When user minimizes the app
      And user "door" access sensor "opened"
      And user selects the "Switch to Night from Door open" push notification
      And user "door" access sensor "closed"
      When timer ends on user device
      Then user status should be set to "Night"
     When user "opens" activity log
    Then verify the following activity log:
    | Elements                 |
       | Door Opened at Night mode|
      | Door Closed at Night mode |
       | Switched to Night by app |
  
  
  
@Doorsensor_ArmedNight_OpenDoor_SwitchingToNightFromEntryDelay_DoorOpenedInEntryDelay_NoAlarm 			@P3 	@--xrayid:ATER-55135				@DAS_DoorSensor 				@Automated
    Scenario: As a user when I open the door in night mode I should be able to switch to Night from entry delay screen and close the door in entry delay waiting should be shown no alarm
      Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And user is set to "Night" mode through CHIL
      And user minimizes the app
      And user "door" access sensor "opened"
      And user selects the "Door opened" push notification
      And user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
      And user "door" access sensor "closed"
      When timer ends on user device
      Then user status should be set to "Night"
     When user "opens" activity log
      Then verify the following activity log:
      | Elements                 |
      | Door Opened at Night mode|
      | Door Closed at Night mode|
      | Switched to Night by app |
 
@Doorsensor_ArmedNight_OpenDoor_AttentionInEntryDelay 				@P1 					@DAS_DoorSensor 	@--xrayid:ATER-55136				@Automated
    Scenario: As a user when the door is opened in night mode I should be able to initiate attention alarm from entry delay screen on observing intruder in premises
     Given user sets the entry/exit timer to "60" seconds
       And user launches and logs in to the Lyric application
       And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
       And user is set to "Night" mode through CHIL
       And user "opens door with app" in background
       And user selects the "Door Opened" push notification
       And user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
       #And user navigates to "Alarm history" screen from the "Alarm" screen
      #Then verify the following alarm history:
       | Elements                    |
       | ALARM AT Night MODE          |
     #Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
     #Then user receives a "Alarm cancelled" email
     Then user status should be set to "Home"
      And user should see the "sensor" status as "issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "open" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
     When user "opens" activity log
     #Then verify the following activity log:
       | Elements                 |
       | SIREN SOUNDED BY ACTUAL USER|
       | ALARM AT NIGHT MODE |
       | Alarm Dismissed |
       | Switched to Home by app|
     And user "closes" activity log
    When user "door" access sensor "closed"
   
       
@Doorsensor_ArmedNight_OpenDoor_AlarmWhenNoActionInEntryDelay 				@P3 				@DAS_DoorSensor 		@--xrayid:ATER-55137				@Automated
    Scenario: As a user when the door is opened in night mode and no commands issued from entry delay screen then system should go into alarm mode
     Given user is set to "Night" mode through CHIL
       And user launches and logs in to the Lyric application
       And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
       And timer ends on user device
     #user should be treated as intruder in this scenario
       And user "opens door with app" in background
      Then user selects the "Door Opened" push notification
      When user "door" access sensor "is not closed"
      Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      Then user status should be set to "Home"
      When user "opens" activity log
      Then verify the following activity log:
       | Elements                 |
       | Alarm Dismissed |
       | Switched to Home by app|
      And user "closes" activity log
     

   @Doorsensor_ArmingNight_ExitError_SwitchingToHomeInEntryDelay 				@P3 				@DAS_DoorSensor 	@--xrayid:ATER-55138			@Automated
    Scenario: As a user when i left my door open during exit delay , I should be able to switch to home from entry delay screen to avoid the alarm
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And user "opens door with app" in background
     Then user selects the "Door Opened" push notification
      And timer lapse "30" seconds
      And user "door" access sensor "closed"
     When user selects "Switch to Home" from "Entry delay" screen
     Then user status should be set to "Home"
     Then user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "door" status as "closed" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      And user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door opened at Night mode|
       | Switched to Home by app  |
      And user "closes" activity log
      When user "door" access sensor "closed"
 
 
@Doorsensor_ArmingNight_ExitError_SwitchingToNightFromEntryDelay_DoorNotClosedInEntryDelay_Alarm 				@P3 		@--xrayid:ATER-55139				@DAS_DoorSensor @Automated
    Scenario: As a user when I left my door open in exit delay , I should be able to select switch to Night from Entry delay screen
    # But if I didn’t not close the door on time, it should get into  alarm
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And  user "door" access sensor "opened"
      And timer lapse "45" seconds
     #verify the entry delay status on dashboard
      And user selects "Switch to Night" from "Entry delay" screen
     Then user should be displayed with the "Waiting to close" screen
     When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                       |
       | DOOR SENSOR ALARM AT NIGHT MODE|
       | ALARM AT NIGHT MODE            |
       | Alarm Dismissed                |
       |Switched to Home by app         |
      When user "closes" activity log
      And user "door" access sensor "closed"
 
@Doorsensor_ArmingNight_ExitError_SwitchingToNightFromEntryDelay_DoorClosedInEntryDelay_NoAlarm 				@P4 	@--xrayid:ATER-55140				@DAS_DoorSensor 				@Automated
    Scenario: As a user when I left my door open in exit delay , I should be able to get Push notification of door open and on clicking it should take to Entry delay 
    #where i can select switch to Night and close the door in entry delay waiting with no alarm
      And user launches and logs in to the Lyric application
      #And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
      And user "door" access sensor "opened"
      And timer ends on user device
      And user "door" access sensor "closed"
      And user selects "Switch to Night" from "Entry delay" screen
      And timer ends on user device
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door Opened at Night mode|
       | Door Closed at Night mode|
       | Switched to Night by app |
 
    @Doorsensor_ArmingNight_ExitError_AttentionInEntryDelay 				@P4 				@DAS_DoorSensor 		@--xrayid:ATER-55141				@Automated
    Scenario: As a user when the door is opened in exit delay of night mode and failed to close door, then intruder entered, I should be able to initiate attention alarm from entry delay screen 
    #on observing intruder in premises
     Given user sets the entry/exit timer to "60" seconds
       And user launches and logs in to the Lyric application
       And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user is set to "Night" mode through CHIL
       And user "door" access sensor "opened"
       And timer lapse "60" seconds
      When user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
      # And user navigates to "alarm history" screen from the "alarm" screen
      #Then verify the following alarm history:
       | Elements                 |
       | ALARM AT NIGHT MODE |
      #And user navigates to "alarm" screen from the "alarm history" screen
     #Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
     #Then user receives a "Alarm cancelled" email
     Then user status should be set to "Home"
     When user "opens" activity log
     #Then verify the following activity log:
       | Elements                    |
       | SIREN SOUNDED BY ACTUAL USER|
       | ALARM AT NIGHT MODE         |
       | Alarm Dismissed             |
       |Switched to Home by app      |
      And user "closes" activity log
     When user "door" access sensor "closed"
 
@Doorsensor_ArmingNight_ExitError_AlarmWhenNoActionInEntryDelay 				@P3 				@DAS_DoorSensor 		@--xrayid:ATER-55142				@Automated
    Scenario: As a user when the door is opened in exit delay and forgot to close in time then user should receive alarm event if user does not perform any action within entry delay
    # from entry delay screen then system should go into alarm mode
     Given user launches and logs in to the Lyric application
     And user clears all push notifications
     And user is set to "Night" mode through CHIL
     When user "opens door with app" in background
     And timer lapse "60" seconds
    # When user "door" access sensor "is not closed"
     #And timer lapse "60" seconds  
     #no action taken 
     When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     
 
   @Doorsensor_Armed_OpenDoor_ForeGround_SwitchingToHomeFromPushNotifications 			@P4 		@--xrayid:ATER-91022			@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to home from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     When user "door" access sensor "opened with app in foreground"
      And user selects the "Switch to Home from Door Open" push notification with app in foreground
     Then user status should be set to "Home"
     Examples:
     |Mode   |
     |Away   |
 #    |Night  |
     
  
 @Doorsensor_Armed_OtherScreen_OpenDoor_ForeGround_SwitchingToHomeFromPushNotifications 			@P4 		@--xrayid:ATER-91023			@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to home from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     Then user status should be set to <Mode>
     When user navigates to <Other Screen> from the "Security Solution card" screen
      And user "door" access sensor "opened with app in foreground"
     When user selects the "Switch to Home from Door Open" push notification
     Then user status should be set to "Home"
     Examples:
     |Mode   |Other Screen                           |
     |Away   |Security Solution Settings screen      |
     |Away   |Same Location Settings screen          |
     |Away   |Same Location Camera(any) device screen|
     |Away   |Different Location                     |     
     |Night  |Security Solution Settings screen      |
     |Night  |Same Location Settings screen          |
     |Night  |Same Location Camera(any) device screen|
     |Night  |Different Location                     |
     
     @Doorsensor_Armed_OpenDoor_ForeGround_ClosedDoor_SwitchingToNight_FromPushNotifications 			@P4 		@--xrayid:ATER-91024			@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to home from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     Then user status should be set to <Mode>
     When user "opens door with app" in foreground
      And user "door" access sensor "Closed"
      And user selects the "Switch to Night from Door Open" push notification
      And timer ends on user device
     Then user status should be set to "Night"
     Examples:
     |Mode   |
     |Away   |
     |Night  |
     
  
 @Doorsensor_Armed_OtherScreen_OpenDoor_ForeGround_ClosedDoor_SwitchingToNightFromPushNotifications 			@P4 		@--xrayid:ATER-91025			@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to night from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     Then user status should be set to <Mode>
     When user navigates to <Other Screen> from the "Security Solution card" screen
      And user "door" access sensor "Closed"
      And user selects the "Switch to Night from Door Open" push notification
      And timer ends on user device
     Then user status should be set to "Night"
     Examples:
     |Mode   |Other Screen                           |
     |Away   |Security Solution Settings screen      |
     |Away   |Same Location Settings screen          |
     |Away   |Same Location Camera(any) device screen|
     |Away   |Different Location                     |     
     |Night  |Security Solution Settings screen      |
     |Night  |Same Location Settings screen          |
     |Night  |Same Location Camera(any) device screen|
     |Night  |Different Location                     |
     
     
    @Doorsensor_Armed_OpenDoor_ForeGround_SwitchingToNight_FromPushNotifications_DoorClosed 			@P4 	@--xrayid:ATER-91026				@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to home from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     Then user status should be set to <Mode>
     When user "opens door with app" in foreground
      And user selects the "Switch to Night from Door Open" push notification
     Then user should be displayed with the "Waiting to close" screen 
     When user "door" access sensor "Closed"
      And timer ends on user device
     Then user status should be set to "Night"
     Examples:
     |Mode   |
     |Away   |
     |Night  |
     
  
 @Doorsensor_Armed_OtherScreen_OpenDoor_ForeGround_SwitchingToHomeFromPushNotifications_DoorClosed 			@P4 		@--xrayid:ATER-91027			@NotAutomatable
    Scenario Outline: As a user when I get push notification while app in foreground I should be able to switch to home from push 
    Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to <Mode>
      And timer ends on user device
     Then user status should be set to <Mode>
     When user navigates to <Other Screen> from the "Security Solution card" screen
      And user "door" access sensor "Closed"
      And user selects the "Switch to Night from Door Open" push notification
     Then user should be displayed with the "Waiting to close" screen 
     When user "door" access sensor "Closed" 
      And timer ends on user device
     Then user status should be set to "Night"
     Examples:
     |Mode   |Other Screen                           |
     |Away   |Security Solution Settings screen      |
     |Away   |Same Location Settings screen          |
     |Away   |Same Location Camera(any) device screen|
     |Away   |Different Location                     |     
     |Night  |Security Solution Settings screen      |
     |Night  |Same Location Settings screen          |
     |Night  |Same Location Camera(any) device screen|
     |Night  |Different Location                     |
     
       #END OF DURING NIGHT MODE
	  
    @WindowSensor_OpenDuringAwayModeExitDelay 			@P4 				@DAS_WindowSensor 		@--xrayid:ATER-55143			@Automated
      Scenario: 31 As a user when the window is opened in Away exit delay I should be notified with alarm 
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And user switches from "Home" to "Away"
     When user "window" access sensor "opened"
   	 Then user should be displayed with the "Alarm" screen
   	 #And user camera is "Live streaming"
   	 #view in full screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
      And user "window" access sensor "closed"
      
      
      @WindowSensor_OpenAfterAwayModeExitDelay 			@P1 				@DAS_WindowSensor 			@--xrayid:ATER-55144		@Automated
      Scenario: 32 As a user when intruder breaches the premises through window after away exit delay I should be notified with alarm
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And timer ends on user device
       And user "opens window with app" in background
      When user selects the "Alarm" push notification
   	 Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     And user "opens" activity log
     Then verify the following activity log:
      | Elements                 | 
      | ALARM AT AWAY MODE       |
      | Alarm Dismissed          |
      | Switched to Home by app  |
     And user "closes" activity log
     And user "window" access sensor "closed"
     
     @WindowSensor_OpenDuringNightModeExitDelay  				@P4 					@DAS_WindowSensor 		@--xrayid:ATER-55145			@Automated
     Scenario: 33 As a user when intruder breaches the premises through window during night mode exit delay I should be notified with alarm 
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Night"
     When user "window" access sensor "opened"
     When user selects the "Alarm" push notification
   	 Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     And user "window" access sensor "closed"
     
     
     @WindowSensor_OpenAfterNightModeExitDelay 				@P2 				@DAS_WindowSensor 			@--xrayid:ATER-55146			@Automated
     Scenario: 34 As a user when intruder breaches the premises through window after night mode exit delay I should be notified with alarm
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And user switches from "Home" to "Night"
      And timer ends on user device
     When user "window" access sensor "opened"
     When user selects the "Alarm" push notification
   	 Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     And user "window" access sensor "closed"
     
  
       ###########
      
     #Door Tampered scenarios
     
     @DoorSensor_TamperDuringAwayModeExitDelay 				@P3 					@DAS_DoorSensor 		@--xrayid:ATER-55147				@Automated
      Scenario: 35 As a user when the DOOR is tampered in Away exit delay I should be notified with alarm 
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user "door" access sensor "tampered"
   	 Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      When user "door" access sensor "tamper restored"
     
     
     @DoorSensor_TamperDuringNightModeExitDelay 				@P4 					@DAS_DoorSensor 		@--xrayid:ATER-55148				@Automated
      Scenario: 36 As a user when the door is tampered in Night exit delay I should be notified with alarm
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Night" mode through CHIL
     And user launches and logs in to the Lyric application
     And user clears all push notifications
      When user "door tampered with app" in background
      When user selects the "Alarm" push notification
   	 Then user should be displayed with the "Alarm" screen
   	  And user selects "dismiss alarm" from "alarm" screen
   	 When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
   	  When user "door" access sensor "tamper restored"
      
      
       @DoorSensor_TamperAfterAwayModeExitDelay 				@P2 				@DAS_DoorSensor 			@--xrayid:ATER-55149			@Automated
      Scenario: 37 As a user when the DOOR is tampered After Away exit delay I should be notified with alarm 
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
     When timer ends on user device
     And user clears all push notifications
     When user "door tampered with app" in background
      When user selects the "Alarm" push notification
   	 Then user should be displayed with the "Alarm" screen
   	 And user "door" access sensor "tamper restored"
   	 When user selects "dismiss alarm" from "alarm" screen
   	 And user navigates to "Sensor Status" screen from the "Security Solution Card" screen
   	 When user navigates to "Security Solution Card" screen from the "Sensor Status" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |DOOR SENSOR TAMPERED AT AWAY MODE|
       |DOOR SENSOR ALARM AT AWAY MODE |
       |DOOR SENSOR TAMPER CLEARED AT HOME MODE|
     And user "closes" activity log
     
     
     
     @DoorSensor_TamperAfterNightModeExitDelay 				@P2 					@DAS_DoorSensor 			@--xrayid:ATER-55150			@Automated
      Scenario: 38 As a user when the door is tampered after Night exit delay I should be notified with alarm
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Night" mode through CHIL
     And user launches and logs in to the Lyric application
     When user "door" access sensor "tampered"
   	 Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
       When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
       When user navigates to "Security Solution Card" screen from the "Sensor Status" screen
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       |DOOR SENSOR TAMPERED AT NIGHT MODE|
       |DOOR SENSOR ALARM AT NIGHT MODE |
       |DOOR SENSOR TAMPER CLEARED AT HOME MODE|
       When user "door" access sensor "tamper restored"
       
      
       @WindowSensor_TamperDuringAwayModeExitDelay 					@P3 						@DAS_WindowSensor 	@--xrayid:ATER-55151					@Automated
      Scenario: 39 As a user when the window is tampered in Away exit delay I should be notified with alarm 
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
      When user "window" access sensor "Tampered"
   	 Then user should be displayed with the "Alarm" screen
   	 # When user navigates to "Dashboard" screen from "Dashboard Alarm" screen
   	 #Then user should see the "Security" status as "attention" on the "Dashboard"
   	 When user selects "dismiss alarm" from "alarm" screen
   	  And user navigates to "Security Solution card" screen from the "Dashboard" screen
   	   When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      When user "window" access sensor "Tamper Restored"
       
       
        @WindowSensor_TamperDuringNightModeExitDelay 				@P4 					@DAS_WindowSensor 		@--xrayid:ATER-55152				@Automated
      Scenario: 40 As a user when the window is tampered in Night exit delay I should be notified with alarm 
      Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      When user "window tampered with app" in background
      When user selects the "Alarm" push notification
   	  Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      Then user "window" access sensor "Tamper Restored"
     
       
      @WindowSensor_TamperAfterAwayModeExitDelay 					@P2 					@DAS_WindowSensor 		@--xrayid:				@Automated
      Scenario: 41 As a user when the window is tampered after Away exit delay I should be notified with alarm 
     Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
       When timer ends on user device
       And user clears all push notifications
      When user "window tampered with app" in background
      When user selects the "Alarm" push notification
   	  Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      And user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      Then user "window" access sensor "Tamper Restored"
      When user navigates to "Security Solution Card" screen from the "Sensor Status" screen
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       |WINDOW SENSOR TAMPERED AT HOME MODE|
       #|WINDOW SENSOR ALARM AT AWAY MODE |
       |WINDOW SENSOR TAMPER CLEARED AT HOME MODE|
       And user "closes" activity log
       
       
        @WindowSensor_TamperAfterNightModeExitDelay 					@P2 						@DAS_WindowSensor 		@--xrayid:ATER-55154			@Automated
      Scenario: 42 As a user when the window is tampered after Night exit delay I should be notified with alarm 
      Given user sets the entry/exit timer to "60" seconds
      And user is set to "Night" mode through CHIL
        And user launches and logs in to the Lyric application
        When timer ends on user device
        And user clears all push notifications
      When user "window" access sensor "Tampered"
   	 Then user should be displayed with the "Alarm" screen
   	 When user selects "dismiss alarm" from "alarm" screen
   	  And user navigates to "Security Solution card" screen from the "Dashboard" screen
   	   When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      When user "window" access sensor "Tamper Restored"
      When user navigates to "Security Solution Card" screen from the "Sensor Status" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |WINDOW SENSOR TAMPERED AT HOME MODE|
       #|WINDOW SENSOR ALARM AT NIGHT MODE |
       |WINDOW SENSOR TAMPER CLEARED AT HOME MODE|
       And user "closes" activity log
      
     
      @Motionsensor_MotionDetectedAfterAwayExitDelay_SwitchingToHomeFromEntryDelay 				@P2 			@--xrayid:ATER-55155		@DASMotionSensor 			@Automated
    Scenario: 43 As a user when motion is detected in Away mode and switch to home is given by user from entry delay screen, system should go to home mode 
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     # And user minimizes the application
     # And user mobile screen is locked
     When user "sensor" detects the "Motion"
     When user selects the "Motion Detected" push notification
     #Then user should be displayed with "Mobile Locked" screen
     #When user enters "Mobile Passcode"
     Then user should be displayed with the "Entry Delay" screen
	 When user selects "Switch to Home" from "Entry delay" screen
	 Then user status should be set to "Home"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Sensor Motion Detected at Away mode|
       |Switched to Home by app |
     When user "closes" activity log
     
     
     @Motionsensor_MotionDetectedAfterAwayExitDelay_SwitchingToNightFromEntryDelay 			@P3  		@--xrayid:ATER-55156		@DASMotionSensor 			@Automated
    Scenario: 44 As a user when motion is detected in Away mode and switch to night is given by user from entry delay screen, system should go to night mode 
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
	  When user "sensor" detects the "Motion"
	  Then user should be displayed with the "Entry Delay" screen
     When user selects "Switch to Night" from "Entry delay" screen
     And timer ends on user device
	 Then user status should be set to "Night"
     When user "opens" activity log
	Then verify the following activity log:
       | Elements                 | 
       |Sensor Motion Detected at Away mode|
       #verify the icon 
       |Switched to Night by app |
     When user "closes" activity log
     
     
     @Motionsensor_MotionDetectedAfterAwayExitDelay_AttentionFromEntryDelay 				@P2 			@--xrayid:ATER-55157		@DASMotionSensor 					@Automated
     Scenario: 45 As a user I should be able to initiate panic alarm from entry delay screen on seeing suspects in my motion sensor detection video
     Given user is set to "Away" mode through CHIL
     And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
	  When user "sensor" detects the "Motion"
     When user selects "Attention" from "Entry delay" screen
     When user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Sensor Motion Detected at Away mode|
       |SIREN SOUNDED BY ACTUAL USER |
       |ALARM AT AWAY MODE|
       #verify the icon
       |Alarm Dismissed|
     When user "closes" activity log
     
     
     @Motionsensor_MotionDetectedAfterAwayExitDelay_AlarmWhenNoActionOnEntryDelay 				@P1 		@--xrayid:ATER-55158				@DASMotionSensor 				@Automated
    Scenario: 46 As a user I should get alarm when no action taken from entry delay screen on seeing motion detection
     Given user is set to "Away" mode through CHIL
     And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
	  When user "sensor" detects the "Motion"
	  When user selects "no options" from "Entry delay" screen
     #When user selects the "Alarm" push notification
     Then user should be displayed with the "Alarm" screen
    # When user navigates to "Alarm History" screen from "Alarm" screen
	# Then user receives a "Door Alarm" in alarm history
    # And user receives a "ALARM AT Night MODE" in alarm history
    # When user navigates to "Alarm" screen from "Alarm History" screen
     When user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Sensor Motion Detected at Away mode|
       |ALARM AT AWAY MODE|
       |Alarm Dismissed|
     When user "closes" activity log
	        
 
     @MotionSensor_TamperedInAwayExitDelay 						@P2 						@DASMotionSensor 		@--xrayid:ATER-55159				@Automated
      Scenario: 48 As a user when the Motion is tampered after Away exit delay I should be notified with alarm 
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      When user motion sensor "Tampered"
   	 Then user should be displayed with the "Alarm" screen
   	  When user navigates to "Dashboard" screen from the "Alarm Security Solution Card" screen
      Then user should see the "Security" status as "attention" on the "Dashboard"
   	  And user navigates to "Security Solution card" screen from the "Dashboard" screen
       When user selects "dismiss alarm" from "alarm" screen
   	   When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
   	  When user motion sensor "Tamper Restored"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Motion SENSOR TAMPERED AT AWAY MODE|
       |Motion SENSOR ALARM AT AWAY MODE |
       |Motion SENSOR TAMPER CLEARED AT AWAY MODE|
       And user "closes" activity log
       
       
       @MotionSensor_TamperedDuringAwayExitDelay 				@P3 				@DASMotionSensor 			@--xrayid:ATER-55160			@Automated
      Scenario: 49 As a user when the Motion is tampered in Away exit delay I should be notified with alarm 
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
      When user motion sensor "Tampered"
   	 Then user should be displayed with the "Alarm" screen
   	  When user navigates to "Dashboard" screen from the "Alarm Security Solution Card" screen
      Then user should see the "Security" status as "attention" on the "Dashboard"
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
       When user selects "dismiss alarm" from "alarm" screen
   	   When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
   	  When user motion sensor "Tamper Restored"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Motion SENSOR TAMPERED AT AWAY MODE|
       |Motion SENSOR ALARM AT AWAY MODE |
       And user "closes" activity log
    
   # ************************
     @DoorsensorOpenAfterAwayExitDelay_windowopen 					@P3 					@DASDoorWindowSensor 		@--xrayid:ATER-55161			@Automated
    Scenario: 50 In away mode As an user I should get alarm immediately on window open by intruder while entry delay in progress  after intruder breaches the premises through door
    Given user is set to "Away" mode through CHIL
     And user launches and logs in to the Lyric application
     And user clears all push notifications
     And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
    When  user "door" access sensor "opened"
	 When user "window" access sensor "opened"
	 Then user should be displayed with the "Alarm" screen
	  When user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Door opened at Away mode|
       |Window Opened at Away Mode |
       |Window Alarm At Away Mode|
       |ALARM AT AWAY MODE|
       
       
    @DoorsensorOpenAfterNightExitDelay_windowopen 					@P3 					@DASDoorWindowSensor 		@--xrayid:ATER-55162				@Automated
    Scenario: 52 In Night mode As an user I should get alarm immediately on window open by intruder while entry delay in progress  after intruder breaches the premises through door
      Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
     And user clears all push notifications
     And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
    When  user "door" access sensor "opened"
	 When user "window" access sensor "opened"
	 Then user should be displayed with the "Alarm" screen
	  When user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Door opened at Night mode|
       |Window Opened at Night Mode |
       |Window Alarm At Night Mode|
       |ALARM AT Night MODE|
    
    
    @AwayMode_MotionDetectedWindowOpenDoorOpen 				@P3 				@Automated   @--xrayid:ATER-55163	
    Scenario: 54 In away mode As an user I should get alarm immediately on window open by intruder while entry delay in progress  after intruder breaches the premises with motion detection
    Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
      #And user minimizes the application 
     When user motion sensor "Motion detected"
     And user selects the "Motion Detected" push notification
	 Then user should be displayed with the "Entry delay" screen
	 When user "window" access sensor "opened"
	 Then user should be displayed with the "Alarm" screen
	 When  user "door" access sensor "opened"
	 And user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
       |Sensor Motion Detected at Away mode|
       |Window Opened at Away Mode|
       |Door Opened at Away mode|
       |ALARM AT AWAY MODE|
       |Motion Alarm|
       |Alarm Dismissed|
      And user "closes" activity log
      When user "window" access sensor "closed"
      When user "door" access sensor "closed"
      
      
      @AwayMode_WindowOpenMotionDetectedDoorOpen 				@P2 				@Automated   @--xrayid:ATER-55164	
    Scenario: 55 In away mode As an user I should get alarm immediately on window open by intruder while entry delay in progress  after intruder breaches the premises with motion detection
    Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
      When user "window" access sensor "opened"
      Then user should be displayed with the "Alarm" screen
      When user "sensor" detects the "Motion"
       When  user "door" access sensor "opened"
       And user selects "dismiss alarm" from "alarm" screen
      When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       |Window Opened at Away Mode|
       |Sensor Motion Detected at Away mode|
       |Door Opened at Away mode|
      And user "closes" activity log
      
      
     @NightMode_Dooropen_MotionsensorAfterExitDelay_windowopen 			@P2 	@--xrayid:ATER-55165				@Automated
    Scenario: 56 In night mode As an user I should get alarm immediately on window open by intruder while entry delay in progress  after intruder breaches the premises with door open and motion detection
    Given user is set to "Night" mode through CHIL
     And user launches and logs in to the Lyric application
     And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     When user "door" access sensor "opened"
     Then user should be displayed with the "Entry Delay" screen
     When user "sensor" detects the "Motion"
	  When user "window" access sensor "opened"
	  And user selects "dismiss alarm" from "alarm" screen
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
        |Door Opened at Away mode|
          |Sensor Motion Detected at Away mode|
       |Window Opened at Away Mode|
      And user "closes" activity log 
      
      
	  @DismissAlarm_Navigation 			@P3 		@--xrayid:ATER-55166			@Automated
      Scenario: 61 As an user I should be navigated to screen previous to alarm status on dismissing alarm
      Given user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
        And user can dismiss the alarm in following screen:
		|Elements   |
      |Geofence setting  |
    #  |Geofence Radius|
      |Add Users|
   #   |Location Details|
   #   |Edit Account|
   #   |About the app|
       #  |Add New Device|
     # |Alert|
     # |Comfort Solution Card|
     # |WLD Solution Card|
     # |Alerts & Notification|
    #  |Camera Settings|
    #  |WLD Settings|
     # |Comfort Settings|
    #  |Basestation Settings |
    #  |DAS Camera Settings|
    #  |Vacation|
   #   |Zwave settings |
   #   |Zwave inclusion|
   #   |Zwave exclusion|
    #  |Camera Activity Log|
        	  
        	  
        @Alarm_Navigation_Otherscreen 				@P2 			@--xrayid:ATER-55167			@Automated
    Scenario: 62 As an user I should be navigated to any screen in lyric app from alarm screen during panel in alarm state
       Given user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
        And user can navigate from the alarm in following screen:
		|Elements   |
      |Geofence setting  |
   #   |Geofence Radius|
      |Add Users|
   #   |Location Details|
    #  |Edit Account|
    #  |About the app|
     # |Add New Device|
     # |Alert|
     # |Comfort Solution Card|
     # |WLD Solution Card|
     # |Alerts & Notification|
    #  |Camera Settings|
    #  |WLD Settings|
     # |Comfort Settings|
    #  |Basestation Settings |
    #  |DAS Camera Settings|
    #  |Vacation|
   #   |Zwave settings |
   #   |Zwave inclusion|
   #   |Zwave exclusion|
    #  |Camera Activity Log|
   # |Sensor enrollment|
   # |OD event triggered|
    #   |ID event triggered|
       
       
    @Alarm_Navigation_Otherscreen_Settings 					@P3			@--xrayid:ATER-91028			@NotAutomatable
    Scenario Outline: 64 As an user I should be not allowed to edit settings during panel in alarm state
      Given user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
      	When user "window" access sensor "opened"
   	   Then user should be displayed with the "Alarm" screen
       When user navigates to <Expected> screen from "Alarm" screen
      Then user should be displayed with "Grayed settings" screen
       When user "dismisses" the alarm
       Then user should be displayed with "Dashboard" screen
       Examples:
       |Expected   |
       |Security Solution Card Settings|
     #  |Camera Settings|
     #  |Geofence radius|Geofence radius|
     #  |Geofence radius|Alerts & Notification|
      # |Alerts & Notification|Security Solution Card|
      # |Security Solution Card|Comfort Solution Card|
      # |Comfort Solution Card|WLD Solution Card|
      # |WLD Solution Crad|My Account|
      # |My Account|App Settings & Info|
     #  |App Settings & Info|Add New Device|
     #  |Add New Device|Camera Settings|
     #  |Camera Settings|WLD Settings|
      # |WLD Settings|Comfort Settings|
      # |Comfort Settings|Basestation Settings |
     #  |Basestation Settings|DAS Camera Settings|
     #  |DAS Camera Settings |Vacation|
     #  |Vacation|Location Details|
      # |Location Details|Manage user|
     #  |Manage user|Zwave settings|
      
   
   #Covered in @EntryDelayScreenValidation Scenario
    @Entrydelay_Navigation_Otherscreen 				@P4			@--xrayid:ATER-55177			@Automated
    Scenario: 63 As an user I should not be navigated to any screen in lyric app from entry delay screen  
      Given user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
        When  user "door" access sensor "opened"
        Then user should be displayed with "Entry Delay" screen
        And user can navigate from the entry exit delay in following screen:
       |Elements   |
      |Geofence setting  |
      |Geofence Radius|
      |Add Users|
      |Location Details|
      |Edit Account|
      |About the app|
      |Add New Device|
       
       
       
    @Alarm_Call 			@P2  		@--xrayid:ATER-55169			@Automated
    Scenario: 65 As an user I should be able to call police from alarm screen on confirming intruder in premises
      Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
        When user "window" access sensor "Tampered"
       Then user should be displayed with the "Alarm" screen
       When user selects "Call" from "Alarm" screen
       Then user should be displayed with the "Call" screen
       When user selects "Cancel" from "Call" screen
       Then user should be displayed with the "Alarm" screen
        When user selects "Call" from "Alarm" screen
       When user selects "Call the police" from "Call" screen
      # Then user should be displayed with the “Phone” screen
       
       
    @AlarmOnlogin 			@P3 	@--xrayid:ATER-55170			@Automated
    Scenario: 66 As an user I should be shown with alarm screen on login to account when panel in Alarm state
     Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       When user "window" access sensor "Tampered"
       Then user should be displayed with the "Alarm" screen
      # Repeat for door motion ismviewer osmviewer
      
    @EntrydelayOnlogin 		@P3 	@--xrayid:ATER-55171			@Automated
    Scenario: 67 As an user I should be shown with entry delay screen on login to account when panel in exntry delay state
    Given user sets the entry/exit timer to "30" seconds
    And user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       When user "door" access sensor "opened"
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
       Then user should be displayed with the "entry delay" screen
        
     
    @Alarm_History 			@P2 	@--xrayid:ATER-55172			@Automated
    Scenario: 68 As a user I should get events in alarm history during alarm period
    Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And timer ends on user device
      When user "door" access sensor "opened"
      And user "sensor" detects the "Motion"
      Then user should be displayed with the "Entry Delay" screen
      When user selects "no options" from "Entry delay" screen
      And user should be displayed with the "Alarm" screen
      When user "window" access sensor "opened" 
      And user "door" access sensor "tampered"
      And user "window" access sensor "Tampered"
     # And user motion sensor "Tampered"     
      When user navigates to "Alarm history" screen from the "Alarm" screen
      And verify the following alarm history:
      |Elements|
      |DOOR OPENED AT NIGHT MODE|
    #  |SENSOR MOTION DETECTED AT NIGHT MODE|
      |ALARM AT NIGHT MODE|
      |Window Opened At NIGHT mode|
      |Door SENSOR Tampered At NIGHT mode|
      |Window SENSOR Tampered At NIGHT mode|
    #  |Motion Sensor Tampered At NIGHT mode|
      

      
       @Basestation_DisplacedDuringExitDelayModes 			@P3 	@--xrayid:ATER-91029				@NotAutomatable
      Scenario: 70 As a user when someone tried to displace or tamper the basestation being in transition of away or night modes I should be notified with alarm 
       Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user minimizes the application
      And user mobile screen is locked
     When user "Displaced" the Basestation "in" Exit delay
     Then user receives a "Alarm" push notification
     When user selects "Alarm" push notification
     Then user should be displayed with "Mobile Locked" screen
     When user enters "Mobile Passcode"
   	 Then user should be displayed with the "Alarm" screen
     When user "dismisses" the alarm
     Then user status should be set to "Home"
     When user navigates to "Activity Log" screen from "Security Solution Card" screen
	 Then user receives a "Basestation Displaced" activity log
     And user receives a "ALARM AT AWAY MODE" activity log
     And user receives a "Alarm Dismissed" activity log
     And user receives a "Switched to Home by app" activity log
    When user navigates to "Alert" screen from "Activity Log" screen
    Then user receives a "Basestation Displaced" alert
     And user receives a "Alarm" alert
     And user receives a "Alarm Dismissed" alert
     And user receives a "Switched to Home" alert 
    Given user is set to "Night" mode through CHIL
      And user minimizes the application
      And user mobile screen is locked
     When user "Displaced" the Basestation "after" Exit delay
     Then user should be displayed with "Night" Mode
     When user "Displaced" the Basestation "in" Exit delay
     Then user should be displayed with "Night" Mode
     When user navigates to "Activity Log" screen from "Security Solution Card" screen
	 Then user "should not" receives a "Basestation Displaced" activity log
      And user receives a "Switched to Night by app" activity log
     When user navigates to "Alert" screen from "Activity Log" screen
     Then user receives a "Switched to Night" alert
      And user "should not" receives a "Alarm Dismissed" alert
      
      @Basestation_DisplacedAfterExitDelayModes 			@P2 		@--xrayid:ATER-91030			@NotAutomatable
      Scenario: 69 As a user when someone tried to displace or tamper the basestation being in away or night modes I should be notified with alarm 
       Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user minimizes the application
      And user mobile screen is locked
     When user "Displaced" the Basestation "in" Exit delay
     Then user receives a "Alarm" push notification
     When user selects "Alarm" push notification
     Then user should be displayed with "Mobile Locked" screen
     When user enters "Mobile Passcode"
   	 Then user should be displayed with the "Alarm" screen
     When user "dismisses" the alarm
     Then user status should be set to "Home"
     When user navigates to "Activity Log" screen from "Security Solution Card" screen
	 Then user receives a "Basestation Displaced" activity log
     And user receives a "ALARM AT AWAY MODE" activity log
     And user receives a "Alarm Dismissed" activity log
     And user receives a "Switched to Home by app" activity log
    When user navigates to "Alert" screen from "Activity Log" screen
    Then user receives a "Basestation Displaced" alert
     And user receives a "Alarm" alert
     And user receives a "Alarm Dismissed" alert
     And user receives a "Switched to Home" alert 
    Given user is set to "Night" mode through CHIL
      And user minimizes the application
      And user mobile screen is locked
     When user "Displaced" the Basestation "after" Exit delay
     Then user should be displayed with "Night" Mode
     When user "Displaced" the Basestation "in" Exit delay
     Then user should be displayed with "Night" Mode
     When user navigates to "Activity Log" screen from "Security Solution Card" screen
	 Then user "should not" receives a "Basestation Displaced" activity log
      And user receives a "Switched to Night by app" activity log
     When user navigates to "Alert" screen from "Activity Log" screen
     Then user receives a "Switched to Night" alert
      And user "should not" receives a "Alarm Dismissed" alert
      
      
     @Alarm_Offline 			@P2 	@--xrayid:ATER-91031				@NotAutomatable
 Scenario: 71 As a user I should be shown with help message after panel offline so that i will be guided to take necessary actions
    Given user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
     When user "Tampered" the window
   	 Then user should be displayed with the "Alarm" screen
     When user DAS panel went to "offline"
     Then user "should not" "dismisses" the alarm
     Then user should be displayed with "Offline" state
      And user should be displayed with "Help" message
      #make the alarm dismissed
      #make the panel offline
      #generate the sensor alarm
      #dismiss using keyfob
      #make panel online
      #check the activity log for sensor alarm details  
    
     
      @ZwaveOperations_Alarm 			@P2 		@--xrayid:ATER-55173			@Automated
 Scenario Outline: 72 As a user I should get alarm when i am performing any Zwave operation
    And user is set to "Night" mode through CHIL
      And user launches and logs in to the Lyric application
      And timer ends on user device
     When user navigates to "ZWAVE UTILITIES" screen from the "Dashboard" screen
      And user navigates to <Zwave operation> screen from the "ZWAVE UTILITIES" screen
      Then user should be displayed with the <Expected> screen
      And user "window" access sensor "opened"
   	 Then user should be displayed with the "Alarm" screen
   	  When user selects "DISMISS ALARM OVERLAY WITH ZWAVE ACTION IN PROGRESS" from "alarm" screen
    Examples:
    |Zwave operation                             | Expected|
    |ZWAVE DEVICE THROUGH GENERAL INCLUSION      |Activate ZWAVE Device|
    |ZWAVE DEVICE THROUGH GENERAL Exclusion      |Exclusion Mode Active|

  
    @AlarmDismissedViaKeyfobDiffModes 			@P2		@--xrayid:ATER-55174			@Automated
    Scenario Outline: 75 As a user I should be able to dismiss alarm through keyfob
     Given user is set to "Away" mode through CHIL
     Given user launches and logs in to the Lyric application
     And user clears all push notifications
     When  user "window" access sensor "opened"
     When user press <Mode> key from keyfob
     #validate email content
   	 And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to <Mode>
   	 When user "opens" activity log
     Then verify the following activity log:
       | Elements  | 
       | Alarm Dismissed by Keyfob|
       | Switched to Home by Keyfob|
     And user "closes" activity log
     Examples:
     |Mode|
     |Home|
     #|Off |
     
      
     @Alarm_MultiLocation  			@P3 		@--xrayid:ATER-91032			@NotAutomatable
     Scenario:	76 As a user when a das is in alarm state in one location, I should be able to access other locations without any problem
     Given user is set to "Away" mode through CHIL
     When user "window" access sensor "opened"
     Given user launches and logs in to the Lyric application
   	 Then user should be displayed with the "Alarm" screen
   	 Then user navigates to "global drawer" from "dashboard alarm" screen
   	  Then user should be displayed with the "Global drawer menu" screen
   	  And user "put app" in background
   	  And user navigates to "other location" screen from the "Dashboard alarm" screen
   	  Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
    
     
      
   @Livestreaming_Alarm  			@P2  	@--xrayid:ATER-55175			@Automated
    Scenario: 73 As an user I should be able to pause and resume streaming in alarm screen
      Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      When user "window" access sensor "opened"
       Then user should be displayed with the "Alarm" screen
       And alarm screen is "Live streaming"
       When user selects "Pause" from "Alarm" screen
       Then user should be displayed with the "Paused streaming" 
       When user selects "Resume" from "Alarm" screen
       Then alarm screen is "Live streaming"
       #check in ipad
       #minimize and launch the aoo, check live stream
       #close the shutter and open in mid of alarm or entry delay, check live stream
       #cover attention alarm
       
       @Livestreaming_Entrydelay  		@P3 	@--xrayid:ATER-55176			@Automated
    Scenario: 74 As an user I should be able to pause and resume streaming in entry delay screen
      Given user is set to "Away" mode through CHIL
        And user launches and logs in to the Lyric application
         When user navigates to "Security Solution card" screen from the "Dashboard" screen
         And user "door" access sensor "opened"
        Then user should be displayed with the "Entry delay" screen
        #And entry delay camera is "Live streaming"
       When user selects "Pause" from "Entry delay" screen
       Then user should be displayed with the "Paused streaming" 
      When user selects "Resume" from "Entry delay" screen
      #And launch from background check live stream
       #close the shutter and open in mid of alarm or entry delay, check live stream
       #cover attention alarm
         
     
     @EntryDelayScreenValidation 		@P1 	@--xrayid:ATER-55177			@Automated
    Scenario: 77 As a user when entry delay is shown I should be able to view the details of entry delay screen.
      Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
      And timer ends on user device
     And  user "door" access sensor "opened"
      And user should be displayed with the following "EntryDelay" options:
      | Elements                               | 
      |  entry delay with door open title      |
     # |  entry delay with sensor name          |
      |  entry delay subtitle as location name |
      |  entry delay live stream               |
      |  entry delay alarm in secs text        |
      |  entry delay alarm in secs counter     |
      |  entry delay switch to home            | 
      |  entry delay switch to night           |
      |  entry delay attention                 |
      |  without back button					  |
    And user is set to "home" mode through CHIL


    @AlarmScreenValidation  			@P1 		@--xrayid:ATER-55178		@Automated 
    Scenario: 78 As a user when alarm is shown I should be able to view the details of alarm screen
     Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      When user "window" access sensor "opened"
      Then user should be displayed with the "Alarm" screen
      And user should be displayed with the following "Alarm" options:
      | Elements                    |
      |  alarm title                |
      |  alarm subtitle             |
      |  alarm live stream          |
      |  alarm navigate back button |
     # |  call                       |
     When user selects "dismiss alarm" from "alarm" screen
     
     #Repeat screen validation for 
      #  And user force closes the application
     #   And user lyric app screen is locked
      
      
      @MobileLocked_Doorsensor_OpenAfterAwayExitDelay_SwitchingToNightFromPushNotification_DoorClosedInEntryDelay_NoAlarm 		@--xrayid:ATER-91033			@P2 					@NotAutomatable
      Scenario: As a user with mobile locked when I open the door I should be able to switch to Night from door open push notification on my arrival to home after closing the door
       Given user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
      When user switches from "Home" to "Away"
      When timer ends on user device
      And user mobile screen is locked
      When  user "door" access sensor "opened"
      And user "door" access sensor "closed"
      When user selects the "Switch to Night option from Door opened" push notification
	 When user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user should be displayed with "Mobile locked" screen
     When user enters "Mobile Passcode" 
     When timer ends on user device
	 Then user status should be set to "Night"
     When user "opens" activity log
     
     
     @TokenExpired_Doorsensor_OpenAfterAwayExitDelay_PotraitLandscapeView_SwitchingToNightFromEntryDelay_DoorNotClosedInWaiting_Alarm 		@--xrayid:ATER-91034			@P2 					@NotAutomatable
    Scenario: As a user with app not used for 24 hrs when I open the door in away mode I should be able to switch to Night from Entry Delay but failed to close the door in entry delay waiting should be taken to alarm
   Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
    And user switches from "Home" to "Away"
    And user force closes the application
   And user lyric app screen is locked
     And timer ends on user device
     And user "door" access sensor "opened"
     Then user selects the "Door Opened" push notification
     #view the entry delay screen in landscape mode
     When user selects "Switch to Night" from "Entry delay" screen
    Then user should be displayed with "Lyric app locked" screen
    When user enters "Lyric Passcode" 
	 Then user should be displayed with the "Waiting to close" screen
	 When user "door" access sensor "is not closed"
      And user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
      
  
    @MotionViewer_AwayMode_SwitchingToHomeFromEntryDelay 			@P1 			@DAS_MotionViewer 		@--xrayid:ATER-55179			@Automated
    Scenario: As a user when motion detected after exit delay I should be able to switch to home from entry delay screen (check clip in activity log)
   Given user is set to "Away" mode through CHIL
    Given user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     When user "indoor motion viewer" detects "motion"
	 When user selects "Switch to Home" from "Entry delay" screen
	 Then user status should be set to "Home"
     And user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       | Indoor motion viewer clip|
       | Switched to Home by app |
      And user "closes" activity log
       Then user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "ISMV" status as "Standby" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
      
      @MotionViewer_AwayMode_SwitchingToNightFromEntryDelayThroughPushNotification 				@P2 		@--xrayid:ATER-55180			@DAS_MotionViewer 			@Automated
      Scenario: As a user when motion detected after exit delay I should be able to switch to night from entry delay screen  (check clip in activity log)
      Given user is set to "Away" mode through CHIL
     Given user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     When user "indoor motion viewer" detects "motion"
      When user selects the "ISMV motion detected" push notification
      #  Then user should be displayed with "Mobile locked" screen
      When user selects "Switch to Night" from "Entry delay" screen
   #  When user enters "Mobile Passcode" 
      When timer ends on user device
	 Then user status should be set to "Night"
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       | Indoor motion viewer clip|
       | Switched to Night by app |
       And user "closes" activity log
        Then user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "ISMV" status as "Standby" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
       
        
      
      @MotionViewer_OpenAfterAwayExitDelay_AttentionFromEntryDelay 				@P2 		@--xrayid:ATER-55181			@Automated 				@DAS_MotionViewer
      Scenario: As a user when ISMV motion is detected in Away mode and attention from entry delay screen is selected on seeing mischeif activity, system should trigger alarm   (check clip in alarm history)
      Given user is set to "Away" mode through CHIL
     Given user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     When user "indoor motion viewer" detects "motion"
     When user selects "Attention" from "Entry delay" screen
	  Then user should be displayed with the "Alarm" screen
     Then user receives a "Alarm" email
     When user selects "dismiss alarm" from "alarm" screen
     Then user receives a "Alarm cancelled" email
     Then user status should be set to "Home"
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       | Indoor motion viewer clip|
       | Switched to Home by app |
       
       
    @MotionViewer_OpenAfterAwayExitDelay_AlarmWhenNoActionOnEntryDelay 				@P1 		@--xrayid:ATER-55182					@Automated 				@DAS_MotionViewer
    Scenario: As a user when ISMV motion is detected in Away mode and no action taken from entry delay screen, system should alarm  
     Given user is set to "Away" mode through CHIL
     Given user launches and logs in to the Lyric application
     When user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
     When user "indoor motion viewer" detects "motion"
     When user selects "no options" from "Entry delay" screen
     Then user should be displayed with the "Alarm" screen
     When user selects "dismiss alarm" from "alarm" screen
     Then user status should be set to "Home"
     When user "opens" activity log
      Then verify the following activity log:
       | Elements                 | 
       | Indoor motion viewer clip|
       | Switched to Home by app |
     And user "closes" activity log
     
     
     @MotionViewerSensor_TamperDuringNightModeExitDelay 					@P4 			@--xrayid:ATER-55183				@DAS_MotionViewer 				@Automated
    Scenario: As a user when the Indoor MotionViewer is tampered in Night exit delay I should be notified with alarm
    Given user sets the entry/exit timer to "60" seconds
      And user is set to "Night" mode through CHIL
     And user launches and logs in to the Lyric application
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
       #And user minimizes the application
      #And user mobile screen is locked
     When user indoor motion viewer "Tampered"
     And user is set to "HOME" mode through CHIL
      When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
      Then user should see the "ISMV" status as "Cover Tampered" on the "Sensor Status"
   	  When user indoor motion viewer "Tamper Restored"
   	  Then user should see the "ISMV" status as "Standby" on the "Sensor Status"
   	  When user navigates to "Security Solution Card" screen from the "Sensor Status" screen
     Then user "opens" activity log
      And verify the following activity log:
       | Elements                 | 
       |Indoor motion viewer TAMPERED AT NIGHT MODE|
       |Indoor motion viewer TAMPER CLEARED AT NIGHT MODE|
       
      
     @MotionViewer_VideoClip 				@P2 		@--xrayid:ATER-91035			@NotAutomatable
     Scenario: As a user when motion detected after exit delay irrespective of exit timer , I should have clips generated for 30sec (landscape, download)
     Given user sets the entry/exit timer to <timerValue> seconds
      And user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
     When  user indoor motion viewer detected
     Then user should be displayed with intermediate screen on loading clip
      And user should be displayed with thumbnail with play icon
     When user plays clip
     Then user should be played with video for 30 seconds
      And user should be played with video of 5 seconds prealert
    
     
     @MotionViewerAlarm_Clipgenerated_Offline  				@P2 			@--xrayid:ATER-91036			@notAutomatablePanelOffline
    Scenario: As a user I should be able to view the clip generated in indoor motion viewer during panel offline
     Given user is set to "Away" mode through CHIL
     And user launches and logs in to the Lyric application
     And user clears all push notifications
     When  user indoor motion viewer detected
     Then view video clips generated on 'Alarm history' screen
     #only 1 video should be played
     When user selects "dismiss alarm" from keyfob
     And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Home"
     Then user should see the "sensor" status as "no issue" on the "Security Solution Card"
     When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
     Then user should see the "ISMV" status as "" on the "Sensor Status"
     And user navigates to "SECURITY SOLUTION CARD" screen from the "SENSOR STATUS" screen
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 | 
        | Motion detected IS motion viewer |
        | Alarm due to IS motion viewer |
       | Alarm Dismissed |
       | Switched to Home by Keyfob|
     And user "closes" activity log
     # verify alarm history events
     
     
    @ISMV_OSMV_MotionDetectedInAwayModeAtSameTime 						@P4			@--xrayid:ATER-91037			@NotAUseCase 					@NotAutomatable
    Scenario: As a user when motion detected by ISMV and OSMV after exit delay at same time then user should be able to shown ISMV name in entry delay screen
   # Trigger 2 ISMV or OSMV sensor, entry delay screen should show 1st sensor only till entry delay completes
      Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
      When user "ISMV sensor1" detects the "Motion"
       When user "ISMV sensor2" detects the "Motion"
      Then user should be displayed with the "Entry delay" screen
      And user should see the "ISMV sensor1" as "Title" on the Entry delay
      Given user is set to "Home" mode through CHIL
      
      
    @MotionDetectedInAwayMode_ByMotionSensorAndMotionViewer_AtSameTime 				@P4 		@--xrayid:ATER-91038				@NotAutomatable
    Scenario: As a user when motion detected by PIR and MV after exit delay at same time I should be able to switch to night from entry delay screen - waiting screen should not be displayed
    Given user is set to "Away" mode through CHIL
       And user launches and logs in to the Lyric application
       And user navigates to "Security Solution card" screen from the "Dashboard" screen
     And timer ends on user device
      When user "ISMV sensor" detects the "Motion"
       When user "motion sensor" detects the "Motion"
      Then user should be displayed with the "Entry delay" screen
      When user selects "Switch to Night" from "Entry delay" screen
      Then verify no waiting screen is displayed
      
       
      @AwayMode_MotiondetectedByOSMV_DoorOpened_MotiondetectedByMotionSensor_MotiondetectedByISMV_WindowOpened 		@--xrayid:ATER-55184			@P1 				@Automated
      Scenario: As a user when the MotionViewer is tampered in Night exit delay I should be notified with alarm
      Given user is set to "Away" mode through CHIL
      And user launches and logs in to the Lyric application
      And user clears all push notifications
       When user navigates to "Security Solution card" screen from the "Dashboard" screen
       And timer ends on user device
       When user "OSMV sensor" detects the "Motion"
       And user "door" access sensor "opened"
      Then user should be displayed with the "Entry delay" screen
        And user "motion sensor" detects "motion"
        When user "ISMV sensor" detects the "Motion"
      And user "window" access sensor "opened"
      Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      #And user navigates to "Security Solution card" screen from the "Dashboard" screen
       When user "opens" activity log
      Then verify the following activity log:
       | Elements                 |
       | Window opened at Away mode|
       | ISMV motion detected at Away mode|
       | Motion sensor detected motion at Away mode|
       | Door opened at Away mode|
       | OSMV motion detected at Away mode |
      
       
      @AwayMode_DoorOpened_MotiondetectedByISMV_MotiondetectedByMotionSensor_WindowOpened 	@--xrayid:ATER-55187			@P3					@Automated
       Scenario: As a user I should be able to know the activities taking place at location when system is in alarm
      Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      #And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
      Then user switches from "Home" to "Away"
      And timer ends on user device
      Then user status should be set to "Away"
       And user "door" access sensor "opened"
       Then user should be displayed with the "Entry Delay" screen
       When user "window" access sensor "opened"
       Then user motion sensor "motion detected"
       And user indoor motion viewer "motion detected"
       And user outdoor motion viewer "motion detected"
       And user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      Then user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user "opens" activity log
      Then verify the following activity log:
       | Elements                 				|
       | Window opened at Away mode				|
       | ISMV motion detected at Away mode		|
       | Sensor Motion Detected at Away mode		|
       | Door opened at Away mode				|
       | OSMV motion detected at Away mode 		|
       And user "closes" activity log
       
       
      @AwayMode_WindowOpened_MotiondetectedByISMV_MotiondetectedByMotionSensor_DoorOpened_MotiondetectedByOSMV 		@--xrayid:ATER-55188			@P3					@Automated
       Scenario: As a user I should be able to know the activities taking place at location when system is in alarm
      Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      #And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
      Then user switches from "Home" to "Away"
      And timer ends on user device
      Then user status should be set to "Away"
      When user "window" access sensor "opened"
       Then user should be displayed with the "Entry Delay" screen
       And user "door" access sensor "opened"
       Then user motion sensor "motion detected"
       And user indoor motion viewer "motion detected"
       And user outdoor motion viewer "motion detected"
       And user selects "Attention" from "Entry Delay" screen
      Then user should be displayed with the "Alarm" screen
      When user selects "dismiss alarm" from "alarm" screen
      Then user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user "opens" activity log
      Then verify the following activity log:
       | Elements                 				|
       | Window opened at Away mode				|
       | ISMV motion detected at Away mode		|
       | Sensor Motion Detected at Away mode		|
       | Door opened at Away mode				|
       | OSMV motion detected at Away mode 		|
       And user "closes" activity log
      
      @MultiDoorsensor_LeftOpenDuringAwayExitDelay_SwitchingToNightFromEntryDelay 				@P4 		@--xrayid:ATER-91039					@NotAutomatable
      Scenario: As a user when door1 and door2 sensor are opened in armed I should be able to switch to night from entry delay screen - waiting screen should be displayed to close the door1 and door2 sensors
      Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
      #And user clears all push notifications
      When user navigates to "Security Solution card" screen from the "Dashboard" screen
      And user switches from "Home" to "Away"
      And user "door1" access sensor "opened"
      And user "door2" access sensor "opened"
      And timer ends on user device
      And user selects "Switch to Night" from "Entry delay" screen
      Then user should be displayed with the "Waiting to close door1" screen
      And user "door1" access sensor "closed"
      Then user should be displayed with the "Waiting to close door2" screen
      And user "door2" access sensor "closed"
      And timer ends on user device
      And user navigates to "Security Solution card" screen from the "Dashboard" screen
     Then user status should be set to "Night"
     When user "opens" activity log
     Then verify the following activity log:
       | Elements                 |
       | Door1 Opened at Away mode|
       | Door2 Opened at Away mode|
       | Door1 Closed at Away mode|
       | Door2 Closed at Away mode|
       | Switched to Night by app |