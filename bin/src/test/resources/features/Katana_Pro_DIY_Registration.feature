@KATANADIY
Feature: KATANA DIY Registration
As a user I want to register a KATANAß device using the Lyric application

@KatanaDIYRegistrationWithNewCustomLocationAndBaseStationName		@P1	@--xrayid:ATER-92470  @Automated 
  Scenario Outline: As a user I want to register a KATANA Pro device with new location and base station name using the Lyric application
    Given user DAS device with ADB ID "6094c4a6" is deregistered and booted
      And user launches and logs in to the Lyric application
     When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
      And user selects "Smart Home Security Pro" from "Add New Device" screen
     When user navigates to "Choose Location" screen from the "What To Expect" screen
      And user selects "Create New Location" from "Choose Location" screen
     Then user should be displayed with the "Create Location" screen
     When user inputs <new location name> in the "Create Location" screen
     Then user should be displayed with the "Confirm Your ZIP Code" screen
     When user inputs <valid zip code>
     Then user should be displayed with the "Name Your Base Station" screen
     When user selects "Create New Base Station" from "Name Your Base Station" screen
     Then user should be displayed with the "Create New Base Station" screen
     When user inputs <new device name> in the "Create New Base Station" screen
     Then user should be displayed with the "Power Base Station" screen
      And user selects "Not Pulsing Blue" from "Power Base station" screen
     Then user should be displayed with the "Base Station Help" screen
  #And user should be displayed with Customer Care number on the bottom of the screen
     When user navigates to "Power Base station" screen from the "Base station Help" screen
     Then user navigates to "Register Base Station" screen from the "Power Base Station" screen
  #When user scans the QR code by showing it to the base station camera
     Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
     When user selects "HHET-5G" from "Connect to Network" screen
      And user inputs "homeET@123" as the WiFi Password
      And user should be displayed with the "Your Security Provision" screen
     Then user should be displayed with the "Congratulations" screen
      And user should be displayed with the "Pro Monitoring" screen
      And user should be displayed with the "Pro Monitoring setup is complete" screen
      And user should be displayed with the "Alarm Signal Test" screen
     Then verify if alarm signal test from dealer is <CompletedStatus>
     And user should be displayed with the "Congratulations alarm test" screen
     When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
     Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
     When user navigates to "People Detection" screen from the "Enable Amazon Alexa" screen
     Then user navigates to "Dashboard" screen from the "People Detection" screen
  #And user creates a passcode if required
  #And user disables the passcode through CHIL
     Then user should be displayed with "Security" device on the "dashboard" screen
      And user should be displayed with <new device name> device on the "dashboard" screen
     When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
      And user "deletes DAS device" by clicking on "delete" button
  #Then user should receive a "Delete DAS Confirmation" popup
     When user "accepts" the "Delete DAS Confirmation" popup
     Then user should not be displayed with "Security" device on the "dashboard" screen
      And user should not be displayed with <new device name> device on the "dashboard" screen
     Then user "deletes location details" by clicking on "delete" button
  
    Examples: 
      | new location name | new device name | invalid zip code | valid zip code | CompletedStatus     | 
      | California        | Scrum Room      | 555555           | 90001          | Partially Confirmed |
  #  | Texas                       | War Room              | 555555                       | 73301                 | |
  # | Texas#$%                    | Ball Room             | 555555                       | 73301                 | |
  
