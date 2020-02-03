@CameraMembership
Feature: Camera Membership
As a user I want to subscribe to plans offered by Honeywell for my camera clips.

@Membersip_StandardMonthly_FromHoneywellMembershipScreen     @P1    @AutomatedOnAndroid @--xrayid:ATER-54630
Scenario: As a user I should be able to purchase a standard monthly subscription from Membership Menu
 		Given user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Monthly" plan from the "Honeywell Membership" screen and selects "Start Membership"
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		#And user is able to view an active "Monthly" subscription selected

@Membersip_StandardAnnaul_FromHoneywellMembershipScreen    @P1     @AutomatedOnAndroid  @--xrayid:ATER-54633
Scenario: As a user I should be able to purchase a standard annaul subscription from Membership Menu
		Given user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Annual" plan from the "Honeywell Membership" screen and selects "Start Membership" 
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		#And user is able to view the an active "Annual" subscription selected
		
@Membersip_PremiumMonthly_FromHoneywellMembershipScreen    @P1     @AutomatedOnAndroid @--xrayid:ATER-54634
Scenario: As a user I should be able to purchase a premium monthly subscription from Membership Menu
		Given "add" camera from CHIL
		And user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Monthly" plan from the "Honeywell Membership" screen and selects "Start Membership"
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		#And user is able to view an active "Monthly" subscription selected
	    And "delete" camera from CHIL 
	    
@Membersip_PremiumAnnaul_FromHoneywellMembershipScreen    @P1      @AutomatedOnAndroid @--xrayid:ATER-54636
Scenario: As a user I should be able to purchase a premium annaul subscription from Membership Menu
		Given "add" camera from CHIL
		And user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Annual" plan from the "Honeywell Membership" screen and selects "Start Membership" 
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		#And user is able to view the an active "Annual" subscription selected
		And "delete" camera from CHIL 
		
@Cancellation_ActiveSubscription	     @P1  @AutomatedOnAndroid @--xrayid:ATER-54637
Scenario: As a user I should be able to cancel my active subscription
		Given user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Monthly" plan from the "Honeywell Membership" screen and selects "Start Membership"
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "No" plan from the "Honeywell Membership" screen and selects "Manage Membership"
		And user clicks on the "Unsubscribe" button from the "Honeywell Membership" screen
		And user clicks on the "Done" option from the "Cancel" popup
		And user clicks on the "Ok" option from the "Membership Canceled" popup
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
 
@Cancellation_ActiveSubscription_FreeTrial	@P1   @AutomatedOnAndroid  @--xrayid:ATER-54638
Scenario: As a user I should be able to cancel my active subscription
		Given "add" camera from CHIL
		And user launches and logs in to the Lyric application
		When user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "Monthly" plan from the "Honeywell Membership" screen and selects "Start Membership"
		And user selects "Proceed To Checkout" option from the "Membership Details" screen
		And user enters "valid" payment details and selects pay now option
		And user selects "Done" option from the "Summary" screen
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And user selects "No" plan from the "Honeywell Membership" screen and selects "Manage Membership"
		And user clicks on the "Unsubscribe" button from the "Honeywell Membership" screen
		And user clicks on the "Done" option from the "Cancel" popup
		And user clicks on the "Ok" option from the "Membership Canceled" popup
		Then user navigates to "Honeywell Membership" screen from the "dashboard" screen
		And "delete" camera from CHIL 