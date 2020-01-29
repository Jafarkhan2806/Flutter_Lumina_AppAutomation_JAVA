@LyricLoginToApplication
Feature: Login To Lyric Application
As a user I want to login to the lyric application

    @LoginToApplication
	Scenario: As a user I want to login to the lyric application
	When user logs in to the Lyric application
	
	@VerifyLoginScreen @--xrayid:ATER-20727 @Automated_PLATFORM_SPECIFIC  
    Scenario: Verify Login Screen 
    As a user I want to logs in to the application 
    When user launches lyric application
  	Then user verifies login screen
    
    @LoginAndLogout @Automated_JASPER_NA_EMEA_HBB_BB_WLD_C1_C2 @--xrayid:ATER-14864
	Scenario: Verify login and logout
	As a user I want to login and logout of the lyric application
	When user logs in to the Lyric application
	And user logsout of Lyric application
	
    @LoginScreenLocalization
	Scenario: To Verify login screen for English Language
	When user launches lyric application
	Then user verify login screen localization
	
	@FrenchLoginScreenLocalization
	Scenario: To Verify login screen for French Language
	When user launches lyric application
	Then user verify login screen localization
	
	@VerifyAppDisabledWhenNoNetworkDroid @--xrayid:ATER-20733   
  Scenario: Verify App is disabled when there is no network connection
  As a user I want to launch the app 
  When user launches lyric application
  Then user "enable" air plane mode of mobile
  And user set the login Id and Password
  And verify "No internet connection" is displayed
  And user taps on "OK button"
  And user "disable" air plane mode of mobile
  
  
  @VerifyAppDisabledWhenNoNetworkIOS @--xrayid:ATER-20733   
  Scenario: Verify App is disabled when there is no network connection
  As a user I want to launch the app 
  When user launches lyric application
  Then user "enable" air plane mode of mobile
  #And user set the login Id and Password
  And verify "No internet connection" is displayed
  #And user taps on "OK button"
  And user "disable" air plane mode of mobile
  
  
  
  @VerifyAppDisabledWhenNoNetwork @--xrayid:ATER-37050   
  Scenario: Slow Internet Connection Error Cellular data not or wifi not connected.
  As a user I want to launch the app 
  When user logs in to the Lyric application
  Then user "enable" air plane mode of mobile
  And verify "NO INTERNET MESSAGE" is displayed
  And verify "RETRY" is displayed
  And user "disable" air plane mode of mobile
  
  @VerifyUserTriesTosigninDeletedAccount @--xrayid:ATER-53751  
  Scenario: Negative User tries to sign in with deleted account
  As a user I want to launch the app 
  Given user launches lyric application
  And user create account and activate
  When user logs in to the Lyric application for verify delete account
  And user navigates to "Edit Account" screen from the "Dashboard" screen
  And user verify the deleted account not allowed to app using same credential
 
  @VerifyResetLink 				@--xrayid:ATER-53619 
   	Scenario: verify reset password link and change password
   	When user launches lyric application
    Then user open secret menu and set the environment
	When user reset the password and verify password link and Login check with "New Password"
	And user logsout of Lyric application
	And user change password using CHIL
	
	@VerifyResendLink 				@--xrayid:ATER-53620 
   	Scenario: verify reset password link and change password
   	When user launches lyric application
   	Then user open secret menu and set the environment
	When verify user can "resend" the password

  @VerifyPasswordResetLink 		  @--xrayid:ATER-53731
   	 Scenario: verify User enters old password after resetting password successfully 
   	 When user launches lyric application
   	 Then user open secret menu and set the environment
	 When user reset the password and verify password link and Login check with "Old Password"
	 And user change password using CHIL
	 
   @VerifyUserCreateAccount       @--xrayid:ATER-53718
	  Scenario: User able to Create Account for NA countries
	  As a user I want to launch the app 
	  Given user launches lyric application
	  And user create account and activate
	  
	 @VerifyDeleteAccountOption @Automated_NLND @--xrayid:ATER-59245
	Scenario: Verify delete account option
	As a user I want to login and logout of the lyric application
	Given user launches lyric application
	And user create account and activate
	Then verify delete account option
	
	
	
	 @VerifyResetLinkExpired 				@--xrayid:ATER-53723 
   	Scenario: verify reset password expired Link
   	Given user launches lyric application
	And user Verify expired resend password link
	
	   