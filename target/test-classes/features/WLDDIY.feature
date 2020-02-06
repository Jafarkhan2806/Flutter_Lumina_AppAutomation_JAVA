@WLDDIY
Feature: Water Leak Detector Onboarding to Resideo Account
As a Resideo user I should be able to onboard water leak detector device using lumina app

  Background: 
    Given user "Enroll" wld device
    And user launches and logs in to the Lumina application
   # Given  user launches and logs in to the Lumina ios application
  
  @WLDDIYAccessToLocationServicesMobileDevice	 @P3
  Scenario Outline: As a user during water leak detector registration I should be prompted with Location services popup when location services access is turned off at mobile device
    Given user with <Available Location>
      And user "Phone location service" is turned "Off" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
      But user navigates to "Water Leak Detector Setup" screen by selecting "Add Device" from <Screen>
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with the "Location Access" screen
     When user clicks on "Next" button
     Then user should receive a "Mobile Location services is off" popup
     When user clicks on "Ok" in "Mobile Location servicess is off" popup
      And user "Phone location service" is turned "On"
      And user clicks on "Next" button
     Then user should receive a "App Location services" popup 
     When user "allows access" in "App Location services" popup
     Then user should be displayed with <Location> screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Available Location | Location        | Screen     | 
      | No Location        | Create Location | WLD card   | 
      | Existing Location  | Choose Location | WLD card   | 
      | No Location        | Create Location | Water card | 
      | Existing Location  | Choose Location | Water card | 
  
  @WLDDIYDenyAppAccessToLocationServices	 @P4
  Scenario Outline: As a user during water leak detector registration I should be prompted with Location services popup when location services access is denied for lumina app
    Given user with <Available Location>
      And user "Phone location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should receive a "App Location services" popup     
     When user "denies access" in "Location services" popup
     Then user should be displayed with "Add New Device Dashboard" screen
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should receive a "App Location services" popup 
     When user "allows access" in "App Location services" popup
     Then user should be displayed with <Location> screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Available Location | Location        | 
      | No Location        | Create Location | 
      | Existing Location  | Choose Location | 
  
  @WLDDIYDenyAppAccessToLocationServicesWithDontAsk	@P4
  Scenario Outline: As a user during water leak detector registration I should be prompted with Location services error popup when location services access is denied and checked dont ask option for lumina app
    Given user with <Available Location>
      And user "Phone location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should receive a "App Location services" popup     
     When user selects on "won't ask again" in " App Location services" popup
      And user "denies access" in "Location services" popup
     Then user should be displayed with "Add New Device Dashboard" screen
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should receive a "App Location services is off" popup
     When user clicks on "Ok" in "App Location servicess is off" popup
     Then user should be displayed with the "Water Leak Detector Setup" screen
    Examples: 
      | Available Location | 
      | No Location        | 
      | Existing Location  | 
  
  @WLDDIYRegistrationDuplicateLocationAndWLDNames @P4
  Scenario: As a user during water leak detector registration I should be shown with error popup when user inputs with existing location and WLD name
    Given user with Existing Location
      And user with Existing Detector
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
      And user inputs "Existing location name" in the "Create Location" screen
     Then user should receive a "Existing Location Error" popup
     When user clicks on "OK" in the "Existing Location Error" popup
     Then user should be displayed with the "Create Location" screen
     When user enters "New location name" in "Create Location" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "Existing device name" in the "Detector Name" screen
     Then user should receive a "Existing Detector Error" popup
     When user clicks on "OK" in the "Existing Detector Error" popup
     Then user should be displayed with the "Detector Name" screen
     When user selects "New detector name" from "Detector Name" screen
     Then user should be displayed with the "Power Detector" screen     
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
  
  @WLDDIYWhenUserEntersMaxCharactersInCustomLocationAndDetectorName @P4
  Scenario Outline: As a user during water leak detector registration I should be assisted to not input the invalid matching criteria for providing location name and device name
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
     When user inputs <Location Invalid Criteria> in the "Create Location" screen
     Then user should be shown with message on invalid criteria 
     When user clicks on "OK" in the "Invalid Location data Error" popup
     Then user should be displayed with "Create Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
      And user selects "Create Custom Name" from "Detector Name" screen
      And user inputs <Device Name Invalid Criteria> in the "Create Custom Name" screen
     Then user should be shown with message on invalid criteria 
     When user clicks on "OK" in the "Invalid Location data Error" popup 
     Then user should be displayed with the "Detector Name" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Location Invalid Criteria | Device Name Invalid Critera | 
      | Enter max characters      | Enter max characters        | 
  
  @WLDDIYRegistrationWithInvalidZipcode	@P3
  Scenario Outline: As a user during water leak detector registration I should be shown with error pop up on inputting the invalid Zipcode using the Lumina application
    Given user selects <Country>
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
     When user inputs <Invalid Zip Code>
     Then user should receive a "Invalid zip code" popup
     When user "dismisses" the "Invalid zip code" popup
     Then user should be shown with message on invalid criteria 
     When user clicks on "OK" in the "Invalid Location data Error" popup
     Then user should be displayed with "Create Location" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen 
    Examples: 
      | Country       | Invalid Zip Code | 
      | United States | 560103           | 
      | Canada        | 560078           | 
  
  @WLDDIYRegistrationWithPrePopulatingLocationDetails	@P3
  Scenario Outline: As a user during water leak detector registration I should be able to add location with name and the Lumina application should auto fill the location informations like Zipcode etc
    Given user selects <Country>
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
  #The Create Location screen should have all Location fields auto filled, Country option should be greyed out
     When user inputs "Location Name" in the "Create Location" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
      And user should be displayed with "Location Name"
  #The location should be created for all zip codes in the supported country list 
    Examples: 
      | Country       | 
      | United States | 
      | Canada        | 
  
  @WLDDIYRegistrationByEditingPrePopulatingLocation	@P3
  Scenario Outline: As a user during water leak detector registration I should be able to add location by editing the auto filled location informations like Zipcode etc
    Given user selects <Country>
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
  #The Create Location screen should have all Location fields auto filled, Country option should be greyed out
     When user inputs "Location Name" in the "Create Location" screen
      And user edits "Location Fields" with "Valid Zip code"
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
      And user should be displayed with "Location Name"
  #The location should be created for all zip codes in the supported country list 
    Examples: 
      | Country       | 
      | United States | 
      | Canada        | 
  
  @WLDDIYRegistrationBluetoothPopup @P4
  Scenario: As a user during water leak detector registration I should be shown with error popup when phone bluetooth service is off
    Given user with Location "Home"
      And user with No detector
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "Off" 
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "Detector name" from "Detector Name" screen
     Then user should be displayed with the "Power Detector" screen
     When user clicks on "Next" button
     Then user should receive a "Turn on Bluetooth" popup
     When user clicks on "OK" in the "Turn on Bluetooth" popup
     Then user should be displayed with the "Power Detector" screen
     When user "Phone Bluetooth service" is turned "On"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
  
  @WLDDIYWhenNoWLDAreAvailable @P2
  Scenario: As a user during water leak detector registration I should be prompted with Detector Not Found popup when there are no detector 
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user clicks on "Next" button
     Then user should receive a "Detector Not Found" popup
     When user clicks "Retry" in the "Detector Not Found" popup
     Then user should receive a "Detector Not Found" popup
     When user clicks on "OK" in the "Detector Not Found" popup
     Then user should be displayed with the "Power Detector" screen
      And user clicks on "It's Not Blinking" in the "Power Detector" screen
      And user should be displayed with the "Detector Help" screen
     When user selects "Back arrow" from "Detector Help" screen
     Then user should be displayed with the "Power Detector" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
  
  @WLDDiscoveryWhenMultipleWLDAreAvailable @P2
  Scenario: As a user during water leak detector registration I should be shown with list of Water Leak Detector when multiple detector is available for bluetooth pairing
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned all more than one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with the "Select Detector" screen with "List of devices"
     When user clicks "Refresh" in the "Select Detector" screen
     Then user should be displayed with the "Select Detector" screen with "List of devices"
     When user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen 
  
  @WLDDIYRegistrationWhenAlreadyWLDisRegistered @P4
  Scenario Outline: As a user during water leak detector registration I should be shown with message already my WLD is registered and i am trying to add once again
    Given Detector is registered to the <Account> in Location "Home"
      And Login to the <Account> 
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects <Location> from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned on Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with the "Connect (WLD-8 Screen)" screen 
  # Status should be as Detector found, Detector paired with greyed out and Connecting the Detector
      And user should be displayed with "Device Already Registered Error"Pop up
     When user clicks on "ok" button in "Device Already Registered Error"Pop up
     Then user should be displayed with "Add new device" Screen
    Examples: 
      | Account                       | Location | 
      | Device Registered Account     | Home     | 
      | Device Registered Account     | Office   | 
      | Device Not Registered Account | Home     | 
  
  @WLDDIYBluetoothTimeoutInWLDDevice @P3
  Scenario Outline: As a user during water leak detector registration I should be prompted with Bluetooth disconnected popup when bluetooth timeout happens in WLD device
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user user navigates to <Registration> screen from the "Power Detector" screen
      And user waits until timeout happens in WLD device
     Then user should receive a "Detector Connection Error" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Power Detector" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Registration           | 
      | Connect(WLD-12 Screen) | 
      | Enter Password         | 
      | New Network            | 
      | Select Network         | 
      | Connect(WLD-12 Screen) | 
  
  @WLDDIYBluetoothDisconnect @P4
  Scenario Outline: As a user during water leak detector registration I should be prompted with Bluetooth disconnected popup when WLD device is disconnected
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user user navigates to <Registration> screen from the "Power Detector" screen
      And user disconnects the WLD DEvice by removing the battery
     Then user should receive a "Detector Connection Error" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Power Detector" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Registration           | 
      | Connect(WLD-12 Screen) | 
      | Enter Password         | 
      | New Network            | 
      | Select Network         | 
      | Connect (WLD-8 Screen) | 
  
  @WLDDIYInternetDisconnect  @P3
  Scenario Outline: As a user during water leak detector registration I should be prompted with InternetFailed popup when WLD device is disconnected on Internet Connection Failed
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
     When user user navigates to "Select Network" screen
      And user selects "Network" from "Select Network" screen
      And user enters "Valid Password"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-12 Screen)" screen
      And user should be displayed with "Connect (WLD-12 Screen)" screen with <Status>
     When user disconnects the internet source to which WLD connected
     Then user should receive a "On Internet Failed" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Select Network" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
    Examples: 
      | Status                    | 
      | Connecting to internet    | 
      | Activating the Connection | 
      | Finalizing the setup      | 
  
  @WLDDIYRegistrationNewaccount @P1 
  Scenario Outline: As a user I should be able to add WLD device by creating new account using Lumina application  
    Given user "Phone location service" is turned "Off"
      And user "Phone Bluetooth service" is turned "Off"
     When user selects "Create Account" from "Login" screen
     Then user should be displayed with the "Activate Account" screen
      And user receives activation link to the mail id
     When user accepts the user activation from mail 
     Then user should be displayed with "Add New Device Dashboard" screen
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with the "Location Access" screen
     When user "Phone location service" is turned "On"
      And user clicks on "Next" button
     Then user should receive a "App Location services" popup 
     When user "allows access" in "App Location services" popup 
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Create Location" button
     Then user should be displayed with "Create Location" screen
  #The Create Location screen should have all Location fields auto filled, Country option should be greyed out
     When user inputs "Location Name" in the "Create Location" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with the "Bluetooth" screen
     When user "Phone Bluetooth service" is turned "On"
      And user clicks on "Next" button 
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
     When user user navigates to "Select Network" screen
      And user selects "Network" from "Select Network" screen
      And user enters "Valid Password"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-12 Screen)" screen
     When user clicks on "Next" button
     Then user should be displayed with "Congratulation" screen
     When user clicks on "Done" button
     Then user should be displayed with "Alert Settings" screen
     When user clicks on "Next" button
  #Then user should not be displayed with BUOY, Water Leak Detector integration FTUE screens
     Then user should be displayed with "Placement Overview" screen
     When user clicks on "Next" button
     Then user should be displayed with "WLD card" screen
  
  @WLDDIYRegistrationToExistingLocation @P1 
  Scenario: 1 As a user I should be able to add WLD device to existing location by using Lumina application   
  #Given user "Phone location service" is turned "On" 
  #And user "App location service" is turned "On" 
  #And user "Phone Bluetooth service" is turned "On"
  #And user login to Existing account with Location "Home"
     #When user "Enroll" wld device
     And user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     And user clicks on "Next" button
     When user should be displayed with the "Choose Location" screen
     And user selects "LOCATION NAME" from "Choose Location" screen
  #And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "DETECTOR NAME" from "Detector Name" screen
  #And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
      And user clicks on "Next" button
     And user should be displayed with the "Connect" screen
     And user should be displayed with the "SELECT NETWORK" screen
      When user selects "appsec2.4" from "CONNECT TO NETWORK" screen
      And user inputs "Appsecacc24" in the "Password" Screen
      And user clicks on "Next" button
     Then user should be displayed with the "CONNECT WIFI" screen
     Then user should be displayed with the "Congratulations" screen
     When user clicks on "Done" button
     Then user should be displayed with the "Manage Alerts" screen
     And user clicks on "Next" button
     Then user should be displayed with the "Placement Overview" screen
     And user clicks on "Next" button
     And user deletes WLD Device from App
     And user clicks on "Yes" button
  #Then user should not be displayed with BUOY, Water Leak Detector integration FTUE screens
  #Then user should be displayed with "Placement Overview" screen
  #When user clicks on "Next" button
  #Then user should be displayed with "WLD card" screen 
    
  
  @WLDDIYRegistrationWithAvailableDetectorName @P4 @UIAutomated
  Scenario Outline: As a user I should be able to add WLD device to existing location using Lumina application by selecting pre populated Water Leak Detector name
    Given user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     And user clicks on "Next" button
     When user should be displayed with the "Choose Location" screen
     And user selects "LOCATION NAME" from "Choose Location" screen
  #And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects <Detector Name> from "Detector Name" screen
      And user should be displayed with the "Power Detector" screen
      And user clicks on "Next" button
     And user should be displayed with the "Connect" screen
     And user should be displayed with the "SELECT NETWORK" screen
      When user selects "appsec2.4" from "CONNECT TO NETWORK" screen
      And user inputs "Appsecacc24" in the "Password" Screen
      And user clicks on "Next" button
     Then user should be displayed with the "CONNECT WIFI" screen
     Then user should be displayed with the "Congratulations" screen
     Then user should be disabled with "Temperature Alerts"
      And user should be disabled with "Temperature Below value"
      And user should be disabled with "Temperature Above value"
      And user should be disabled with "Humidity Alerts"
      And user should be disabled with "HUMIDITY BELOW VALUE"
      And user should be disabled with "HUMIDITY ABOVE VALUE"
     When user clicks on "Done" button
     Then user should be displayed with the "Manage Alerts" screen
     And user clicks on "Next" button
     Then user should be displayed with the "Placement Overview" screen
     And user clicks on "Next" button
     And user deletes WLD Device from App
     And user clicks on "Yes" button
    Examples: 
      | Detector Name   | 
      | Basement        | 
      #| Laundry Room    | 
      #| Garage          | 
      #| Master Bathroom | 
      #| Guest Bathroom  | 
      #| Water Filter    | 
      #| Water Heater    | 
      #| Kitchen Sink    | 
      #| Refrigerator    | 
      #| Dishwasher      | 
      #| Furnance        | 
  
  @WLDDIYRegistrationByAddNetwork @P2 @UIAutomated
  Scenario Outline: As a user I should be able to register WLD device by adding network using Lumina application  
    Given user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     And user clicks on "Next" button
     When user should be displayed with the "Choose Location" screen
     And user selects "LOCATION NAME" from "Choose Location" screen
  #And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "DETECTOR NAME" from "Detector Name" screen
  #And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
      And user clicks on "Next" button
     And user should be displayed with the "Connect" screen
     And user should be displayed with the "SELECT NETWORK" screen
      And user selects "Add New Network" from "CONNECT TO NETWORK" screen
     Then user should be displayed with the "Add New Network" screen 
     And user clicks on <Security> button
      And user inputs "A1" in the "SSID" Screen
      And user inputs "Vijay1987" in the "Password" Screen
      And user clicks on "Next" button
     Then user should be displayed with the "Congratulations" screen
     When user clicks on "Done" button
     Then user should be displayed with the "Manage Alerts" screen
     And user clicks on "Next" button
     Then user should be displayed with the "Placement Overview" screen
     And user clicks on "Next" button
     And user deletes WLD Device from App
     And user clicks on "Yes" button
    Examples: 
      | Security             | 
      | WEP Personal           | 
      | WEP Share||
      | WPA Personal(AES)    | 
      | WPA Personal(TKIP)   | 
      | WPA2 Personal(AES)   | 
      | WPA2 Personal(TKIP)  | 
      | WPA2 Personal(Mixed) | 
      | WPS Secure           | 
  
  @WLDDIYRegistrationWithInvalidPassword	 	@P2 
  Scenario: As a user I should be able to add a WLD device by connecting to available network after trying to connect with invalid password
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
  # user mistakenly selects wrong network and realaized it after getting the error
     When user user navigates to "Select Network" screen
      And user selects "Network" from "Select Network" screen
      And user enters "Invalid Password"
      And user clicks on "Next" button
     Then user should receive a "Incorrect Password" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Enter Password" screen
     When user clicks on "Eye" button
     Then user should be displayed with the "Invalid Password" 
     When user enters "Valid Password"
     Then user should be displayed with the "Valid Password"
     When user clicks on "Eye" button
     Then user should be displayed with the "Eye" button stricked
     Then user should not be displayed with the "Valid Password"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-12 Screen)" screen
     When user clicks on "Next" button
     Then user should be displayed with "Congratulation" screen
     When user clicks on "Done" button
     Then user should be displayed with "Alert Settings" screen
     When user clicks on "Next" button
  #Then user should not be displayed with BUOY, Water Leak Detector integration FTUE screens
     Then user should be displayed with "Placement Overview" screen
     When user clicks on "Next" button
     Then user should be displayed with "WLD card" screen
  
  @WLDDIYRegistrationWithInvalidNetwork	 	@P3 
  Scenario: As a user I should be able to add a WLD device by connecting to available network after trying to connect with invalid network details
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
  # user mistakenly selects wrong network and realaized it after getting the error
     When user user navigates to "Select Network" screen
      And user selects "Network" from "Select Network" screen
      And user enters "Invalid Password"
      And user clicks on "Next" button
     Then user should receive a "Incorrect Password" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Enter Password" screen
     When user selects "Back arrow" from "Enter Password" screen
     Then user should be displayed with the "Select Network" screen
     When user selects "Network" from "Select Network" screen
      And user enters "Valid Password"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-12 Screen)" screen
     When user clicks on "Next" button
     Then user should be displayed with "Congratulation" screen
     When user clicks on "Done" button
     Then user should be displayed with "Alert Settings" screen
     When user clicks on "Next" button
  #Then user should not be displayed with BUOY, Water Leak Detector integration FTUE screens
     Then user should be displayed with "Placement Overview" screen
     When user clicks on "Next" button
     Then user should be displayed with "WLD card" screen   
  
  @WLDDIYAddAWiFiNetworkWithInvalidNetworkCancelSetup	 	@P4 
  Scenario: As a user I should be able to cancel registration of WLD device when connecting to network with invalid Wi-Fi network details
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
  # user mistakenly entered the invalid network with security 
     When user user navigates to "Select Network" screen
      And user selects "Add New Network" from "Select Network" screen
     Then user should be displayed with the "New Network" screen 
      And user enters "SSID"
      And user selects "Security"
      And user clicks on "Next" button
     Then user should receive a "Incorrect Password" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Enter Password" screen
     When user selects "Back arrow" from "Enter Password" screen
     Then user should be displayed with the "Select Network" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
  
  @WLDDIYRegistrationByConnectingToOpenWiFiNetwork @P2
  Scenario: As a user I should not be able to connect to a open Wi-Fi network and able to perform WLD registration
    Given user with Location "Home"
      And user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
     When user navigates to "Water Leak Detector Setup" screen from the "Add New Device Dashboard" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user selects "Home" from "Choose Location" screen
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
  # user selects open network 
     When user user navigates to "Select Network" screen
      And user selects "Open Network" from "Select Network" screen
     Then user should receive a "Should not connect to Open network" popup
     When user clicks on "OK" button
     Then user should be displayed with the "Select Network" screen
     When user clicks on "Cancel" button 
     Then user should be displayed with "Add New Device Dashboard" screen
  
  @WLDDIYMultipleWLDRegistrationsInLocation		@P1 
  Scenario: As a user I should be able to register multiple WLD devices in a single location using the Lyric application
    Given user "Phone location service" is turned "On" 
      And user "App location service" is turned "On" 
      And user "Phone Bluetooth service" is turned "On"
      And user launches the Lumina application
      And user login to existing account with Water leak detector in location "Home"
     Then user should be displayed with "WLD Card" screen
     When user navigates to "Water Leak Detector Setup" screen from the "WLD card" screen
     Then user should be displayed with the "Water Leak Detector Setup" screen
     When user clicks on "Next" button
     Then user should be displayed with "Choose Location" screen
     When user clicks on "Home" in the "Choose Location" button
      And user clicks on "Next" button
     Then user should be displayed with the "Detector Name" screen
     When user selects "Basement" from "Detector Name" screen
      And user clicks on "Next" button
     Then user should be displayed with the "Power Detector" screen
     When user turned one Water Leak detector for bluetooth pairing
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-8 Screen)" screen
     When user selects "Network" from "Select Network" screen
      And user enters "Valid Password"
      And user clicks on "Next" button
     Then user should be displayed with "Connect (WLD-12 Screen)" screen
     When user clicks on "Next" button
     Then user should be displayed with "Congratulation" screen
     When user clicks on "Done" button
     Then user should be displayed with "Alert Settings" screen
     When user clicks on "Next" button
  #Then user should not be displayed with BUOY, Water Leak Detector integration FTUE screens
     Then user should be displayed with "Placement Overview" screen
     When user clicks on "Next" button
     Then user should be displayed with "Water card" screen   
  
  @ResumeWLDDIYRegistrationByNavigatingToOtherApp		@P3 
  Scenario Outline: As a user I should be able to resume with registration of WLD device using Lumina application even after navigating to other apps intermediatly
    Given user with Existing Location
      And user navigates to "Water Leak Detector Setup" screen by selecting "Add Device" from "WLD card"
     When user navigates to <Screen> 
     Then user should be displayed with the <Screen>
     When user navigated out of the app
  #Attending call ,Decline Call, Clicking on notification, Minimize and access other app
      And user launches Lumina application
     Then user should be displayed with the <Screen> 
    Examples: 
      | Screen                    | 
      | Water Leak Detector Setup | 
      | Location Access           | 
      | Choose Location           | 
      | Detector Name             | 
      | Power Detector            | 
      | Detector Help             | 
      | Bluetooth                 | 
      | Connect(WLD-8 Screen)     | 
      | New Network               | 
      | Enter Password            | 
      | Connect(WLD-12 Screen)    | 
  
  @WLDDIYConfigurationVerifyBackArrowFunctionality    @P4 
  Scenario Outline: Verify the Back arrow functionality in Water Leak Detector registration flow screens
    Given user with Existing Location    
     When user navigates to the <CurrentScreen>
      And user selects "Back arrow" from <CurrentScreen>
     Then user should be displayed with the <PreviousScreen> 
  
    Examples: 
      | CurrentScreen             | PreviousScreen            | 
      | Water Leak Detector Setup | Add New Device Dashboard  | 
      | Location Access           | Water Leak Detector Setup | 
      | Choose Location           | Water Leak Detector Setup | 
      | Create Location           | Choose Location           | 
      | Detector Name             | Choose Location           | 
      | Power Detector            | Detector Name             | 
      | Bluetooth                 | Power Detector            | 
      | Connect                   | Power Detector            | 
      | New Network               | Select Network            | 
      | Enter Password            | Select Network            | 
  
