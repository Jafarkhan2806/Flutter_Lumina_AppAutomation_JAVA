Feature: As an user, I want to Create an account, forget password and Login scenaios 

@GenralCreateaccountscreen
  Scenario: To verify the Create Account screen  
    Given app is launched 
     When the user taps on Create Account  
     Then Create Account screen should be displayed 
 
 @GenralCreateaccountfunctionality 
  Scenario Outline: To verify Create Account functionality  
    Given Create Account screen is dislayed  
     When User enters <Firstname><Lastname>
  Example: 
      | Firstname       | Lastname       | 
      | Valid Firstname | Valid Lastname | 
      | Blank Firstname | Blank Lastname | 
      And User enters <Email ID>
  Example: 
      | Email ID      | 
      | Valid email   | 
      | Invalid email | 
      | Blank email   | 
      And user enters Password and Verify Password
      And user selects the country
      And taps on Create  
     Then Add a new device screen should be displayed along with change country option
      And an Error message should be shown if the First and Last name is blank 
      And an Error message should be displayed for invalid/blank email ID and for already registered valid Email ID. 
      And an Error message should be displayed if the password length is less then 8 characters 
      And an Error message should be displayed if the password and verify password is not as per the defined regular expression
      And an Error message should be displayed if the password and verify password do not match 
  
   @GenralCreateaccountSelectcountry
  Scenario Outline: To verify Select country screen 
    Given Confirm country screen is dislayed
     When the user selects any country from auto-populated list OR enters the required country in Search field
      And tap on the required country
     Then the selected country should be displayed in Create account screen
  
   @GenralCreateaccountcanccelfunctionality
  Scenario: Verify CANCEL in Create Account
    Given Create Account screen is dislayed  
     When user taps on CANCEL 
     Then the app launch screen should be displayed
  
   @GenralLoginFunctionality
  Scenario: Verify LOGIN in Create Account
    Given Create Account screen is dislayed  
     When user taps on LOGIN 
     Then the LOGIN screen should be displayed
  
   @GenralPrivacystatementfunctionality 
  Scenario: Verify Privacy Statement in Create Account
    Given Create Account screen is dislayed  
     When user taps on Privacy Statement 
     Then the Privacy Statement screen should be displayed
      And upon Cancel, Create Account screen should be displayed
  
   @GenralEULAfunctionality 
  Scenario: Verify EULA in Create Account
    Given Create Account screen is dislayed  
     When user taps on EULA  
     Then the EULA screen should be displayed
      And upon Cancel, Create Account screen should be displayed
  
   @GenralCreateaccountfunctionalitywithNONetwork
  Scenario: Verify Create Account when No Network
    Given Create Account screen is dislayed  
     When user taps on Create  
     Then Network error message should be displayed 
  
 #Forget Password 
 
 
 @GenralForgetPasswordfunctionality 
  Scenario: To verify the Forgot Password screen  
    Given Login screen is displayed
     When the user taps on Forgot Password 
     Then Reset Password screen should be displayed 
  
   @GenralResetPasswordfunctionality 
  Scenario Outline: To verify Reset Password functionality  
    Given Reset Password screen is dislayed  
     When User enters <Email ID>
  Example: 
      | Email ID           | 
      | Registered Email   | 
      | Unregistered Email | 
      | Invalid Email      | 
      | Blank Email        | 
      And taps on Reset 
     Then a success message should be displayed with Resend and Login buttons
      And Email ID not registered message should be displayed for Unregistered Email ID.
      And Error message should be displayed for Invalid and Blank Email ID. 
  
   @GenralResetPasswordfunctionalitywithNONetwork 
  Scenario: Verify Reset Password when No Network
    Given Reset Password screen is dislayed  
     When user taps on Reset Password  
     Then Network error message should be displayed 
   
   #Login

 @GenralLoginScreen 
  Scenario: To verify the gogin screen  
    Given the app is launched 
     When the user taps on login 
     Then the login screen should be displayed 
  
   @Genralloginfunctionality 
  Scenario Outline: To verify login functionality  
    Given login screen is dislayed  
     When User enters <Email ID> and <Password> 
  Example: 
      | Email ID            | Password               | 
      | Valid email         | Valid Password         | 
      | Valid email         | Invalid Password       | 
      | Invalid email       | Valid Password         | 
      | Invalid email       | Invalid Password       | 
      | Valid/Invalid email | Blank Password         | 
      | Blank email         | Valid/Invalid Password | 
      | Blank email         | Blank Password         | 
      And taps on Login 
     Then User should be able to Login with valid credentials 
      And Login Failed error message should be displayed for Invalid credentials 
  
   @GenralLoginCancelfunctionality 
  Scenario: Verify CANCEL login
    Given Login screen is dislayed  
     When user taps on CANCEL 
     Then the app launch screen should be displayed
  
   @GenraloginfunctionalitywhenNoNetwork 
  Scenario: Verify login when there is No Network
    Given Login screen is dislayed  
     When user taps on Login 
     Then Network error message should be displayed 