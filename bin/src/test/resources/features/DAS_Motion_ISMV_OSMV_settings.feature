@MotionSensorSettings
Feature: Verify Motion Viewer settings

#Requirement :One DAS Panel and one OSMV should be configured
@DASMotionViewerEnrollmentWithDefaultSensorNameWatchHow-ToVideo
Scenario Outline: As a user I should be able to successfully enroll Access Sensor with default sensor name and video should play for assistance in sensor enrollment
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "SETUP button" from "Set Up Accessories" screen
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

@DASOSMVStatusVerification 
  Scenario: As a user I want to view that all OSMV settings 
    Given user launches and logs in to the Lyric application 
     When user navigates to "Motion SENSOR settings" screen from the "Dashboard" screen 
     Then user should be displayed with the following "sensor Settings" options: 
      | Settings           |
      | Name               |  
      | Battery            | 
      | Signal Strength and Test |
      | Model and Firmware Details |
	  | DELETE|

#Requirement :One DAS Panel and one OSMV should be configured and OSMV sensor should be in offline
@DASOSMVStatusVerificationoffline
  Scenario: As a user I want to view that all OSMV settings 
    Given user launches and logs in to the Lyric application 
     When user navigates to "Motion Viewer settings" screen from the "Dashboard" screen 
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


#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVRenameVerification 
Scenario Outline:AS a user I want to rename my OSMV sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion sensor settings" screen from the "Dashboard"
When user edits the "Motion sensor" name to "New Name"
Then user navigates to "Base station configuration" screen from the "Motion Sensor settings" screen
And user navigates to "Motion sensor settings" screen from the "Base station configuration" screen
Then user should be displayed with "New Name" device on the "Sensor" screen
#And user reverts back the "sensor name" through CHIL
Examples:
|Mode|
|Home|
|OFF|

#Requirement :One DAS Panel and two OSMV should be configured
@DASKeyFobDuplicatenameVerification
Scenario Outline:AS a user I want to verify duplicate name my OSMV sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user edits the "motion" for first OSMV
Then user edits the "motion1" for second OSMV
And user navigates to "Sensors" screen from the "Motion viewer settings" screen
Then user should receive "Sensor Name Already Assigned, Pleases Pleases give different name" pop up 
And user should not displayed with "motion1" name for second osmv
Examples:
|Mode|
|Home|
|OFF|

#Requirement :O ne DAS Panel and one OSMV should be configured
@DASOSMVRenamePopUpVerification 
Scenario Outline:AS a user I want to rename my OSMV sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "Motion sensor settings" screen from the "Dashboard"
When user selects "Name Text Field" from "Motion sensor settings" screen
#Then user should display the "you can perform this action only in Home or Off mode" pop up
Then the following "sensor settings" options should be disabled:
|Options|
|Name field|  
Examples:
|Mode|
|Night|
|Away|
|Offline|


#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVSensorStatusVerificationWithHomeAwayNightOffMode
Scenario Outline:AS a user I want to Verify OSMV Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "Motion sensor settings" screen from the "Dashboard"
Then user should see the "motion sensor" status as <Sensor Status> on the "MOTION SENSOR SETTINGS"
Examples:
|Mode| Sensor Status |
|Home| Good |
|Away| OFF |
|Home| Cover Tampered|
|Night| Good |
|Night | Cover Tampered|
|OFF| Good |
|OFF |Cover Tampered|

#Requirement:One DAS Panel and one OSMV should be configured
@DASOSMVSensorStatusOFFVerificationWithHomeAwayNightOffMode
Scenario Outline:AS a user I want to Verify OSMV Battery status OFF 
Given user launches and logs in to the Lyric application 
#And user is set to <Mode> mode through CHIL
#And user is set to "sensor status" as "OFF"
Then user navigates to "Motion sensor settings" screen from the "Dashboard"
Then user should see the "motion sensor" status as "off" on the "Motion sensor settings"
When user selects "Off Status" from "Motion sensor settings" screen
Then user should be displayed with the "Sensor Off" screen
Examples:
|Mode | 
|Away |


#Requirement:One DAS Panel and one OSMV should be configured and OSMV status cover tampered status
@DASOSMVStatusCoverTamperedVerificationHome
Scenario Outline:AS a user I want to Verify OSMV Cover Tamper and Tamper restored status When base station status in Home and OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
#OSMV back plate not closed
Then user navigates to "sensor settings" screen from the "Dashboard" screen
When user selects "Status Covered Tampered" from "Motion sensor settings" screen
Then user should be displayed with "sensor Cover Tamper" screen
And User selects the "Clear Tamper" from "sensor Cover Tamper" screen
#OSMV back plate not closed
Then user sholud receive a "Sensor Tamper" popup 
When "ok" the "sensor tamper" popup
Then user should displayed with "sensor Cover Tamper" screen
And User selects the "Clear Tamper" option 
Then user sholud receive a "Sensor Tamper" popup 
When "retry" the "sensor tamper" popup
#OSMV back plate not closed
Then user should displayed with "sensor Cover Tamper"" screen
And User selects the "Clear Tamper" from "sensor Cover Tamper" screen
Then user should receive a "Sensor Tamper" popup 
#OSMV back plate closed
When "retry" the "sensor tamper" popup
And user should see the "motion sensor" status as <Status update> on "sensor status"
Examples:
|Mode| Status update |
|Home| Good |
|Home| Medium |
|Home| Low|


#Requirement:One DAS Panel and one OSMV should be configured and OSMV status cover tampered status
@DASOSMVStatusCoverTamperedVerificationAwayNightoff
Scenario Outline:AS a user I want to Verify OSMV Cover Taper status When base station status in Away, Night, OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
#OSMV back plate not closed
Then user navigates to "Motion Sensor settings" screen from the "Dashboard"
When user selects "SENSOR COVER TAMPERED" from "Motion Sensor settings" screen
#Then user should display the "you can perform this action only in Home mode" pop up
Then the following "sensor settings" options should be disabled:
|Options|
|COVER TAMPERED|
Examples:
|Mode|
|Night|
|Away|
|OFF|

#Requirement :One DAS Panel and one OSMV Sensor should be configured and OSMV status cover tampered status
@DASOSMVStatusCoverTamperedVerificationHomeawaynightoff
Scenario Outline:AS a user I want to Verify OSMV Cover Taper status When base station status in Away, Night, OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
#Access Sensor back plate not closed
And user set to "Sensor" "Offline"
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
Then user should not display "Cleared Tampered" option 
Examples:
|Mode|
|Home|
|Away|
|Night|
|OFF|

#Requirement :One DAS Panel and one OSMV should be configured and OSMV status cover tampered status
@DASOSMVStatusCoverTamperedVerificationOffline
Scenario Outline:AS a user I want to Verify OSMV Cover Taper status When base station status in offline
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
#OSMV back plate not closed
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects "Status Covered Tampered" 
Then user should navigates to "OSMV Cover tampered" screen
And user should not display the "Cover Tampered" button
When user selects the "BACK" button 
Then user should be displayed with "Motion Viewer settings" screen
Examples:
|Mode|
|Offline|

#Requirement:One DAS Panel and one OSMV should be configured
@DASOSMVBatteryStatusVerificationWithHomeAwayNightOffOfflineMode
Scenario Outline:AS a user I want to Verify OSMV Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "Motion sensor settings" screen from the "Dashboard" screen
And user should see the "Battery" status as <Battery status> on the "Motion sensor setting"
Examples:
|Mode| Battery Status |
|Home| Good |
|Home| OFFLINE|
#|Home| Low|
|Home| OFF |
|Night| Good |
|Night| OFFLINE |
#|Night| Low|
|Away| OFF |
|Away| Good |
|Away| OFFLINE |
#|Away| Low|

#Requirement :One DAS Panel and one OSMV should be configured and battery status should be in Low and OFFLINE
@DASOSMVBatteryLowofflineStatusLowHelpScreenVerification
Scenario Outline: AS a user I want to Verify OSMV Low and Offline Battery Help screen
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Battery status" button
Then user should be displayed with "Low_Offline Battery Help" Screen
When user selects "BACK" button
Then user should be displayed with "Motion Viewer settings" screen
Examples:
|Mode|
|Home|
|Away|
|Night|
|OFF|
|OFFLINE|

#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVBatteryStatusWhenSensorstatusOfflineVerification
Scenario Outline:AS a user I want to Verify OSMV Battery status
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
And user should display the Battery status as empty
Examples:
|Mode| 
|Home|
|Night|
|Away|



#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVSignalStrengthAndTestVerification 
Scenario Outline: As a user I want to Verify OSMV SignalStrengthAndTest in Home or OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should be displayed with "Test OSMV" screen
When user selects "Viewer Not Working?" from "Test OSMV" screen
Then user should be displayed with the "Motion Sensor Help" screen
And user should be displayed with "Get Additional Help" link
When user select the "Get Additional Help" link
Then user should navigates to "Honeywell help web portal" on goole chrome
And user navigates to "Access Sensor Help" screen from "Honeywell Help web portal" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with "Signal Strength" screen
Then user should be displayed with <Signal strength> status
And user navigates to "Motion Sensor Help" screen from "Test Signal Strength" screen
Then user navigates to "Test OSMV" screen from "Motion Sensor Help" screen
Then user <Viewer Location> <Motion Status>
Then user <Viewer Location> <Motion Status Update>
Then user navigates to "Motion Viewer Settings" screen from the "Test OSMV" screen
And user should displayed with <Motion status Update>
Examples:
|Mode | Signal strength |Motion Status | Motion Status Update |
|Home | High |NO MOTION DETECTED |MOTION DETECTED |
|Home | Medium |NO MOTION DETECTED |MOTION DETECTED |
|Home | Low |NO MOTION DETECTED |MOTION DETECTED |
|OFF | High |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Medium |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Low |NO MOTION DETECTED |MOTION DETECTED |




@DASOSMVEnrollmentWithSensorNotWorkingAndIsOutOfRange
Scenario Outline: As a user I should be able to verify OSMV not working functionality when sensor is out of range in Home and OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should be displayed with "Test OSMV" screen
When user selects "Viewer Not Working?" from "Test OSMV" screen
Then user should be displayed with the "Motion Sensor Help" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with "Signal Strength" screen 
Then user should receive a "Out Of Range" popup
And user "taps on RETRY in" the "Out Of Range" popup
Then user should receive a "Out Of Range" pop up
And user "taps on OK in" the "Out Of Range" popup
Then user should be displayed with the "Motion Sensor Help" screen
And user navigates to "Test OSMV" screen from the "Test Signal Strength" screen
Examples:
|Mode|
|Home|
|OFF|


#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVSignalStrengthAndTestVerificationWithAwayNightOffline
Scenario Outline: As a user I want to Verify OSMV SignalStrengthAndTest in Away, Night and offline mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should display the "you can perform this action only in Home or Off mode" pop up 
Examples:
|Mode|
|Away|
|Night|
|Offline|


#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVSignalStrengthRangeTestVerificationOFFLINEAwayNight
Scenario Outline: As a user I want to verify OSMV signal Strength and Test in Offline, Away and Night mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should display the "you can perform this action only in Home or Off mode" pop up 
Examples:
|Mode|
|Night|
|Away|
|OFF|
 
#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVSignalStrengthRangeTestVerificationSensorOffline
Scenario Outline: As a user I want to verify OSMV signal Strength and Test in Offline, Away and Night mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Motion Viewer settings" screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should display the "Sensor is Offline" pop up 
Examples:
|Mode|
|Night|
|Away|
|OFF|

#Requirement :One DAS Panel and one OSMV should be configured
@DASOSMVModelAndFirmwareDetailsVerification 
Scenario Outline: Verify Model details and Firmware details in OSMV
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Model and Firmware Details" screen from the "Sensor Settings" screen
Then user should be displayed with the "Model Details" and "Firmware Details"  of the OSMV
And user selects "Back" button
Then user should navigates to "Motion Sensor" screen
Examples:
|Mode|
|Home|
|Away|
|Night|
|OFF|
|OFFLINE|

#Requirement :One DAS Panel and one OSMV should be configured
@DASDeleteOSMVVerification
Scenario Outline: As a user I should be able to delete OSMV configured to my DAS panel from my account through the Lyric application 
Given user launches and logs in to the Lyric application
When user navigates to "Motion Sensor Settings" screen from the "Security Solution card" screen
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen
And user is set to <Mode> through CHIL 
When user navigates to "Motion Viewer settings" screen from the "Dashboard" screen 
And user "deletes OSMV" by clicking on "delete" button
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "OSMV" on the "sensors" screen
Then user navigates to "Base Station Configuration" screen from the "Sensor" screen
#Only for OSMV
And user should not  displayed with the "Aware and Deter" and "Outdoor Motion Viewers On in Home Mode" options
Examples:
|Mode|
|Home|
|OFF|


#Requirement :One DAS Panel and one OSMV should be configured
@DASDeleteOSMVErrorpopupVerification
Scenario Outline: As a user I should be able to verify delete error pop up from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL 
When user navigates to "Motion Viewer settings" screen from the "Dashboard" screen 
And user "deletes OSMV" by clicking on "delete" button
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should be displayed with "Unable to delete sensor" pop up 
When user selects the "OK" button
Then user display with "Motion Viewer settings" screen
Then user should be displayed with "OSMV" on the "sensors" screen
Examples:
|Mode|
|Home|
|OFF|


#Requirement :One DAS Panel and one OSMV should be configured
@DASDeleteOSMVPopupVerification @UIAutomated 
Scenario Outline: As a user I should be able to delete OSMV configured to my DAS panel from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL 
When user navigates to "Motion Viewer settings" screen from the "Dashboard" screen 
And user "deletes OSMV" by clicking on "delete" button
And user "deletes sensor" by clicking on "delete" button
Then user should be displayed the "you can perform this action only in Home or Off mode" pop up 
Examples:
|Mode|
|Night|
|Away|
|Offline|



