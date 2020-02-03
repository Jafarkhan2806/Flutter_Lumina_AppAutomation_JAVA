@DAS_Sensor
Feature: DAS Sensor
As a user I want to check the manage and view the status of security accessories

Background:
Given reset relay as precondition

@DASSecuritySettingsSensorStatus			@P2			@Automated  @--xrayid:ATER-54677
Scenario Outline: As a user i should be displayed with security accessories in Security Settings 
#DAS with sensors Door Contact Window Contact ISMV OSMV Motion Sensor 2 Keyfob
Given user is set to "Home" mode through CHIL
When user launches and logs in to the Lyric application
And user navigates to "Security Settings" screen from the "Dashboard" screen
Then user should see <Key Fob Devices> with count as <Key Fob Devices Count> and <Without Issues>
And user should see <Sensor Devices> with count as <Sensor Devices Count> and <Without Issues>
#When user is set <Sensors> to <Sensor status>
When user "Door" access sensor <Door Access Sensor Status>
And user "Window" access sensor <Window Access Sensor Status>
And user motion sensor <Motion Sensor Status>
And user indoor motion viewer <ISMV Status>
And user outdoor motion viewer <OSMV Status>
Then user should see <Key Fob Devices> with count as <Key Fob Devices Count> and <Without Issues>
And user should see <Sensor Devices> with count as <Sensor Devices Count> and <Issues Count>

Examples:
| Key Fob Devices	| Key Fob Devices Count	| Sensor Devices	| Sensor Devices Count	| Without Issues	| Issues Count	| Door Access Sensor Status	| Window Access Sensor Status	| Motion Sensor Status	| ISMV Status	| OSMV Status	|
| Key Fob			| 1						| Sensors		| 5						| No issues		| 4				| Opened						| Tampered						| Cover Tampered			| Low Battery	| Offline		|


#Requirement :One DAS Panel and one Door Sensor should be configured
@DASDoorSensorRenameVerification				@P2	 		@Automated @--xrayid:ATER-54678
Scenario Outline: As a user I want to rename my Door Sensor through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "45" seconds
When user launches and logs in to the Lyric application
Then user navigates to "Door Access Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
When user "Door" access sensor <Sensor status>
Then user edits the "Access Sensor" name to "new name"
#And user reverts back the "Access Sensor" Sensor name through CHIL

Examples:
| Mode				| Sensor status		|
| Home				| Cover Tampered		|
| Home				| Open				|
#| Home				| Low battery		|
| Off 				| Cover Tampered		|
| Off				| Open				|
#| Off				| Low battery		|
#| Sensor Enrollment	| Cover Tampered		|
#| Sensor Enrollment	| Open				|
#| Sensor Enrollment	| Low battery		|


#Requirement :One DAS Panel and one Access Sensor should be configured
@DASWindowSensorRenameVerification			@P2	 		@Automated @--xrayid:ATER-54678
Scenario Outline: As a user I want to rename my Window Sensor sensor through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "45" seconds
When user launches and logs in to the Lyric application
Then user navigates to "Window Access Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
When user "Window" access sensor <Sensor status>
Then user edits the "Window Sensor" name to "new name"
#And user reverts back the "Access Sensor" Sensor name through CHIL

Examples:
| Mode				| Sensor status		|
| Home				| Cover Tampered		|
| Home				| Open				|
#| Home				| Low battery		|
| Off 				| Cover Tampered		|
| Off				| Open				|
#| Off				| Low battery		|
#| Sensor Enrollment	| Cover Tampered		|
#| Sensor Enrollment	| Open				|
#| Sensor Enrollment	| Low battery		|


#Requirement :One DAS Panel and one Motion Sensor should be configured
@DASMotionRenameVerification			@P2	 		@Automated @--xrayid:ATER-54679
Scenario Outline: As a user I want to rename my Motion Sensor through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
Then user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
When user motion sensor <Sensor status>
Then user edits the "Motion Sensor" name to "new name"
#And user reverts back the "Motion Sensor" Sensor name through CHIL

Examples:
| Mode				| Sensor status		|
| Home				| Cover Tampered		|
| Home				| Open				|
| Home				| Low battery		|
| Off 				| Cover Tampered		|
| Off				| Open				|
| Off				| Low battery		|
| Sensor Enrollment	| Cover Tampered		|
| Sensor Enrollment	| Open				|
| Sensor Enrollment	| Low battery		|


#Requirement :One DAS Panel and one ISMV Sensor should be configured
@DASKeyfobRenameVerification			@P2			@Automated @--xrayid:ATER-54684
Scenario Outline: As a user I want to rename my keyfob through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
Then user navigates to "Keyfob Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
Then user edits the "KeyFob" name to "new name"
Then user should be displayed with "KeyFob" device on the "Keyfob list" screen
And user reverts back the "KeyFob name" through CHIL

Examples:
| Mode				|
| Home				|
| Off 				|
| Sensor Enrollment 	|


#Requirement :One DAS Panel and one ISMV Sensor should be configured
@DASISMVSensorRenameVerification			@P2	 		@Automated @--xrayid:ATER-54711
Scenario Outline: As a user I want to rename my ISMV through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
Then user navigates to "ISMV Sensor Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
When user indoor motion viewer <Sensor status>
Then user edits the "ISMV" name to "new name"
#And user reverts back the "Motion Sensor" Sensor name through CHIL

Examples:
| Mode				| Sensor status		|
| Home				| Open				|
| Home				| Low battery		|
| Off				| Open				|
| Off				| Low battery		|
| Sensor Enrollment	| Open				|
| Sensor Enrollment	| Low battery		|


#Requirement :One DAS Panel and one ISMV Sensor should be configured
@DASOSMVSensorRenameVerification			@P2	 		@Automated @--xrayid:ATER-54712
Scenario Outline: As a user I want to rename my OSMV through the application
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
Then user navigates to "OSMV Sensor Settings" screen from the "Dashboard" screen
#And user is set to <Sensor status>
When user outdoor motion viewer <Sensor status>
Then user edits the "OSMV" name to "new name"
#And user reverts back the "Motion Sensor" Sensor name through CHIL

Examples:
| Mode				| Sensor status		|
| Home				| Open				|
| Home				| Low battery		|
| Off				| Open				|
| Off				| Low battery		|
| Sensor Enrollment	| Open				|
| Sensor Enrollment	| Low battery		|


#Requirement :One DAS Panel and one Access Sensor should be configured
@DASSensorRenamePopUpVerification		@P2			@Automated @--xrayid:ATER-54715
Scenario Outline: As a user i should be shown with message that I cannot rename my Access Sensor sensor through the application when panel is in below states 
Given user is set to <Mode> mode through CHIL
And timer lapse "45" seconds
When user launches and logs in to the Lyric application
When user navigates to <Sensor Settings> screen from the "Dashboard" screen 
Then the following <Sensor Settings> options should be disabled:
| Options		|
| Name field		|
#Then user should display the "you can perform this action only in Home or Off mode" pop up 

Examples:
| Sensor Settings		| Mode		|
| Door Access Settings	| Night		|
| Window Access Settings	| Away		|
| Motion Sensor Settings	| Away	|
| ISMV Sensor Settings  	| Night		|
| OSMV Sensor Settings  	| Night		|


#Requirement :One DAS Panel and one Key fob should be configured
@DASKeyfobRenamePopUpVerification		@P2			@Automated @--xrayid:ATER-54716
Scenario Outline: As a user i should be shown with message that I cannot rename my keyfob through the application when panel is in below states 
Given user is set to <Mode> mode through CHIL
And timer lapse "45" seconds
When user launches and logs in to the Lyric application
Then user navigates to "Keyfob Settings" screen from the "Dashboard" screen
Then the following "KeyFob Settings" options should be disabled:
| Options		|
| Name field		|
#Then user should display the "you can perform this action only in Home or Off mode" pop up

Examples:
| Mode		|
| Night		|
| Away		|
#| Alarm		|


#Requirement :One DAS Panel and all sensor type should be configured
@DASSensorStatusOFFWithAwayMode			@P2			@Automated	@--xrayid:ATER-54719
Scenario Outline: As a user I want to switch to different states in my DAS device when multiple sensors are in fault condition in Away mode
Given user sets the entry/exit timer to "45" seconds
And user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
And user navigates to "Security Solution Card" screen from the "Dashboard" screen
#And user "Cover Tampered" the Door sensor
#And user "Cover Tampered" the Window sensor
#And user "Cover Tampered" the Motion sensor
When user "Door" access sensor "Cover Tampered"
And user "Window" access sensor "Cover Tampered"
#And user motion sensor "Cover Tampered"
And user switches from <Mode> to "Away"
Then user should receive a "Switch to Away" popup
When user "accepts" the "Switch to Away" popup
#When "Switching timer" ends on user device
#Then user should be displayed with the "Away Status"
Then user should be displayed with a switching to "Away" text
And user should be displayed with switching timer
And timer ends on user device
And user status should be set to "Away"
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "Door Sensor" status as "OFF" on the "Sensor List"
And user should see the "Window Sensor" status as "OFF" on the "Sensor List"
#And user should see the "Motion Sensor" status as "OFF" on the "Sensor List"
| Sensors       | Sensor Status	|
#| Door Sensor   | OFF       		|
#| Window Sensor | OFF       		|
#| Motion Sensor | OFF       		|

Examples:
|Mode|
|Home|
|OFF |


@DASSensorStatusOFFWithNightMode		@P2			@Automated @--xrayid:ATER-54722
Scenario Outline: As a user I want to switch to different states in my DAS device when multiple sensors are in fault condition in Night mode
Given user sets the entry/exit timer to "45" seconds
And user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
When user launches and logs in to the Lyric application
And user navigates to "Security Solution Card" screen from the "Dashboard" screen
#And user "Cover Tampered" the Door sensor
#And user "Cover Tampered" the Window sensor
#And user "Cover Tampered" the Motion sensor
When user "Door" access sensor "Cover Tampered"
And user "Window" access sensor "Cover Tampered"
And user motion sensor "Cover Tampered"
And user switches from <Mode> to "Night"
Then user should receive a "Switch to Night" popup
When user "accepts" the "Switch to Night" popup
#When "Switching timer" ends on user device
#Then user should be displayed with the "Away Status"
And user should be displayed with a switching to "Night" text
And user should be displayed with switching timer
And timer ends on user device
And user status should be set to "Night"
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "Door Sensor" status as "OFF" on the "Sensor List"
And user should see the "Window Sensor" status as "OFF" on the "Sensor List"
#And user should see the "Motion Sensor" status as "COVER TAMPERED" on the "Sensor List"
#| Sensors       | Sensor Status	|
#| Door Sensor   | OFF       		|
#| Window Sensor | OFF       		|
#| Motion Sensor | ACTIVE       		|

Examples:
|Mode|
|Home|
|OFF |


@DASDoorWindowSensorCoverTamperStatus			@P2			@Automated @--xrayid:ATER-54723
Scenario Outline: As a user i should be displayed with Cover Tamper for Door and Window sensors status 
#DAS with sensors Door Contact Window Contact
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
And user launches and logs in to the Lyric application
#And user creates "Cover Tamper" at the <Sensor>
When user <SensorType> access sensor "Cover Tampered"
Then user navigates to <SensorList> screen from the "Dashboard" screen
And user selects "Sensor Cover Tampered" from <SensorList> screen
Then user should be displayed with the "Sensor Cover Tamper" screen
And user selects "Clear Tamper" from "Sensor Cover Tamper" screen
Then user should receive a "Sensor Tamper" popup 
When user "OK" the "Sensor Tamper" popup 
Then user should be displayed with the "Sensor Cover Tamper" screen
When user selects "Clear Tamper" from "Sensor Cover Tamper" screen
And user should receive a "Sensor Tamper" popup 
When user "RETRY" the "Sensor Tamper" popup
When user <SensorType> access sensor "tamper cleared"
When user "RETRY" the "Sensor Tamper" popup
And user <SensorType> access sensor "closed"
And user should see the <SensorType> status as "Closed" on the "Access sensor Settings"

Examples:
| Mode	| SensorList					| SensorType		|
| Home	| Door Access Settings		| Door			|
| Home	| Window Access Settings		| Window			|	
#| Off 	| Door Access Settings		| Door			|			
#| Off 	| Window Access Settings		| Window			|


@DASMotionSensorCoverTamperStatus			@P2			@Automated @--xrayid:ATER-54724
Scenario Outline: As a user i should be displayed with Cover Tamper for Motion sensors status 
#DAS with Motion sensor
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
When user navigates to <SensorList> screen from the "Dashboard" screen
#And user creates "Cover Tamper" at the <Sensor>
#And user motion sensor "Cover Tampered"
And user selects "Sensor Cover Tampered" from <SensorList> screen
Then user should be displayed with the "Sensor Cover Tamper" screen
And user selects "Clear Tamper" from "Sensor Cover Tamper" screen
Then user should receive a "Sensor Tamper" popup 
When user "OK" the "Sensor Tamper" popup 
Then user should be displayed with the "Sensor Cover Tamper" screen
When user selects "Clear Tamper" from "Sensor Cover Tamper" screen
And user should receive a "Sensor Tamper" popup 
When user "RETRY" the "Sensor Tamper" popup
#When user motion sensor "tamper cleared"
When user "RETRY" the "Sensor Tamper" popup
And user should see the <SensorType> status as "Standby" on the "Motion sensor Settings"

Examples:
| Mode	| SensorList					| SensorType		|	
| Home	| Motion Sensor Settings		| Motion			|		
| Off 	| Motion Sensor Settings		| Motion			|


@DASSensorLowBatteryStatus			@P2			@NotAutomatable		 
Scenario Outline: As a user i should be displayed with low battery sensors status 
#DAS with sensors Door Contact Window Contact ISMV OSMV Motion Sensor 
Given user launches and logs in to the Lyric Application
And user is set to <Mode> through CHIL
When user navigates to "Security Settings " screen from "Dashboard" screen
And user navigates to "Sensor list" screen from "Security Settings" screen
And user creates "Low Battery" at the <Sensor> 
Then user should be displayed with the "Low Battery status"
When user selects the "Low Battery status"
Then user should be displayed with the "Low Battery description" Screen
When user navigates to "Sensor list" screen from "Low Battery description" Screen
Then user should not be displayed with "Low Battery status"

Examples:
|Mode|Sensor| 
|Away|Door Sensor|			
#|Away|Window Sensor|		
#|Away|Motion Sensor|
#|Away|ISMV Sensor|
#|Away|OSMV Sensor|
#|Night|Door Sensor|			
#|Night|Window Sensor|		
#|Night|Motion Sensor|
#|Night|ISMV Sensor|
#|Night|OSMV Sensor|
#|Home|Door Sensor|			
#|Home|Window Sensor|		
#|Home|Motion Sensor|
#|Home|ISMV Sensor|
#|Home|OSMV Sensor|
#|Off |Door Sensor|			
#|Off |Window Sensor|		
#|Off |Motion Sensor|
#|Off |ISMV Sensor|
#|Off |OSMV Sensor|


@DASSensorOfflineStatus			@P2			@NotAutomatable @--xrayid:
Scenario Outline: As a user i should be displayed with offline sensors status 
#DAS with sensors Door Contact Window Contact ISMV OSMV Motion Sensor 
Given user launches and logs in to the Lyric Application
And user is set to <Mode> through CHIL
When user navigates to "Security Settings " screen from "Dashboard" screen
And user navigates to "Sensor list" screen from "Security Settings" screen
And user creates "Offline" at the <Sensor> 
Then user should be displayed with the "Offline status"
When user selects the "Offline status"
Then user should be displayed with the "Offline description" Screen
When user navigates to "Sensor list" screen from "Offline description" Screen
Then user should not be displayed with "Offline status"

Examples:
|Mode|Sensor| 
|Away|Door Sensor|			
|Away|Window Sensor|		
|Away|Motion Sensor|
|Away|ISMV Sensor|
|Away|OSMV Sensor|
|Night|Door Sensor|			
|Night|Window Sensor|		
|Night|Motion Sensor|
|Night|ISMV Sensor|
|Night|OSMV Sensor|
|Home|Door Sensor|			
|Home|Window Sensor|		
|Home|Motion Sensor|
|Home|ISMV Sensor|
|Home|OSMV Sensor|
|Off |Door Sensor|			
|Off |Window Sensor|		
|Off |Motion Sensor|
|Off |ISMV Sensor|
|Off |OSMV Sensor|


#Requirement :One DAS Panel and one Access Sensor should be configured
@DASSensorModelAndFirmwareDetailsVerification			@P2			@Automated @--xrayid:ATER-54726
Scenario Outline:Verify Model details and Firmware details in Access Sensor
Given user is set to <Mode> mode through CHIL
And timer lapse "15" seconds
And user launches and logs in to the Lyric application
When user navigates to "Door Access Settings" screen from the "Dashboard" screen
And user selects "Model and Firmware Details" from "Door Access Settings" screen
Then user should be displayed with the "Model and Firmware Details" screen
When user navigates to "Window Access settings" screen from the "Model and Firmware Details" screen
And user selects "Model and Firmware Details" from "Window Access settings" screen
Then user should be displayed with the "Model and Firmware Details" screen
When user navigates to "Motion Sensor settings" screen from the "Model and Firmware Details" screen
And user selects "Model and Firmware Details" from "Motion Sensor settings" screen
Then user should be displayed with the "Model and Firmware Details" screen
#When user navigates to "ISMV Sensor settings" screen from the "Model and Firmware Details" screen
#And user selects "Model and Firmware Details" from "ISMV Sensor settings" screen
#Then user should be displayed with the "Model and Firmware Details" screen
#When user navigates to "OSMV Sensor settings" screen from the "Model and Firmware Details" screen
#And user selects "Model and Firmware Details" from "OSMV Sensor settings" screen
#Then user should be displayed with the "Model and Firmware Details" screen
#When user navigates to "Keyfob settings" screen from the "Model and Firmware Details" screen
#And user selects "Model and Firmware Details" from "Keyfob settings" screen
#Then user should be displayed with the "Model and Firmware Details" screen

Examples:
| Mode		|
| Home		|
| Away		|
| Night		|
| OFF		|
#| OFFLINE	|


#Requirement :One DAS Panel and one Door Access Sensor should be configured
@DASDoorSensorSignalStrengthWithSensor			@P2			@Automated @--xrayid:ATER-54727
Scenario Outline: As a user I should be able to verify the signal strength and test Door Sensor in Home and OFF mode
Given user is set to <Mode> mode through CHIL
And user "door" access sensor <Access Sensor Status>
And timer lapse "15" seconds
And user launches and logs in to the Lyric application
When user navigates to "Door Access Settings" screen from the "Dashboard" screen
Then user selects "Signal Strength and Test" from "Door Access settings" screen
Then user should be displayed with the "Test Access Sensor" screen
Then user should see the "door sensor" status as <Access Sensor Status> on the "Test Access Sensor"
When user selects "Sensor Not Working" from "Test Access Sensor" screen
Then user should be displayed with the "Access Sensor Help" screen
When user selects "Test Signal Strength" from "Access Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the "door sensor" status as "High" on the "Signal Strength"
And user navigates to "Access Sensor Help" screen from the "Test Signal Strength" screen
Then user navigates to "Test Access Sensor" screen from the "Access Sensor Help" screen
When user navigates to "Door Access Settings" screen from the "Test Access Sensor" screen

Examples:
| Mode					| Access Sensor Status	|
| Home					| Cover Tampered			|
| Home					| Open					|
#| Home					| Low battery			|
#| Off 					| Cover Tampered			|
#| Off 					| Open					|
#| Off 					| Low battery			|
#| Sensor Enrollment 	| Cover Tampered			|
#| Sensor Enrollment 	| Open					|
#| Sensor Enrollment 	| Low battery			|


#Requirement :One DAS Panel and one Door Access Sensor should be configured
@DASWindowSensorSignalStrengthWithSensor			@Automated @--xrayid:ATER-54728
Scenario Outline: As a user I should be able to verify the signal strength and test window Sensor in Home and OFF mode
Given user is set to <Mode> mode through CHIL
And user "window" access sensor <Access Sensor Status>
And timer lapse "15" seconds
And user launches and logs in to the Lyric application
When user navigates to "Window Access Settings" screen from the "Dashboard" screen
Then user selects "Signal Strength and Test" from "Window Access settings" screen
Then user should be displayed with the "Test Access Sensor" screen
Then user should see the "window sensor" status as <Access Sensor Status> on the "Test Access Sensor"
When user selects "Sensor Not Working" from "Test Access Sensor" screen
Then user should be displayed with the "Access Sensor Help" screen
When user selects "Test Signal Strength" from "Access Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the "window sensor" status as "High" on the "Signal Strength"
And user navigates to "Access Sensor Help" screen from the "Test Signal Strength" screen
Then user navigates to "Test Access Sensor" screen from the "Access Sensor Help" screen
When user navigates to "Window Access Settings" screen from the "Test Access Sensor" screen

Examples:
| Mode					| Access Sensor Status	|
| Home					| Cover Tampered			|
| Home					| Open					|
#| Home					| Low battery			|
| Off 					| Cover Tampered		|
| Off 					| Open					|
#| Off 					| Low battery			|
#| Sensor Enrollment 	| Cover Tampered			|
#| Sensor Enrollment 	| Open					|
#| Sensor Enrollment 	| Low battery			|


#Requirement :One DAS Panel and one Motion Sensor should be configured
@DASMotionSensorSignalStrengthWithSensor			@P2			@Automated @--xrayid:ATER-54731
Scenario Outline: As a user I should be able to verify the signal strength and test Motion Sensor in Home and OFF mode
Given user is set to <Mode> mode through CHIL
And user motion sensor <Motion Sensor Status>
And user launches and logs in to the Lyric application
When user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen
Then user selects "Signal Strength and Test" from "Motion Sensor Settings" screen
Then user should be displayed with the "Test Motion Sensor" screen
Then user should see the "motion sensor" status as "No Motion Detected" on the "Test Motion Sensor"
When user selects "Sensor Not Working" from "Test Motion Sensor" screen
Then user should be displayed with the "Motion Sensor Help" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the "motion sensor" status as "High" on the "Signal Strength"
When user navigates to "Test Motion Sensor" screen from the "Test Signal Strength" screen
Then user navigates to "Motion Sensor Settings" screen from the "Test Motion Sensor" screen

Examples:
| Mode					| Motion Sensor Status	|
| Home					| Cover Tampered			|
| Home					| Open					|
| Home					| Low battery			|
| Off 					| Cover Tampered			|
| Off 					| Open					|
| Off 					| Low battery			|
| Sensor Enrollment 	| Cover Tampered			|
| Sensor Enrollment 	| Open					|
| Sensor Enrollment 	| Low battery			|


#Requirement :One DAS Panel and one ISMV Sensor should be configured
@DASISMVSensorSignalStrengthWithSensor			@P2			@Automated @--xrayid:ATER-54732
Scenario Outline: As a user I should be able to verify the signal strength and test ISMV Sensor in Home and OFF mode
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
Then user navigates to "ISMV Sensor settings" screen from the "Dashboard" screen
And user indoor motion viewer <Sensor Status>
Then user selects "Signal Strength and Test" from "ISMV Sensor settings" screen
Then user should be displayed with the "Test Motion Viewer" screen
Then user should see the "ISMV sensor" status as "No Motion Detected" on the "Test Motion Viewer"
When user navigates to "Motion Viewer Help" screen from the "Test Motion Viewer" screen
Then user navigates to "Signal Strength" screen from the "Motion Viewer Help" screen
Then user should be displayed with the "Signal Strength" screen
And user should see the "Signal to Base Station" status as "High" on the "Signal Strength"
When user navigates to "Test Motion Viewer" screen from the "Signal Strength" screen
Then user navigates to "Motion Viewer Settings" screen from the "Test Motion Viewer" screen

Examples:
| Mode				| Sensor Status		|
| Home				| Cover Tampered		|
| Home				| Open				|
| Home				| Low battery		|
| Off 				| Cover Tampered		|
| Off 				| Open				|
| Off 				| Low battery		|
| Sensor Enrollment 	| Cover Tampered		|
| Sensor Enrollment 	| Open				|
| Sensor Enrollment 	| Low battery		|


#Requirement :One DAS Panel and one OSMV Sensor should be configured
@DASOSMVSensorSignalStrengthWithSensor		@P2			@Automated @--xrayid:ATER-54733
Scenario Outline: As a user I should be able to verify the signal strength and test OSMV Sensor in Home and OFF mode
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
Then user navigates to "OSMV Sensor settings" screen from the "Dashboard" screen
And user indoor motion viewer <Sensor Status>
Then user selects "Signal Strength and Test" from "OSMV Sensor settings" screen
Then user should be displayed with the "Test Motion Viewer" screen
Then user should see the "OSMV sensor" status as "No Motion Detected" on the "Test Motion Viewer"
When user navigates to "Motion Viewer Help" screen from the "Test Motion Viewer" screen
Then user navigates to "Signal Strength" screen from the "Motion Viewer Help" screen
Then user should be displayed with the "Signal Strength" screen
And user should see the "Signal to Base Station" status as "High" on the "Signal Strength"
When user navigates to "Test Motion Viewer" screen from the "Signal Strength" screen
Then user navigates to "Motion Viewer Settings" screen from the "Test Motion Viewer" screen

Examples:
| Mode				| Sensor Status		|
| Home				| Cover Tampered		|
| Home				| Open				|
| Home				| Low battery		|
| Off 				| Cover Tampered		|
| Off 				| Open				|
| Off 				| Low battery		|
| Sensor Enrollment 	| Cover Tampered		|
| Sensor Enrollment 	| Open				|
| Sensor Enrollment 	| Low battery		|


#Requirement :One DAS Panel and one Door Access Sensor should be configured
@DASDoorSensorSignalStrengthWithSensorNotWorkingAndIsOutOfRange			@NotAutomatable @--xrayid:
Scenario Outline: As a user I should be able to verify the signal strength and test Door Sensor is not working in Home and OFF mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to "Door Access settings" settings screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should be displayed with "Test Sensor" screen
When user selects "Sensor Not Working?" from "Test Sensor" screen
Then user should be displayed with the "Access Sensor Help" screen
When user selects "Test Signal Strength" from "Access Sensor Help" screen
Then user should be displayed with "Signal Strength" screen 
Then user should receive a "Out Of Range" popup
And user "taps on RETRY in" the "Out Of Range" popup
Then user should receive a "Out Of Range" pop up
And user "taps on OK in" the "Out Of Range" popup
Then user should be displayed with the "Access Sensor Help" screen
And user navigates to "Test Sensor" screen from the "Test Signal Strength" screen

Examples:
|Mode|Sensor status|
|Home|Cover Tampered|
|Home|Open|
|Home|Low battery|


#Requirement :One DAS Panel and one Sensor should be configured and sensor status should be offline
@DASSensorSignalStrengthWhenSensorOffline			@NotAutomatable @--xrayid:
Scenario Outline: As a user I should be shown with message that I cannot check signal strength for panel accessories through the application when sensor offline
Given user launches and logs in to the Lyric application 
And user is set to <Mode> through CHIL
Then user navigates to <Sensor Settings> settings screen from the "Dashboard"
When user selects the "Signal Strength and Test" button
Then user should be displayed with "Sensor is offline" pop up

Examples:
|Sensor Settings|Status|
|Door sensosr   |Offline|
|Motion sensor  |Offline|
|Window sensor  |Offline|
|ISMV sensor    |Offline|
|OSMV sensor    |Offline|


@DASSignalStrengthErrorpopupVerification				@NotAutomatable
Scenario Outline: As a user I should be able to verify delete error pop up from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL 
When user navigates to <Sensor Settings> Settings screen from the "Dashboard" screen 
And user selects the "Signal Strength and Test" button
#Deletion failed(Put panel to offline,server not responding ) 
Then user should be displayed with "Signal Strength and Test " pop up 
When user selects the "Retry" button
Then user should be displayed with "Signal Strength and Test " pop up 
When user selects the "Cancel" button
Then user display with <Sensor Settings> Settings screen

Examples:
|Mode|Sensor Settings|
|Home|Door Sensor  |
|Home|Window Sensor|
|Home|Motion Sensor|
|Home|ISMV Sensor|
|Home|OSMV Sensor|
|Off |Door Sensor  |
|Off |Window Sensor|
|Off |Motion Sensor|
|Off |ISMV Sensor|
|Off |OSMV Sensor|


@DASSignalStrengthSensorDisabled				@NotAutomatable @--xrayid:
Scenario Outline: As a user I should be shown with message that I cannot check signal strength for panel accessories through the application when panel is in below states
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to <Sensor Settings> screen from the "Dashboard" screen 
Then the following <Sensor Settings> Settings options should be disabled:
|Options|
|Signal Strength and test|
#Then user should display the "you can perform this action only in Home or Off mode" pop up

Examples:
|Sensor Settings|Mode|
|Door sensosr   |Night|
|Motion sensor  |Away|
|Window sensor  |Alarm|
|ISMV sensor    |Away|
|OSMV sensor    |Night|


#Requirement :One DAS Panel and one Door Access Sensor should be configured
@DASDeleteDoorAccessSensor			@P2				@Automated @--xrayid:ATER-54735
Scenario Outline: As a user I should be able to delete door access sensor from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
And user "door" access sensor <Sensor Status>
And user launches and logs in to the Lyric application
When user navigates to "Door Access Settings" screen from the "Dashboard" screen
When user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Access Sensor Confirmation" popup
And user "dismisses" the "Delete Access Sensor Confirmation" popup
Then user should be displayed with the "Door Access Settings" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Access Sensor Confirmation" popup
And user "accepts" the "Delete Access Sensor Confirmation" popup
Then user should not be displayed with "door" device on the "sensor list" screen

Examples:
| Mode				| Sensor Status		|
| Home				| Cover Tampered		|
| Home				| Open				|
| Home				| Low battery		|
| Home				| Offline			|
| Off 				| Cover Tampered		|
| Off 				| Open				|
| Off 				| Low battery		|
| Off				| Offline			|
| Sensor Enrollment | Cover Tampered		|
| Sensor Enrollment | Open				|
| Sensor Enrollment | Low battery		|
| Sensor Enrollment | Offline			|


#Requirement :One DAS Panel and one Window Access Sensor should be configured
@DASDeleteWindowAccessSensor			@P2				@Automated @--xrayid:ATER-54737
Scenario Outline: As a user I should be able to delete window access sensor from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
And user "door" access sensor <Sensor Status>
And user launches and logs in to the Lyric application
When user navigates to "Window Access Settings" screen from the "Dashboard" screen
When user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Access Sensor Confirmation" popup
And user "dismisses" the "Delete Access Sensor Confirmation" popup
Then user should be displayed with the "Window Access Settings" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Access Sensor Confirmation" popup
And user "accepts" the "Delete Access Sensor Confirmation" popup
Then user should not be displayed with "window" device on the "sensor list" screen

Examples:
| Mode				| Sensor Status		|
| Home				| Cover Tampered		|
| Home				| Open				|
| Home				| Low battery		|
| Home				| Offline			|
| Off 				| Cover Tampered		|
| Off 				| Open				|
| Off 				| Low battery		|
| Off				| Offline			|
| Sensor Enrollment | Cover Tampered		|
| Sensor Enrollment | Open				|
| Sensor Enrollment | Low battery		|
| Sensor Enrollment | Offline			|


#Requirement :One DAS Panel and one Motion Sensor should be configured
@DASDeleteMotionSensor			@P2				@Automated @--xrayid:ATER-54738
Scenario Outline: As a user I should be able to delete motion sensor from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
When user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen
And user motion sensor <Sensor Status>
When user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Motion Sensor Confirmation" popup
And user "dismisses" the "Delete Motion Sensor Confirmation" popup
Then user should be displayed with the "Motion Sensor Settings" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Motion Sensor Confirmation" popup
And user "accepts" the "Delete Motion Sensor Confirmation" popup
Then user should not be displayed with "motion sensor" device on the "sensor list" screen

Examples:
| Mode				| Sensor Status		|
| Home				| Cover Tampered		|
| Home				| Standby			|
| Home				| Low battery		|
| Home				| Offline			|
| Off 				| Cover Tampered		|
| Off 				| Standby			|
| Off 				| Low battery		|
| Off				| Offline			|
| Sensor Enrollment | Cover Tampered		|
| Sensor Enrollment | Standby			|
| Sensor Enrollment | Low battery		|
| Sensor Enrollment | Offline			|


#Duplicate of the above scenario
#Requirement :One DAS Panel and one Motion Sensor should be configured
@DASDeleteMotionSensor123			@Duplicate @--xrayid:
Scenario Outline: As a user I should be able to delete key fob from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
And user is set to <Sensor status>
When user navigates to "Motion Sensor settings" screen from the "Dashboard" screen 
And user "deletes Sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
When user "Cancels" the "Delete Sensor Confirmation" popup
Then user display with "Door Sensor settings" screen
When user "deletes Sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
When user selects the "OK" button
Then user display with "Motion Sensor settings" screen
When user navigates to "Sensor list" screen from the "Motion Sensor settings" screen 
Then user should not be displayed with "Motion Sensor" in the "Sensor list" screen

Examples:
|Mode|Sensor status|
|Home|Cover Tampered|
|Home|Standby|
|Home|Low battery|
|Home|Offline|
|Off |Cover Tampered|
|Off |Standby|
|Off |Low battery|
|Off|Offline|
|Sensor Enrollment |Cover Tampered|
|Sensor Enrollment |Standby|
|Sensor Enrollment |Low battery|
|Sensor Enrollment |Offline|


#Requirement :One DAS Panel and one Keyfob should be configured
@DASDeleteKeyfob				@P2				@Automated @--xrayid:ATER-54739
Scenario Outline: As a user I should be able to delete keyfob from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
When user navigates to "Keyfob Settings" screen from the "Dashboard" screen
When user selects "delete sensor" from "Keyfob Settings" screen
Then user should receive a "Delete keyfob Confirmation" popup
When user "dismisses" the "Delete Keyfob Confirmation" popup
When user selects "delete sensor" from "Keyfob Settings" screen
Then user should receive a "Delete keyfob Confirmation" popup
And user "accepts" the "Delete Keyfob Confirmation" popup
Then user should not be displayed with "Keyfob" device on the "Keyfob list" screen

Examples:
| Mode	|
| Home	|
| Off 	|


#Requirement :One DAS Panel and one ISMV Sensor should be configured
@DASDeleteISMVSensor				@P2				@Automated @--xrayid:ATER-54740
Scenario Outline: As a user I should be able to delete ISMV from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
When user launches and logs in to the Lyric application
Then user navigates to "ISMV Sensor Settings" screen from the "Dashboard" screen
When user indoor motion viewer <Sensor status>
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete ISMV Sensor Confirmation" popup
And user "dismisses" the "Delete ISMV Sensor Confirmation" popup
Then user should be displayed with the "ISMV Sensor settings" screen
When user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete ISMV Sensor Confirmation" popup
And user "accepts" the "Delete ISMV Sensor Confirmation" popup
Then user should not be displayed with "ISMV sensor" device on the "sensor list" screen

Examples:
| Mode				| Sensor status		|
| Home				| Cover Tampered		|
| Home				| Standby			|
| Home				| Low battery		|
| Home				| Offline			|
| Off 				| Cover Tampered		|
| Off 				| Standby			|
| Off 				| Low battery		|
| Off				| Offline			|
| Sensor Enrollment | Cover Tampered		|
| Sensor Enrollment | Standby			|
| Sensor Enrollment | Low battery		|
| Sensor Enrollment | Offline			|


#Requirement :One DAS Panel and one OSMV Sensor should be configured
@DASDeleteOSMVSensor					@P2				@Automated @--xrayid:ATER-54741
Scenario Outline: As a user I should be able to delete OSMV from my account through the Lyric application 
Given user is set to <Mode> mode through CHIL
When user launches and logs in to the Lyric application
Then user navigates to "OSMV Sensor Settings" screen from the "Dashboard" screen
When user outdoor motion viewer <Sensor status>
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete OSMV Sensor Confirmation" popup
And user "dismisses" the "Delete OSMV Sensor Confirmation" popup
Then user should be displayed with the "OSMV Sensor settings" screen
When user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete OSMV Sensor Confirmation" popup
And user "accepts" the "Delete OSMV Sensor Confirmation" popup
Then user should not be displayed with "OSMV sensor" device on the "sensor list" screen

Examples:
| Mode				| Sensor status		|
| Home				| Cover Tampered		|
| Home				| Standby			|
| Home				| Low battery		|
| Home				| Offline			|
| Off 				| Cover Tampered		|
| Off 				| Standby			|
| Off 				| Low battery		|
| Off				| Offline			|
| Sensor Enrollment | Cover Tampered		|
| Sensor Enrollment | Standby			|
| Sensor Enrollment | Low battery		|
| Sensor Enrollment | Offline			|


@DASDeleteSensorDisabled				@NotAutomatable @--xrayid:
Scenario Outline: As a user I should be shown with message that I cannot delete panel accessories through the application when panel is in below states
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to <Sensor Settings> screen from the "Dashboard" screen 
Then the following <Sensor Settings> Settings options should be disabled:
|Options|
|Delete field|
#Then user should display the "you can perform this action only in Home or Off mode" pop up

Examples:
|Sensor Settings|Mode|
|Door sensosr   |Night|
|Motion sensor  |Away|
|Window sensor  |Offline|
|ISMV sensor    |Alarm|
|OSMV sensor    |Night|
|Keyfob         |Away|


@DASDeleteSensorErrorpopupVerification			@NotAutomatable @--xrayid:
Scenario Outline: As a user I should be able to verify delete error pop up from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL 
When user navigates to <Sensor Settings>screen from the "Dashboard" screen 
And user "deletes Sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
When user "ok" the "Delete Sensor Confirmation" popup
#Deletion failed(Put panel to offline,server not responding ) 
Then user should be displayed with "Unable to delete sensor" pop up 
When user selects the "OK" button
Then user display with <Sensor Settings> Settings screen
And user should be displayed with <Sensor> in the "Sensor list" screen

Examples:
|Mode|Sensor Settings|Sensor|
|Home|Door Sensor  |Door Sensor|
|Home|Window Sensor|Window Sensor|
|Home|Motion Sensor|Motion Sensor|
|Home|ISMV Sensor|ISMV Sensor|
|Home|OSMV Sensor|OSMV Sensor|
|Off |Door Sensor  |Door Sensor|
|Off |Window Sensor|Window Sensor|
|Off |Motion Sensor|Motion Sensor|
|Off |ISMV Sensor|ISMV Sensor|
|Off |OSMV Sensor|OSMV Sensor|

@DASUpdateSensorNameToExistingName		@P2			@AutomatedForIOSOnly @--xrayid:ATER-54742
Scenario: As a user I should see error popup when I update sensor name and enter existing sensor name
Given user is set to "Home" mode through CHIL
When user launches and logs in to the Lyric application
When user navigates to "Window Access Settings" screen from the "Dashboard" screen
Then user edits the "Window Sensor" name to "existing door sensor name"
And user should receive a "Sensor name already assigned error" popup
And user "clicks on OK in" the "Sensor name already assigned error" popup