@Localiztion 
Feature: Localization verification
As a user I want to verify Screens for localiztion

    @VerifyCreateAccountEnglishUS @--xrayid:ATER-34407 @Automated_PLATFORM_SPECIFIC
	Scenario: Localization- NA- English US- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountFrenchCanada  @--xrayid:ATER-34410 @Automated_PLATFORM_SPECIFIC
	Scenario: Localization- NA- French Canada- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountEnglishUK @--xrayid:ATER-34413 @Automated_PLATFORM_SPECIFIC
	Scenario: Localization- EMEA- English UK- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountFrench  @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34416
	Scenario: Localization- EMEA- French France- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountFrench_SUI @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34871
	Scenario: Localization- EMEA- French Switzerland- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountFrench_BE @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34872
	Scenario: Localization- EMEA- French Belgium- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountDutch @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34873
	Scenario: Localization- EMEA- Dutch Netherlands- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountDutchBE @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-34874
	Scenario: Localization- EMEA- Dutch Belgium- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountGerman @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34875
	Scenario: Localization- EMEA- German Germany- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountGermanAus @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34876
	Scenario: Localization- EMEA- German Austria- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountGermanSUI @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-34877
	Scenario: Localization- EMEA- German Switzerland- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountItalian @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34878
	Scenario: Localization- EMEA- Italian Italy- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountItalianSUI @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34879
	Scenario: Localization- EMEA- Italian Switzerland- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountPortuguesePL @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34880
	Scenario: Localization- EMEA- Portuguese Portugal- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountPortugueseBR @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34881
	Scenario: Localization- EMEA- Portuguese Brazil- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountSpainSpanish @Automated_PLATFORM_SPECIFIC  @--xrayid:ATER-34882
	Scenario: Localization- EMEA- Spain Spanish- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization
	
	
	@VerifyCreateAccountEnglishIreland  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31140
	Scenario: Localization- EMEA- English Ireland- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization 
	
	
	@VerifyCreateAccountPolish  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53886
	Scenario: Localization- EMEA- Polish Poland- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization 
	
	@VerifyCreateAccountSlovakian  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53884
	Scenario: Localization- EMEA- Slovakian Slovakia- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization 
	
	@VerifyCreateAccountHungarian  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53883
	Scenario: Localization- EMEA- Hungarian- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization 
	
	@VerifyCreateAccountCzech  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53882
	Scenario: Localization- EMEA- Czech- Create Account Screen Verification
	When user launches lyric application
	Then user verify create account screen for localization 
	
	
	@ForgotpasswordNAEnglish_US  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31139
	Scenario: Localization-English US- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordNAFrench_CA  @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31744
	Scenario: Localization- French Canada- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization

	
	@ForgotpasswordEMEAEnglish_UK @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31747
	Scenario: Localization- EMEA- English UK- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAEnglish_IR @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31750
	Scenario: Localization- EMEA- English IR- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAFrench @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31751
	Scenario: Localization- EMEA- French France- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAFrench_BE @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31758
	Scenario: Localization- EMEA- French Belgium- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAFrench_SUI @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31763
	Scenario: Localization- EMEA- French Switzerland- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAGerman_AUS @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31766
	Scenario: Localization- EMEA- German Austria- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAGerman_SUI @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-34946
	Scenario: Localization- EMEA- German Switzerland- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAGerman @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35433
	Scenario: Localization- EMEA- German Germany- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAItalian @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35434
	Scenario: Localization- EMEA- Italian Italy- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAItalian_SUI @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35435
	Scenario: Localization- EMEA- Italian Switzerland- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAPortugueseBR @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-31743 
	Scenario: Localization- EMEA- Portuguese Brazil- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAPortuguesePL @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35436
	Scenario: Localization- EMEA- Portuguese Portugal- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEADutch @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35437
	Scenario: Localization- EMEA- Dutch- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEADutch_BE @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35438
	Scenario: Localization- EMEA- Dutch Belgium- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEASpanish @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-35439
	Scenario: Localization- EMEA- Spanish- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	
	@ForgotpasswordNASpanishUS @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53633
	Scenario: Localization- NA- Spanish US- Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAPolish @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53880
	Scenario: Localization- EMEA- Polish Poland - Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEACzech @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53876
	Scenario: Localization- EMEA- Czech - Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEASlovakian @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53879
	Scenario: Localization- EMEA- Slovakian - Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@ForgotpasswordEMEAHungarian @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53877
	Scenario: Localization- EMEA- Hungarian - Login and Forgot Password Screen Verification 
	When user launches lyric application
	Then user verify login screen localization
	Then user verify Forgot password screen localization
	
	@VerifyAppInterruption @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-53733
	Scenario: user verifies App while interruption
	When user launches lyric application
	Then user verify "Create Account" page while interruption
	
	@CreateAccountInvalidCredentials @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-91775
	Scenario: user verifies create account with invalid credentials
	When user launches lyric application
	Then user verify "Create Account" with "Invalid Credentials" IDAAS "Enabled"
	
	@CreateAccountSessionExpired @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-91778
	Scenario: user verifies session expired during create
	When user launches lyric application
	Then user verify "Create Account" session expired with IDAAS "Enabled"
	
	@ForgotPasswordSessionExpired @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-91780
	Scenario: user verifies session expired during forgot password
	When user launches lyric application
	Then user verify "Forgot Password" session expired with IDAAS "Enabled"
	
	@ForgotPasswordValidCredentials @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-91779
	Scenario: user verifies forgot password with valid credentials
	When user launches lyric application
	Then user verify "Forgot Password" with "Valid Credentials" IDAAS "Enabled"
	
	
	@NegativeCreateAccountVericationCodeExpired @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-ATER-91776
	Scenario: user verifies session expired during forgot password
	When user launches lyric application
	Then user verify "Create Account" with "invalid Credentials with Guarilla Email" IDAAS "Enabled"
	
	@CreateAccntChngeEmail @Automated_PLATFORM_SPECIFIC @--xrayid:ATER-91773
	Scenario: user verifies create account with valid credentials by changing the email
	When user launches lyric application
	Then user verify "Change Email" with "Valid Credentials" IDAAS "Enabled"
	
	