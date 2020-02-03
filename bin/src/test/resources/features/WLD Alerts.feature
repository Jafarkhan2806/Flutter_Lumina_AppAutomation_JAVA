@WLDAlerts
Feature: WLD Alerts
  As user I should be able to View my Water Leak Detector alerts on my Solution card and dashboard


@WalerLeakDetected @NotAutomatable @--xrayid:ATER-53894
Scenario: As a user I should be able view Water Leak Detected Alert on my dashboard and solution card
Given user launches and logs in to the Lyric application 
And user creates "Water leak Alert"
When user lands on"Dashboard" screen 
Then user should be able to see "Water Leak Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Water Leak Alert" On "Solution card" screen
And user should be displayed with "Water Leak" Notification
And user should be displayed with "Water Leak detected Since time"
And user should be displayed with "Mute Option"
When user selects "Mute"
Then user should be displayed with "Mute may take up to 1 minute pop up"
When user "accepts" the popup
Then user should be displayed with "unmute"option
When user selects"Unmute"
Then user should be displayed with "UnMute may take up to 1 minute pop up"
When user clears "water leak alert"
Then user should receive "water leak resolved" notification
And user should be able to see "Water leak clear status" on "solution card" Screen
When user navigates to "Dashboard" screen from "Solution Card" screen
Then user should see the "Water leak status cleared"


@ViewHighHumiditywarning @NotAutomatable @--xrayid:ATER-53895
Scenario: As a user i should be able to view High humidity warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "High humidity"
When user lands on"Dashboard" screen 
Then user should be able to see "high humidity Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " High Humidity Alert" On "Solution card" screen
And user should be displayed with "High Humidity Since time"
And user should be able to see "Dismiss" Option
When user "Dismisses" the "high humidity alert"
Then user should be displayed with "temperature/humidiy graph" on "solution card" Screen
And user shoul dbe displayed with "Temperature and humidity values" on "dashboard" Screen


@ViewLowHumiditywarning @NotAutomatable @--xrayid:ATER-53896
Scenario: As a user i should be able to view Low humidity warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "Low humidity"
When user lands on"Dashboard" screen 
Then user should be able to see "Low humidity Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Low Humidity Alert" On "Solution card" screen
And user should be displayed with "Low Humidity Since time"
And user should be able to see "Dismiss" Option
When user "Dismisses" the "Low humidity alert"
Then user should be displayed with "Temperature/humidiy graph" on "solution card" Screen
And user shoul dbe displayed with "Temperature and humidity values" on "dashboard" Screen

 
@ViewHighTemperaturewarning @NotAutomatable @--xrayid:ATER-53897
Scenario: As a user i should be able to view High Temperature warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "High Temperature"
When user lands on"Dashboard" screen 
Then user should be able to see "High Temperature Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " High Temperature Alert" On "Solution card" screen
And user should be displayed with "High Temperature Since time"
And user should be able to see "Dismiss" Option
When user "Dismisses" the "High Temperature alert"
Then user should be displayed with "Temperature/humidiy graph" on "solution card" Screen
And user shoul dbe displayed with "Temperature and humidity values" on "dashboard" Screen


@ViewLowTemperaturewarning @NotAutomatable @--xrayid:ATER-53898
Scenario: As a user i should be able to view Low Temperature warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "Low Temperature"
When user lands on"Dashboard" screen 
Then user should be able to see "Low Temperature Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Low Temperature Alert" On "Solution card" screen
And user should be displayed with "Low Temperature Since time"
And user should be able to see "Dismiss" Option
When user "Dismisses" the "Low Temperature alert"
Then user should be displayed with "Temperature/humidiy graph" on "solution card" Screen
And user should be displayed with "Temperature and humidity values" on "dashboard" Screen


@ViewLowBatterywarning @NotAutomatable @--xrayid:ATER-53899
Scenario: As a user i should be able to view Low Battery warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "Low Battery"
When user lands on"Dashboard" screen 
Then user should be able to see "Low Battery Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Low Battery Alert" On "Solution card" screen
And user should be displayed with "Low Battery Since time"
When user "Clears" the "Low Battery alert"
Then user should be displayed with "Temperature/humidiy graph" on "Solution card" Screen
And user shoul dbe displayed with "Temperature and humidity values" on "Dashboard" Screen

@ViewCriticalBatterywarning @NotAutomatable @--xrayid:ATER-53900
Scenario: As a user i should be able to view Critical battery warning on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "Critical Battery"
When user lands on"Dashboard" screen 
Then user should be able to see "Critical Battery Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Critical Alert" On "Solution card" screen
And user should be displayed with "Critical Battery Since time"
When user "Clears" the "Critical Battery alert"
Then user should be displayed with "Temperature/humidiy graph" on "Solution card" Screen
And user should be displayed with "Temperature and humidity values" on "Dashboard" Screen

@ViewOfflineAlert @NotAutomatable @--xrayid:ATER-53901
Scenario: As a user i should be able to view Offline Alert on my Solution Card and dashboard
Given user launches and logs in to the Lyric application 
And user creates "Device Offline"
When user lands on"Dashboard" screen 
Then user should be able to see "Offline Alert" on "Dashboard" screen
When user navigates to "Solution Card" Screen from "Dashboard" Screen
Then user should be able to see " Offline Alert" On "Solution card" screen
And user should be displayed with "Offline Since time"
And user Should be displayed with "troubleshooting" Option
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
When user "Clears" the "Offline alert"
Then user should be displayed with "Temperature/humidiy graph" on "Solution card" Screen
And user shoul dbe displayed with "Temperature and humidity values" on "Dashboard" Screen