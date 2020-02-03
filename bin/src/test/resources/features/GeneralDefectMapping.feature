@GenralAdditionScenarios @Platform
Feature: As a user i wanted to verify addition scenarios

      
#Requirment : Sinale location with or with out solution
@GeneralinappratinginsolutionDIYflow        @NotAutomatable
 Scenario Outline: As a user i wanted to verify in app rating should not display in DIY flow
 Given user launches and logs in to the Lyric application
 When user configure the <Solution> with new location
 Then user should not displayed "inapprating" pop up during DIY flow
 Examples: 
      | Solutions		| 
      | JasperNA		| 
      | JasperEMEA		| 
      | HB              |
      | C1              |
      | C2              |
      | D6              |
      | DAS             |
      
#Requirement: Single location with any solution
@GeneralInAppRatingNotNowiOS         @NotAutomatable
Scenario: As a user I want to verify In App Rating with "Not Now" option
Given user launches and logs in to the Lyric application
Then user should receive a "Enjoying Honeywell" popup
And user should be displayed with following "inapprating" options:
|Options|
|Enjoying Honeywell?|
|Tap a star to rate it on the app store.|
|5 stars|
|Not Now |
When user selects "Not Now" option
Then user should not be displayed with "Enjoying Honeywell?" pop up

#Requirement: Single location with any solution
@GeneralInAppRatingStarSelectiOS         @NotAutomatable
Scenario Outline: As a user I want to verify In App Rating with star selection
Given user launches and logs in to the Lyric application
Then user should be displayed "Enjoying Honeywell?" pop up
When user selects the <stars> 
Then user should be displayed with "inapprating" options:
|Options|
|Enjoying Honeywell?|
|Tap a star to rate it on the app store.|
|Cancel | 
|Submit |
And user should be dispalyed with selected <stars>
Examples:
|stars |
|1 |
|2|
|3|
|4|
|5|

#Requirement: Single location with any solution
@GeneralInAppRatingCanceliOS     @NotAutomatable
Scenario Outline: As a user I want to verify In App Rating with cancel option functionlity
Given user launches and logs in to the Lyric application
Then user should be displayed "Enjoying Honeywell?" pop up
When user selects the <stars> 
Then user should be displayed with "inapprating" options:
|Options|
|Enjoying Honeywell?|
|Tap a star to rate it on the app store.|
|Cancel | 
|Submit |
And user should be dispalyed with selected <stars>
When user selects "Cancel" option
Then user should not be displayed with "Enjoying Honeywell?" pop up
Examples:
|stars |
|1 |
|2|
|3|
|4|
|5|

#Requirement: Single location with any solution
@GeneralInAppRatingSubmitiOS     @NotAutomatable
Scenario Outline: As a user I want to verify In App Rating with submit option functionlity
Given user launches and logs in to the Lyric application
Then user should be displayed "Enjoying Honeywell?" pop up
When user selects the <stars> 
Then user should be displayed with "inapprating" options:
|Options|
|Enjoying Honeywell?|
|Tap a star to rate it on the app store.|
|Cancel | 
|Submit |
And user should be dispalyed with selected <stars>
When user selects "Submit" option
Then user should navigates to "AppStore"
Examples:
|stars |
|1 |
|2|
|3|
|4|
|5|

#Geofence Location Status
# JaseprNA, JasperEMEA, C1, C2, DAS,
@GeneralGlobalDrawerVerifyLocationStatus         @Automated                         
Scenario Outline:  As a user I want to verify Location status when user cross the fence home and away with solutions
Given user has <Mode> system mode
And user thermostat is set to "geofence based" schedule
When user launches and logs in to the Lyric application
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this locaiton toggle" to "on"
And user thermostat set <Period> with <Geofence>
And user should be updated with Location status <Period>
And user thermostat set <UPeriod> with <Geofence>
And user should be updated with Location status <UPeriod>
Examples:
| Mode | Period             | Geofence           | UPeriod            | UGeofence    |
| Cool | Away  				| UserDeparted		 | Home				  |	UserArrived	 |
| Heat | Home               | UserArrived        | Away               | UserDeparted |
| Cool	| Away  			| UserDeparted	 	 | Home				  |	UserArrived	 |
| Cool | UserArrived        | Home               | Away               | UserDeparted |


#Invite User
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerInviteUserEmailConfirmation     @NotAutomatable
Scenario: As a user i want to Verify Email notification for invited user
Given user launches and logs in to the Lyric Application
When user navigates to "Invite User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
And user login to "das_stage5@grr.la" email account
And user should be displayed with "email invitation"

#Activity History
#Requirements : single location with DAS/JASPER/CAMERA/HB any solution
@GeneralGlobalDrawerGeofoenceNotificationInActivityHistory          @Automated
Scenario Outline: As a user I want to verify Geofence messages in Activity History
Given user launches and logs in to the Lyric Application
When user Cross the fence "home" to "Away"
And user receives a <Push Notification1> push notification
When user navigates to "Activity History" screen from the "Dashboard" screen
Then "Geofence away event - success" should be displayed in the "Activity History" screen
And user selects "Geofence away event - success" from "Activity History" screen
And user should be displayed with the following "Geofence cross description" options:
|GeofenceCrossDescriptionOptions|
|Geofence away event - success  |
Then user navigates to "Global Drawer" screen from the "Activity History" screen
When user Cross the fence "Away" to "Home"
And user receives a <Push Notification2> push notification
When user navigates to "Activity History" screen from the "Dashboard" screen
Then "Geofence home event - success" should be displayed in the "Activity History" screen
And user selects "Geofence home event - success" from "Activity History" screen
And user should be displayed with the following "Geofence cross description" options:
|GeofenceCrossDescriptionOptions|
|Geofence home event - success  |
Examples:
| Push Notification1 | Push Notification2 |
|	SET TO AWAY		 | SET TO HOME        |


#Server Down
#LCC/ CHIL Down error popup
@Serverdownerrorpopupverficiation       @NotAutomatable
Scenario: As a user i wnat to verify the error pop up when server is down
Given user launches and logs in to the Lyric Application
Then user server "LCC/TCC/CHIL" down
And user receives the pop up "The Honeywell Service is temporarily unavailable, but dont worry -- this wont effect your  device"
And user should be displayed with "RETRY" option
When user selcts the "RETRY" option
Then user should receives the pop up "The Honeywell Service is temporarily unavailable, but dont worry -- this wont effect your  device"
When server "LCC/TCC/CHIL" up
Then user select the "RETRY" option
And user pop up should be disappear 


#Activity History
#Requirments: Single location with solutions and with alters
@GeneralGlobalDrawerActivityHistoryCheckAndUncheckAndCheckScnearios          @Automated
Scenario: As a user I want to verify select all the messages in Activity History
Given user launches and logs in to the Lyric Application
When user navigates to "Activity history" screen from the "Dashboard" screen
Then user selects "Edit" from "Activity history" screen
Then user selects "All Messages" from "Activity history" screen
Then user unselects "a message" from "Activity History" screen
When user selects "All Messages" from "Activity history" screen
When user selects "the Delete button" from "Activity history" screen
#Then user should not be displayed with the "Messages" on the "Activity history" screen
Then user should be displayed with "No Messages label in Activity History screen"
Then user logs out of the app

#Requirements : Single location with and with out any solution
@GeneralGlobalDrawerInviteUserDeleteAccountMultiUser            @Automated
Scenario Outline: As a user I want to verify Email notification for Invited user
Given user launches and logs in to the Lyric Application
When user navigates to "Users" screen from the "Dashboard" screen
Then user selects "Invite New User" from "Users" screen
Then user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| unit77@grr.la			|
When user logs out and logs in to the Lyric Application with <invite users email address>
When user navigates to "Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
And user selects "Delete Invited Email" from "Users" screen
Then user should receive a "Delete User" popup
And user "Clicks on OK in" the "Delete User" popup
Then user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| unit76@grr.la			|
#Then user logs out of the app
#Then user launches and logs in to the Lyric application
When user logs out and logs in to the Lyric Application with <invited users email address>
Then user should be displayed with the "Add New Device" screen
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
Then user selects "Get Started" from "What To Expect" screen
Then user selects "Home" from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid first locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
Then user clicks on the back arrow in the <Current Screen> screen
When user logs out and logs in to the Lyric Application with <invite users email address>
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user "deletes location" by clicking on "Delete Location" button
Then user should receive a "Delete Location" popup
When user "Clicks on Delete in" the "Delete Location" popup
#When user "Clicks on Yes in" the "Delete Location" popup
Then user should be displayed with the "Add New Device" screen
Then user selects "Close Button" from "Add New Device" screen
Then user "Clicks on sign out button in" the "Exit Honeywell Home" popup

Examples:
|invite users email address   | Password  | invited users email address | valid first locations zip code |Current Screen           | Previous Screen   |
|unit77@grr.la  			  | Password1 | unit76@grr.la				| 90001						  	 |Add New Device Dashboard | Dashboard         |

#Requirements : Single location with solution and push notifications
@GeneralPushNotificationAfterLogout             @Automated
Scenario Outline: As a user I want to verify push notifcation clear after user logged out
Given user sets the entry/exit timer to <Timer> seconds 
Given user launches and logs in to the Lyric Application
Then user clears all push notifications
Then user closes the coach marks
And user is set to <Mode> mode through CHIL
When user navigates to "Security Solution Card" screen from the "Dashboard" screen
And user switches from <Mode> to "Away"
And user should be displayed with a switching to <UMode> text
And user status should be set to "Away"
And user receives a <Push Notification> push notification
Then user logs out of the app
Then user should not be displayed with Honeywell Home push notifications
Examples: 
|Timer| Mode | UMode| Push Notification 	|
|15	  | Home | Away | SET TO AWAY			|

#Permission pop up 
#Location service off on the phone device
#Cannot Automate in iOS
@GeneralLocationServicesOnPopupCancelFunctionality          @AutomatedOnAndroid			@LimitationOnInvokingSettingsAppOnIOS  @NotAutomatable	
Scenario: As a user I want to verify turn on location service popup cancel functionality
Given user launches the Lyric application without closing the popup
Then user turns off the mobile device location
Then user should receive a "Turn On Location services" popup
Then user "Clicks on Skip button in" the "Turn on Location Services" popup
Then user should not receive a "Turn On Location Services" popup

#Requirements : Location service off on the phone device
#Cannot Automate in iOS
@GeneralLocationServicesOnPopupSettingsFunctionality          @AutomatedOnAndroid		@LimitationOnInvokingSettingsAppOnIOS   @NotAutomatable
Scenario: As a user I want to verify turn on location service pop up cancel functionality
Given user launches the Lyric application without closing the popup
Then user turns off the mobile device location
Then user should receive a "Turn On Location services" popup
Then user "Clicks on Settings button in" the "Turn on Location Services" popup
Then user should be displayed with the "Mobile device Location settings" screen
When user selects "Enable Location" from "Mobile device Location settings" screen
Then user launches the Lyric application after turning on the device location
Then user should not receive a "Turn On Location Services" popup


#Cannot Automate in iOS
@GeneralLocationPermissionDenyFunctionality          @AutomatedOnAndroid   @NotAutomatableOniOS    @NotAutomatable
Scenario: As a user I want to verify Deny option in location permission popup
Given user launches the Lyric application without closing the popup
Then user turns off the mobile device location
Then user should receive a "Turn On Location services" popup
Then user "Clicks on Settings button in" the "Turn on Location Services" popup
Then user should be displayed with the "Mobile device Location settings" screen
When user selects "Enable Location" from "Mobile device Location settings" screen
Then user launches and logs in to the Lyric application without closing the popup
Then user should receive a "Allow Honeywell to access this devices location" popup
And user should be displayed with the following "Allow Honeywell to access this devices location" options:
|AllowHoneywellToAccessThisDevicesLocation|
|Allow									  |
|Deny									  |
When user "selects Deny button from" the "Allow Honeywell to access this devices location" popup
Then user should not receive a "Allow honeywell to access this devices location" popup
#And user navigates to "Hoenywell permission" settings            ------- Cannot automate the next 2 steps on Android relating to Device Settings
#And user should be displayed with "location permission deny"


#Cannot Automate in iOS
@GeneralLocationPermissionAllowFunctionality          @AutomatedOnAndroid      @NotAutomatableOniOS   @NotAutomatable
Scenario: As a user I want to verify Allow option in location permission pop up
Given user launches the Lyric application without closing the popup
Then user turns off the mobile device location
Then user should receive a "Turn On Location services" popup
Then user "Clicks on Settings button in" the "Turn on Location Services" popup
Then user should be displayed with the "Mobile device Location settings" screen
When user selects "Enable Location" from "Mobile device Location settings" screen
Then user launches and logs in to the Lyric application without closing the popup
Then user should receive a "Allow Honeywell to access this devices location" popup
And user should be displayed with the following "Allow Honeywell to access this devices location" options:
|AllowHoneywellToAccessThisDevicesLocation|
|Allow									  |
|Deny									  |
When user "selects Allow button from" the "Allow Honeywell to access this devices location" popup
Then user should not receive a "Allow honeywell to access this devices location" popup
#And  user navigates to "Hoenywell permission" settings		      ------- Cannot automate the next 2 steps on Android relating to Device Settings
#And user should be displayed with "location permission Allow"


#iOS 
@GeneralLocationPermissionDontAllowFunctionality          @Automated
Scenario: As a user I want to verify Never option in location permission pop up 
Given user launches and logs in to the Lyric Application without closing the popup
When user should receive a "Allow honeywell to access your location" popup
Then user should be displayed with the "Geofencing will not work unless" description
Then user should be displayed with the following "Allow honeywell to access your location" options:
|AllowHoneywellToAccessYourLocationOptions|
|Only while using the app				  |
|Always allow							  |
|Dont Allow							  	  | 
Then user "selects Dont Allow button from" the "Allow honeywell to access your location" popup
Then user should not receive a "Allow honeywell to access your location" popup
#Cannot automate the next 2 steps on ios relating to Device Settings
#And  user navigates to "Hoenywell permission" settings
#And user should be displayed with "Never"

#iOS
@GeneralLocationPermissionAlwaysAllowFunctionality          @Automated
Scenario: As a user I want to verify Always option in location permission popup 
Given user launches and logs in to the Lyric Application without closing the popup
When user should receive a "Allow honeywell to access your location" popup
Then user should be displayed with the "Geofencing will not work unless" description
Then user should be displayed with the following "Allow honeywell to access your location" options:
|AllowHoneywellToAccessYourLocationOptions|
|Only while using the app				  |
|Always allow							  |
|Dont Allow							  	  | 
Then user "selects Allow button from" the "Allow honeywell to access your location" popup
Then user should not receive a "Allow honeywell to access your location" popup
#And  user navigates to "Hoenywell permission" settings	    ------- Cannot automate the next 2 steps on ios relating to Device Settings
#And user should be displayed with "Always"

#iOS
@GeneralLocationPermissionWhileUsingTheAppFunctionality          @Automated
Scenario: As a user I want to verify While using the app option in location permission popup 
Given user launches and logs in to the Lyric Application without closing the popup
When user should receive a "Allow honeywell to access your location" popup
Then user should be displayed with the "Geofencing will not work unless" description
Then user should be displayed with the following "Allow honeywell to access your location" options:
|AllowHoneywellToAccessYourLocationOptions|
|Only while using the app				  |
|Always allow							  |
|Dont Allow							  	  | 
Then user "selects Only While using the app button from" the "Allow honeywell to access your location" popup
Then user should not receive a "Allow honeywell to access your location" popup
#And  user navigates to "Hoenywell permission" settings    ------- Cannot automate the next 2 steps on ios relating to Device Settings
#And user should be displayed with "While Using the App"

#iOS
@GeneralNotificationPermissionAllowFunctionality          @Automated
Scenario: As a user I want to verify Deny option in location permission popup 
Given user launches and logs in to the Lyric Application without closing the popup
When user should receive a "Allow honeywell to access your location" popup
Then user "selects Allow button from" the "Allow honeywell to access your location" popup
When user should receive a "Honeywell would like to send you notifications" popup
Then user should be displayed with the "Notifications may include alerts" description
Then user should be displayed with the following "Honeywell would like to send you notifications" options:
|HoneywellWouldLikeToSendYouNotifications|
|Dont Allow								 |
|Allow									 |
When user "selects Allow button from" the "Honeywell would like to send you notifications" popup
Then user should not receive a "Honeywell would like to send you notifications" popup
#And  user navigates to "Hoenywell Notification permission" settings  ------- Cannot automate the next 2 steps on ios relating to Device Settings
#And user should be displayed with "Allow notifcations" enabled

#iOS
@GeneralNotificationPermissionDontAllowFunctionality          @Automated
Scenario: As a user I want to verify Deny option in location permission popup 
Given user launches and logs in to the Lyric Application without closing the popup
When user should receive a "Allow honeywell to access your location" popup
Then user "selects Allow button from" the "Allow honeywell to access your location" popup
When user should receive a "Honeywell would like to send you notifications" popup
Then user should be displayed with the "Notifications may include alerts" description
Then user should be displayed with the following "Honeywell would like to send you notifications" options:
|HoneywellWouldLikeToSendYouNotifications|
|Dont Allow								 |
|Allow									 |
When user "selects Dont Allow button from" the "Honeywell would like to send you notifications" popup
Then user should not receive a "Honeywell would like to send you notifications" popup
#And  user navigates to "Hoenywell Notification permission" settings ------- Cannot automate the next 2 steps on ios relating to Device Settings
#And user should be displayed with "Allow notifcations" disabled 

#Android
#@GeneralLocationPermissionAllowFunctionalityAfterLogin          @Automatable
Scenario: As a user I want to verify Allow option in location permission popup 
Given user launches and logs in to the Lyric application without closing the popup
When user should receive a "Allow Honeywell to access this devices location" popup
And user should be displayed with the following "Allow Honeywell to access this devices location" options:
|AllowHoneywellToAccessThisDevicesLocation|
|Allow									  |
|Deny									  |
When user "selects Allow button from" the "Allow Honeywell to access this devices location" popup
Then user should not receive a "Allow Honeywell to access this devices location" popup

#Android
#@GeneralLocationPermissionDenyFunctionalityAfterLogin          @Automatable
Scenario: As a user I want to verify Deny option in location permission popup 
Given user launches and logs in to the Lyric application without closing the popup
When user should receive a "Allow Honeywell to access this devices location" popup
And user should be displayed with the following "Allow Honeywell to access this devices location" options:
|AllowHoneywellToAccessThisDevicesLocation|
|Allow									  |
|Deny									  |
When user "selects Deny button from" the "Allow Honeywell to access this devices location" popup
Then user should not receive a "Allow Honeywell to access this devices location" popup
