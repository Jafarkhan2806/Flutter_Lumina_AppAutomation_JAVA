@WLDSettings 
Feature: WLD Settings 
  As user I should be able to control my WLD settings from the app

@VerifyWLDSettings @Automated @--xrayid:ATER-53786
Scenario: As a user I want to verify that all WLD Settings options are available to me 
Given user launches and logs in to the Lyric application  
And user navigates to "WLD Settings" screen from the "Dashboard" screen
Then user should be displayed with the following "Leak Detector Settings" options: 
      | Settings					| 
      | Manage Alerts				|
      | Battery Status				|
      |	Temperature Unit			|
      | Update Frequency			|					 
      | Leak Detector Configuration |

#Manage Alerts 

@EnableDisableIndoorTemperatureAlertInWLDSettings @Automated @--xrayid:ATER-53787
Scenario: As a user I should be able to enable or disable Indoor Temperature Alert on my WLD
Given user launches and logs in to the Lyric application  
When user navigates to "WLD Manage Alerts" screen from the "Dashboard" screen
And user changes the "Indoor Temperature Alerts" to "ON"
Then "WLD Indoor Temperature Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "WLD Indoor Temperature Alert" options: 
| WLD Manage Alerts Options| 
| Email for enabled alerts | 
| Alert for this range     |
When user changes the "Indoor Temperature Alerts" to "OFF"
Then "WLD Indoor Temperature Alert" value should be updated to "OFF" on "Manage Alerts" screen

@EnableDisableEmailNotifications @NotAutomatable @--xrayid:ATER-53851
Scenario: As a user I should be able to enable or disable EmailForEnabledAlerts on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
And user changes the "Indoor Temperature Alerts" to "ON"
And user changes the "Email Notifications" to "ON"
Then "Email Notifications" value should be updated to "ON" on "Manage Alerts" screen
When user creates "Alerts"
Then user should receive "Email Alert"
When user changes the "Email Notifications" to "OFF"
Then "Email Notifications" value should be updated to "OFF" on "Manage Alerts" screen
When user creates "Alerts"
Then user should not receive "Email Alert"

@WLDChangeAlertForThisRangeforTemperature @AutomatedforAndroidOnly @--xrayid:ATER-53852
Scenario: As a user I should be able to change Alert For This Range on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "WLD Manage Alerts" screen from the "Dashboard" screen
And user changes the "Indoor Temperature Alerts" to "ON"
And user selects "Alert for this Temperature Range" from "WLD Manage Alerts" screen
Then user should be displayed with the following "Alert for this Temperature Range" options: 
| Temperature Alert Range Options	| 
| Below 	| 
| Above		|
When user clicks on "Below Range" in "Temperature" Alerts
Then user should be able to see updated values in "Alert for this Temperature Range" when user changes "Below" values in Alert Range
#And user should be able to receive push notification for below range
When user clicks on "Above Range" in "Temperature" Alerts
Then user should be able to see updated values in "Alert for this Temperature Range" when user changes "Above" values in Alert Range
#And user should be able to receive push notification for Above range
#When user selects the "Push notification"
#Then user should be navigates to "SolutionCard"

@EnableDisableIndoorHumidityAlert  @Automated @--xrayid:ATER-53853
Scenario: As a user I should be able to enable or disable Indoor Humidity Alert on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "WLD Manage Alerts" screen from the "Dashboard" screen
And user changes the "WLD Indoor Humidity Alert" to "ON"
Then "WLD Indoor Humidity Alert" value should be updated to "ON" on "Manage Alerts" screen
And user should be displayed with the following "WLD Indoor Humidity Alert" options: 
| WLD Manage Alerts Options| 
| Email for enabled alerts | 
| Alert for this range     |
When user changes the "WLD Indoor Humidity Alert" to "OFF"
Then "WLD Indoor Humidity Alert" value should be updated to "OFF" on "Manage Alerts" screen

@EnableDisableEmailForEnabledAlertsforHumidity @NotAutomatable @--xrayid:ATER-53854
Scenario: As a user I should be able to enable or disable EmailForEnabledAlerts for Humidity on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "Manage Alerts" screen from the "Dashboard" screen
And user changes the "WLD Indoor Humidity Alert" to "ON"
And user changes the "Email Notifications" to "ON"
When user creates "Alerts"
Then user should receive "Email Alert"
Then "Email Notifications" value should be updated to "ON" on "Manage Alerts" screen
When user changes the "Email Notifications" to "OFF"
Then "Email Notifications" value should be updated to "OFF" on "Manage Alerts" screen
When user creates "Alerts"
Then user should not receive "Email Alert"

@ChangeAlertForThisRangeforHumididty @AutomatedforAndroidOnly @--xrayid:ATER-53855
Scenario: As a user I should be able to change Alert For This Range on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "WLD Manage Alerts" screen from the "Dashboard" screen
And user changes the "WLD Indoor Humidity Alert" to "ON"
When user selects "Alert for this Humidity Range" from "WLD Manage Alerts" screen
Then user should be displayed with the following "Alert for this Humidity Range" options: 
| Humidity Alert Range Options	| 
| Below 	| 
| Above		|
When user clicks on "Below Range" in "Humidity" Alerts
Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Below" values in Alert Range
#And user should be able to receive push notification for below range
When user clicks on "Above Range" in "Humidity" Alerts
Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Above" values in Alert Range
#And user should be able to receive push notification for Above range
#When user selects the "Push notification"
#Then user should be navigates to "SolutionCard"

@SetEmailContacts @Automated @--xrayid:ATER-53856
Scenario: As a user I should be able set email contacts on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "Email Notifications" screen from the "Dashboard" screen
Then verify if user is able to see enterred "Email ID" in the Email display part:
|Email|
|Valid Email ID|
|Invalid Email ID|

@ChangeTemperatureUnit @Automated @--xrayid:ATER-53857
Scenario: As a user I should be able to set Temperture Unit on my WLD
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard 
Then verify Temperature Unit is changed as per the "Temperature Unit" selected below:
|Options|
|Fahrenheit|
|celsius|

@SetUpdateFrequency @Automated @--xrayid:ATER-53858
Scenario: As a user I should be able to set Update frequency on my WLD
Given user launches and logs in to the Lyric application
When user navigates to "Update Frequency" screen from the "Dashboard" screen
And user changes the "Update Frequency" to "Daily"
And user navigates to "Leak Detector Settings" screen from the "WLD Solution Card" screen
Then "Update Frequency" value should be updated to "Daily" on "Leak Detector Settings" screen
And user navigates to "Update Frequency" screen from the "WLD Settings" screen
When user changes the "Update Frequency" to "Twice Daily"
And user navigates to "Leak Detector Settings" screen from the "WLD Solution Card" screen
Then "Update Frequency" value should be updated to "Twice Daily" on "Leak Detector Settings" screen
And user navigates to "Update Frequency" screen from the "WLD Settings" screen
When user changes the "Update Frequency" to "Three Times Daily"
And user navigates to "Leak Detector Settings" screen from the "WLD Solution Card" screen
Then "Update Frequency" value should be updated to "Three Times Daily" on "Leak Detector Settings" screen
#Please add after update and selects back button > pop up validation  " Changes may take up to 24 hours to effect"

#Leak Detector Configuration 

@RenameWLDdevice  @Automated @--xrayid:ATER-53859
Scenario: As a user I want to rename my wld through the application 
Given user launches and logs in to the Lyric application 
When user selects "WLD device" from the dashboard
And user navigates to "Leak Detector Configuration" screen from the "WLD Solution card" screen
When user edits the "Water Leak Detector" name to "Test WLD Name" 
And user navigates to "Dashboard" screen from the "Leak Detector Configuration" screen 
Then verify the Edited name on "WLD Dashboard" screen
#user reverts back to Original device name
When user selects "WLD Renamed device" from the dashboard
And user navigates to "Leak Detector Configuration" screen from the "WLD Solution card" screen
When user edits the "Water Leak Detector" name to "Original Name" 
And user navigates to "Dashboard" screen from the "Leak Detector Configuration" screen 
Then verify the Edited name on "WLD Dashboard" screen

@RenameWLDWithDuplicatename @Automatedwithtwowlds @--xrayid:ATER-53860
#Account should have two WLDs with one named as "Test WLD Name" and other named as "Test"
Scenario: As a user I want to get a error message when i enter a duplicate name for my wld
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard
And user navigates to "Leak Detector Configuration" screen from the "WLD Solution card" screen
When user edits the "Water Leak Detector" name to "Test WLD Name" 
And user navigates to the "Previous" screen 
Then user should receive a "DUPLICATE NAME ERROR" popup

@ViewLeakDetectorconfigurationOptions @Automated @--xrayid:ATER-53861
Scenario: As a user I want to View my wld Configuration details
Given user launches and logs in to the Lyric application 
And user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen 
Then user should be displayed with the following "Leak Detector Configuration" options:
|Configuration|
|Leak Detector Name|
|Firmware Details|
|Delete Leak Detector|

@DeleteLeakDetector @NotAutomatable @--xrayid:ATER-53862
Scenario: As a user I should be able to delete my WLD device from my account through the Homes application 
Given user launches and logs in to the Homes application 
When user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen 
And user "Deletes Leak Detector" by clicking on "Delete" button
And user should receive a "Delete Device Confirmation" popup
Then user "Dismisses" the "Delete Device Confirmation" popup
When user "Deletes Leak Detector" by clicking on "Delete" button
And user should receive a "Delete Device Confirmation" popup
And user "Accepts" the "Delete Device Confirmation" popup
Then WLD should be deleted
And user should be displayed with "Dashboard" With "Add new Device" Option

@DeleteLeakDetectorwhenDeviceOffline @NotAutomatable @CogIconNotVissible @--xrayid:ATER-53863
Scenario: As a user I should be able to delete my WLD device from my account through the Homes application 
Given user launches and logs in to the Homes application 
When user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen
And user "Deletes Leak Detector" by clicking on "Delete" button
And user should receive a "Delete Device Confirmation" popup
Then user "Dismisses" the "Delete Device Confirmation" popup
When user "Deletes Leak Detector" by clicking on "Delete" button
And user should receive a "Delete Device Confirmation" popup
And user "Accepts" the "Delete Device Confirmation" popup
Then WLD should be deleted
And user should be displayed with "Dashboard" With "Add new Device" Option


