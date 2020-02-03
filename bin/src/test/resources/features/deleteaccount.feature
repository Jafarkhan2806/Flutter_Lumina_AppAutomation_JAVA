Feature: As an user, I want to delete my account from the app. @LYR-22282

@DeleteAccountWithSingleuserWithNoLocationNoDeviceNoMembership        
  Scenario: To verify user is able to delete his account if there are no devices, no locations and no Membership linked to the account. 
    	Given app is launched
		And user creates account and email got verified.	
	When user lands in '93Add New Device'94 screen
		And user clicks on BACK button
		Then verify user should receive the Pop up screen with '93Exit Honeywell Home?'94 Pop up.
	When user Clicks on '93DELETE ACCOUNT'94 link     
		Then verify user should receive a '93Delete Account-Sorry to see you go'94 Page/Pop up.
	When user clicks of NO button
		Then verify user should navigate back to '93Add New Device'94 screen.	
	When user clicks on BACK button
		Then verify user should receive the Pop up screen with Exit Honeywell Pop up.
	When user Clicks on '93DELETE ACCOUNT'94 button     
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user Clicks on YES button
		Then verify user should navigate to Login screen. 		
		And verify user should receive a pop-up saying '93Your Account & Data is Deleted'94.
		And verify user is unable to login with same credentials
	


@SingleUserDeleteAccountWithNoDeviceNoMembershipOld
  Scenario: To verify user is able to delete his account if there are no devices in any locations any no Membership linked to the account. 
	Given app is launched
		And user creates account and email got verified.
		And user created a location only without any device.
	When user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE ACCOUNT'94 link.
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user clicks of NO button
		Then verify user should navigate back to '93Edit Account'94 screen.	
	When user clicks on '93DELETE ACCOUNT'94 link
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user clicks on YES button
		Then verify user should receive a pop-up saying '93Your Account & Data is Deleted'94.
		And verify user should navigate to Login screen. 
		And verify user is unable to login with same credentials
	

@SingleUserWithUnsharedDeviceWithCameraSubscriptions.
	Scenario Outline: To verify user is not able to delete his account when he has a unshared device or a Camera Subscription in it
	Given app is launched
		And user taps on LOGIN
		And user should have <DEVICE> in one LOCATION
		And user should not have any CAMERA SUBSCRIPTIONS
	When user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE ACCOUNT'94 link
		Then verify user should receive a pop up saying '93Actions required before deleting your account'94
		Then verify user can click and navigate to the the '93Delete All Devices'94 FAQ Page from the link.
	When user clicks of BACK or OK button
		Then verify user should navigate back to Edit Account screen.
Examples: 
      | DEVICE                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |


@DeleteAccountWithLocationHavingNoDeviceWithCameraSubscriptionOld
	Scenario: To verify user is unable to delete his account when he has a unshared device or a Camera Subscription in it
		Given app is launched
		And user creates account and email got verified.
		And user created a location only without any device.
		And user should have a valid CAMERA SUBSCRIPTION
	When user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE ACCOUNT'94 link
		Then verify user should receive a pop up saying '93Actions required before deleting your account '94
		Then verify user can click and navigate to the the '93Cancel Your Honeywell Membership'94 FAQ Page from the link.			
	When user clicks of BACK or OK button
		Then verify user should navigate back to Edit Account screen.


@DeleteAccountWithLocationHavingDeviceWithsubscription 
	Scenario Outline: To verify user is unable to delete his account when he has a unshared device or a Camera Subscription in it
	Given app is launched
		And user taps on LOGIN
		And user should have <DEVICE> in one LOCATION
		And user should have a valid CAMERA SUBSCRIPTION
	When user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE ACCOUNT'94 link
		Then verify user should receive a pop up saying '93Actions required before deleting your account '94
		And verify user can click and navigate to the the '93Delete All Devices'94 FAQ Page from the link.
		And verify user can click and navigate to the the '93Cancel Your Honeywell Membership'94 FAQ Page from the link.	
	When user clicks of BACK or OK button
		Then verify user should navigate back to Edit Account screen.
Examples: 
      | DEVICE                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |



@MultipleDeviceDeleteSameAccountRestAllDeviceLogsOut
Scenario Outline: To verify all logged in devices should log out if account is deleted.
	Given app is launched in two devices
		And user taps on LOGIN in both the devices with same account.
		And user should have <DEVICE> in one LOCATION
	When user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen in one device
		And user clicks on '93DELETE ACCOUNT'94 link in one device.
	Then verify user should receive a pop up saying '93Actions required before deleting your account'94
		And verify user can click and navigate to the the '93Delete All Devices'94 FAQ Page from the link.
		And Click on OK/BACK button.
	When user deletes the <DEVICE> from dashboard.
		And user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen in one device
		And user clicks on '93DELETE ACCOUNT'94 link in one device.
	When user clicks on YES button
		Then verify user should receive a pop-up saying '93Your Account & Data is Deleted'94.
		And verify both users should navigate to Login screen. 
		And verify both users are unable to login with same credentials
	When user clicks of NO button
		Then verify user should navigate back to '93Edit Account'94 screen.


Examples: 
      | DEVICE                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |






@SingleAccountMultipleLoginsDeleteLocationRestAllDeviceAddDeviceScreen
Scenario: To verify all logged in devices should navigate to add device screen when a location is deleted.
	Given app is launched in two devices 
		And user creates account and email got verified.
		And user created a location only without any device.
	When any device user navigates to '93Home Address'94 screen from '93Dashboard'94 screen in one device
		And any device user clicks on '93DELETE LOCATION'94 link in any device
		And Clicks on DELETE in Confirmation page.
		Then both the devices should navigate to Add Device Screen.
	When any user clicks on BACK button
		Then verify user should receive the Pop up screen with '93Exit Honeywell Home?'94 Pop up.
	When user Clicks on '93DELETE ACCOUNT'94 link         
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user Clicks on YES button
		Then verify both device should navigate to Login screen. 		
		And verify user should receive a pop-up saying '93Your Account & Data is Deleted'94 in one device.
		And verify user is unable to login with same credentials in any device.




@DMultipleAccountSharedLocationDeletedInOneAccount
Scenario Outline: To verify user is navigated to add device screen when a shared location is deleted and if account is deleted.
	Given app is launched in two devices
		And both users taps on LOGIN in with different accounts
		And both users should have <DEVICE> in one LOCATION
		And first user must have shared his location with second user account
	When second user navigates to '93Home Address'94 screen from '93Dashboard'94 screen in one device
		And second user clicks on '93Delete Address'94 link in second device
	Then verify second user should be able to delete first users location
		And verify first user should not be able to see that deleted location and device.
		And verify second user can still have access to its own location.
	When first user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen in one device
		And first user clicks on '93DELETE ACCOUNT'94 link in one device
		Then verify first user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user clicks of NO button
		Then verify user should navigate back to '93Edit Account'94 screen.	
	When first user clicks on YES button
		Then verify user should receive a pop-up saying '93Your Account & Data is Deleted'94
		And verify both users should navigate to Login screen. 
		And verify both users are unable to login with same credentials

Examples: 
      | DEVICE                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |


@InvitedUserHaveAccessToDeletedPrimaryUserLocationAndDevice.
Scenario Outline: To verify invited user is able to access the primary user shared location and device even if primary user deleted its account.
	Given app is launched in two devices
		And both users taps on LOGIN in with different accounts
		And both users should have <DEVICE> in one LOCATION
		And primary user must have shared his location with invited user.
	When primary user navigates to '93Edit Account'94 screen from '93Dashboard'94 screen in one device
		And primary user clicks on '93DELETE ACCOUNT'94 link in one device
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user Clicks on YES button
		Then verify primary user should navigate to Login screen. 		
		And verify primary user should receive a pop-up saying '93Your Account & Data is Deleted'94.
		And verify primary user is unable to login with same credentials
		And verify invited user is still able to access the primary location and device.
Examples: 
      | DEVICE                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |



@DeleteAllLocationsAndThenDeleteAccountOld
Scenario: To Verify user is navigated to add device screen when all locations are deleted and account is deleted when user clicks on '93DELETE ACCOUNT'94 with appropriate pop up
	Given app is launched
		And user creates account and email got verified
		And user creates Location1 without any device
		And user creates Location2 without any device
	When user navigates to '93Home Address'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE LOCATION'94 link in Location2
		And Clicks on DELETE in Confirmation page.
		Then user should be directed to Location1 Dashboard.
	When user navigates to '93Home Address'94 screen from '93Dashboard'94 screen
		And user clicks on '93DELETE LOCATION'94 link in Location1
		And Clicks on DELETE in Confirmation page.
		Then user should be directed to '93Add New Device'94 screen
		And user clicks on BACK button
		Then verify user should receive the Pop up screen with '93Exit Honeywell Home?'94 Pop up
	When user Clicks on '93DELETE ACCOUNT'94 button     
		Then verify user should receive a '93'93DELETE ACCOUNT'94-Sorry to see you go'94 '93'93DELETE ACCOUNT'94-Sorry to see you go'94 Page/Pop up.
	When user Clicks on YES button
		Then verify user should navigate to Login screen. 		
		And verify user should receive a pop-up saying '93Your Account & Data is Deleted'94.
		And verify user is unable to login with same credentials