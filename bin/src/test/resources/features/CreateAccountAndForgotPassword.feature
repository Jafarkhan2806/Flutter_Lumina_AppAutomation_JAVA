	 @Platform
	 Feature: As an user, I want to Create an account, forget password and Login scenarios 

	 @GenralCreateaccountscreen
  	 Scenario: To verify the Create Account screen  
     Given app is launched 
     When the user taps on Create Account  
     Then Create Account screen should be displayed 

     #requirement : Country should be US 
     @GeneralCreateAccountFieldValidationUSLocation          @Automated
     Scenario: To verify create account fields text
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     #Then user should be displayed with the "Please confirm your country" screen
     #And user selects "Current Country" from "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United States" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|

     #requirement : Country should be UK 
     @GeneralCreateAccountFieldValidationEMEALocation          @Automated
     Scenario: To verify create account fields text
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     #Then user should be displayed with the "Please confirm your country" screen
     #When user inputs "United Kingdom" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United Kingdom" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     And user should be displayed with the following "Create Account for UK" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |Marketing communications sign up |
     |Sign me up for exclusive updates and toggle |
     |Signing up consent label should not be displayed |	
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button |
	 When user selects "Sign me up toggle button" from "Create Account" screen
	 And user should be displayed with the following "Create Account for UK" options:
     |CreateAccountOptions |
	 |Signing up consent label should be displayed |	
	
	
     @GeneralCreateAccountCancelFunctionalityWithoutEnteringText          @Automated
     Scenario: To verify cancel functionlity with out filling the fields
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     #Then user should be displayed with the "Please confirm your country" screen
     #And user selects "Current Country" from "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user selects "Back button" from "Create Account" screen
     And user should be displayed with the "Honeywell Home" screen
	
	 #Invalid scenario
     @GeneralCreateAccountCancelFunctionalityWithFillingText          #Functionality Not there
     Scenario: To verify cancel functionlity with filling the fields
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user enters the "First Name" and "Last Name"
     When user selects the "Cancel" option
     Then user should be displayed with "confirmation" pop up
     When user dismiss the popup
     Then user should be displayed with "Create account" screen
     When user selects the "Cancel" option
     Then user should be displayed with "confirmation" pop up
     When user accepts the popup
     Then user should navigates to "Login" screen

     @Gernalcreateaccountwithvaliddetails          @NotAutomatable
     Scenario Outline: As a user i wanted to create account
     Given user launches the app
     When user selects "Create account" option
     Then the user edits the <first name> and <last name>
     And user eidts the <Email> 
     And user edits the <Password> and <Verify Password>
     When user selects "Create" button
     Then user navigates "Activate Account" screen
     And user should be displayed with "Details" options:
     |Details|
     |Almost Done |
     |New email |
     |Go To Mail |
     |Resend Email|
     When user navigates to "Email" and selects activation link
     Then user should be navigates to "Add new device" screen 
     Examples: 
      | first name | last name | Email | Password | Verify Password |
      | giri       | THEJ      | New email | Password1 | Password1 |
      | sami       | krishna   | New email | Password1 | Password1 |
      | vijay      | Govda     | New email | Password1 | Password1 |
      | anju       | sweets    | New email | Password1 | Password1 |

     @Gernalcreateaccountwithvaliddetailsgotoemnail          @NotAutomatable
     Scenario Outline: As a user i wanted to create account with go to email
     Given user launches the app
     When user selects "Create account" option
     Then the user edits the <first name> and <last name>
     And user eidts the <Email> 
     And user edits the <Password> and <Verify Password>
     When user selects "Create" button
     Then user navigates "Activate Account" screen
     And user should be displayed with "Details" options:
     |Details|
     |Almost Done |
     |New email |
     |Go To Mail |
     |Resend Email|
     When user selects "Go To Mail" option
     Then user navigates to "email inbox"
     When user navigates to "Email" and selects activation link
     Then user should be navigates to "Add new device" screen 
    Examples: 
      | first name | last name | Email | Password | Verify Password |
      | giri       | THEJ      | New email | Password1 | Password1 |
      | sami       | krishna   | New email | Password1 | Password1 |
      | vijay      | Govda     | New email | Password1 | Password1 |
      | anju       | sweets    | New email | Password1 | Password1 |

	 @Gernalcreateaccountwithvaliddetailsresendlink          @NotAutomatable
     Scenario Outline: As a user i wanted to create account
      Given user launches the app
     When user selects "Create account" option
     Then the user edits the <first name> and <last name>
     And user eidts the <Email> 
     And user edits the <Password> and <Verify Password>
     When user selects "Create" button
     Then user navigates "Activate Account" screen
     And user should be displayed with "Details" options:
     |Details|
     |Almost Done |
     |New email |
     |Go To Mail |
     |Resend Email|
     Then user selects "Resend Email" option
     And user should dispalyed with "Activation email sent" pop up
     When user accepts "Activaction email sent" pop up
     Then user should navigates to "Activate account" screen
     When user navigates to email inbox
     Then user should be dispalyed two activation mail
     When user navigates to "Email" and selects activation link
     Then user should be navigates to "Add new device" screen  
      Examples: 
      | first name | last name | Email | Password | Verify Password |
      | giri       | THEJ      | New email | Password1 | Password1 |
      | sami       | krishna   | New email | Password1 | Password1 |
      | vijay      | Govda     | New email | Password1 | Password1 |
      | anju       | sweets    | New email | Password1 | Password1 |
	
	 #Issue on Android in Activate Account screen
     @GeneralCreateAccountWithValidDetailsBackOption          @Automated
     Scenario Outline: As a user I want to verify Back option on activating account screen
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create button" from "Create Account" screen
     Then user should be displayed with the "Activate Account" screen
     Then user should be displayed with the following "Activate Account Details" options:
     |ActivateAccountDetails|
     |Almost Done 			|
     |New email 			|
     |Go To Mail 			|
     |Resend Email			|
     Then user selects "Back button" from "Activate Account" screen
     Then user should be displayed with the "Honeywell Home" screen
     When user selects "Login" from "Honeywell Home" screen
     Then user inputs <Email> in "Email Text Field" in the "Login With Created Credentials" screen
     Then user inputs <Password> in "Password Text Field" in the "Login With Created Credentials" screen
     Then user selects "Login button" from "Login" screen
     Then user should be displayed with the "Activate Account" screen
     Examples: 
      | First Name | Last Name | Email 	   		| Password  | Verify Password |
      | Kenneth	   | Richard   | unit600@grr.la | Password1 | Password1       |
 
	 @GeneralCreateAccountWithMaxAlphanumericCharacters          @Automated
     Scenario Outline: As a user I want to verify max alphanumeric characters allowed for First Name and Last Name
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     When user inputs <First Name Max Characters> in "First Name Text Field" in the "Create Account" screen
     Then user should not be allowed to enter more than "40" characters in "First Name" in the "Create Account" screen
     When user inputs <Last Name Max Characters> in "Last Name Text Field" in the "Create Account" screen
     Then user should not be allowed to enter more than "40" characters in "Last Name" in the "Create Account" screen
     Examples:
     | First Name Max Characters		  		        | Last Name Max Characters				          |
     | This is to test max characters     		   		| This is to test max characters              	  |
     | This is to test max characters and its D			| This is to test max characters and its D        |
     | This is to test max characters and its Digits    | This is to test max characters and its Digits   |
     | This is to test max characters 1234567$!	   	    | This is to test max characters 1234567$!	      |
     | This is to test max characters 1234567$! 78  	| This is to test max characters 1234567$! 78     |
     | !@#$%^&*()_+=-`~!@#$%^&*()_+-~!@#$%^&*()    	    | !@#$%^&*()_+=-`~!@#$%^&*()_+-~!@#$%^&*()        |
     
	 
     @GeneralCreateAccountWithoutFillingsTheDetailsErrorValidation          @Automated
     Scenario: As a user I want to verify the error options on Create Account screen without filling the details
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United States" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create button" from "Create Account" screen
     And user should be displayed with the following "Create Account Field Error Validation" options:
     | CreateAccountFieldErrorValidation |
     | You must enter a first name |
     | You must enter a last name | 
     | You must enter a valid email address |
     | Invalid password format  |
     Then user should be displayed with the following "Create Account" options: 
     | CreateAccountOptions		|
     | First Name				|
     
 	 @GeneralCreateAccountWithAlreadyRegisteredEmailId          @Automated
     Scenario Outline: As a user I want to verify create account with already registered email id
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create button" from "Create Account" screen
     Then user should receive a "Email address already registered" popup
     Examples: 
     | First Name | Last Name | Email 		  |Password  | Verify Password |
     | giri       | THEJ      | unit@grr.la   |Password1 | Password1 	   |
  

 	 @GeneralCreateAccountWithInvalidPasswordFormat          @Automated
     Scenario Outline: As a user i want to verify Create Account with invalid password
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United States" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create button" from "Create Account" screen
     Then user should be displayed with the following "Password dont match validation" options:
     | PasswordDontMatchValidation |
     | Invalid password format 	   |    
     Examples: 
     | First Name | Last Name | Email 		|   Password        | Verify Password    |
     | giri       | THEJ      | unit@grr.la |  		            | Password1 		 |
     | giri       | THEJ      | unit@grr.la |  	password1 		| Password1 		 |		
     | giri       | THEJ      | unit@grr.la |  	Password	    | Password1 		 |
     | giri       | THEJ      | unit@grr.la |  	password	    | Password1 		 |
     | giri       | THEJ      | unit@grr.la |  	pass	    	| Password1 		 |

 	 @GeneralCreateAccountWithInvalidPassword          @Automated
     Scenario Outline: As a user i want to verify Create Account with Invalid Password
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United States" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create button" from "Create Account" screen
     Then user should be displayed with the following "Password dont match validation" options:
     | PasswordDontMatchValidation |
     | Passwords dont match 	   |
     Examples: 
     | First Name | Last Name | Email 		| Password 	| Verify Password |
     | giri       | THEJ      | unit@grr.la | Password2 | Password1 	  |

 	 @GeneralCreateAccountPrivacyStatementAndEULA          @Automated
     Scenario Outline: As a user I want to verify Create Account Privacy Policy and EULA
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     Then user should be displayed with the following "Create Account" options:
     | CreateAccountOptions    |
     | By Tapping create below |
     | Privacy Statement       |
     When user selects "Privacy Statement" from "Create Account" screen
     Then user should be displayed with the "Privacy Policy and EULA" screen
     Then user selects "Back" from "Privacy Statement" screen
     Then user should be displayed with the "Create Account" screen
     Then user should be displayed with the following "Create Account" options:
     | CreateAccountOptions    |
     | By Tapping create below |
     | Privacy Statement       |
     When user selects "End User License Agreement" from "Create Account" screen
     Then user should be displayed with the "Privacy Policy and EULA" screen
     Then user selects "Back" from "End User License Agreement" screen
     Then user should be displayed with the "Create Account" screen
     Examples: 
     | First Name | Last Name | Email 		| Password 	| Verify Password |
     | giri       | THEJ      | unit@grr.la | Password1 | Password1 	  |

	 @GeneralCreateAccountMarketingOptIn               @Automated  
  	 Scenario Outline: To verify that user has provided with a option for opting-in marketing emails while creating an account
     Given user launches the Lyric application
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United Kingdom" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user should be displayed with the following "Create Account for UK" options:
     |CreateAccountOptions 						  |
     |Marketing communications sign up 		      |
     |Sign me up for exclusive updates and toggle |
     Then user selects "Sign Me Up Toggle Button" from "Create Account" screen
     Then user should be displayed with the following "Create Account for UK" options:
     |CreateAccountOptions 						  |
     |Marketing communications sign up 		      |
     |Signing up consent label should be displayed|
     And user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create Button" from "Create Account" screen
     Then user should be displayed with the "Activate Account" screen
     Then user selects "Back Button" from "Activate Account" screen
     Then user should be displayed with the "Honeywell Home" screen   
     When user selects "Create Account" from "Honeywell Home" screen
     Then user should be displayed with the "Create Account" screen
     Then user inputs <First Name> in "First Name Text Field" in the "Create Account" screen
     Then user inputs <Last Name> in "Last Name Text Field" in the "Create Account" screen
     Then user inputs <Email> in "Email Text Field" in the "Create Account" screen
     Then user inputs <Password> in "Password Text Field" in the "Create Account" screen
     Then user inputs <Verify Password> in "Verify Password Text Field" in the "Create Account" screen
     Then user selects "Country" from "Create Account" screen
     Then user should be displayed with the "Please confirm your country" screen
     Then user inputs "United States" in "Search Text Field" in the "Please confirm your country" screen
     Then user should be displayed with the "Create Account" screen
     Then user should be displayed with the following "Create Account" options:
     |CreateAccountOptions |
     |First Name|
     |Last Name|
     |Email |
     |Password|
     |Verify Password |
     |Password must have |
     |Country selection |
     |By Tapping create below |
     |Privacy Statement |
     |EULA|
     |Create button|
     Then user selects "Create Button" from "Create Account" screen
     Then user should be displayed with the "Activate Account" screen
     Then user selects "Back Button" from "Activate Account" screen
     Then user should be displayed with the "Honeywell Home" screen
     Examples: 
     | First Name | Last Name | Email 		   | Password 	| Verify Password |
     | anil       | Govda     | unit@grr.la    | Password1  | Password1 	  |
     
     
     
	@EditAccounOptInOptOut @LYR25497          @NotAutomatable
 	Scenario: To verify that user has provided with a option for opting-in and opting out marketing emails in edit account screen 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to â€œEdit Accountâ€� screen
    Then check for opt in link
    And verify opt in weblink 
    And opt in for marketing email
    And verify the inbox for the opt in confirmation email
    And user navigates to â€œEdit Accountâ€� screen
    Then check for opt out link
    And verify opt out weblink 
    And verify the inbox for the opt out confirmation email
  

   	@GeneralCreateAccountSelectCountry          @Automated
  	Scenario: To verify Select country screen 
  	Given user launches the Lyric application
    When user selects "Create Account" from "Honeywell Home" screen
    #Then user should be displayed with the "Please confirm your country" screen
    #When user inputs "United Kingdom" in "Search Text Field" in the "Please confirm your country" screen
    Then user should be displayed with the "Create Account" screen
    Then user selects "Country" from "Create Account" screen
    Then user should be displayed with the "Please confirm your country" screen
    Then user inputs "United Kingdom" in "Search Text Field" in the "Please confirm your country" screen
    Then user should be displayed with the "Create Account" screen
    Then user should be displayed with the following "Create Account" options: 
    | CreateAccountOptions		|
    | Country selection			|
    Then user should be displayed with the "Selected Country in Create Account" screen
    
  	@GeneralLoginFunctionality          @Automated
    Scenario: Verify Login in Honeywell Home screen
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user should be displayed with the following "Login" options:
    |Login				  |
    |Email 				  |
    |Password             |
    |Forgot Password      |
    |Disabled Login button|
    |Cancel               |

    @GeneralLoginCancelFunctionality          @Automated
  	Scenario: Verify Login in Honeywell Home screen
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user should be displayed with the following "Login" options:
    |Login				  |
    |Email 				  |
    |Password			  |
    |Forgot Password      |
    |Disabled Login button|
    |Cancel 			  |
    When user selects "Cancel" from "Login" screen
    Then user should be displayed with the "Honeywell Home" screen

    @GeneralLoginWithValidCredentialWithoutLocation          @Automated     @ShouldBeAFreshInstallationAlwaysToCheckThisScenario
    Scenario Outline: As a user I want to verify valid Login credentails with out location
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user inputs <Email> in "Email Text Field" in the "Login" screen
    Then user inputs <Password> in "Password Text Field" in the "Login" screen
    Then user selects "Login button" from "Login" screen
    Then user verifies login is successful when user logs in first time
    Then user should be displayed with the "Add New Device" screen
    #Then user logs out of the app
    Examples:
    |Email         | Password  |
    |zone58@grr.la | Password1 |

    @GeneralLoginWithValidCredentialWithLocation          @Automated
    Scenario Outline: As a user I want to verify valid Login with location
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user inputs <Email> in "Email Text Field" in the "Login" screen
    Then user inputs <Password> in "Password Text Field" in the "Login" screen
    Then user selects "Login button" from "Login" screen
    Then user verifies login is successful when user logs in first time
    Then user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
    Then user should be displayed with the "Add New Device Dashboard" screen
    #Then user logs out of the app
    Examples:
    |Email		   | Password  |
    |unit80@grr.la | Password1 |

    @GeneralLoginWithInvalidEmailAndPassword          @Automated
    Scenario Outline: As a user I want to verify valid Login with location
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user inputs <Email> in "Email Text Field" in the "Login" screen
    Then user inputs <Password> in "Password Text Field" in the "Login" screen
    Then user selects "Login button" from "Login" screen
    #Then user should be displayed with "Unable to login. Email or password incorrect" text above email edit box with red color
    Then user should be displayed with the following "Invalid Email and Password validation" options:
    |InvalidEmailAndPasswordValidation |
    |Unable to login. Email or password incorrect|
    Examples:
    |Email		   | Password |
    |bajssm@grr.la | Password1 |

    @GeneralLoginWithInvalidEmail            @AlreadyCoveredInTheAbove
    Scenario Outline: As a user i wanted to verify valid login with location
    Given user launches the app
    When user edits the <Email> and <Password>
    Then user should be displayed with "Your email address or password is invalid" text above email edit box with red color
    Examples:
    |Email | Password  |
    |bajssm| Password1 |

  
    #Forget Password 
    @GeneralForgetPasswordFieldValidation          @Automated
    Scenario: To verify the Forgot Password screen  
    Given user launches the Lyric application
    When user selects "Login" from "Honeywell Home" screen
    Then user selects "Forget password" from "Login" screen
    And user should be displayed with the following "Reset Details" options:
    |ResetDetails|
    |Email text with edit box|
    |Disabled Reset button |
    |Login |

     @GeneralForgetPasswordLoginFunctionality          @Automated
     Scenario Outline: To verify the Forgot Password screen  
     Given user launches the Lyric application
     When user selects "Login" from "Honeywell Home" screen
     Then user selects "Forget password" from "Login" screen
     Then user inputs <Email> in "Email Text Field" in the "Login" screen
     Then user selects "Login button" from "Login" screen
     Then user should be displayed with the following "Login" options:
     |Login				    |
     |Email 				|
     |Password			    |
     |Forgot Password       |
     |Disabled Login button |
     |Cancel 			    |
     Examples:
     |Email|
     | unit@grr.la | 
  
    @GenralForgetPasswordmailactivation          @NotAutomatable
  	Scenario Outline: To verify the Forgot Password screen  
    Given user launches the app
     When user selects "Login" screen
     Then user selects "Forget password"
     When user edits the <Email>
     Then user selects the "Reset" option
     #iOS
     And user should navigates to "Great" screen
     And user should be dispalyed with below options:
     |Options|
     |Description |
     |Email |
     |Resend option|
     |Login |
      When user select resend option
      Then user should receive forget password mail
      #Android
      And user received toast message "Password link sent"
      Examples:
     |Email|
     | unit@grr.la | 

   
