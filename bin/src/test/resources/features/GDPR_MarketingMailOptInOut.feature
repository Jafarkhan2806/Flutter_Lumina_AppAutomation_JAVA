Feature: As an user, I want to Opt in or Opt out marketing emails for EMEA countries 
@CreateAccounOptIn @LYR25497
  Scenario: To verify that user has provided with a option for opting-in marketing emails while creating an account
     Given app is launched 
     And user navigates to “Create Account” screen
     When user selects any EMEA country
     #As of now toggle is only for EMEA countries
     Then verify marketing communication toggle button is “present”
     When user selects non EMEA country
     #As of now toggle is only for EMEA countries
     Then verify marketing communication toggle button is “ not present” 
     #Default value of toggle button should be off
     When toggle is “on” description should be “shown”
     And toggle is “off” description should be “hidden”
     Then create account with toggle “on”
     And navigate back to “Login screen”
     And create account with toggle “off”

@EditAccounOptInOptOut @LYR25497
 Scenario: To verify that user has provided with a option for opting-in and opting out marketing emails in edit account screen 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to “Edit Account” screen
    Then check for opt in link
    And verify opt in weblink 
    And opt in for marketing email
    And verify the inbox for the opt in confirmation email
    And user navigates to “Edit Account” screen
    Then check for opt out link
    And verify opt out weblink 
    And verify the inbox for the opt out confirmation email




     

           			

  