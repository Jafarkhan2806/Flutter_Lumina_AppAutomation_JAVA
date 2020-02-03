Feature: As an user, I would like to send a feed back as anonymous user or like to send details like email id, device info while giving feed back 3 or less to helpshift   @LYR25481
  
Scenario: To verify that user has provided with a option for opting-in marketing emails while creating an account
     Given app is launched 
     And user taps on LOGIN
     When user navigates to “About the App” screen
     Then user rate the app 3 or below
     Then verify toggle button is present on feedback screen with description
     When user clicks on send feed back with toggle on
     Then verify user details sent to help shift
     When user clicks on send feed back with toggle off
     Then verify user details sent as anonymous
     
      




     

           			

  