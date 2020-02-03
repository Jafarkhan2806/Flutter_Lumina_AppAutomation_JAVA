@JasperNAEMEAHBBSettings		@Comfort
Feature: DAS Settings 
  As user I should be able to control my Japer NA settings from the app


#JasperNA, 
@VerifyJasperNASettings		@P1		@Automated		@--xrayid:ATER-44516
Scenario: As a user I want to verify that all JasperNA Settings options are available to me 
Given user launches and logs in to the Lyric application 
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen 
Then user should be displayed with the following "Thermostat Settings" options: 
      | ThermostatSettings			|
      | Manage Alerts				|
      | Set Filter Reminder			|
     #|	Set up HomeKit & Siri		|
      | Adaptive Recovery			|	
      | Auto Changeover				|
     #| Ventilation					|
      | Emergency Heat				| 
      | Reset Wi-Fi					| 
      | Thermostat Configuration 	| 


#JasperEMEA
@VerifyJasperNAEMEASpruceSettings		@P1		@Automated		@--xrayid:ATER-44517
Scenario: As a user I want to verify that all JasperNA Settings options are available to me 
Given user launches and logs in to the Lyric application 
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen 
Then user should be displayed with the following "Thermostat Settings" options: 
      | ThermostatSettings			|
      | Manage Alerts				|
      | Set Filter Reminder			|
      | Optimise						|
      |	Set up HomeKit & Siri		|
      | Optimizer					|
      | Emergency Heat				|
      | Reset Wi-Fi					| 
      | Thermostat Configuration 	| 


#HB_Spruce
@VerifyHBBSettings		@P1		@Automated		@--xrayid:ATER-44518
Scenario: As a user I want to verify that all HBB Settings options are available to me 
Given user launches and logs in to the Lyric application 
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen 
Then user should be displayed with the following "Thermostat Settings" options: 
      | ThermostatSettings			|
      | Manage Alerts				|
      | Set Filter Reminder			|
      | Fine Tune					|
      | Adaptive Recovery			|
      | Auto Changeover				|
      | Ventilation					|
      | Humidification				|
      | Dehumidification				|
      | Frost Protection				|
      | Emergency Heat				|
      | Sleep Brightness Mode		|
      | Sound						|
      | Reset Wi-Fi					| 
      | Thermostat Configuration 	|

#Manage Alerts 

#JasperNA, JasperEMEA, HB_Spruce
@EnableDisableIndoorTemperatureAlert		@P1		@Automated		@--xrayid:ATER-44519
Scenario: As a user I should be able to enable or disable Indoor Temperature Alert on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
And user changes the "Indoor Temperature Alert" to "ON"
Then "Indoor Temperature Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "Indoor Temperature Alert" options:
	| IndoorTempAlertOptions			| 
	| Alert for this range			|
When user changes the "Indoor Temperature Alert" to "OFF"
Then "Indoor Temperature Alert" value should be updated to "OFF" on "Manage Alerts" screen
    

#JasperNA, JasperEMEA, HB_Spruce   
@ChangeAlertForThisRangeforTemperature		@P1		@Automated		@--xrayid:ATER-44520
Scenario: As a user I should be able to change Alert For This Range on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
Then user changes the "Indoor Temperature Alert" to "ON"
And "Indoor Temperature Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "Indoor Temperature Alert" options:
	| IndoorTempAlertOptions			| 
	| Alert for this range			|
When user selects "Temperature Alert for this range" from "Manage Alerts" screen
Then user should be displayed with the following "Temperature Alert for this range" options:
	| AlertTempRangeOptions		| 
	| Below 						| 
	| Above						|
When user selects "Below Temperature Range" from "Manage Alerts" screen
Then user receives a "Below Temperature Range Alert" push notification
When user navigates to "Activity History" screen from the "Thermostat Settings" screen
Then user should be displayed with the following "Temperature Alert" options:
	| TempRangeAlertMsg		|
	| Below					|
When user navigates to "Manage Alerts" screen from the "Activity History" screen
Then user should be displayed with the following "Indoor Temperature Alert" options:
	| IndoorTempAlertOptions			| 
	| Alert for this range			|
When user selects "Temperature Alert for this range" from "Manage Alerts" screen
And user selects "Above Temperature Range" from "Manage Alerts" screen
Then user receives a "Above Temperature Range Alert" push notification
When user navigates to "Activity History" screen from the "Thermostat Settings" screen
Then user should be displayed with the following "Temperature Alert" options:
	| TempRangeAlertMsg		|
	| Above					|


#HB_Srpuce
@HBBEnableDisableIndoorHumidityAlert		@P2		@Automated @--xrayid:ATER-54487
Scenario: As a user I should be able to enable or disable Indoor Humidity Alert on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
Then user changes the "Indoor Humidity Alert" to "ON"
And "Indoor Humidity Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "Indoor Humidity Alert" options:
	| IndoorHumidityAlertOptions			| 
	| Alert for this range				|
When user changes the "Indoor Humidity Alert" to "OFF"
Then "Indoor Humidity Alert" value should be updated to "OFF" on "Manage Alerts" screen


#HB_Srpuce
@ChangeAlertForThisRangeforHumidity		@P1		@AutomatedOnAndroid	@--xrayid:ATER-44521 @Automated
Scenario: As a user I should be able to change Alert For This Range on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
Then user changes the "Indoor Humidity Alert" to "ON"
And "Indoor Humidity Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "Indoor Humidity Alert" options:
	| IndoorHumidityAlertOptions			| 
	| Alert for this range				|
When user selects "Humidity Alert for this range" from "Manage Alerts" screen
Then user should be displayed with the following "Humidity Alert for this range" options:
	| AlertHumidityRangeOptions		| 
	| Below 							| 
	| Above							|
When user selects "Below Humidity Range" from "Manage Alerts" screen
Then user receives a "Below Humidity Range Alert" push notification
When user navigates to "Activity History" screen from the "Thermostat Settings" screen
Then user should be displayed with the following "Humidity Alert" options:
	| HumidityRangeAlertMsg		|
	| Below						|
When user navigates to "Manage Alerts" screen from the "Activity History" screen
Then user should be displayed with the following "Indoor Humidity Alert" options:
	| IndoorHumidityAlertOptions			| 
	| Alert for this range				|
When user selects "Humidity Alert for this range" from "Manage Alerts" screen
And user selects "Above Humidity Range" from "Manage Alerts" screen
Then user receives a "Above Humidity Range Alert" push notification
When user navigates to "Activity History" screen from the "Thermostat Settings" screen
Then user should be displayed with the following "Humidity Alert" options:
	| HumidityRangeAlertMsg		|
	| Above						|


#Set Filter Reminder 

#JasperNA, HB-Spruce
@EnableDisableSetFilterReminder		@P2		@Automated @--xrayid:ATER-54490
Scenario: As a user I should be able to enable or disable Set Filter Reminder option on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Set Filter Reminder" screen from the "Dashboard" screen
And user changes the "Set Filter Reminder Switch" to "ON"
Then "Set Filter Reminder Switch" value should be updated to "ON" on "Set Filter Reminder" screen
When user changes the "Set Filter Reminder Switch" to "OFF"
Then "Set Filter Reminder Switch" value should be updated to "OFF" on "Set Filter Reminder" screen
     
     
@VerifySetFilterReminderOptions		@P2		@Automated @--xrayid:ATER-54491
Scenario: As a user I should be able to view options for Set Filter Reminder
Given user launches and logs in to the Lyric application
When user navigates to "Set Filter Reminder" screen from the "Dashboard" screen
And user changes the "Set Filter Reminder Switch" to "ON"
Then the following "Set Filter Reminder" options should be enabled:
		| SetFilterReminderOptions		| 
	    | Replace Filter Every			| 
    		| Filter Last Replaced			| 
      	| Next Scheduled Reminder		|
When user changes the "Set Filter Reminder Switch" to "OFF"
Then the following "Set Filter Reminder" options should be disabled:
		| SetFilterReminderOptions		| 
	    | Replace Filter Every			| 
    		| Filter Last Replaced			| 
      	| Next Scheduled Reminder		|


#JasperNA, HB-Spruce
@ChangeReplacefilterandFilterLastReplacedOptions		@P2		@Automated  @--xrayid:ATER-54493
Scenario: As a user I should be able to set options Replace filter and Filter Last Replaced
Given user launches and logs in to the Lyric application
When user navigates to "Set Filter Reminder" screen from the "Dashboard" screen
And user changes the "Set Filter Reminder Switch" to "ON"
And user selects <Replace filter value as month> from "Set Filter Reminder" screen
Then "Replace Filter Every" value should be updated to <replace filter Every value> on "Set Filter Reminder" screen
When user selects "Filter Last Replaced " from "set filter reminder" screen
Then user should be able to "Selecet new date"
And user should be able to "View Next scheduled Reminder"
And user should be able to receive push notification for filter reminder once
|7 month|
|8 month|
|9 month|
|10 month|
|11month|


#Homekit -- only for iOS , spruce , NA, EMEA

@SetupHomekitHB		@P2		@Automated  @--xrayid:ATER-54494
Scenario: As a user i should verify Homekit option should not display for HB
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then user should not be displayed with "Set up HomeKit and Siri" device on the "Thermostat Settings" screen


#JasperNA, JasperEMEA, HB_Spruce
@SetupHomekitAndSiriiOS		@P2		@NotAutomatable  @--xrayid:ATER-54497
 Scenario Outline: As a user i should be able to set homekit and siri using Custom location.
 Given user launches and logs in to the Lyric application 
 When user navigates to "Setup Homekit & Siri" screen from the "Dashboard" screen 
 Then user should be displayed with the "Looking for Device" Spinner
 And user should be displayed with the "Identify Thermostat" Spinner
 When user clicks on "Identify Thermostat" option
 Then user should be displayed with "LCD blinking" on the device
 When user navigates to "Find Homekit Setup Guide" screen from the "Identify Thermostat" screen
 And user click son "Next"
 Then user should be displayed with the " Connecting to device" Spinner
 And user should be displayed with the "Thermostat Room" Screen
 When user inputs <Custom Location> in "Custom Field"
 Then user should be displayed with the " Thermostat Configuration" Screen
 And user should be displayed with the "Identify" Option 
 
 Examples:
 		|Custom Location		|
      	| My Room			|
        
 #JasperNA, JasperEMEA, HB_Spruce
 @SetupHomekitAndSiriiOS		@P1		@NotAutomatable @--xrayid:ATER-54499
 Scenario Outline: As a user i should be able to set homekit and siri using default location.
 Given user launches and logs in to the Lyric application 
 When user navigates to "Setup Homekit & Siri" screen from the "Dashboard" screen 
 Then user should be displayed with the "Looking for Device" Spinner
 And user should be displayed with the "Identify Thermostat" Spinner
 When user clicks on "Identify Thermostat" option
 Then user should be displayed with "LCD blinking" on the device
 When user navigates to "Find Homekit Setup Guide" screen from the "Identify Thermostat" screen
 And user click son "Next"
 Then user should be displayed with the " Connecting to device" Spinner
 Examples:
 		|Default Location	|
      	| Default Room		|
     	| Basement			|
      	| Bedroom			| 
      	| Guest Bedroom		|	
      	| Hallway			|
      	| Living Room 		|

#Add HomeKit error pop up 
@Homekitpopupverification		@P2		@NotAutomatable @--xrayid:ATER-54505
 Scenario: As a user i should be able to get homekit error pop up when my device is unavailable.
 Given user launches and logs in to the Lyric application 
 When user navigates to "Setup Homekit & Siri" screen from the "Dashboard" screen 
 Then user should be displayed with the "Looking for Device" Spinner
 And user should be displayed with the "Identify Thermostat" Spinner
 When user navigates to "Find Homekit Setup Guide" screen from the "Identify Themostat" screen
 And user doesn't receives any response from the device
 Then user should be displayed with the "Error" Popup
 Then user should be displayed with the " Error" Popup
When user taps on "Learn how to setup homekit"
 Then user should be displayed with "Homekit Web portal"
 And when user navigates back to lyric app
 When user taps on "Try Again"
 Then user should be displayed with the "Looking for Device" Spinner 
 And user should be displayed with the "Identify Thermostat" Spinner
 When user clicks on "Identify Themostat" option
  And user doesn't receives any response from the device
 Then user should be displayed with the " Error" Popup
 When user taps on "Cancel"
 Then user should be displayed with the "Setup Homekit & Siri" screen


#LYR-24321
#HomeKitMultilocationaccuont

# Comfort settings 

#HB_Spruce
@HBBEnableDisableFineTune		@P2		@Automated @--xrayid:ATER-54507
Scenario: As a user I should be able to enable or disable Fine Tune option on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Fine Tune" to "ON"
Then "Fine Tune" value should be updated to "ON" on "Thermostat Settings" screen
When user changes the "Fine Tune" to  "OFF"
Then "Fine Tune" value should be updated to "OFF" on "Thermostat Settings" screen 


#HB_Spruce, JasperNA
@EnableDisableAdaptiveRecovery		@P2		@Automated @--xrayid:ATER-54508
Scenario: As a user I should be able to enable or disable Adaptive recovery on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Adaptive Recovery" to "ON"
Then "Adaptive Recovery" value should be updated to "ON" on "Thermostat Settings" screen
When user changes the "Adaptive Recovery" to "OFF"
Then "Adaptive Recovery" value should be updated to "OFF" on "Thermostat Settings" screen


#JasperEMEA—optimise
@EnableDisableAOptimiseValue		@P2		@Automated @--xrayid:ATER-54510
Scenario: As a user I should be able to enable or disable optimise value on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Optimise" to "ON"
Then "Optimise" value should be updated to "ON" on "Thermostat Settings" screen
When user changes the "Optimise" to "OFF"
Then "Optimise" value should be updated to "OFF" on "Thermostat Settings" screen


#JasperNA, HB_Spruce
@EnableDisableEmergencyHeat		@P2		@Automated @--xrayid:ATER-54512
Scenario: As a user I should be able to enable or disable Emergency Heat on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Emergency Heat" to "ON"
Then "Emergency Heat" value should be updated to "ON" on "Thermostat Settings" screen
When user changes the "Emergency Heat" to "OFF"
Then "Emergency Heat" value should be updated to "OFF" on "Thermostat Settings" screen


@AutoChangeOverWhenHeatOnlyOrCoolOnlyIsEnabled	@P2		@Automated @--xrayid:ATER-54513
Scenario Outline: As a user I should not be able view Auto changeover when heatonly or coolonly enabled on my thermostat
Given user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
		| Options	|
		| Auto		|
		| Heat		|
		| Cool		|
		| Off		|
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
When user navigates to "Thermostat Settings" screen from the "thermostat solution card" screen
Then the following "Thermostat Settings" options should be disabled:
		| ThermostatSettingsOption		|
		| Auto Changeover				|
		
Examples:
| SystemMode		|
| Cool			|
#| Heat			|


#JasperNA, HB_Spruce
@EmergencyHeatWhenCoolOnlyIsEnabled		@P2		@Automated @--xrayid:ATER-54514
Scenario Outline: As a user I should not be able view Auto changeover when cool only enabled on my thermostat
Given user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
		| Options	|
		| Auto		|
		| Heat		|
		| Cool		|
		| Off		|
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
When user navigates to "Thermostat Settings" screen from the "thermostat solution card" screen
Then the following "Thermostat Settings" options should be disabled:
		| ThermostatSettingsOption		|
		| Emergency Heat					|
		
Examples:
| SystemMode		|
| Heat			|
#| Cool			|


#JasperNA, HB_Spruce
@EmergencyHeatWhenHeatOnlyIsEnabled		@P2		@Automated @--xrayid:ATER-54516
Scenario Outline: As a user I should not be able view Auto changeover when Heat only enabled on my thermostat
Given user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
		| Options	|
		| Auto		|
		| Heat		|
		| Cool		|
		| Off		|
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
When user navigates to "Thermostat Settings" screen from the "thermostat solution card" screen
Then the following "Thermostat Settings" options should be disabled:
		| ThermostatSettingsOption		|
		| Emergency Heat					|
		
Examples:
| SystemMode		|
| Heat			|


#HB_Spruce
@HBBSpruceEnableFrostProtectionMode		@P2		@Automated @AutomatedOnAndroid @--xrayid:ATER-54517
Scenario Outline: As a user I should be able to enable or disable Frost Protection Mode on my thermostat
#Given user launches and logs in to the Lyric application
#When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
#And user changes the " Mode" to "ON"
#Then "Frost Protection Mode" value should be updated to "ON" on "Thermostat Settings" screen
#When user changes the "Frost Protection Mode" to "OFF"
#Then "Frost Protection Mode" value should be updated to "OFF" on "Thermostat Settings" screen
Given user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
When user navigates to "Thermostat Settings" screen from the "thermostat solution card" screen
And user changes the "Frost Protection Mode" to "~0%"
When user navigates to "Thermostat Settings" screen from the "Frost Protection" screen
Then "Frost Protection Mode" value should be updated to "~0%" on "Thermostat Settings" screen
When user changes the "Frost Protection Mode" to "~50%"
And user navigates to "Thermostat Settings" screen from the "Frost Protection" screen
Then "Frost Protection Mode" value should be updated to "~50%" on "Thermostat Settings" screen
When user changes the "Frost Protection Mode" to "~100%"
And user navigates to "Thermostat Settings" screen from the "Frost Protection" screen
Then "Frost Protection Mode" value should be updated to "~100%" on "Thermostat Settings" screen
#Hardware settings 

Examples:
		| SystemMode		|
		| Cool			|


#HB_Spruce
@HBBSpruceEnableHumidification		@P2		@Automated @--xrayid:ATER-54519
Scenario: As a user I should be able to enable or disable Humidification on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Humidification" screen from the "Dashboard" screen
And user changes the "Humidification" to "ON"
Then "Humidification" value should be updated to "ON" on "Thermostat Humidification" screen
When user navigates to "Thermostat Settings" screen from the "Thermostat Humidification" screen
Then "Humidification" value should be updated to "ON" on "Thermostat Settings" screen
When user navigates to "Thermostat Humidification" screen from the "Thermostat Settings" screen
When user changes the "Humidification" to "OFF"
Then "Humidification" value should be updated to "OFF" on "Thermostat Humidification" screen
When user navigates to "Thermostat Settings" screen from the "Thermostat Humidification" screen
Then "Humidification" value should be updated to "OFF" on "Thermostat Settings" screen


#HB_Spruce
@HBBSpruceEnableDeHumidification		@P2		@Automated @--xrayid:ATER-54520
Scenario: As a user I should be able to enable or disable DeHumidification on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Dehumidification" screen from the "Dashboard" screen
And user changes the "Dehumidification" to "ON"
Then "Dehumidification" value should be updated to "ON" on "Thermostat Dehumidification" screen
When user navigates to "Thermostat Settings" screen from the "Thermostat Dehumidification" screen
Then "Dehumidification" value should be updated to "ON" on "Thermostat Settings" screen
When user navigates to "Thermostat Dehumidification" screen from the "Thermostat Settings" screen
When user changes the "Dehumidification" to "OFF"
Then "Dehumidification" value should be updated to "OFF" on "Thermostat Dehumidification" screen
When user navigates to "Thermostat Settings" screen from the "Thermostat Dehumidification" screen
Then "Dehumidification" value should be updated to "OFF" on "Thermostat Settings" screen


#HB_Spruce
@HBBIncreaseDecreaseSleepBrightnessMode 		@P2		@Automated @AutomatedOnAndroid  @--xrayid:ATER-54521
Scenario: As a user I should be able to increase or decrease Sleep Brightness Mode option on my thermostat
Given user launches and logs in to the Lyric application
When user navigates to "Sleep Brightness Mode" screen from the "Dashboard" screen
And user changes the "Sleep Brightness" to "~50%"
Then "Sleep Brightness" value should be updated to "~50%" on "Sleep Brightness Mode" screen
When user navigates to "Thermostat Settings" screen from the "Sleep Brightness Mode" screen
And "Sleep Brightness" value should be updated to "~50%" on "Thermostat Settings" screen
When user navigates to "Sleep Brightness Mode" screen from the "Thermostat Settings" screen
And user changes the "Sleep Brightness" to "~0%"
Then "Sleep Brightness" value should be updated to "Off" on "Sleep Brightness Mode" screen
When user navigates to "Thermostat Settings" screen from the "Sleep Brightness Mode" screen
Then "Sleep Brightness" value should be updated to "Off" on "Thermostat Settings" screen


#HB_Spruce
@HBBverifySoundOptions		@P2		@Automated @--xrayid:ATER-54522
Scenario: As a user I should be able to view options for Sound
Given user launches and logs in to the Lyric application
When user navigates to "Sound" screen from the "Dashboard" screen
Then user should be displayed with the following "Sound" options: 
		| SoundOptions	| 
		| Low 			| 
		| Normal   		| 
		| Off	  		| 


#HB_Spruce	  
@HBBchangeSoundSettings		@P2		@Automated  @--xrayid:ATER-54523
Scenario: As a user I should be able to set options for Sound
Given user launches and logs in to the Lyric application
When user navigates to "Sound" screen from the "Dashboard" screen
And user changes the "Sound" to "Off"
And user navigates to "Thermostat Settings" Screen from the "Sound" Screen
Then "Sound" value should be updated to "Off" on "Thermostat Settings" screen 
When user navigates to "Sound" screen from the "Thermostat Settings" screen
And user changes the "Sound" to "Low"
And user navigates to "Thermostat Settings" Screen from the "Sound" Screen
Then "Sound" value should be updated to "Low" on "Thermostat Settings" screen 
When user navigates to "Sound" screen from the "Thermostat Settings" screen
And user changes the "Sound" to "Normal"
And user navigates to "Thermostat Settings" Screen from the "Sound" Screen
Then "Sound" value should be updated to "Normal" on "Thermostat Settings" screen


#HB_Spruce
@HBBChangeVentilationSettings		@P2		@Automated  @--xrayid:ATER-54524
Scenario: As a user I should be able to view options for Ventilation
Given user launches and logs in to the Lyric application
When user navigates to "Ventilation" screen from the "Dashboard" screen
Then user should be displayed with the following "Ventilation" options: 
		| VentilationOptions		| 
		| Off 					| 
		| On   					| 
		| Auto	  				|
When user changes the "Ventilation" to "Off"
And user navigates to "Thermostat Settings" Screen from the "Ventilation" Screen
Then "Ventilation" value should be updated to "Off" on "Thermostat Settings" screen 
When user navigates to "Ventilation" screen from the "Thermostat Settings" screen
And user changes the "Ventilation" to "On"
And user navigates to "Thermostat Settings" Screen from the "Ventilation" Screen
Then "Ventilation" value should be updated to "On" on "Thermostat Settings" screen 
When user navigates to "Ventilation" screen from the "Thermostat Settings" screen
And user changes the "Ventilation" to "Auto"
And user navigates to "Thermostat Settings" Screen from the "Ventilation" Screen
Then "Ventilation" value should be updated to "Auto" on "Thermostat Settings" screen

#Rest wi-fi


#JasperNA, JAsperEMEA
@ResetWiFiNAEMEA		@P2		@NotAutomatable  @--xrayid:ATER-54525
Scenario: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with" PIN Screen"
      | open                | abcd      | none          | 
      | WEP_SHARED          | abcd      | abcd          | 
      | WPA_PERSONAL_TKIP   | abcd      | abcd          | 
      | WPA_PERSONAL_AES    | abcd      | abcd          | 
      | WPA2_PERSONAL_AES   | abcd      | abcd          | 
      | WPA2_PERSONAL_TKIP  | abcd      | abcd          | 
      | WPA2_PERSONAL_MIXED | abcd      | abcd          | 
      | WPA2                | abcd      | abcd          | 


#JasperNA, JAsperEMEA
@ResetWiFiByAddingNetworkNAEMEA		@P2		@NotAutomatable @--xrayid:ATER-54526
Scenario Outline: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with" PIN Screen"
Then user should be displayed with "Select WiFi" screen
When user selects <WiFi SSID> from the available WiFi list
And user inputs <WiFi Password> as the WiFi Password
Then user "wifi name" should be updated to <WiFi SSID> in the "Thermostat WiFi" screen.

Examples: 
      | WiFi SSID | WiFi Password | 
      | abcd      | abcd          | 
 
 
#JasperNA, JAsperEMEA
@ResetWiFiIncorrectPasswordNAEMEA	@P2		@NotAutomatable @--xrayid:ATER-54527
Scenario Outline: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with" PIN Screen"
When user enters the Proper PIN
Then user should be displayed with "Select WiFi" screen
And user selects <WiFi SSID> from the available WiFi list
And user inputs <Incorrect WiFi Password> as the WiFi Password
Then user should receive a "Incorrect WiFi Password" pop up

Examples: 
      | WiFi SSID | Incorrect WiFi Password | 
      | abcd      | abcd                    | 


@ResetWiFiHB			@P2		@NotAutomatable @--xrayid:ATER-54528
Scenario: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with "Select WiFi" screen
      | open                | abcd      | none          | 
      | WEP_SHARED          | abcd      | abcd          | 
      | WPA_PERSONAL_TKIP   | abcd      | abcd          | 
      | WPA_PERSONAL_AES    | abcd      | abcd          | 
      | WPA2_PERSONAL_AES   | abcd      | abcd          | 
      | WPA2_PERSONAL_TKIP  | abcd      | abcd          | 
      | WPA2_PERSONAL_MIXED | abcd      | abcd          | 
      | WPA2                | abcd      | abcd          | 


@ResetWiFiByAddingNetworkHB			@P2		@NotAutomatable @--xrayid:ATER-54529
Scenario Outline: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with "Select WiFi" screen
When user selects <WiFi SSID> from the available WiFi list
And user inputs <WiFi Password> as the WiFi Password
Then user "wifi name" should be updated to <WiFi SSID> in the "Thermostat WiFi" screen.

Examples: 
      | WiFi SSID | WiFi Password | 
      | abcd      | abcd          | 


@ResetWiFiIncorrectPasswordHB		@P2		@NotAutomatable @--xrayid:ATER-54530
Scenario Outline: As a user I want to reset my DAS Panel WiFi 
Given user launches and logs in to the Lyric application 
And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
When user "resets WiFi" by clicking on "Reset WiFi" button  
Then user should be displayed with the "Reset WiFi Instructions" screen
When user presses the center temperature for 5 seconds on the Thermostat
Then the Thermostat should start wifi network
When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
And user connects to thermostat network
Then user should be displayed with "Select WiFi" screen
Examples: 
      | WiFi SSID | Incorrect WiFi Password | 
      | abcd      | abcd                    | 



#Thermostat Configuration 

#JasperNA, JAsperEMEA, HB_Spruce
@RenameJasperNAEMEAHBdevice			@P2			@Automated @--xrayid:ATER-54531
Scenario: As a user I want to rename my thermostat through the application 
Given user launches and logs in to the Lyric application 
And user navigates to "Thermostat Configuration" screen from the "Dashboard" screen 
When user edits the "Thermostat" name to "Test Thermostat Name" 
And user navigates to "Dashboard" screen from the "Thermostat Settings" screen 
Then user should be displayed with "Test Thermostat Name" device on the "dashboard" screen 
And user reverts back the "Thermostat device name" through CHIL


#JasperNA, JAsperEMEA, HB_Spruce
@ViewThermostatconfigurationOptions			@P2			@Automated @--xrayid:ATER-54532
#Precondition: User has set Heating System, Heating Stages, Cooling Stages in Thermostat
Scenario: As a user I want to View my thermostat Configuration details
Given user launches and logs in to the Lyric application 
And user navigates to "Thermostat Configuration" screen from the "Dashboard" screen
Then user should be displayed with the following "Thermostat Configuration" options:
	| ThermostatConfigurationOptions			|
	| NAME									|
	| Firmware Version						|
	| Heating System							|
	| Heating Stages							|
	| Cooling Stages							|
 


#JasperNA, JAsperEMEA, HB_Spruce
@DismissDeletePopupJasperNAEMEAHB			@P4			@Automated @--xrayid:ATER-54533
Scenario: As a user I should be able to dismiss the delete poup for my Japer NA device from my account through the Lyric application
Given user launches and logs in to the Lyric application 
When user navigates to "Thermostat Configuration" screen from the "Dashboard" screen
And user "deletes thermostat" by clicking on "delete" button
Then user should receive a "Delete Thermostat Device Confirmation" popup
And user "dismisses" the "Delete Thermostat Device Confirmation" popup


#Offline

#JasperNA
@JasperNASettingsDisabled			@P2		@NotAutomatable @--xrayid:ATER-54534
Scenario: As a user I should not be allowed to change jasper settings when I am offline 
Given user device is offline
And user launches and logs in to the Lyric application 
And user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be disabled:
      | Options				| 
      | Adaptive recovery	|	
      | Ventilation			|
      | Emergency heat		| 
      | Auto chnageover		|


#HB_Spruce
@HBBSettingsDisabled			@P2		@NotAutomatable  @--xrayid:ATER-54536
Scenario: As a user I should not be allowed to change HBB settings when I am offline 
Given user device is offline
And user launches and logs in to the Lyric application 
And user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be disabled:
      | Options					| 
      | Adaptive recovery		|	
      | Ventilation				|
      | Emergency heat			| 
      | Auto chnageover			|
      | Fine tune				|
      | Frost Protection Mode	|
      | Humidification			|
      | Dehumdification			|
      | Sleep Brightness Mode	|
      | Sound					|


#JasperEMEA
@JasperEmeaSettingsDisabled			@P2		@NotAutomatable @--xrayid:ATER-54538
Scenario: As a user I should not be allowed to change Jasper EMEA settings when I am offline 
Given user device is offline
And user launches and logs in to the Lyric application 
And user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be disabled:
      | Options			| 
      | Optimise			|	
      | Ventilation		|
     

#JasperNA, JasperEMEA, HB_Spruce  
@JasperSettingsEnabledwhenOffline 		@P2		@NotAutomatable @--xrayid:ATER-54539
Scenario: As a user I should be allowed to change Thermostat common settings when I am offline 
Given user device is offline
And user launches and logs in to the Lyric application 
And user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be Enabled:
      | Options					| 
      | Manage Alerts			|	
      | Reset WIFI				|
      | Thermostat Configuration	| 


#JaseprNA, HB_Spruce
@TogglebetweenEmergencyHeatAndAutoChangeOver			@P2			@Automated @--xrayid:ATER-54540
Scenario: As a user I should be able to Toggle between Emergency heat and Auto ChangeOver
Given user launches and logs in to the Lyric application
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Emergency Heat" to "ON"
Then "Auto Changeover" value should be updated to "OFF" on "Thermostat Settings" screen
When user changes the "Auto Changeover" to "ON"
Then "Emergency Heat" value should be updated to "OFF" on "Thermostat Settings" screen