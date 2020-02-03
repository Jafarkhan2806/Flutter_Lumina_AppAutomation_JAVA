@MotionSensorSettings
Feature: Verify Motion Sensor settings


Background:
Given reset relay as precondition

#Requirement :One DAS Panel and one motion sensor should be configured
@DASMotionSensorSettings-Precondition @UIAutomated
Scenario Outline: a - As a user I should be able to successfully enroll motion Sensor with default sensor name and video should play for assistance in sensor enrollment
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "Motion sensor SETUP button" from "Set Up Accessories" screen
#Then user should be displayed with the "Sensor Overview" Screen
#When user selects "Watch The How To video" from "Sensor Overview" screen
#Then user should be displayed with the "Video clip" screen
#When user navigates to "Sensor Overview" screen from the "Video clip" screen
#When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Sensor Location Area> from "Mount Sensor" screen
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor" screen
Then user should see the <Sensor Location> status as "Motion NOT Detected" on the "Test Access Sensor"
When user "SENSOR" detects "MOTION"
Then user should see the <Sensor Location> status as "Motion Detected" on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "Good" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "Good" on the "Sensor Status"
Examples:
|Mode|Sensor Location| Sensor Location Area|
|Home | Living Room | In a Wall Corner|

@DAS_MotionSensorStatusVerification  @UIAutomated
  Scenario: b- As a user I want to view that all motion sensor settings 
    Given user launches and logs in to the Lyric application 
     When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
     Then user should be displayed with the following "Sensor Settings" options:
      | Settings                   |
      | Name                       | 
      |Status 	                   | 
      | Battery                    | 
      | Signal Strength and Test   |
      | Model and Firmware Details |
      | DELETE                     |
      
#Requirement :One DAS Panel and one motion sensor should be configured
@DAS_MotionSensorRenameVerification @UIAutomated
Scenario Outline: c- As a user I want to rename my motion sensor through the application
And user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application 
 When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
When user edits the "motion sensor" name to "new name"
#And user reverts back the "Access Sensor" Sensor name through CHIL
Examples:
|Mode|
|Home|
#|OFF|


#Requirement :One DAS Panel and one motion sensor should be configured
@DAS_MotionSensorRenamePopUpVerification @UIAutomated
Scenario Outline: d- AS a user I want to rename my motion sensor sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
Then the following "sensor settings" options should be disabled:
|Options|
|Name field|
#Then user should display the "you can perform this action only in Home or Off mode" pop up 
Examples:
|Mode|
|Night|
#|Away|


#Requirement :One DAS Panel and one motion Sensor should be configured
@DAS_MotionSensorSignalStrengthAndTestVerificationWithAwayNightOffline @UIAutomated
Scenario Outline: e- As a user I want to Verify Motion Sensor SignalStrengthAndTest in Away, Night and offline mode
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application 
When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
Then the following "sensor settings" options should be disabled:
|Options|
|Signal strength and test|
#Then user should display the "you can perform this action only in Home or Off mode" pop up 
Examples:
|Mode|
|Away|
#|Night| 

#Requirement :One DAS Panel and one motion sensor should be configured
@DAS_DeleteMotionSensorPopupVerification @UIAutomated 
Scenario Outline: f- As a user I should not be able to delete motion Sensor configured to my DAS panel when system is in armed state 
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL 
When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
#Then user should be displayed the "you can perform this action only in Home or Off mode" pop up 
Then the following "sensor settings" options should be disabled:
|Options|
|Delete|
Examples:
|Mode|
|Night|
#|Away|

#Requirement :One DAS Panel and one motion sensor should be configured and motion sensor status cover tampered status
@DASmotionSensorStatusCoverTamperedVerificationAwayNightoff
Scenario Outline: g - AS a user I want to Verify motion sensor Cover Taper status When base station status in OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
And user motion sensor "tampered"
Then user navigates to "Motion Sensor settings" screen from the "Dashboard" screen
When user selects "Sensor Cover Tampered" from "Motion Sensor settings" screen
Then user should be displayed with the "Sensor Cover Tamper" screen
And user selects "Clear Tamper" from "Sensor Cover Tamper" screen
Then user should receive a "perform only in Home mode" popup 
Examples:
|Mode|
|OFF|

#Requirement :One DAS Panel and one motion sensor should be configured
@DAS_MotionSensorStatusOFFVerificationWithAwayMode @UIAutomated
Scenario Outline: h- AS a user I want to Verify Motion Sensor status OFF 
And user is set to "Home" mode through CHIL
And user motion sensor "tampered"
Given user launches and logs in to the Lyric application 
And user navigates to "Security Solution card" screen from the "Dashboard" screen 
When user switches from "Home" to <Mode>
Then user should receive a <Switch to Mode> popup
When user "accepts" the <Switch to Mode> popup
Then user navigates to "Motion sensor settings" screen from the "Security Solution card" screen
Then user should see the "motion sensor" status as <Sensor status> on the "Motion Sensor Settings"
Then user navigates to "Motion Sensor OFF" screen from the "Motion sensor settings" screen
And user navigates to "Security Solution card" screen from the "Motion Sensor Settings" screen 
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "motion sensor" status as "off" on the "Sensor Status"
Examples:
|Mode|Switch to Mode | Sensor status|
|Away|Switch to Away |Off|

#Requirement :One DAS Panel and one Access Sensor should be configured
@DAS_MotionSensorSignalStrengthAndTestVerification @UIAutomated
Scenario Outline: i- As a user I want to Verify Access Sensor SignalStrengthAndTest in Home or OFF mode and assistance link
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard" screen
When user selects "Signal Strength and Test" from "Motion Sensor settings" screen
Then user should be displayed with the "Test Motion Sensor" screen
Then user should see the "motion sensor" status as <Motion Status> on the "TEST MOTION SENSOR"
When user selects "Sensor Not Working" from "Test Motion Sensor" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the "motion sensor" status as <Signal strength> on the "Signal Strength"
Then user navigates to "Test Motion Sensor" screen from the "Motion Sensor Help" screen
Then user should see the "motion sensor" status as <Motion Status Update> on the "Test MOTION Sensor"
Examples:
|Mode | Signal strength |Motion Status | Motion Status Update |
|Home | High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Medium |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Low |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Medium |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Low |NO MOTION DETECTED |MOTION DETECTED |


#Requirement :One DAS Panel and one Access Sensor should be configured and Access Sensor status cover tampered status
@DAS_MotionSensorStatusCoverTamperedVerificationHome @UIAutomated
Scenario Outline: j- AS a user I want to Verify Motion Sensor Cover Tamper and Tamper restored status When base station status in Home and OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
And user motion sensor "tampered"
Then user navigates to "Motion Sensor settings" screen from the "Dashboard" screen
When user selects "Sensor Cover Tampered" from "Motion Sensor settings" screen
Then user should be displayed with the "Sensor Cover Tamper" screen
And user selects "Clear Tamper" from "Sensor Cover Tamper" screen
Then user should receive a "Sensor Tamper" popup 
When user "OK" the "Sensor Tamper" popup 
Then user should be displayed with the "Sensor Cover Tamper" screen
When user selects "Clear Tamper" from "Sensor Cover Tamper" screen
And user should receive a "Sensor Tamper" popup 
When user "RETRY" the "Sensor Tamper" popup
And user motion sensor "tamper cleared"
When user "RETRY" the "Sensor Tamper" popup
And user should see the "Motion sensor" status as <Status> on the "Motion sensor Settings"
Examples:
|Mode| State | Status |
|Home| Good |Good |
#|Home| Opened | Open |




#Requirement :One DAS Panel and one motion sensor should be configured
@DASDeleteMotionSensorVerification @UIAutomated
Scenario Outline: l -As a user I should be able to delete motion sensor configured to my DAS panel from my account through the Lyric application 
Given user launches and logs in to the Lyric application
When user navigates to "Motion Sensor Settings" screen from the "DASHBOARD" screen
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "Motion sensor" device on the "sensor list" screen
Examples:
|Mode|
|Home|
#|OFF|

#Requirement :One DAS Panel and one motion sensor should be configured
@DAS_MotionSensorModelAndFirmwareDetailsVerification @UIAutomated
Scenario Outline: k- Verify Model details and Firmware details in Motion Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard" screen
When user selects "Model and Firmware Details" from "Door Access settings" screen
Then user should be displayed with the "Model and Firmware Details" screen
Examples:
|Mode|
|Home|
#|Away|
#|Night|
#|OFF|
#|OFFLINE|

#Requirement :One DAS Panel and one motion sensor Sensor should be configured and motion sensor status cover tampered status
@DASmotionSensorStatusCoverTamperedVerificationHomeawaynightoff @NotAutomatable
Scenario Outline:AS a user I want to Verify motion sensor Cover Taper status When base station status in Away, Night, OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
#Access Sensor back plate not closed
And user set to "Sensor" "Offline"
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
Then user should not display "Cleared Tampered" option 
Examples:
|Mode|
|Home|
|Away|
|Night|
|OFF|

#Requirement :One DAS Panel and one motion sensor should be configured and motion sensor status cover tampered status
@DASmotionSensorStatusCoverTamperedVerificationOffline @NotAutomatable
Scenario Outline:AS a user I want to Verify motion sensor Cover Taper status When base station status in offline
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
#motion sensor back plate not closed
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user selects "Status Covered Tampered" 
Then user should navigates to "motion sensor Cover tampered" screen
And user should not display the "Cover Tampered" button
When user selects the "BACK" button 
Then user should be displayed with "Motion Sensor settings" screen
Examples:
|Mode|
|Offline|

#Requirement :One DAS Panel and one motion sensor should be configured
@DASmotionSensorBatteryStatusVerificationWithHomeAwayNightOffOfflineMode @NotAutomatable
Scenario Outline:AS a user I want to Verify motion sensor Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
And user should display the Battery status <Battery Status>
Examples:
|Mode| Battery Status |
|Home| Good |
|Home| OFFLINE|
|Home| Low|
|Home| OFF |
|Night| Good |
|Night| OFFLINE |
|Night| Low|
|Away| OFF |
|Away| Good |
|Away| OFFLINE |
|Away| Low|
|Away| OFF |

#Requirement :One DAS Panel and one motion sensor should be configured and battery status should be in Low and OFFLINE
@DASmotionSensorBatteryLowofflineStatusLowHelpScreenVerification @NotAutomatable
Scenario Outline: AS a user I want to Verify motion sensor Low and Offline Battery Help screen
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user selects the "Battery status" button
Then user should be displayed with "Low_Offline Battery Help" Screen
When user selects "BACK" button
Then user should be displayed with "Motion Sensor settings" screen
Examples:
|Mode|
|Home|
|Away|
|Night|
|OFF|
|OFFLINE|

#Requirement :One DAS Panel and one motion sensor should be configured
@DASmotionSensorBatteryStatusWhenSensorstatusOfflineVerification @NotAutomatable
Scenario Outline:AS a user I want to Verify motion sensor Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
And user should display the Battery status as empty
Examples:
|Mode| 
|Home|
|Night|
|Away|




@DASMotionSensorEnrollmentWithSensorNotWorkingAndIsOutOfRange @NotAutomatable
Scenario Outline: As a user I should be able to verify motion sensor not working functionality when sensor is out of range in Home and OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should be displayed with "Test motion sensor" screen
When user selects "Viewer Not Working?" from "Test motion sensor" screen
Then user should be displayed with the "Motion Sensor Help" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with "Signal Strength" screen 
Then user should receive a "Out Of Range" popup
And user "taps on RETRY in" the "Out Of Range" popup
Then user should receive a "Out Of Range" pop up
And user "taps on OK in" the "Out Of Range" popup
Then user should be displayed with the "Motion Sensor Help" screen
And user navigates to "Test motion sensor" screen from the "Test Signal Strength" screen
Examples:
|Mode|
|Home|
|OFF|




#Requirement :One DAS Panel and one motion sensor should be configured
@DASMotionSensorSignalStrengthRangeTestVerificationSensorOffline @NotAutomatable
Scenario Outline: As a user I want to verify motion sensor signal Strength and Test in Offline, Away and Night mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should display the "Sensor is Offline" pop up 
Examples:
|Mode|
|Night|
|Away|
|OFF|




#Requirement :One DAS Panel and one motion sensor should be configured
@DASDeleteMotionSensorErrorpopupVerification @NotAutomatable
Scenario Outline: As a user I should be able to verify delete error pop up from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL 
When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
And user "deletes motion sensor" by clicking on "delete" button
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should be displayed with "Unable to delete sensor" pop up 
When user selects the "OK" button
Then user display with "Motion Sensor settings" screen
Then user should be displayed with "motion sensor" on the "sensors" screen
Examples:
|Mode|
|Home|
|OFF|





###########NOT AUTOMATABLE###########
#Requirement :One DAS Panel and one motion sensor should be configured and motion sensor sensor should be in offline
@DASmotionSensorStatusVerificationoffline
  Scenario: As a user I want to view that all motion sensor settings 
    Given user launches and logs in to the Lyric application 
     When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
     Then user should be displayed with the following <Settings> options: 
      | Settings           |
	#Disabled
      | Name               |  
      | Status 		   |
      | Battery            | 
      | Signal Strength and Test |
	#Enabled
      | Model and Firmware Details |
      | DELETE|
      
#Requirement :One DAS Panel and two motion sensor should be configured
@DASKeyFobDuplicatenameVerification
Scenario Outline: AS a user I want to verify duplicate name my motion sensor sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user edits the "motion" for first motion sensor
Then user edits the "motion1" for second motion sensor
And user navigates to "Sensors" screen from the "Motion Sensor settings" screen
Then user should receive "Sensor Name Already Assigned, Pleases Pleases give different name" pop up 
And user should not displayed with "motion1" name for second motion sensor
Examples:
|Mode|
|Home|
|OFF|

#Requirement :One DAS Panel and one motion sensor should be configured
@DASmotionSensorSensorStatusVerificationWithHomeAwayNightOffMode
Scenario Outline:AS a user I want to Verify motion sensor Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "MOTION SENSOR SETTINGS" screen from the "Dashboard" screen
Then user should see the "motion sensor" status as <Sensor Status> on the "MOTION SENSOR SETTINGS"
Examples:
|Mode| Sensor Status |
|Home| Good |
|Home| medium |
|Home| Low|
|Home| OFF |
|Home| Low battery |
|Home| Cover Tampered|
|Night| Good |
|Night| medium |
|Night| Low|
|Night | Cover Tampered|
|OFF| Good |
|OFF| medium |
|OFF| Low|
|OFF|OFF |
|OFF |Cover Tampered|
