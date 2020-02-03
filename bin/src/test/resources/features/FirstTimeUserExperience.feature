@FTUE
Feature: As a user I should be displayed with the appropriate coach marks as a FTUE

  @VerifyDASCoachMarks
  Scenario: As a user I should be displayed with the DAS Coach Marks when I log in using an account configured with a DAS
    Given user is set to "Home" mode through CHIL
      And user DAS camera is set to "on" through CHIL
     When user launches and logs in to the Lyric application without closing the coach marks
     Then user verifies the "DAS Dashboard" coach marks
     When user navigates to "Security Solution Card" screen from the "Dashboard" screen
     Then user verifies the "DAS Solution Card" coach marks
     When user navigates to "Camera Solution Card" screen from the "Security Solution Card" screen
     Then user should receive a "New to Lyric Camera" popup
     When user "accepts" the "New To Lyric Camera" popup
     Then user should be displayed with the "Camera Settings Introduction" screen
     When user navigates to "Camera Solution Card" screen from the "Camera Settings Introduction" screen
     Then user verifies the "DAS Camera Solution Card" coach marks
  
  @VerifyNAThermostatCoachMarks
  Scenario: As a user I should be displayed with the Thermostat Coach Marks when I log in using an account configured with a NA Thermostat
     When user launches and logs in to the Lyric application without closing the coach marks
     Then user verifies the "thermostat dashboard" coach marks
     When user selects "thermostat device" from the dashboard
     Then user verifies the "NA Thermostat Solution Card" coach marks
  
  @VerifyEMEAThermostatCoachMarks
  Scenario: As a user I should be displayed with the Thermostat Coach Marks when I log in using an account configured with a EMEA thermostat
     When user launches and logs in to the Lyric application without closing the coach marks
     Then user verifies the "thermostat dashboard" coach marks
     When user selects "thermostat device" from the dashboard
     Then user verifies the "EMEA Thermostat Solution Card" coach marks
  