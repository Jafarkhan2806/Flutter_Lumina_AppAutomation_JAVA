@DASDIY
Feature: DAS DIY Registration
As a user I want to register a DAS device using the Lyric application

@DIYRegistrationWhenSingleBaseStationIsAvailable123	 	@P1
Scenario Outline: As a user I want to register a DAS device using the Lyric application by disabling geofencing and ignorning alexa setup
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "dismisses" the "Delete DAS Confirmation" popup
Then user "deletes DAS device" by clicking on "delete" button
And user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |
      | Home                                    | Kitchen                         |