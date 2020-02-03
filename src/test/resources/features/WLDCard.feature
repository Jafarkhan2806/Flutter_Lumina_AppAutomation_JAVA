@WaterLeakDetectorCard
Feature: As user I should be able to View and perform desired actions in Water Leak Detector card 

  Background: 
    Given user launches and logs in to the Lumina application
  
  @DisplayWaterLeakDetectorwithin48hrs @P1 @UIAutomated
  Scenario: 2 As a user I should be shown with required information of my Water Leak Detector card when detector registered just within 48 hours from the time of registration 
  #Given user login to existing account with Water leak detector in location "Home" 
  #And user with water leak detector added within 48 hours 
  And user navigates to "Water Card" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the following Water Leak Detector details:
      | Water Leak Detector | 
      | Device Name         | 
      #| Settings option     | 
      | Temperature Value   | 
      | Humidity Value      | 
  #| Connection Status   | 
  #| Last Updated Time   | 
  #| Battery percentage  | 
  #| Next Update Time    | 
  #And user should be displayed with the "No Alerts" in water leak detector 
  #And user should be displayed with the "Temperature value" in "Fahrenheit"
      And user should be displayed with the "Setup Complete" screen
  #Data will be available after 48 hours
  #And user should be able to select "Options":
  #| Options     | 
  #| Temperature | 
  #| Humidity    | 
  
  @DisplayWaterLeakDetectorafter48hrs @P1 @UIAutomated
  Scenario Outline: As a user I should be shown with required information of my Water Leak Detector card when detector registered before 48 hours from the time of registration 
  #Given user launches and logs in to the Lumina application 
  #And user with water leak detector added before 48 hours 
     Then user should be displayed with the following "Water Leak Detector" details:
      | Water Leak Detector | 
      | Detector Name       | 
      | Settings option     | 
      | Temperature Value   | 
      | Humidity Value      | 
  #| Connection Status   | 
  #| Last Updated Time   | 
  #| Battery percentage  | 
  #| Next Update Time    | 
  #And user should be displayed with "No Alerts" in water leak detector 
  #And user should be displayed with "Temperature value" in "Fahrenheit"
      And user should be displayed with the "Temperature graph" screen
  #When user selects <Options>
  #And user should be displayed with the "Humidity graph"
  #But user should be displayed with the "Temperature graph"
    Examples: 
      | Options     | 
      | Humidity    | 
      | Temperature | 
  
  @TemperatureAndHumidityGraphFivedaysDIY @P3
  Scenario: As a user i should be able to view temperature and humidity temperature graph of my water leak detector within 5 days
    Given user login to existing account with Water leak detector in location "Home" 
      And user with water leak detector added before 5 days 
     Then user should be displayed with the following "Graph" options:
      | Graph Options                         | 
      | Dates of which trend is recorded      | 
      | No of days trend                      | 
      | Maximum and minimum temperature trend | 
      | MAXIMUM 5 dates                       | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
     When user navigates to "humidity graph" screen from the "temperature graph" screen
     Then user should be displayed with the following "Graph" options:
      | Graph Options                      | 
      | Dates of which trend is recorded   | 
      | No of days trend                   | 
      | Maximum and minimum humidity trend | 
      | MAXIMUM 5 dates                    | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
  
  @TemperatureAndHumidityGraphAfterFivedaysDIY @P2
  Scenario: As a user i should be able to view temperature and humidity temperature graph of my water leak detector after 5 days to 30 days
    Given user login to existing account with Water leak detector in location "Home" 
      And user with water leak detector added within 30 days 
     Then user should be displayed with the following "Graph" options:
      | Graph Options                         | 
      | Dates of which trend is recorded      | 
      | No of days trend                      | 
      | Maximum and minimum temperature trend | 
      | MAXIMUM 5 dates                       | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
      And user should be displayed with 5 days trend on moving left or right between 30 days of graph
     When user navigates to "humidity graph" screen from the "temperature graph" screen
     Then user should be displayed with the following "Graph" options:
      | Graph Options                      | 
      | Dates of which trend is recorded   | 
      | No of days trend                   | 
      | Maximum and minimum humidity trend | 
      | MAXIMUM 5 dates                    | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
      And user should be displayed with 5 days trend on moving left or right between 30 days of graph
  
  @TemperatureAndHumidityGraphAfter30daysDIY @P4
  Scenario: As a user i should be able to view temperature and humidity temperature graph of my water leak detector after 30 days
    Given user login to existing account with Water leak detector in location "Home" 
      And user with water leak detector added before 30 days 
     Then user should be displayed with the following "Graph" options:
      | Graph Options                         | 
      | Dates of which trend is recorded      | 
      | No of days trend                      | 
      | Maximum and minimum temperature trend | 
      | MAXIMUM 5 dates                       | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
      And user should be displayed with 5 days trend on moving left or right between 30 days of graph
      And user should be displayed with latest 30 days graph
     When user navigates to "humidity graph" screen from the "temperature graph" screen
     Then user should be displayed with the following "Graph" options:
      | Graph Options                      | 
      | Dates of which trend is recorded   | 
      | No of days trend                   | 
      | Maximum and minimum humidity trend | 
      | MAXIMUM 5 dates                    | 
      And user should be displayed with the high and low temperature on tapping at any point in the graph
      And user should be displayed with 5 days trend on moving left or right between 30 days of graph
      And user should be displayed with latest 30 days graph
  
  @WaterLeakDetectedAppBackground @P1
  Scenario: As a user I should be notified with Water Leak Detected Alert so that i will prompted to take necessary corrective action
  #Given user login to existing account with Water leak detector in location "Home"
     When water leak detector detects "Water Leak Detected"
     Then user should be able to receive push notification for "Water Leak Detected"
     When user selects the "Push notification"
     Then user should be displayed with "Water Leak Detected" card as overlay
      And user should be displayed with Card details:
      | Card details                  | 
      | Red Background                | 
      | Water Leak Detected           | 
      | Time stamp with Detector name | 
      | Mute option                   | 
      | Close option                  | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Water Leak Detected" icon
      And user should be displayed with "Water Leak Detected"
      And user should be displayed with "Siren on"
      And user should be displayed with "Mute Siren" button
     When user minimizes the app or app in backgroud
      And user launches the app again
     Then user should not be displayed with "Water Leak Detected" card as overlay
  
  @WaterLeakDetectedAppForeground @P3
  Scenario: As a user I should be shown with Water Leak Detected Alert as overlay so that i will prompted to take necessary corrective action
    Given user login to existing account with Water leak detector in location "Home"
     When water leak detector detects "Water Leak Detected"
     Then user should be displayed with "Water Leak Detected" card as overlay
      And user should be displayed with Card details:
      | Card details                  | 
      | Red Background                | 
      | Water Leak Detected           | 
      | Time stamp with Detector name | 
      | Mute option                   | 
      | Close option                  | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Water Leak Detected" icon
      And user should be displayed with "Water Leak Detected" 
      And user should be displayed with "Siren on"
      And user should be displayed with "Mute Siren" button
  
  @WaterLeakDetectedMuteSiren @P1
  Scenario: As a user I should be able to mute siren on water leak notification so that i wont get annoyed with sound after i got known water leak in premises 
    Given user login to existing account with Water leak detector in location "Home"
     When water leak detector detects "Water Leak Detected"
     Then user should be able to receive push notification for "Water Leak Detected"
     When user selects the "Push notification"
     Then user should be displayed with "Water Leak Detected" card as overlay
      And user should be displayed with Card details:
      | Card details                  | 
      | Red Background                | 
      | Water Leak Detected           | 
      | Time stamp with Detector name | 
      | Mute option                   | 
      | Close option                  | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Water Leak Detected" icon
      And user should be displayed with "Water Leak Detected"
      And user should be displayed with "Siren on"
      And user should be displayed with "Mute Siren" button
     When user selects "Mute Siren" button
     Then user should be displayed with "Mute may take up to 1 minute pop up"
     Then user should be displayed with "unmute"option
     When user clicks "Water Leak Detected" icon
     Then user should be displayed with "Water Leak Detected" card
      And user should be displayed with Card details:
      | Card details                  | 
      | Red Background                | 
      | Water Leak Detected           | 
      | Time stamp with Detector name | 
      | Unmute option                 | 
      | Close option                  | 
     When user selects "Unmute"
     Then user should be displayed with "UnMute may take up to 1 minute pop up"
     When user clears "water leak alert"
     Then user should be able to receive notification "water leak resolved" notification
      And user should be displayed with "No Alerts" in water leak detector
  
  #Low Battery alert will be received on battery reaches below 25%, 20%,15% & 10%  
  #​  @LowBatterywarning @P1
  #Scenario: As a user i should be shown with Low Battery warning when my water leak detector battery drained below 25
  #Given user login to existing account with Water leak detector in location "Home" 
  #Then user should be displayed with "WLD card" screen
  #And user minimizes the app
  #When water leak detector detects "Low Battery"
  #Then user should be able to receive push notification for "Low battery"
  #When user selects the "Push notification"
  #Then user should be navigates to "Water Leak Detector" screen
  #And user should be displayed with "Low battery with percentage" with Alert icon
  #When user clicks "Alert" icon
  #Then user should be displayed with "Low battery" card
  #And user should be displayed with Card details:
  #| Card details                  | 
  #| White Background              | 
  #| Time stamp with Detector name | 
  #| Close option                  | 
  #| Replace Batteries             | 
  #When user clicks "Replace Batteries" 
  #Then user should be displayed with "Replace Batteries" screen
  #When user clicks on "Back" button button
  #Then user should be displayed with "Low battery" card
  #When user clicks "Close" 
  #Then user should be navigates to "Water Leak Detector" screen
  #And user user should be displayed with "Low battery with percentage" with Alert icon
  
  #@CriticalBatterywarning @P1
  #Scenario: As a user i should be shown with critical Battery warning when my water leak detector battery drained below 5%
  #Given user login to existing account with Water leak detector in location "Home" 
  #Then user should be displayed with "WLD card" screen
  #And user minimizes the app
  #Low Battery alert will be received on battery reaches below 5%  
  #When water leak detector detects "Critical Battery"
  #Then user should be able to receive push notification for "Critical battery"
  #When user selects the "Push notification"
  #Then user should be navigates to "Water Leak Detector" screen
  #And user should be displayed with "Critical battery with percentage" with Alert icon
  #When user clicks "Alert" icon
  #Then user should be displayed with "Critical battery" card
  #And user should be displayed with Card details:
  #| Card details                  | 
  #| White Background              | 
  #| Time stamp with Detector name | 
  #| Close option                  | 
  #| Replace Batteries             | 
  #When user clicks "Replace Batteries" 
  #Then user should be displayed with "Replace Batteries" screen
  #When user clicks on "Back" button button
  #Then user should be displayed with "Critical battery" card
  #When user clicks "Close" 
  #Then user should be navigates to "Water Leak Detector" screen
  #And user user should be displayed with "Critical battery with percentage" with Alert icon 
  #When user replaces the batteries
  #Then user should be able to receive notification "Critical battery resolved" notification
  #And user should be displayed with "No Alerts" in water leak detector
  
  @OfflineAlert @P1
  Scenario: As a user i should be shown with offline alert when my water leak detector went offline
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
      And user minimizes the app
     When water leak detector reports "Offline"
     Then user should be able to receive push notification for "Offline"
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Offline"
      And user should be displayed with "Detector with Alert" icon
     When user clicks "Detector with Alert" icon
     Then user should be displayed with "Offline" card
      And user should be displayed with Card details:
      | Card details                  | 
      | White Background              | 
      | Time stamp with Detector name | 
      | Close option                  | 
      | Troubleshooting               | 
     When user  clicks on "Troubleshooting" 
     Then user should be displayed with "Troubleshooting FAQ's" Screen
     When user navigates to "Email" Screen from "Troubleshooting FAQ's" Screen
     Then user should be able to send "Email"
     When user taps on "cancel"
     Then user should be displayed with "Troubleshooting FAQ's" Screen
     When user taps on "Call option"
     Then user should be displayed with " Call pop up"
     When user tap on "cancel"
     Then user should be displayed with "Troubleshooting FAQ's" Screen
     When user taps on "Call option"
     Then user should be displayed with " Call pop up"
     When user tap on "call"
     Then user should be navigated to "Phone app"
     When user clicks on "Back" button button
     Then user should be displayed with "Offline" card
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Detector with Alert" icon 
      And user should be displayed with "Offline"
     When water leak detector restored to Online
     Then user should be able to receive notification "Online" notification
      And user should be displayed with "No Alerts" in water leak detector      
  #
  #
  @WLDSettings  @P1
  Scenario: 7 As a user after registration I should be having required default options enabled in device settings screen 
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
     Then user should be displayed with the following Leak Detector Settings details: 
      | Leak Detector Settings | 
      | Manage Alerts          | 
      | Temperature Unit       | 
      | Update Frequency       | 
      | About My Droplet       | 
      #And user should not be displayed with "Auto Shutoff" screen
  #And user should be displayed with "Temperature Unit" as "Fahrenheit"
     When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with the "Manage Alerts" screen
      And user should be displayed with the following Manage Alert details:
      | Manage Alerts              | 
      #| Temperature Alerts | 
      | Temperature above          | 
      | Temperature below          | 
      #| Humidity Alerts   | 
      | Humidity above             | 
      | Humidity below             | 
  #| Email Enabled              | 
      #| Push Enabled | 
   And user clicks on "Back" button 
  When user navigates to "Update Frequency" screen from the "Settings" screen
  Then user should be displayed with the "Update Frequency" screen
  And user should be enabled with "Recommended"
  And user clicks on "Back" button
  When user navigates to "About My Droplet" screen from the "Settings" screen
  Then user should be displayed with About Device details: 
  | About Device    | 
  | Mac ID          | 
  | Installed Day   | 
  #| DETECTOR NAME       | 
  #| Online Status   | 
  #| Signal Strength | 
  #| Battery Value   | 
  
  @ChangeTemperatureUnit @P1 @UIAutomated
  Scenario: 8 As a user I should be able to change my water leak detector Temperture Unit 
    #Given user login to existing account with Water leak detector in location "Home" 
     #Then user should be displayed with "WLD card" screen
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user selects "Temperature Unit" with "Celcius" 
     #Then user should be displayed with "Temperature Unit" as "Celcius" 
     #When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be disabled with "Temperature Alerts"
      And user should be displayed with the following Manage Alert details:
      | Manage Alerts              | 
      #| Temperature Alerts  | 
      | Temperature above          | 
      | Temperature below          | 
      #| Humidity Alerts     | 
      | Humidity above             | 
      | Humidity below             | 
     #When user selects "Temperature above" value "drop box"
     #Then user should be displayed with "Temperature above" range from "0.5C" to "60C"
     #When user selects "Temperature below" value "drop box"
     #Then user should be displayed with "Temperature below" range from "0.0C" to "59.5C"
      And user navigates to "Water Leak Detector" screen from the "Manage Alerts" screen
     #Then user should be displayed with "Temperature value" in "Celcius"
     When user navigates to "Settings option" screen from the "Water Leak Detector" screen
      And user selects "Temperature Unit" with "Fahrenheit" 
       And user should be displayed with the following Manage Alert details:
      | Manage Alerts              | 
      #| Temperature Alerts  | 
      | Temperature above          | 
      | Temperature below          | 
      #| Humidity Alerts     | 
      | Humidity above             | 
      | Humidity below             | 
     #When user selects "Temperature above" value "drop box"
     #Then user should be displayed with "Temperature above" range from "33F" to "140F"
     #When user selects "Temperature below" value "drop box"
     #Then user should be displayed with "Temperature below" range from "32F" to "139F"
      And user navigates to "Water Leak Detector" screen from the "Manage Alerts" screen
     #Then user should be displayed with "Temperature value" in "Fahrenheit"

  @TemperatureAlert @P1
  Scenario Outline: As a user I should be able to change the temperature range to get above or below alerts when my water leak detector detects the alert
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Temperature Alerts" as " Enabled"
     When user selects "Alert for this Temperature Range" from "Manage Alerts" screen
     Then user should be displayed with the following "Alert for this Temperature Range" options: 
      | Humidity Alert Range Options | 
      | Below                        | 
      | Above                        | 
     When user clicks on "Below Range" in "Temperature" Alerts
      And user clicks on "Above Range" in "Temperature" Alerts
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be able to see updated values in "Alert for this Temperature Range" when user changes "Below" values in Alert Range
     Then user should be able to see updated values in "Alert for this Temperature Range" when user changes "Above" values in Alert Range
     When water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
  
    Examples: 
      | Alert            | 
      | High Temperature | 
      | Low Temperature  | 
  
  @TemperatureAlertDismiss @P1
  Scenario Outline: As a user I should be able to dismiss the above or below alerts when my water leak detector detects the alert
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss" 
     Then <Alert> card Dismissed
      And user should be navigates to "Water Leak Detector" screen
      And user should be not displayed with <Alert> with Alert icon
      And user should be displayed with "All Good"  
    Examples: 
      | Alert            | 
      | High Temperature | 
      | Low Temperature  | 
  
  @TempratureReAlert @P1
  Scenario Outline: As a user I should be re alerted with alert next day after i dismisses above or below alerts 
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss" 
     Then <Alert> card Dismissed
      And user should be navigates to "Water Leak Detector" screen
      And user should be not displayed with <Alert> with Alert icon
      And user should be displayed with "All Good" 
     When Next day
     Then user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
    Examples: 
      | Alert            | 
      | High Temperature | 
      | Low Temperature  | 
  
  @TemperatureAlertUpended @P3
  Scenario Outline: As a user I should be upended with alert when new above or below alerts detected by water leak detector
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When water leak detector detects <New Alert>
     Then user should be able to receive push notification for <New Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Temperature Value     | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
    Examples: 
      | Alert            | New Alert        | 
      | High Temperature | Low Temperature  | 
      | Low Temperature  | High Temperature | 
  
  @DisableTemperatureAlert @P1 @UIAutomated
  Scenario: 4 As a user I should be able to disable temperature Alert 
    #Given user login to existing account with Water leak detector in location "Home" 
     #Then user should be displayed with "WLD card" screen
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be disabled with "Temperature Alerts"
     And user should be disabled with "Temperature Below value"
      And user should be disabled with "Temperature Above value"
     #When user disables "Temperature Alerts" from "Manage Alerts" screen
     When user clicks on "Back" button
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "No" button
     Then user should be displayed with the "Settings Option" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be enabled with "Temperature Alerts"
     When user should be disabled with "Temperature Alerts"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button 
     Then user should be displayed with the "Manage Alerts" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be disabled with "Temperature Alerts"
     And user should be disabled with "Temperature Below value"
      And user should be disabled with "Temperature Above value"
  
  @EnableTemperatureAlert @P1
  Scenario: 3 As a user I should be able to enable temperature Alert if it is disabled
    #Given user login to existing account with Water leak detector in location "Home" 
     #Then user should be displayed with "WLD card" screen
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     And user should be disabled with "Temperature Alerts"
     Then user should be enabled with "Temperature Alerts"
     And user should be displayed with the following Manage Alert details:
      | Manage Alerts              | 
      | Temperature Alerts | 
      | Temperature above          | 
      | Temperature below          | 
     When user clicks on "Back" button
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "No" button
     Then user should be displayed with the "Settings Option" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be disabled with "Temperature Alerts"
     When user should be enabled with "Temperature Alerts"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button 
     Then user should be displayed with the "Manage Alerts" screen
      And user should be enabled with "Temperature Alerts"
     And user should be displayed with the following Manage Alert details:
      | Manage Alerts              | 
      | Temperature Alerts | 
      | Temperature above          | 
      | Temperature below          |
  
  @TemperatureAlertRange @P3
  Scenario: As a user I should be adjusted with next below value automatically if my above value is less than below value and vice versa for below
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Temperature Alerts" as " Enabled"
     When user selects "Alert for this Temperature Range" from "Manage Alerts" screen
     Then user should be displayed with the following "Alert for this Temperature Range" options: 
      | Temperature Alert Range Options | 
      | Below                           | 
      | Above                           | 
     When user clicks on "Above Range" in "Temperature" Alerts 
      And user selects "Above value" below than "Below value"
     Then user should be able to see "Below value" updated automatically to below than "Above value" 
     When user clicks on "Below Range" in "Temperature" Alerts 
      And user selects "Below value" above than "Above value"
     Then user should be able to see "Above value" updated automatically to above than "Below value"
  
  @HumidityAlert @P1
  Scenario Outline: As a user I should be able to change the humidity range to get above or below alerts when my water leak detector detects the alert
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Humidity Alerts" as " Enabled"
     When user selects "Alert for this Humidity Range" from "Manage Alerts" screen
     Then user should be displayed with the following "Alert for this Humidity Range" options: 
      | Humidity Alert Range Options | 
      | Below                        | 
      | Above                        | 
     When user clicks on "Below Range" in "Humidity" Alerts
      And user clicks on "Above Range" in "Humidity" Alerts
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Below" values in Alert Range
     Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Above" values in Alert Range
     When water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
  
    Examples: 
      | Alert         | 
      | High Humidity | 
      | Low Humidity  | 
  
  @HumidityAlertDismiss @P1
  Scenario Outline: As a user I should be able to dismiss the above or below alerts when my water leak detector detects the alert
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss" 
     Then <Alert> card Dismissed
      And user should be navigates to "Water Leak Detector" screen
      And user should be not displayed with <Alert> with Alert icon
      And user should be displayed with "All Good"  
    Examples: 
      | Alert         | 
      | High Humidity | 
      | Low Humidity  | 
  
  @MultipleAlert @P2
  Scenario: As a user I should be shown with summary of alerts in the system when water leak detector is with multiple alerts
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects "Water Leak Detected"
      And water leak detector detects "High Temperature"
      And water leak detector detects "Low humidity"
      And water leak detector detects "Low battery"  
     Then user should be able to receive push notification for "Water Leak Detected"
      And user should be able to receive push notification for "High Temperature"
      And user should be able to receive push notification for "Low Humidity"
      And user should be able to receive push notification for "Low Battery"
     When user selects the "Push notification"
     Then user should be displayed with "Alert Summary" card
      And user should be displayed with Card details:
      | Card details             | 
      | Red Background           | 
      | Water Leak Detected Tile | 
      | High Temperature Tile    | 
      | Low Humidity Tile        | 
      | Low Battery Tile         | 
      | Close option             | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Water Leak Detected" icon
      And user should be displayed with "Water Leak Detected"
      And user should be displayed with "Siren on" 
     When user clicks "Water Leak Detected Tile"
      And user should be displayed with Card details:
      | Card details                  | 
      | Red Background                | 
      | Water Leak Detected           | 
      | Time stamp with Detector name | 
      | Unmute option                 | 
      | Close option                  | 
     When user clears "water leak alert"
     Then user should be able to receive notification "water leak resolved" notification
     When user selects the "Push notification"
     Then user should be displayed with "System with 3 Alerts" with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with "Alert Summary" card
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details          | 
      | Orange Background     | 
      | High Temperature Tile | 
      | Low Humidity Tile     | 
      | Low Battery Tile      | 
      | Close option          | 
     When user clicks "High Temperature Tile" 
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | High Temperature value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss"
     Then user should be displayed with Card details:
      | Card details          | 
      | Orange Background     | 
      | High Temperature Tile | 
      | Low Humidity Tile     | 
      | Low Battery Tile      | 
      | Close option          | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "System with 2 Alerts"with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with "Alert Summary" card
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details      | 
      | Orange Background | 
      | Low Humidity Tile | 
      | Low Battery Tile  | 
      | Close option      | 
     When user clicks "Low Humidity Tile" 
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Low Humidity value            | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss"
     Then user should be displayed with Card details:
      | Card details      | 
      | Orange Background | 
      | Low Humidity Tile | 
      | Low Battery Tile  | 
      | Close option      | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with "Low battery with percentage"with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with "Low battery" card
      And user should be displayed with Card details:
      | Card details                  | 
      | White Background              | 
      | Battery Percentage            | 
      | Time stamp with Detector name | 
      | Close option                  | 
      | Replace Batteries             | 
     When user clicks "Close" 
     Then user should be navigates to "Water Leak Detector" screen
      And user user should be displayed with "Low battery with percentage" with Alert icon 
     When user replaces the batteries
     Then user should be able to receive notification "Low battery resolved" notification
      And user should be displayed with "No Alerts" in water leak detector    
  
  @HumidityReAlert @P1
  Scenario Outline: As a user I should be re alerted with alert next day after i dismisses above or below alerts 
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss" 
     Then <Alert> card Dismissed
      And user should be navigates to "Water Leak Detector" screen
      And user should be not displayed with <Alert> with Alert icon
      And user should be displayed with "All Good" 
     When Next day
     Then user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
    Examples: 
      | Alert         | 
      | High Humidity | 
      | Low Humidity  | 
  
  @HumidityReAlertBelow @P1
  Scenario Outline: As a user I should be re alerted with alert next day after i dismisses above or below alerts 
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When user clicks "Dismiss" 
     Then <Alert> card Dismissed
      And user should be navigates to "Water Leak Detector" screen
      And user should be not displayed with <Alert> with Alert icon
      And user should be displayed with "All Good" 
     When Next day
     Then user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
    Examples: 
      | Alert         | 
      | High Humidity | 
      | Low Humidity  | 
  
  @HumidityAlertUpended @P3
  Scenario Outline: As a user I should be upended with alert when new above or below alerts detected by water leak detector
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
     When water leak detector detects <New Alert>
     Then user should be able to receive push notification for <New Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
    Examples: 
      | Alert         | New Alert     | 
      | High Humidity | Low Humidity  | 
      | Low Humidity  | High Humidity | 
  
  @DisableHumidityAlert @P1 @UIAutomated
  Scenario: 6 As a user I should be able to disable humidity Alert 
    #Given user login to existing account with Water leak detector in location "Home" 
     #Then user should be displayed with "WLD card" screen
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be enabled with "Humidity Alerts"
     When user should be disabled with "Humidity Alerts"
     And user should be disabled with "HUMIDITY BELOW VALUE"
     And user should be disabled with "HUMIDITY ABOVE VALUE"
     When user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "No" button
     Then user should be displayed with the "Settings option" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be enabled with "Humidity Alerts"
     When user should be disabled with "Humidity Alerts"
      And user clicks on "Back" button
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with the "Manage Alerts" screen
     #When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be disabled with "Humidity Alerts"
      And user should be disabled with "HUMIDITY BELOW VALUE"
     And user should be disabled with "HUMIDITY ABOVE VALUE"
  
  @EnableHumidityAlert @P1 @UIAutomated
  Scenario: 5 As a user I should be able to enable humidity Alert if it is disabled
    #Given user login to existing account with Water leak detector in location "Home" 
     #Then user should be displayed with "WLD card" screen
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be disabled with "Humidity Alerts"
     When user should be enabled with "Humidity Alerts"
     And user should be enabled with "HUMIDITY BELOW VALUE"
     And user should be enabled with "HUMIDITY ABOVE VALUE"
     When user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "No" button
     Then user should be displayed with the "Settings option" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be disabled with "Humidity Alerts"
     When user should be enabled with "Humidity Alerts"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with the "Manage Alerts" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be enabled with "Humidity Alerts"
    And user should be enabled with "HUMIDITY BELOW VALUE"
     And user should be enabled with "HUMIDITY ABOVE VALUE"
  
  @HumidityAlertRange @P3
  Scenario: As a user I should be adjusted with next below value automatically if my above value is less than below value and vice versa for below
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be enabled with "Humidity Alerts"
     #When user selects "Alert for this Humidity Range" from "Manage Alerts" screen
     Then user should be displayed with the following Manage Alert details: 
      | Humidity Alert Range Options | 
      | Humidity Below                        | 
      | Humidity Above                        | 
     When user clicks on "Above Range" in "Humidity" Alerts 
      And user selects "Above value" below than "Below value"
     Then user should be able to see "Below value" updated automatically to below than "Above value" 
     When user clicks on "Below Range" in "Humidity" Alerts 
      And user selects "Below value" above than "Above value"
     Then user should be able to see "Above value" updated automatically to above than "Below value"
  
  @EnableDisablePushNotifications @P2
  Scenario: As a user I should be able to disable or enable push notifications for water leak detector humidity and temperature alerts based on my need
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Push Notification" as " Enabled"
     When user unchecks the "Push Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks "No" in "Save Changes"
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Push Notification" as " Enabled"
     When user unchecks the "Push Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Push Notification" as " Disabled" 
     When user triggers low/high humidity or temperature alert
     Then user should not receive email for the alerts
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Push Notification" as " Disabled"
     When user checks the "Push Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Push Notification" as " Enabled" 
     When user triggers low/high humidity or temperature alert
     Then user should receive email for the alerts
  
  @EnableDisableEmailNotifications @P2
  Scenario: As a user I should be able to disable or enable Email notifications for water leak detector humidity and temperature alerts based on my need
    Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Email Notification" as " Enabled"
     When user unchecks the "Email Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks "No" in "Save Changes"
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Email Notification" as " Enabled"
     When user unchecks the "Email Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Email Notification" as " Disabled" 
     When user triggers low/high humidity or temperature alert
     Then user should not receive email for the alerts
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Email Notification" as " Disabled"
     When user checks the "Email Notification" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
      And user should be displayed with "Email Notification" as " Enabled" 
     When user triggers low/high humidity or temperature alert
     Then user should receive email for the alerts
  
  @SetUpdateFrequency @P1
  Scenario: As a user I should be able to set Update frequency to one time or two time or three time per day based on my desire to get the updates from water leak detector
    Given user login to existing account with Water leak detector in location "Home" 
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
      And user navigates to "Update Frequency" screen from the "Settings" screen
     Then user should be displayed with  "Update Frequency" as " Daily" 
     When user selects the "Update Frequency" to "Twice Daily"
      And user clicks on "Back" button
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "No" button
     Then user should be displayed with the "Settings option" screen
     When user navigates to "Update Frequency" screen from the "Settings" screen
      And user should be displayed with  "Update Frequency" as " Daily"
     When user selects the "Update Frequency" to "Twice Daily"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with the "Settings" screen
     When user navigates to "Update Frequency" screen from the "Settings" screen
      And user should be displayed with  "Update Frequency" as " Twice Daily" 
     When user selects the "Update Frequency" to "Twice Daily"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with message "Changes may take up to 24 hours to effect"
      And user should be displayed with the "Settings" screen
     When user navigates to "Update Frequency" screen from the "Settings" screen
      And user should be displayed with  "Update Frequency" as " Twice Daily" 
     Then Temperature,Humidity,Battery value,Online status will get along with alerts than water leak in every 12 hours
     Then user should be updated with Next Update Time in Water Leak Detector screen based on frequency and it may take maximum of 24 hours
     When user selects the "Update Frequency" to "Three times Daily"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with message "Changes may take up to 24 hours to effect"
      And user should be displayed with the "Settings" screen
     When user navigates to "Update Frequency" screen from the "Settings" screen
      And user should be displayed with  "Update Frequency" as " Three times Daily" 
     Then Temperature,Humidity,Battery value,Online status will get along with alerts than water leak in every 8 hours
     Then user should be updated with Next Update Time in Water Leak Detector screen based on frequency and it may take maximum of 12 hours
     When user selects the "Update Frequency" to "Daily"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with message "Changes may take up to 24 hours to effect"
      And user should be displayed with the "Settings" screen
     When user navigates to "Update Frequency" screen from the "Settings" screen
      And user should be displayed with  "Update Frequency" as " Three times Daily" 
     Then Temperature,Humidity,Battery value,Online status will get along with alerts than water leak in every 24 hours 
     Then user should be updated with Next Update Time in Water Leak Detector screen based on frequency and it may take maximum of 8 hours
  
  @AboutDevice  @P2 @UIAutomated
  Scenario: As a user I should be shown with my Water Leak Detector device important informations 
    #Given user login to existing account with Water leak detector in location "Home" 
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "About Device" screen from the "Settings" screen
     Then user should be displayed with the About Device details: 
      | About Device    | 
      | Mac ID          | 
      | Installed Day   | 
      | Basement        | 
      | Online Status   | 
      | Signal Strength | 
      | Battery Value   | 
  
  @RenameWLDdevice  @P2
  Scenario: As a user I should be able to rename my water leak detector with new name on my desire
    Given user login to existing account with Water leak detector in location "Home" 
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "About Device" screen from the "Settings" screen
     When user edits the "Water Leak Detector" name to "Test WLD Name" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks "No" in "Save Changes"
     Then user should be displayed with "About Device" screen
      And user should be displayed with detector name as "Previous name" 
     When user edits the "Water Leak Detector" name to "Test WLD Name"
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "About Device" screen
      And user should be displayed with detector name as "Test WLD Name"
     When user navigates to "Settings" screen from the "About Device" screen
      And user navigates to "Water Leak Detector" screen from the "Settings" screen 
     Then user should be displayed with detector name as "Test WLD Name" 
  
  #Account should have two WLDs with one named as "Test WLD Name" and other named as "Test"
  @RenameWLDWithDuplicatename @P4
  Scenario: As a user I should be shown with error message when i enter a duplicate name for my water leak detector
    Given user login to existing account with multiple Water leak detector in location "Home" 
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "About Device" screen from the "Settings" screen
     When user edits the "Water Leak Detector" name to "Existing Another Water Leak Detector Name" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Name Already exist Error " popup
     When user clicks "Ok" in "Name Already exist Error " popup
     Then user should be displayed with "About Device" screen
      And user should be displayed with detector name as "Previous name" 
  
  @WLDNameInvalidCriteria @P3
  Scenario: As a user I should be shown with error message when i enter a duplicate name for my water leak detector
    Given user login to existing account with Water leak detector in location "Home" 
      And user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "About Device" screen from the "Settings" screen
     When user edits the "Water Leak Detector" name to "Invalid Criteria" 
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Invalid Name" popup
     When user clicks "Ok" in "Invalid Name" popup
     Then user should be displayed with "About Device" screen
      And user should be displayed with detector name as "Previous name" 
  
  #Having both category one(Water leak,Offline) and category two Alerts(Humidity,Temperature,Low battery)
  @DeleteLeakDetectorFromLocationWithSingleDetector @P1
  Scenario Outline: As a user I should be able to delete my Water Leak Detector device from my account using lumina application 
    Given user login to existing account with Water leak detector in location "Home" 
      And user with Detector <Status> 
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user "clicks" on "Delete Leak Detector"
     Then user should be displayed with "Delete Device" popup 
     When user "cancel" the "Delete Device" 
     Then user should be displayed with "Settings" screen 
      And user should be retained with his detector
     When user "confirm" the "Delete Device" 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Status           | 
      | Offline          | 
      | No Leak          | 
      | Leak Detected    | 
      | Low Humidity     | 
      | High Temperature | 
      | Memory Error     | 
      | Critical battery | 
      | Low battery      | 
  
  

      
 @FahrenheitToCelcius
  Scenario: As a user I should be able to set preferred measuring units for multiple devices- Fahrenheit to Celsius independent of the phone’s settings
	 When user navigates to "Water Card" screen from the "Add New Device Dashboard" screen
     	And user sees the wld dashboard
		And  user navigates to "Settings Option" screen from the "Water Leak Detector" screen 
    	And  user selects "Temperature Unit" to "Celcius"                                   
     Then user clicks on "BACK" button	
     And user sees the wld dashboard									
    	And user should see temperature in Celcius											   



@StatusOfHome
Scenario: As a user I should have a quick access to view the status of Home
	When user navigates to "Water Card" screen from the "Add New Device Dashboard" screen
	Then user should see a quick view the following:
  	| Device Home   | 
	| Device Status | 
	| Temperature value |
	| Humidity value| 
	| Battery value |



@HumidityTimeStamp
Scenario: As a user I should be able to see the humidity reading and time stamp of the Humidity sync time
	When user navigates to "Water Card" screen from the "Add New Device Dashboard" screen
	Then user should see the following in WLD main screen:
	| Device Home   | 
	| Humidity value| 
	| Last Updated | 
	| Next Updated |


@EnableManageAlert
Scenario: As a User I should be able to enable manage alerts
	Then user should be displayed with "WLD card" screen
     When user navigates to "Settings" screen from the "Water Leak Detector" screen
      And user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be displayed with "Humidity Alerts" as " Enabled"
     When user selects "Alert for this Humidity Range" from "Manage Alerts" screen
     Then user should be displayed with the following "Alert for this Humidity Range" options: 
      | Humidity Alert Range Options | 
      | Below                        | 
      | Above                        | 
     When user clicks on "Below Range" in "Humidity" Alerts
      And user clicks on "Above Range" in "Humidity" Alerts
      And user clicks on "Back" button 
     Then user should be displayed with the "Save Changes" popup
     When user clicks on "Yes" button
     Then user should be displayed with "Settings" screen
     When user navigates to "Manage Alerts" screen from the "Settings" screen
     Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Below" values in Alert Range
     Then user should be able to see updated values in "Alert for this Humidity Range" when user changes "Above" values in Alert Range
     When water leak detector detects <Alert>
     Then user should be able to receive push notification for <Alert>
     When user selects the "Push notification"
     Then user should be navigates to "Water Leak Detector" screen
      And user should be displayed with <Alert> with Alert icon
     When user clicks "Alert" icon
     Then user should be displayed with <Alert> card
      And user should be displayed with Card details:
      | Card details                  | 
      | Orange Background             | 
      | Current Humidity Value        | 
      | Time stamp with Detector name | 
      | Dismiss option                | 
      | Close option                  | 
  
@DeviceOfflineEvent
Scenario: As a User I should get device offline event if device is not communicating for more than 24 hours
	 Given user login to existing account with Water leak detector in location "Home" 
     Then user should be displayed with "WLD card" screen
      And user minimizes the app
     When water leak detector reports "Offline"
     Then user should be able to receive push notification for "Offline"
     When user navigates to "Settings Option" screen from the "Water Leak Detector" screen
  	 And user navigates to "Update Frequency" screen from the "Settings" screen
  	 And user selects the "Update Frequency" to "Twice Daily"
  	 Then user should be able to receive push notification for "Water Leak Detected"
  	 
      
     






























	
	
	