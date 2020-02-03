@DIYRegistration-NA
Feature: DIY Registration
As an user I want to register my Flycatcher NA thermostat and connect to wifi

@DIYNewAccount
  Scenario: Complete DIY registration with new user account
    Given user has Location <Service> in mobile device
     When user create new account by selecting <Country> and activate
      And user selects the <Thermostat> to be installed 
      And User Creats a "Customize" Location 
      And User Selects the "Flycatcher Device"
      And User enter Pin code displayed on the Screen
     Then Verify "Registration Progress" is displayed
      And Verify "Registration Succesfull" is displayed
  
  @DIYExistingAccount
  Scenario: Complete DIY registration with existing user account
    Given user launches and logs in to the Lyric application
     When user selects the <Thermostat> to be installed
      And User Chooses"Customize" Location 
      And User Selects the "Flycatcher Device"
      And User enter "Valid Pincode" displayed on the Screen
     Then Verify "Registration Progress" is displayed
      And Verify "Registration Succesfull" is displayed
  
  @DIYEwithMulipltestatdisplayed
  Scenario: Complete DIY registration with existing user account
    Given user launches and logs in to the Lyric application
     When user selects the <Thermostat> to be installed
      And User Chooses"Customize" Location 
     When User id displayed with "Multiple FlyCatcher"device
     Then And User Selects the "Device Name"
      And User enter "Valid Pincode" displayed on the Screen
     Then Verify "Registration Progress" is displayed
      And Verify "Registration Succesfull" is displayed
  
  @DIYExistingLocation
  Scenario: Complete DIY registration with existing location
    Given user launches and logs in to the Lyric application
     When user selects the <Thermostat> to be installed
      And User Chooses "existing" Location 
      And User Selects the "Flycatcher Device"
      And User enter "Valid Pincode" displayed on the Screen
     Then Verify "Registration Progress" is displayed
      And Verify "Registration Succesfull" is displayed
  
  @DIYInvalidPincode
  Scenario: To verify if Pincode error screen is displayed
    Given user launches and logs in to the Lyric application
     When user selects the <Thermostat> to be installed
      And User Chooses "existing" Location 
      And User Selects the "Flycatcher Device"
      And User enter "InValid Pincode" displayed on the Screen
     Then Verify "Pin Code error" is displayed
  
  @DIYRegistrationFailure
  Scenario: To verify registration error message is displayed due to network failure,API'failure
    Given user launches and logs in to the Lyric application
      And user selects the <Thermostat> to be installed
      And User Chooses "existing" Location 
      And User Selects the "Flycatcher Device"
      And User enter "Valid Pincode" displayed on the Screen
     When "Registration Progress" is in Progress disconnect wifi
     Then Verify "Registration failure message" is displayed
  
  @DIYRegistrationtimeout
  Scenario: To verify registration Timout message is displayed due to Low network/Dat sync
    Given user launches and logs in to the Lyric application
      And user selects the <Thermostat> to be installed
      And User Chooses "existing" Location 
      And User Selects the "Flycatcher Device"
      And User enter "Valid Pincode" displayed on the Screen
     When "Registration Progress" in low network
     Then Verify "Registration Timeout message" is displayed
      And verify "Retry Option" is displayed
  
  @DIYContractorFlowInvite
  Scenario: To verify contractor invite mail is sent to user after manaul ISU 
    Given Contractor enter in Contractor flow
      And Contractor selects the <Thermostat> to be installed
      And Contractor enters Valid "User Credentials"
     When Contractor send an Invite to User 
     Then user launches and logs in to the Lyric application
      And Verify if "Contractor invite" is displayed
  
  @DIYContractorFlow
  Scenario: To verify user is able register Flycahter device using contractor invite
    Given Contractor send an Invite to User
      And user launches and logs in to the Lyric application
     When user taps on "Contractor invite"
      And User Chooses "existing" Location 
      And User Selects the "Flycatcher Device"
      And User enter "Valid Pincode" displayed on the Screen
     Then Verify "Registration Progress" is displayed
      And Verify "Registration Succesfull" is displayed
  
  
