Feature: User should be blocked from using app if device is having invalid date and time

@InvalidmobiledeviceDateOrTimeAndAppisLoggedout @LYR23886/22361
  Scenario: To verify the user has blocked using app with device time invalid  
     Precondition user have invalid date or time or both
     Given app is launched 
     When user taps on LOGIN with valid credential
     Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and time in your mobile device’s settings’ with ‘Close’ button 
     When ‘Close’ is clicked
     Then user should be in login page 
     #invalid time :  +/- 31 min to current time Invalid date : Any dates other than current date
     When user correct the date/time
     Then user should be allowed to login to the app with valid credential

@InvalidmobiledeviceDateOrTimeAndAppisLoggedin @LYR23886/22361
  Scenario: To verify the user has blocked using app with device time invalid  
     Precondition user have invalid date or time or both
     And app is launched 
     Given app got session time out(60 min) or force closed 
     #No session API called during DIY, so no session timeout holds good while DIY
     When user tries to access the app again
     Then  Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and       time in your mobile device’s settings’ with ‘Retry’ button 
     When user clicks on ‘Retry’ user should still see the popup
     When user correct the date/time
     Then user should be allowed to access the app 


      @InvalidmobiledeviceDateOrTimeAndCreateAccount @LYR23886/22361
  Scenario: To verify the user has blocked using app with device time invalid  
     Precondition user have invalid date or time or both
     Given app is launched 
     When user tries to Create account
     Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and       time in your mobile device’s settings’ with ‘Retry’ button
When user correct the date/time
     Then user should be allowed to access the app 

        
    