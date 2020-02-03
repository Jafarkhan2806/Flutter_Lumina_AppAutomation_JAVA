@GeneralGlobalDrawerUnderScenarios @Platform
Feature: General global drawer under scenarios 
	As a user I want to verify under global drawer scenaios

@NavigateToPhoneSettings
Scenario: Navigate to Phone Settings from Honeywell Home app
Given user launches and logs in to the Lyric application
Then user should be displayed with the "Dashboard" screen
When user minimizes the app
And user turns off location services in app settings privacy screen
	
#Single location with out any solution for UK Location
@GeneralGlobalDrawerWithoutSolutionVerificationForUKLocation			@Automated			@--xrayid:ATER-67850	
Scenario: As a user i want to view the options displayed in global drawer without a solution for UK location
Given user launches and logs in to the Lyric application
When user navigates to "Global Drawer" screen from the "Dashboard" screen
Then user should be displayed with the following "Global Drawer Without Solution For UK Location" options:
| GlobalDrawerWithoutSolutionORWithWLDSolutionForUKLocation	|
| Without Automation Header									|
| Without Geofence option									|
| Home Header												|
| Activity history											|
| Users														|
| Address													| 
| Account Header											|
| Account Details											|
| About the app												|
| FAQs														|
| Logout													|
#And user logs out of the app


#Single location with out any solution for US Location
@GeneralGlobalDrawerWithoutSolutionVerificationForUSLocation				@Automated			@--xrayid:ATER-67851
Scenario: As a user i want to view the options displayed in global drawer without a solution for US location
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer Without Solution For US Location" options:
| GlobalDrawerWithoutSolutionORWithWLDSolutionForUSLocation	|
| Without Automation Header									|
| Without Geofence option									|
| Home Header												|
| Activity history											|
| Users														|
| Address													| 
| Account Header											|
| Account Details											|
| About the app												|
| No FAQs For US location									|
| Logout													|
#And user logs out of the app


#WLD Solution for UK Location
@GeneralGlobalDrawerWithWLDSolutionVerificationForUKLocation				@Automated			@--xrayid:ATER-67852
Scenario: As a user i want to view the options displayed in global drawer with WLD solution for UK location
Given user launches and logs in to the Lyric Application
Then user selects "Home" from "Dashboard" screen
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With WLD Solution For UK Location" options:
| GlobalDrawerWithoutSolutionORWithWLDSolutionForUKLocation	|
| Without Automation Header									|
| Without Geofence option									|
| Home Header												|
| Activity history											|
| Users														|
| Address													| 
| Account Header											|
| Account Details											|
| About the app												|
| FAQs														|
| Logout													|
#And user logs out of the app


#WLD Solution for US Location
@GeneralGlobalDrawerWithWLDSolutionVerificationForUSLocation				@Automated			@--xrayid:ATER-67853
Scenario: As a user i want to view the options displayed in global drawer with WLD solution for US location
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With WLD Solution For US Location" options:
| GlobalDrawerWithoutSolutionORWithWLDSolutionForUSLocation	|
| Without Automation Header									|
| Without Geofence option									|
| Home Header												|
| Activity history											|
| Users														|
| Address													| 
| Account Header											|
| Account Details											|
| About the app												|
| No FAQs For US location									|
| Logout													|
#And user logs out of the app


#DAS, C1, C2 Solution for UK Location
@GeneralGlobalDrawerWithSolutionForDASC1C2VerificationForUKLocation			@Automated			@--xrayid:ATER-67854
Scenario: As a user i want to view the options in global drawer scenarios for DAS or C1 or C2 solutions for UK location
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With DAS C1 C2 Solution For UK Location" options:
| GlobalDrawerWithDASC1C2SolutionForUKLocation		|
| Automation Header									|
| Geofence 											|
| Home Header										| 
| Activity history									|
| Add Users											|
| Address											| 
| Account Header									|
| Honeywell Membership For Android					|
| Edit Account										|
| About the app										|
| FAQs												|
| Logout 											|
#And user logs out of the app


#DAS, C1, C2 for US Location
@GeneralGlobalDrawerWithSolutionForDASC1C2VerificationForUSLocation			@Automated			@--xrayid:ATER-67855
Scenario: As a user i want to view the options in global drawer scenarios for DAS or C1 or C2 solutions for US location
Given user launches and logs in to the Lyric Application
Then user selects "Location2" from "Dashboard" screen
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With DAS C1 C2 Solution For US Location" options:
| GlobalDrawerWithDASC1C2SolutionForUSLocation		|
| Automation Header									|
| Geofence 											|
| Home Header										| 
| Activity history									|
| Users												|
| Address											| 
| Account Header									|
| Honeywell Membership For Android					|
| Account Details									|
| About the app										|
| No FAQs For US location							|
| Logout 											|
#And user logs out of the app


#JASPEREMEA for UK Location
@GeneralGlobalDrawerWithSolutionForJASPEREMEAVerificationForUKLocation			@Automated			@--xrayid:ATER-67856
Scenario: As a user i want to view the options in global drawer scenarios for Jasper EMEA solution for UK location
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With JASPER EMEA Solution For UK Location" options:
| GlobalDrawerWithJasperEMEASolutionForUKLocation	|
| Automation Header									|
| Geofence 											| 
| Holiday											|
| Home Header										|
| Activity history									|
| Users												|
| Address											| 
| Account Header									|
| Account Details									|
| About the app										|
| FAQs												|
| Logout 											|
#And user logs out of the app


#JasperNA for US Location
@GeneralGlobalDrawerWithSolutionForJASPERNAVerificationForUSLocation			@Automated			@--xrayid:ATER-67857
Scenario: As a user i want to view the options in global drawer scenarios for Jasper NA solution for US location
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen 
Then user should be displayed with the following "Global Drawer With JASPER NA Solution For US Location" options:
| GlobalDrawerWithJasperNASolutionForUSLocation		|
| Automation Header									|
| Geofence 											|
| Vacation											|
| Home Header										| 
| Activity history									|
| Users												|
| Address											| 
| Account Header									|
| Account Details									|
| About the app										|
| No FAQs For US location							|
| Logout 											|
#And user logs out of the app


#Geofence 
#Geofence this location disabled and enabled
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions
@GeneralGlobalDrawerEnableAndDisableGeofence					@Automated			@--xrayid:ATER-67858
Scenario:  As a user I want to verify the enable and disable geofence option under global drawer when a solution is present
Given user launches and logs in to the Lyric Application
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "on"
Then user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
When user navigates to "Geofence Radius" screen from the "Geofence Settings" screen
And user selects "Update Geofence Center" from "Geofence Radius" screen
Then user should receive a "Update Geofence Center" popup
And user "Cancels" the "Update Geofence Center" popup
When user selects "Update Geofence Center" from "Geofence Radius" screen
Then user should receive a "Update Geofence Center" popup
And user "Clicks on UPDATE in" the "Update Geofence Center" popup
When user selects "Save button" from "Geofence Radius" screen
Then user should be displayed with the "Geofence Settings" screen
And "Geofencing" value should be updated to "ON" on "Geofence Settings" screen
And user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
When user changes the "Geofence this location toggle" to "off"
Then the following "Geofence Settings" options should be disabled:
| Options					|
| Geofence this Location	|
And user should not be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|


#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions
@GeneralGlobalDrawerUpdateGeofenceCenterAndTapOnBackButtonInGeofenceRadius     @Automated			@--xrayid:ATER-67859
Scenario: As a user I want to verify if cancel geofence changes popup appears when YES, Update button is selected in Update Geofence Center popup and tap on back button in Geofence Radius screen
Given user launches and logs in to the Lyric Application
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "on"
Then user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
When user navigates to "Geofence Radius" screen from the "Geofence Settings" screen
And user selects "Update Geofence Center" from "Geofence Radius" screen
Then user should receive a "Update Geofence Center" popup
And user "Clicks on UPDATE in" the "Update Geofence Center" popup
When user selects "Back button" from "Geofence Radius" screen
Then user should receive a "Cancel Geofence Changes" popup
And user "Cancels" the "Cancel Geofence Changes" popup
When user selects "Back button" from "Geofence Radius" screen
Then user should receive a "Cancel Geofence Changes" popup
And user "Accepts" the "Cancel Geofence Changes" popup
Then user should be displayed with the "Geofence Settings" screen
And "Geofencing" value should be updated to "ON" on "Geofence Settings" screen
And user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|


#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions
@GeneralGlobalDrawerTapOnBackButtonInGeofenceRadiusWithoutUpdatingGeofenceCenter    @Automated			@--xrayid:ATER-67860
Scenario: As a user I want to verify if Geofence Settings screen is displayed when tapped on back button in Geofence Radius screen
Given user launches and logs in to the Lyric Application
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "on"
Then user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
When user navigates to "Geofence Radius" screen from the "Geofence Settings" screen
And user selects "Back button" from "Geofence Radius" screen
Then user should be displayed with the "Geofence Settings" screen
And "Geofencing" value should be updated to "ON" on "Geofence Settings" screen
And user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|


#Geofence this location disabled and enabled when location serivce off 
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions  with out Geofence 
@GeneralGlobalDrawerGoefnecedisabledEnablewhileDIYwhenlocationserviceoff				@NotAutomatable			@--xrayid:ATER-68224
Scenario Outline: As a user I want to verify the disabled and enabled geofence option when location service off under global drawer when configued solution with out geofence enable
Given user launches and logs in to the Lyric Application
And user turn off the "Location service" on the phone
And user configured the <Solution> with out geofence 
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" button 
Then user navigates to "Geofence option" screen
And user disaplyed with disabled "Geofence this Location" option 
When user enables the "Geofence this Location" toggle button 
Then user should be displayed with "Location services disabled" popup 
When user enables the "Locatiton service" on the phone 
Then user enables the "Geofence this Location" toggle button 
And user should be displayed with following "Geofence this location" options :
|Geofence this location |
|Geofence Radius |
|Location Status |
|Geofence Alert |
When user disabled the "Goefnece this location" 
Then user should dispaly with "Disabling geofencing" popup 
And user should not be displayed with following "Geofence this location" options :
|Geofence this location |
|Geofence Radius |
|Location Status |
|Geofence Alert |

Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|C1|
|C2|
|DAS|


#Geofence this location Permission pop up Dismiss
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS  or all the solutions  with out Geofence 
@GeneralGlobalDrawerGoefnecedisabledEnablewhileDIYwhenlocationpermissionoffDismiss				@NotAutomatable			@--xrayid:ATER-68225
Scenario Outline: As a user I want to verify the disabled and enabled geofence option when location permission off under global drawer when configued solution with out geofence enable
Given user launches and logs in to the Lyric Application
And user turn off the "locaiton permission" on the phone
And user configured the <Solution> with out geofence 
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" button 
Then user navigates to "Geofence option" screen
And user disaplyed with disabled "Geofence this Location" option 
When user enables the "Geofence this Location" toggle button 
Then user should be displayed with "Update Location Permissions" pop up
When user "Dismiss" the  "Update Location Permissions" pop up
Then user should be dsipalyed with disabled "Geofence this Location" option

Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|C1|
|C2|
|DAS|


#Geofence this location Permission pop up show me how
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS  or all the solutions  with out Geofence 
@GeneralGlobalDrawerGoefnecedisabledEnablewhileDIYwhenlocationpermissionoffshowmehow				@NotAutomatable			@--xrayid:ATER-68226
Scenario Outline: As a user I want to verify the disabled and enabled geofence option when location permission off -- show me how , under global drawer when configued solution with out geofence enable
Given user launches and logs in to the Lyric Application
And user turn off the "locaiton permission" on the phone
And user configured the <Solution> with out geofence 
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" button 
Then user navigates to "Geofence option" screen
And user disaplyed with disabled "Geofence this Location" option 
When user enables the "Geofence this Location" toggle button 
Then user should be displayed with "Update Location Permissions" pop up
When user selects the "Show me how" button 
Then user should be displayed  with the "Question" screen
# YES 
When user selects "YES" button 
Then user should be displayed with "You found this helpful" text  
And user should not displayed with the "Options" 
# No When user selects any one "Questions"
When user selects "NO" button 
Then user should be displayed with "You didn't find this helpful" text 
And user should not displayed with the "Options" 
When user selects the "Contact us" button
Then user should be displayed with "New Conversation" screen 
And user enters the "email" and "Your name"
And user enters the text in "Home can we help" field
And user attach the "Screen shot" 
And user attached file should be displayed in "How can we halp" field
When user selects the "Send" option 
Then user should be displayed with "Thanks for contacting us" pop up 
And user should be displayed with disabled "Geofence this location" option

Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|C1|
|C2|
|DAS|


#Geofence this location Permission pop up Go to settings
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS  or all the solutions  with out Geofence 
@GeneralGlobalDrawerGoefnecedisabledEnablewhileDIYwhenlocationpermissionoffGoToSettings				@NotAutomatable			@--xrayid:ATER-68227
Scenario Outline: As a user I want to verify the disabled and enabled geofence option when location permission off -- Go to settings , under global drawer when configued solution with out geofence enable
Given user launches and logs in to the Lyric Application
And user turn off the "locaiton permission" on the phone
And user configured the <Solution> with out geofence 
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" button 
Then user navigates to "Geofence option" screen
And user disaplyed with disabled "Geofence this Location" option 
When user enables the "Geofence this Location" toggle button 
Then user should be displayed with "Update Location Permissions" pop up
When user selects the "Go to Settings" option 
Then user naivgates to "Location persmissions" screen
When user enables the "Location persmissions" 
Then user anviagtes to "Geofence option" screen
And should be displayed with enabled "Geofence this location" option
And user should be displayed with following "Geofence this location" options :
|Geofence this location |
|Geofence Radius |
|Location Status |
|Geofence Alert |

Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|C1|
|C2|
|DAS|


#Geofence radius -- FeofenceCenter.feature 
#				 -- GeofenceRadiusUpdate.feature
#				 -- GeofenceManager.feature
#				 -- GeofenceSet.feature	 
#Geofence Alert 
#Requirements : single location with jasperNA or JapserEMEA or C1 or C2 or DAS  or all the solutions  with out Geofence 
@GeneralGlobalDrawerVerifyPushNotificationWhenGeofenceAlertIsEnabledAndDisabled				@Automated			@--xrayid:ATER-67861
Scenario Outline: As a user I want to verify if push notification is received when geofence alert toggle is enabled
Given user has <Mode> system mode
And user thermostat is set to "geofence based" schedule
When user launches and logs in to the Lyric application
When user clears all push notifications
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "on"
When user changes the "Geofence Alert toggle" to "on"
And user thermostat set <Period> with <Geofence>
Then user receives a "Geofence crossed Home" push notification
And user thermostat set <UPeriod> with <UGeofence>
Then user receives a "Geofence crossed Away" push notification
When user clears all push notifications
Then user selects "HOME OFFICE" from "Dashboard" screen
Then user navigates to "Global Drawer" screen from the "Dashboard" screen 
And user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence Alert toggle" to "off"
And user thermostat set <Period> with <Geofence>
Then user should not receive a "Geofence crossed Home" push notification
And user thermostat set <UPeriod> with <UGeofence>
Then user should not receive a "Geofence crossed Away" push notification

Examples:
| Mode	| Period			| Geofence		| UPeriod		| UGeofence		|
| Heat	| Home			| UserArrived  	| Away			| UserDeparted	|
| Cool	| UserArrived  	| Home			| Away			| UserDeparted	|


#ActivityHistory
#Requirements : single location with out any solution 
@GeneralGlobalDrawerWithoutSolutionActivityHistoryNoMsgsLabel				@Automated			@--xrayid:ATER-67862
Scenario: As a user i want to Verify No messages label in Activity History screen when no solution is configured for the logged in account
Given user launches and logs in to the Lyric Application
When user navigates to "Activity History" screen from the "Dashboard" screen
Then user should be displayed with "No Messages label in Activity History screen"
And user should not be displayed with the following "Activity History" options:
| ActivityHistoryOptions	|
| Edit						|
Then user navigates to "Global Drawer" screen from the "Activity History" screen
#And user logs out of the app


#Activity history with all solution 
#Requirements : single location with jasperNA or JapserEMEA
@GeneralGlobalDrawerVerifyActivityHistoryMsgWithoutTitleForComfortSolution				@NotAutomatable			@--xrayid:ATER-
Scenario Outline: As a user I want to view Activity history message without title  for Comfort solution
Given user launches and logs in to the Lyric Application
And user configured the <Solution>
When user navigates to "Activity History" screen from the "Dashboard" screen 
Then user should be displayed with All "triggered" event for all the <Solution>
And user should be displayed with Activity history message title only
When user selects the any Message which is truncated and displayed in Activity history
Then user should be navigated to respective "Message" screen 
And user navigates back to "Activity History" screen from "Message" screen

Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|HB|
|BB|
|DWH|


@GeneralGlobalDrawerVerifyActivityHistoryMsgWithTitleForSecuritySolution				@NotAutomatable			@--xrayid:ATER-
Scenario Outline: As a user I want to view Activity history message without title  for Security solution
Given user launches and logs in to the Lyric Application
And user configured the <Solution>
When user navigates to "Activity History" screen from the "Dashboard" screen 
Then user should be displayed with All "triggered" event for all the <Solution>
And user should be displayed with Activity history message title and subtitle
When user selects the any Message which is truncated and displayed in Activity history
Then user should be navigated to respective "Message" screen 
And user navigates back to "Activity History" screen from "Message" screen
When user selects the "Video Message" of "C1 or C2 or DAS -ISMV or OSMV"
Then user should be navigates to "Video Clip" screen 
And user should be displayed with one "Video Clip"
And user able to "Play the video clip"
And user should display the "Video Play" option once video completed
When user select the "Download" option 
Then user should "Download" the "video Clip"
And user should display with "Download success" pop up 
When user "Deletes" the clip"
Then user navigates to "Activity History" screen
When user selects "older video message" more than 24 hours of "C1 or C2 or DAS -ISMV or OSMV"
Then user should be navigates to "Video CLip" screen 
And user should be displayed with "Error" pop up as "Clip has expired"

Examples:
|Solution|
|C1|
|C2|
|DAS|
|WLD|


#Requirements : single location with jasperNA or JapserEMEA or WLD or C1 or C2 or DAS or all the solutions and trigged all the events 
@GeneralGlobalDrawerWithSolutionActivityHistoryVerification				@NotAutomatable			@--xrayid:ATER-68228
Scenario Outline: As a user i want to view the under global drawer scenarios  with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions  
Given user launches and logs in to the Lyric Application
And user configured the <Solution>
When user navigates to "Activity History" screen from the "Dashboard" screen 
Then user should be displayed with All "triggered" event for all the <Solution>
When user selects the any "Message"
Then user should be navigated to respective "Message" screen 
And user navigates back to "Activity History" screen from "Message" screen 
When user selects the "Video Message" of "C1 or C2 or DAS -ISMV or OSMV"
Then user should be navigates to "Video Clip" screen 
And user should be displayed with one "Video Clip"
And user able to "Play the video clip"
And user should display the "Video Play" option once video completed
When user select the "Download" option 
Then user should "Download" the "video Clip"
And user should display with "Download success" pop up 
When user "Deletes" the clip"
Then user navigates to "Activity History" screen
When user selects "older video message" more than 24 hours of "C1 or C2 or DAS -ISMV or OSMV"
Then user should be navigates to "Video CLip" screen 
And user should be displayed with "Error" pop up as "Clip has expired"
Examples:
|Solution|
|JasperNA|
|JasperEMEA|
|C1|
|C2|
|DAS|
|WLD| 

#Activity history Edit selected message  with all solutions
#Requirements : single location with jasperNA or JapserEMEA or WLD or C1 or C2 or DAS or all the solutions  and triggered all the events 
@GeneralGlobalDrawerWithSolutionActivityHistoryDeleteAMessage				@Automated			@--xrayid:ATER-67863
Scenario: As a user i want to delete selected Activity history message with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions
Given user launches and logs in to the Lyric Application
When user navigates to "Activity History" screen from the "Dashboard" screen
When user selects "Edit" from "Activity History" screen
And the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Select All					|
Then the following "Activity History" options should be disabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "a message" from "Activity History" screen
Then the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "Cancel" from "Activity History" screen
Then user should not be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Select All					|
| Delete						|
When user selects "Edit" from "Activity History" screen
And the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Select All					|
Then the following "Activity History" options should be disabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "a message" from "Activity History" screen
Then the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "Delete" from "Activity History" screen 
Then "deleted message" should not be displayed in the "Activity History" screen
#And user logs out of the app

#Activity history Edit select all message  with all solutions
#Requirements : single location with jasperNA or JapserEMEA or WLD or C1 or C2 or DAS or all the solutions  and trigged all the events 
@GeneralGlobalDrawerWithSolutionActivityHistoryDeleteAllMessages				@Automated			@--xrayid:ATER-67864
Scenario: As a user i want to delete all messages from Activity history with jasperNA or JapserEMEA or C1 or C2 or DAS or all the solutions
Given user launches and logs in to the Lyric Application
When user navigates to "Activity History" screen from the "Dashboard" screen
When user selects "Edit" from "Activity History" screen
And the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Select All					|
Then the following "Activity History" options should be disabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "all messages" from "Activity History" screen
Then the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "Cancel" from "Activity History" screen
Then user should not be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Select All					|
| Delete						|
When user selects "Edit" from "Activity History" screen
And the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Select All					|
Then the following "Activity History" options should be disabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "all messages" from "Activity History" screen
Then the following "Activity History" options should be enabled:
| ActivityHistoryOptions		|
| Delete						|
And user should be displayed with the following "Activity History" options:
| ActivityHistoryOptions		|
| Cancel						|
When user selects "Delete" from "Activity History" screen 
Then user should be displayed with "No Messages label in Activity History screen"
#And user logs out of the app

#ManageUsers
#Requirements : single location with and with out any solution 
@GeneralGlobalDrawerAddDeleteUsersFromInviteList				@Automated	@--xrayid:ATER-67865
Scenario Outline: As a user I want to Verify invite user functionality by adding and removing a user from invite list
Given user launches and logs in to the Lyric Application
When user navigates to "Invite New User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user deletes the <invite users email address> from "Users" screen
Then user should receive a "Delete User" popup
And user "Clicks on Ok in" the "Delete User" popup
Then user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
Then user should be displayed with "No Users label"
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user should be displayed with the "Add New Device" screen

Examples:
| invite users email address	|
| das_stage5@grr.la				|


#Requirements : single location with and with out any solution and user should be invited 
@GeneralGlobalDrawerInviteUserWithLoggedInUserEmail				@Automated			@--xrayid:ATER-67866	
Scenario: As a user i want to Verify if error message displays when logged in users email address in Add Users
Given user launches and logs in to the Lyric Application
When user navigates to "Users" screen from the "Dashboard" screen
Then user should not be displayed with the following "Invited Users" options:
| InvitedUsersList	|
| Logged in user	|
#When user navigates to "Invite User" screen from the "Manage Users" screen
When user selects "Invite New User" from "Users" screen
Then user inputs "Logged in users email address" in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "User already added to this account error" options:
|UserAlreadyAddedErrorValidation					 |
|The requested user was already added to this account|
#When user navigates to "Manage Users" screen from the "Invite New User" screen
Then user clicks on the back arrow in the "Invite New User" screen
Then user should not be displayed with the following "Invited Users" options:
| InvitedUsersList	|
| Logged in user		|


#Requirements : single location with and with out any solution and user should be invited 
@GeneralGlobalDrawerInviteUserWithAlreadyInvitiedUsersEmail			@Automated		@--xrayid:ATER-67867
Scenario Outline: As a user i want to Verify if error message displays when already existing invited users email address is entered in Add Users 
Given user launches and logs in to the Lyric Application
When user navigates to "Users" screen from the "Dashboard" screen
When user selects "Invite New User" from "Users" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
#Then user clicks on the back arrow in the "Invite New User" screen
#When user navigates to "Invite New User" screen from the "Manage Users" screen
When user selects "Invite New User" from "Users" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "User already added to this account error" options:
|UserAlreadyAddedErrorValidation					  |
|The requested user was already added to this account|
#And user "Clicks on OK in" the "User already added to this account error" popup
#When user navigates to "Manage Users" screen from the "Invite New User" screen
Then user clicks on the back arrow in the "Invite New User" screen
And user deletes the <invite users email address> from "Users" screen
Then user should receive a "Delete User" popup
And user "Clicks on Cancel in" the "Delete User" popup
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user deletes the <invite users email address> from "Users" screen
Then user should receive a "Delete User" popup
And user "Clicks on OK in" the "Delete User" popup
Then user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|

Examples:
| invite users email address	|
| das_stage5@grr.la				|


#Requirements : Single location with and with out any solution
@GeneralGlobalDrawerInvitNewUser				@NotAutomatable		@--xrayid:ATER-68240
Scenario Outline: As a user i want to verify invite new user and with out activation the account user should not receive any alerts
Given user launches and logs in to the Lyric Application
When user navigates to "Invite New User" screen from the "Dashboard" screen
Then user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
And user should not be displayed with the following "Manage Users" options:
| InvitedUsersList  | 
| new account|
When user navigates to "New user" Email account
Then user trigger the events 
And new user should not be receive events mail
Then user should be displayed with invited mail 
When new user download the app or open the app
Then user Activated account
And user should be displayed with invited location details
Examples:
|invite users email address |
|New account |

  
#HomeAddress
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerClearFieldsInEditAddressAndVerifyPlaceholdersTextDisplayed             @Automated			@--xrayid:ATER-68241
Scenario Outline: As a user i want to Verify placeholder text displayed for each field in Edit Address screen
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions		| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header			| 
| Address Text Field		| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field	| 
| Change Country			|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save						|
Then user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country> in "Search Text Field" in the "Please confirm your country" screen
When user clears the text displayed in the following text fields in the "Edit Address" screen:
Then user should be displayed with the placeholder text for the following fields in "Edit Address" screen:
| TextFieldsInEditAddressScreen		|
| Location Name Text Field			|
| Address Text Field				| 
| City Text Field					| 
| State Text Field					| 
| Postal Code Text Field			|
When user inputs <Location Name> in "Location Name Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user inputs <Address> in "Address Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user inputs <City> in "City Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user inputs <State> in "State Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with <Location Name> in the "Address" screen
And user should be displayed with <State> in the "Address" screen
And user should be displayed with <Postal Code> in the "Address" screen
And user should be displayed with the following "Address" options:
| AddressOptions				|
| Edit Address Label			|
| Delete Location Option		|

Examples:
|Location Name | Address	| City			| Postal Code	| Country 		|
|TestHome	   | New Room	| My City		| M4B 1B4		| Canada		|
 
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerCancelsTheAddressLocationChanges             @Automated			@--xrayid:ATER-68242
Scenario Outline: As a user i want to verify the app behavior by canceling the address location changes
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions			| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header				| 
| Address Text Field			| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field		| 
| Change Country				|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save					|
When user inputs <Location Name> in "Location Name Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <Address> in "Address Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <City> in "City Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <State> in "State Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user clicks on the back arrow in the "Edit Address" screen
Then user should receive a "Cancel Location Changes" popup
When user "dismisses" the "Cancel Location Changes" popup
Then user should be displayed with the "Edit Address" screen
And user should be displayed with <Location Name> in the "Location Name Text Field in Edit Address" screen
And user should be displayed with <Address> in the "Address Text Field in Edit Address" screen
And user should be displayed with <City> in the "City Text Field in Edit Address" screen
And user should be displayed with <State> in the "State Text Field in Edit Address" screen
And user should be displayed with <Postal Code> in the "Postal Code Text Field in Edit Address" screen
When user clicks on the back arrow in the "Edit Address" screen
Then user should receive a "Cancel Location Changes" popup
When user "accepts" the "Cancel Location Changes" popup
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen

Examples: 
| Location Name	| Address	| City		| State		| Postal Code	| 
| Warehouse		| Appleton	| Niagara	| New York	| 14008			| 

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyUpdatedExistingAddress            @Automated			@--xrayid:ATER-68244
Scenario Outline: As a user i want to verify if updated address is displayed after saving it
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions			| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header				| 
| Address Text Field			| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field		| 
| Change Country				|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save					|
When user inputs <Address> in "Address Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <City> in "City Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <State> in "State Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with <State> in the "Address" screen
And user should be displayed with <Postal Code> in the "Address" screen
And user should be displayed with the following "Address" options:
| AddressOptions				|
| Edit Address Label			|
| Delete Location Option		|

Examples: 
| Address		| City			| State			| Postal Code|
| Coin Street	| Street 12		| Alberta		| 90002		|  
| State Street	| Street 11		| Toronto		| 90004		|  

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyIfExistingAddressIsDisplayedWhenNavFromEditAddressWithoutUpdatingAddress             @Automated			@--xrayid:ATER-68246
Scenario: As a user i want to verify if existing address is displayed when navigated from edit address screen without updating the address
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions			| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header				| 
| Address Text Field			| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field		| 
| Change Country				|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save					|
When user clicks on the back arrow in the "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAddressUpdateWithSameCountry	            @Automated			@--xrayid:ATER-		@LYR-37032
Scenario Outline: As a user i want to verify if address fields are empty when country is updated with same country
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions		| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header			| 
| Address Text Field		| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field	| 
| Change Country			|
And the following "Edit Address" options should be disabled:
| EditAddressOptions	|
| Save					|
When user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country> in "Search Text Field" in the "Please confirm your country" screen
Then user should be displayed with the "Edit Address" screen
And user should be displayed with the following "Address Fields For The Selected Country" options:
| AddressFieldsForTheSelectedCountry	| 
| Location Name Header					| 
| Location Name Text Field				| 
| Address Header						| 
| Address Text Field					| 
| City Text Field						| 
| State Text Field						| 
| Postal Code Text Field				| 
| Change Country						|
And the following "Edit Address" options should be disabled:
| EditAddressOptions	|
| Save					|
When user inputs <State> in "State Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be disabled:
| EditAddressOptions	|
| Save					|
When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Default Country" in the "Address" screen
And user should be displayed with <State> in the "Address" screen
And user should be displayed with <Postal Code> in the "Address" screen
And user should be displayed with the following "Address" options:
| AddressOptions			|
| Edit Address Label		|
| Delete Location Option	|

Examples: 
| State		| Postal Code	| Country 		|
| NY		| 10029			| United States |


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAddressEditWithNewCountryStateAndZipcode             @Automated			@--xrayid:ATER-68247
Scenario Outline: As a user i want to verify if address is getting saved when country is changed and saved by entering state and zip code
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions		| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header			| 
| Address Text Field		| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field	| 
| Change Country			|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save						|
When user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country> in "Search Text Field" in the "Please confirm your country" screen
Then user should be displayed with the "Edit Address" screen
And user should be displayed with the following "Address Fields For The Selected Country" options:
| AddressFieldsForTheSelectedCountry	| 
| Location Name Header					| 
| Location Name Text Field				| 
| Address Header						| 
| Address Text Field					| 
| City Text Field						| 
| State Text Field						| 
| Postal Code Text Field				| 
| Change Country						|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save						|
When user inputs <State> in "State Text Field" in the "Edit Address" screen
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save						|
When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save						|
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with <Country> in the "Address" screen
And user should be displayed with <State> in the "Address" screen
And user should be displayed with <Postal Code> in the "Address" screen
And user should be displayed with the following "Address" options:
| AddressOptions				|
| Edit Address Label			|
| Delete Location Option		|
When user navigates to "Edit Address" screen from the "Address" screen
When user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country1> in "Search Text Field" in the "Please confirm your country" screen
When user inputs <State1> in "State Text Field" in the "Edit Address" screen
When user inputs <Postal Code1> in "Postal Code Text Field" in the "Edit Address" screen
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
Then user logs out of the app

Examples: 
| Country	| State				| Postal Code	| Country1 | Postal Code1 | State1 |
| Argentina	| Buenos Aires		| 1865			| Canada   | M4B 1B3	  |	Toronto|
| Australia	| QLD				| 4822			| Canada   | M4B 1B3	  |	Toronto|
| Austria	| Vienna			| 1000			| Canada   | M4B 1B3	  |	Toronto|
| Belgium	| Brussels			| 1040			| Canada   | M4B 1B3	  |	Toronto|
| Brazil	| Amapa				| 68950-000		| Canada   | M4B 1B3	  |	Toronto|
| Bulgaria	| Plovdiv			| 4000			| Canada   | M4B 1B3	  |	Toronto|
| Canada	| ON				| M5H 2N2		| Canada   | M4B 1B3	  |	Toronto|
| Chile		| Santiago			| 8320000		| Canada   | M4B 1B3	  |	Toronto|
| China		| Beijing			| 100000		| Canada   | M4B 1B3	  |	Toronto|
| Colombia	| Antioquia			| 055038		| Canada   | M4B 1B3	  |	Toronto|


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAddressEditWithNewCountryStateAndInvalidZipcode             @Automated		@--xrayid:ATER-72295
Scenario Outline: As a user i want to verify if address is getting saved when country is changed and saved by entering state and invalid zip code
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen 
Then user should be displayed with the following "Edit Address" options:
| EditAddressOptions			| 
| Location Name Header		| 
| Location Name Text Field	| 
| Address Header				| 
| Address Text Field			| 
| City Text Field			| 
| State Text Field			| 
| Postal Code Text Field		| 
| Change Country				|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save					|
When user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country> in "Search Text Field" in the "Please confirm your country" screen
Then user should be displayed with the "Edit Address" screen
And user should be displayed with the following "Address Fields For The Selected Country" options:
| AddressFieldsForTheSelectedCountry		| 
| Location Name Header					| 
| Location Name Text Field				| 
| Address Header						| 
| Address Text Field					| 
| City Text Field						|
| Postal Code Text Field				| 
| Change Country						|
And the following "Edit Address" options should be disabled:
| EditAddressOptions		|
| Save					|
#When user inputs <State> in "State Text Field" in the "Edit Address" screen
When user inputs <Invalid Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user selects "Save button" from "Edit Address" screen
Then user should receive a "Invalid Zipcode" popup
When user "dismisses" the "Invalid Zipcode" popup
Then user should be displayed with the "Edit Address" screen
When user selects "Change Country" from "Edit Address" screen
Then user should be displayed with the "Please confirm your country" screen
When user inputs <Country1> in "Search Text Field" in the "Please confirm your country" screen
Then user should be displayed with the "Edit Address" screen
When user inputs <State> in "State Text Field" in the "Edit Address" screen
 When user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions		|
| Save					|
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with <Country1> in the "Address" screen
And user should be displayed with <State1> in the "Address" screen
And user should be displayed with <Postal Code> in the "Address" screen
And user should be displayed with the following "Address" options:
| AddressOptions				|
| Edit Address Label			|
| Delete Location Option		|
	
Examples: 
|  Country1   | Country		| State			| Invalid Postal Code	| Postal Code	| State1 		|
| Canada	  | Argentina	| Buenos Aires	| A1					| M4B 1B3		| Toronto		|
| Canada	  | Australia	| QLD			| 0987					| M4B 1B3		| Toronto		|
| Canada	  | Austria		| Vienna		| 4822					| M4B 1B3		| Toronto		|
| Canada	  | Belgium		| Brussels		| 1000					| M4B 1B3		| Toronto		|
| Canada	  | Brazil		| Amapa			| 1040					| M4B 1B3		| Toronto		|
| Canada	  | Bulgaria	| Plovdiv		| 68950-000				| M4B 1B3		| Toronto		|
| Canada	  | Canada		| ON			| 4000					| M4B 1B3		| Toronto		|
| Canada	  | Chile		| Santiago		| M5H 2N2				| M4B 1B3		| Toronto		|
| Canada	  | China		| Beijing		| 8320000				| M4B 1B3		| Toronto		|
| Canada	  | Colombia	| Antioquia 	| 100000				| M4B 1B3		| Toronto		|


  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerAddressValidateMaxCharsInLocationName             @Automated			@--xrayid:ATER-68248
Scenario Outline: As a user i want to verify max characters that can be entered in Location name text field in Edit Address screen
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen
When user inputs <max characters> in "Location Name Text Field" in the "Edit Address" screen
Then user should not be allowed to enter more than "30" characters in "Location Name" in the "Edit Address" screen
When user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Updated Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen
When user navigates to "Edit Address" screen from the "Address" screen
When user inputs "Previous value" in "Location Name Text Field" in the "Edit Address" screen
And user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen
Then user logs out of the app

Examples:
| max characters                   	|
| This is to test max character		|
| This is to test max characters	|
| This is to test max characterss	|
  

@GeneralGlobalDrawerAddressVerifyIfSpecialCharactersAreAllowedInLocationName             @Automated			@--xrayid:ATER-69066
Scenario: As a user i want to verify is special characters can be saved in Location name text field in Edit Address screen 
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen
When user inputs "special characters" in "Location Name Text Field" in the "Edit Address" screen
Then user should not be displayed with "special characters" in "Location Name Text Field" in the "Edit Address" screen
And user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name Without Special Characters" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen
When user navigates to "Edit Address" screen from the "Address" screen
When user inputs "Previous value" in "Location Name Text Field" in the "Edit Address" screen
And user selects "Save button" from "Edit Address" screen
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen
Then user logs out of the app


#Enter space before and after location name
@GeneralGlobalDrawerAddressVerifyIfEmptySpacesAreAllowedInLocationName             @Automated		@--xrayid:ATER-69067
Scenario: As a user i want to verify is empty space can be saved in Location name text field in Edit Address screen
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user navigates to "Edit Address" screen from the "Address" screen
When user inputs "empty spaces" in "Location Name Text Field" in the "Edit Address" screen
Then user selects "Save button" from "Edit Address" screen
And user should receive a "Name Must Start With Letter or Number" popup
When user "accepts" the "Name Must Start With Letter or Number" popup
And user should be displayed with "Location Name With empty spaces" in the "Edit Address" screen
When user clicks on the back arrow in the "Edit Address" screen
Then user should receive a "Cancel Location Changes" popup
When user "accepts" the "Cancel Location Changes" popup
Then user should be displayed with the "Address" screen
And user should be displayed with "Location Name" in the "Address" screen
And user should be displayed with "Location Address" in the "Address" Screen
  

#Requirements : single location with out any solution
@GeneralGlobalDrawerAddressDeleteLocationWithoutAnySoultion            @Automated		@--xrayid:ATER-69069
Scenario Outline: As a user i want to Verify delete location for an account without any solution
Given user launches and logs in to the Lyric application with user account without any location
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <new location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen
When user clicks on the back arrow in the <Current Screen> screen
Then user should be displayed with the <Previous Screen> screen
And user "deletes default location details" by clicking on "delete" button
    
Examples: 
| new location name		| valid zip code	| Current Screen				| Previous Screen	|
| California			| 90001				| Add New Device Dashboard		| Dashboard			|

  
#Requirements : single location with any solution
@GeneralGlobalDrawerAddressDeleteLocationWithAnySolution             @Automated		@--xrayid:ATER-74327			#PendingForAutomation
Scenario: As a user i want to Verify if error popup displays when tapped on delete location for an account with any solution
Given user launches and logs in to the Lyric Application
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user "deletes location" by clicking on "Delete Location" button
Then user should receive a "Delete Location" popup
When user "Clicks on Cancel in" the "Delete Location" popup
Then user should be displayed with the "Address" screen
When user "deletes location" by clicking on "Delete Location" button
Then user should receive a "Delete Location" popup
When user "Clicks on Delete in" the "Delete Location" popup
Then user should be displayed with "Device is associated with account error" popup
When user "accepts" the "Device is associated with account error" popup
Then user should be displayed with the "Address" screen
  
#Requirements : Two location with out any solution
@GeneralGlobalDrawerAddressDeletingMultipleLocationsWithoutAnySolution            @Automated			@--xrayid:ATER-69070
Scenario Outline: As a user i want to verify if user is navigated to other locations dashboard when a location is deleted for an account without any solution
Given user launches and logs in to the Lyric application with user account without any location
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <first location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid first locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <second location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid second locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen
When user clicks on the back arrow in the <Current Screen> screen
Then user should be displayed with the <Previous Screen> screen
#And user "deletes the existing location details" by clicking on "delete" button
And user "deletes location details" by clicking on "delete" button
Then user should be displayed with the "Dashboard" screen
And user "deletes the existing location details" by clicking on "delete" button
    
Examples: 
| first location name	| valid first locations zip code		| second location name	| valid second locations zip code		| Current Screen					| Previous Screen	|
| California				| 90001								|  Texas					| 90002									| Add New Device Dashboard		| Dashboard			|

  
#@GeneralGlobalDrawerWithsolutiondeleteoption
#@GeneralGlobalDrawerHomeaddressfieldvalidationwitherror
#@GeneralGlobalDrawerCityfieldvalidatinmaxcharecters
#@GeneralGlobalDrawerCityfieldvalidatinwitherror
#@GeneralGlobalDrawerStatefieldvalidation
#@GeneralGlobalDrawerStatefieldvalidationerror
#@GeneralGlobalDrawerZipCodevalication
#@GeneralGlobalDrawerZipCodevalicationwitherror

  
#Edit Account
#Edit first name last name
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountUpdateFirstNameAndLastName         @Automated		@--xrayid:ATER-69076
Scenario Outline: As a user i want to Verify if updated first name and last name is getting saved
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
#When user inputs <first name> in "First Name Text Field" in the "Edit Account" screen
#Then user inputs <last name> in "Last Name Text Field" in the "Edit Account" screen
Then user should be displayed with the following "Account Details" options:
|AccountDetailsOptions|
|Name              	  |
|Email			      |
|Change Password      |
|Delete Account       |
|Use Passcode	      |
And user should be displayed with the "First and Last Name in the Account Details" screen
And user should be displayed with the "Logged in Email in the Account Details" screen
#And user selects "Save button" from "Edit Account" screen
Then user selects "Name" from "Account Details" screen
Then user should be displayed with the "Name Edit Account" screen
Then user should be displayed with the following "Name Edit Account" options:
|NameEditAccountOptions|
|First Name			   |
|Last Name			   |
|Save button		   |
Then the following "Save button" options should be disabled:
| Save button		| 
| Save				|
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| First Name Text Field				|
When user inputs <First name> in "First Name Text Field" in the "Name Account Details" screen
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
When user inputs <Last name> in "Last Name Text Field" in the "Name Account Details" screen
Then user selects "Save button" from "Name Edit Account" screen
Then user should be displayed with the "Account Details" screen
#Then user should be displayed with the "Global Drawer" screen
#And user navigates to "Edit Account" screen from the "Global Drawer" screen
Then user should be displayed with "updated first name and last name" in the "Account Details" screen
#Then user should be displayed with "updated last name" in the "Account Details" screen

Examples: 
| First name | Last name | 
| giri       | THEJJ     | 
| sami       | krishna   | 
| vijay      | Govda     | 
| anju       | Chandran  |  
  

#Edit first name last name with error
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountErrorMsgWhenExistingFirstNameIsCleared    @Automated	@--xrayid:ATER-69079   @InvalidScenario
Scenario: As a user i want to Verify if error message is displayed when tried to save account without first name 
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
Then user selects "Name" from "Account Details" screen
When user clears the text displayed in the following text fields in the "Account Details" screen:
| TextFieldsInEditAccountScreen		|
| First Name Text Field				|
Then the following "Save button" options should be disabled:
|Save button|
|Save		|
#And user selects "Save button" from "Account Details" screen
#Then user should receive a "First Name is required" popup
#When user "Clicks on OK in" the "First Name is required" popup
#Then user should be displayed with the "Edit Account" screen
#When user clicks on the back arrow in the "Account Details" screen
#Then user should be displayed with the "Global Drawer" screen
#And user navigates to "Account Details" screen from the "Global Drawer" screen
#Then user should be displayed with "existing first and last name" in the "Account Details" screen
#And user should be displayed with "existing last name" in the "Edit Account" screen

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountErrorMsgWhenExistingLastNameIsCleared   @Automated	@--xrayid:ATER-69080   @InvalidScenario
Scenario: As a user i want to Verify if error message is displayed when tried to save account without last name 
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user clears the text displayed in the following text fields in the "Account Details" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
Then the following "Save Button" options should be disabled:
|SaveButton		 |
|Save			 |
#And user selects "Save button" from "Edit Account" screen
#Then user should receive a "Last Name is required" popup
#When user "Clicks on OK in" the "Last Name is required" popup
#Then user should be displayed with the "Edit Account" screen
#When user clicks on the back arrow in the "Edit Account" screen
#Then user should be displayed with the "Global Drawer" screen
#And user navigates to "Edit Account" screen from the "Global Drawer" screen
#Then user should be displayed with "existing first and last name" in the "Edit Account" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountDisabledAndEnabledSaveButtonWhenFirstNameIsCleared    @Automated		@--xrayid:ATER-69081
Scenario: As a user i want to Verify if save button gets enabled when first name text field is cleared
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
Then user selects "Name" from "Edit Account" screen
Then user should be displayed with the "Name Edit Account" screen
Then user should be displayed with the following "Name Edit Account" options:
|NameEditAccountOptions|
|First Name			   |
|Last Name			   |
|Save button		   |
Then user should be displayed with the "Save button" as disabled
When user clears the text displayed in the following text fields in the "Name Edit Account" screen:
| TextFieldsInEditAccountScreen		|
| First Name Text Field				|
And the following "Name Edit Account" options should be disabled:
| NameEditAccountOptions	| 
| Save					    |
When user clears the text displayed in the following text fields in the "Name Edit Account" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
Then the following "Edit Account" options should be disabled:
| EditAccountOptions		| 
| Save						|
Then user clicks on the back arrow in the "Name Edit Account" screen
Then user should be displayed with "Cancel Name Changes" popup
And user selects "No button" in the "Cancel Name Changes" popup
Then user should be displayed with "Name Edit Account" screen without any changes
Then user clicks on the back arrow in the "Name Edit Account" screen
Then user should receive a "Cancel Name Changes" popup
Then user "clicks on Yes in" the "Cancel Name Changes" popup
Then user should be displayed with the "Edit Account" screen
Then user should be displayed with "existing first and last name" in the "Edit Account" screen
#And user should be displayed with "existing last name" in the "Edit Account" screen

#Then user should receive a "First Name is required" popup
#When user "Clicks on OK in" the "First Name is required" popup
#Then user should be displayed with the "Edit Account" screen
#Then the following "Edit Account" options should be enabled:
#| EditAccountOptions		| 
#| Save					|
#When user clicks on the back arrow in the "Edit Account" screen
#Then user should be displayed with the "Global Drawer" screen
#And user navigates to "Edit Account" screen from the "Global Drawer" screen
#Then user should be displayed with "existing first name" in the "Edit Account" screen
#And user should be displayed with "existing last name" in the "Edit Account" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountDisabledAndEnabledSaveButtonWhenLastNameIsCleared   @Automated	@--xrayid:ATER-74334  @AlreadyCoveredInTheAboveScenario
Scenario: As a user i want to Verify if save button gets enabled when last name text field is cleared
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
And the following "Edit Account" options should be disabled:
| EditAccountOptions		| 
| Save					|
When user clears the text displayed in the following text fields in the "Edit Account" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
Then the following "Edit Account" options should be enabled:
| EditAccountOptions		| 
| Save					|
And user selects "Save button" from "Edit Account" screen
Then user should receive a "Last Name is required" popup
When user "Clicks on OK in" the "Last Name is required" popup
Then user should be displayed with the "Edit Account" screen
Then the following "Edit Account" options should be enabled:
| EditAccountOptions		| 
| Save					|
When user clicks on the back arrow in the "Edit Account" screen
Then user should be displayed with the "Global Drawer" screen
And user navigates to "Edit Account" screen from the "Global Drawer" screen
Then user should be displayed with "existing first and last name" in the "Edit Account" screen
#And user should be displayed with "existing last name" in the "Edit Account" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountValidateMaxCharsInFirstNameAndLastNameTxtFields  @Automated	 @--xrayid:ATER-69082
Scenario Outline: As a user i want to verify max characters that can be entered in first name and last name text fields in Edit Account screen
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
Then user selects "Name" from "Account Details" screen
Then user should be displayed with the "Name Account Details" screen
Then user should be displayed with the following "Name Account Details" options:
|NameAccountDetailsOptions|
|First Name			   |
|Last Name			   |
|Save button		   |
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| First Name Text Field				|
When user inputs <max characters> in "First Name Text Field" in the "Name Account Details" screen
And user should not be allowed to enter more than "40" characters in "First Name" in the "Name Account Details" screen
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
And user inputs <max characters> in "Last Name Text Field" in the "Name Account Details" screen
Then user should not be allowed to enter more than "40" characters in "Last Name" in the "Name Account Details" screen
And user selects "Save button" from "Name Account Details" screen
Then user should be displayed with the "Account Details" screen
#When user navigates to "Edit Account" screen from the "Global Drawer" screen
Then user should be displayed with "Updated First Name and Last Name" in the "Account Details" screen
Then user logs out of the app
#When user inputs "Previous value" in "First Name Text Field" in the "Edit Account" screen
#And user inputs "Previous value" in "Last Name Text Field" in the "Edit Account" screen
#And user selects "Save button" from "Edit Account" screen
#Then user should be displayed with the "Global Drawer" screen
#When user navigates to "Edit Account" screen from the "Global Drawer" screen
#Then user should be displayed with "existing first name" in the "Edit Account" screen
#And user should be displayed with "existing last name" in the "Edit Account" screen

Examples:
| max characters                   			|
| Test maxm characters limit 40 character	|
| Test maxm characters limit 40 characters	|
| Test maxm characters limit 40 characterr	|
| Test maxm characters limit 40 characterss |
  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountValidateSpecialCharsInFirstNameAndLastNameTxtFields  @Automated	  @--xrayid:ATER-69083
Scenario: As a user i want to Verify if special characters can be saved in first name and last name text fields in Edit Account screen
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
Then user selects "Name" from "Account Details" screen
Then user should be displayed with the "Name Account Details" screen
Then user should be displayed with the following "Name Account Details" options:
|NameAccountDetailsOptions|
|First Name			   |
|Last Name			   |
|Save button		   |
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| First Name Text Field				|
When user inputs "special characters" in "First Name Text Field" in the "Name Account Details" screen
When user clears the text displayed in the following text fields in the "Name Account Details" screen:
| TextFieldsInEditAccountScreen		|
| Last Name Text Field				|
And user inputs "special characters" in "Last Name Text Field" in the "Name Account Details" screen
Then user selects "Save button" from "Name Account Details" screen
Then user should be displayed with the "Account Details" screen
Then user should be displayed with "Updated First and Last Name" in the "Account Details" screen
Then user selects "Name" from "Account Details" screen
When user inputs "Previous value" in "First Name Text Field" in the "Name Account Details" screen
And user inputs "Previous value" in "Last Name Text Field" in the "Name Account Details" screen
And user selects "Save button" from "Name Account Details" screen
Then user should be displayed with the "Account Details" screen
Then user should be displayed with "existing first and last name" in the "Account Details" screen

#Change Password in Edit Account Screen
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountUpdatePasswordWithoutSpecialCharacters    @Automated		 @--xrayid:ATER-69084
Scenario: As a user i want to Verify update password functionality in Edit Account screen
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
Then the following "Change Password" options should be enabled:
| ChangePasswordOptions		| 
| Save						|
When user inputs "Valid Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Valid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user inputs "Valid Verify New Password Format" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "updated password"
And user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
Then the following "Change Password" options should be enabled:
| ChangePasswordOptions		| 
| Save						|
When user inputs "Updated Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Previous New Password Format Value" in "New Password Text Field" in the "Change Password" screen
And user inputs "Previous Verify New Password Format Value" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "previous password"
Then user navigates to "Account Details" screen from the "Dashboard" screen
And user should be displayed with the "Account Details" screen


#Change Password in Edit Account Screen
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountUpdatePasswordWithSpecialCharacters    @Automated	 @--xrayid:ATER-69084
Scenario: As a user i want to Verify update password functionality in Edit Account screen
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Change Password" from "Edit Account" screen
Then user should be displayed with the "Change Password" screen
Then the following "Change Password" options should be enabled:
| ChangePasswordOptions		| 
| Save						|
When user inputs "Valid Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Valid New Password Format With Special Characters" in "New Password Text Field" in the "Change Password" screen
And user inputs "Valid Verify New Password Format With Special Characters" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "updated password"
And user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Change Password" from "Edit Account" screen
Then user should be displayed with the "Change Password" screen
Then the following "Change Password" options should be enabled:
| ChangePasswordOptions		| 
| Save						|
When user inputs "Updated Old Password With Special Characters" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Previous New Password Format Value" in "New Password Text Field" in the "Change Password" screen
And user inputs "Previous Verify New Password Format Value" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "previous password"
Then user navigates to "Edit Account" screen from the "Dashboard" screen
And user should be displayed with the "Edit Account" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountChangePwdValidationWhenTappedOnSaveWithoutEnteringAnyText    @Automated	@--xrayid:ATER-69085
Scenario: Change password screen validations when user taps on Save button without entering text in Old Password, New Password and Verify New Password text fields
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
When user selects "Save button" from "Change Password" screen
Then user should be displayed with "You must enter your password" error message in the "Old Password text field" in the "Change Password" screen
And user should be displayed with "You must enter your new password" error message in the "New Password text field" in the "Change Password" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountChangePwdValidationWhenIncorrectOldPwdIsEntered  @Automated	 @--xrayid:ATER-69086
Scenario: Change password screen validations when user taps on Save button by entering incorrect Old Password, valid New Password and Verify New Password text fields
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
When user inputs "Incorrect Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Valid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user inputs "Valid Verify New Password Format" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with "Old Password is Invalid" error message in the "Old Password text field" in the "Change Password" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountChangePwdValidationWhenInvalidNewPwdIsEntered  @Automated	 @--xrayid:ATER-69087
Scenario: Change password screen validations when user taps on Save button by entering valid Old Password, invalid New Password and Verify New Password text fields
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
When user inputs "Valid Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Invalid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user inputs "Invalid Verify New Password Format" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with "Passwords dont match" error message in the "New Password Text Field" in the "Change Password" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountChangePwdValidationWithBlankVerifyNewPwd  @Automated	@--xrayid:ATER-74348  @NoUpdateRequired
Scenario: Change password screen validations when user taps on Save button by entering valid Old Password, valid New Password and skip Verify New Password text fields
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
When user inputs "Valid Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Valid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with "You must enter your verify password" error message in the "Verify New Password Text Field" in the "Change Password" screen


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerEditAccountChangePwdValidationWhenNewAndVerifyNewPwdDoesNotMatch   @Automated	 @--xrayid:ATER-69088
Scenario: Change password screen validations when user taps on Save button by entering valid Old Password, different text in New Password and Verify New Password text fields
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Change Password" from "Account Details" screen
Then user should be displayed with the "Change Password" screen
When user inputs "Valid Old Password" in "Old Password Text Field" in the "Change Password" screen
And user inputs "Valid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user inputs "Invalid Verify New Password Format" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with "Passwords do not match" error message in the "New Password text field" in the "Change Password" screen
When user inputs "InValid New Password Format" in "New Password Text Field" in the "Change Password" screen
And user inputs "Valid Verify New Password Format" in "Verify New Password Text Field" in the "Change Password" screen
And user selects "Save button" from "Change Password" screen
Then user should be displayed with "Passwords dont match" error message in the "New Password text field" in the "Change Password" screen

  
  #Same as above
  #Requirements : single location with and with out any solution
  @GeneralGlobaldrawerChangepasswordwithNewpasswordandverifyPassworddontmatch         	@--xrayid:ATER-69089
  Scenario Outline: As a user i want to Verify change password  with error under  global drawer with and with out solution 
    Given user launches and logs in to the Lyric Application
     Then navigates to “Edit Account” screen from "Dashboard" screen 
     When user navigates "Change password" screen from "Edit Account" screen 
     Then user enter the valid “Old Password” 
      And user enters with <New Password> and <Verify New Password> 
     When user selects the “SAVE” option
     Then user should be displayed with “Passwords don’t match” text below “New Password” edit box with red color
    Examples: 
      | New Password | Verify New Password | 
      | Valid        | Invalid             | 
      | Invalid      | Valid               | 


#Covered in the above scenarios
  #Requirements : single location with and with out any solution
  @GeneralGlobaldrawerEditAccountChangepasswordwitherror            @--xrayid:ATER-69090
  Scenario Outline: As a user i want to Verify change password  with error under  global drawer with and with out solution 
    Given user launches and logs in to the Lyric Application
     Then navigates to “Edit Account” screen from "Dashboard" screen 
     When user navigates "Change password" screen from "Edit Account" screen 
     Then user should be displayed with disabled "SAVE" button
     When user enters the <Old password> < New password> <Verify New password> edit fields
     Then user should be displayed with enabled "SAVE" button 
      And Password mismatch alert message should be displayed if New password and Verify new password are not the same
      And an alert message should be displayed if the password length is less then 8 characters 
      And an alert message should be displayed if the password and verify new password is not as per the defined regular expression
    Examples: 
      | Old password     | New password           | Verify new password    | 
      | Valid password   | Invalid/blank password | Invalid/blank password | 
      | Valid password   | Valid password         | Invalid/blank password | 
      | Valid password   | Invalid/blank password | Valid password         | 
      | Invalid password | Valid password         | Valid password         | 
      | Invalid password | Invalid/blank password | Invalid/blank password | 
      | Invalid password | Valid password         | Invalid/blank password | 
      | Invalid password | Invalid/blank password | Valid password         | 
  


#Delete Account in Edit Account Screen
#Requirements : single location with out solution 
@GeneralGlobalDrawerEditAccountDeleteAccountWithoutASolution             @Automated		@--xrayid:ATER-69091
Scenario Outline: As a user i want to Verify the app behavior by deleting an account without any solution
Given user launches and logs in to the Lyric application with user account with location
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go		|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen

Examples: 
      | Default Location		| Default Device Name		| valid zip code        |
      | Home					| Living Room				| 90001                 |


#Delete account with learn how to delete a device #GDPR  
#Requirements : single location with solution 
@GeneralGlobalDrawerEditAccountDeleteAccountWithSolution             @Automated			@--xrayid:ATER-69092
Scenario: As a user i want to Verify the app behavior by deleting an account with solution
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Close button" from "Delete Account" screen
Then user should be displayed with the "Account Details" screen

  
  # PIN implementaion pending 
  
  #@GeneralEnaleDisableTogglebutton
  #@GenalMandetorypopup
  #@GeneralSecuritypopup
  #@GenalwrongPINvalidation
  #@GeneralWrongFingerPrintValication
  #@GeneralcorrectPINValication
  #@GeneralCorrectFingerPrintvalication
  #@GeneralEnableDisableTogglebutton
  #@GeneralEnableFingerPrintwithoutphonesecurity
  #@GernalForgetPIN
  #@GeneralCreatePINwithsecurity
  #@GeneralCreatePINWithoutsecurity
  
  
#About the app Screen
#Requirements : single location with and with out any solution , US location 
@GeneralGlobalDrawerAboutTheAppVerifyOptionsDisplayedForUSLocation             @Automated		@--xrayid:ATER-69093
Scenario: As a user i want to Verify the options displayed in about the app for US Location with and with out solution 
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
And user should be displayed with the following "About the app" options:
| AboutTheAppOptions			| 
| Rate the app for Android	|
| Get Help             		| 
| Privacy Policy and EULA 	|
| Acknowledgements     		| 
| Version              		| 
  

#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerAboutTheAppVerifyOptionsDisplayedForUKLocation             @Automated		@--xrayid:ATER-69094
Scenario: As a user i want to Verify the options displayed in about the app for UK Location with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
And user should be displayed with the following "About the app" options:
| AboutTheAppOptions			| 
| Rate the app for Android	|
| Without Get Help Option	| 
| Privacy Policy and EULA 	|
| Acknowledgements     		| 
| Version              		|
  

#Privacy Policy & EULA
#Requirements : single location with and with out any solution , US location 
@GeneralGlobalDrawerAboutTheAppVerifyPrivacyPolicyAndEULAScreen             @Automated		@--xrayid:ATER-69095
Scenario: As a user i want to Verify Privacy policy and EULA screen present in About the App with and with out solution 
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Privacy Policy and EULA" from "About the app" screen
Then user should be displayed with the "Privacy Policy and EULA" screen
And user navigates to "About the app" screen from the "Privacy Policy and EULA" screen 


#Acknowledgements
#Requirements : single location with and with out any solution , US location 
@GeneralGlobalDrawerAboutTheAppVerifyAcknowledgementsScreen             @Automated		@--xrayid:ATER-69096
Scenario: As a user i want to Verify Acknowledgements screen present in About the App with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Acknowledgements" from "About the app" screen
Then user should be displayed with the "Acknowledgements" screen
And user navigates to "About the app" screen from the "Acknowledgements" screen
  

#App version
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerAboutTheAppVerifyVersion             @Automated		@--xrayid:ATER-69097
Scenario: As a user i want to Verify App Version present in About the App Screen with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
And user should be displayed with the following "About the app" options:
| AboutTheAppOptions			|
| Version              		|
  

#GetHelp
#Requirements : single location with and with out any solution , US location 
@GeneralGlobalDrawerAboutTheAppVerifyGetHelpScreen             @Automated			@--xrayid:ATER-69098
Scenario: As a user i want to Verify Get Help screen present in About the App with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Get Help" from "About the app" screen
Then user should be displayed with the "Get Help" screen
And user navigates to "About the app" screen from the "Get Help" screen


#Covered in @GeneralGlobalDrawerAboutTheAppVerifyOptionsDisplayedForUKLocation
  #Requirements : single location with and with out any solution , UK location 
  @GeneralGlobalDrawerAbouttheappGetHelpUKLocationVerification          		@--xrayid:ATER-69099
  Scenario: As a user i want to Verify GetHelp US Location under About the app with and with out solution 
    Given user launches and logs in to the Lyric Application
     Then user Navigates to "About the app" screen from the "Dashboard" screen
      And user should not displayed "GET HELP" option


#Rate the app only for android  
#Rate the app close option
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyRateTheAppPopupForUSLocation             @Automated		@--xrayid:ATER-69100
Scenario: As a user i want to Verify Rate the app with close option for US Location under About the app with and with out solution 
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
Then user should be displayed with the "About the app" screen

  
@GeneralGlobalDrawerVerifyFeedbackScreenWithBelowFourRating            @Automated		@--xrayid:ATER-69101
Scenario Outline: As a user i want to Verify if Feedback screen displays when user gives rating less than four star 
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs <max characters> in "Feedback Text Field" in the "App Feedback" screen
Then user should not be allowed to enter more than "50" characters in "Feedback Text Field" in the "App Feedback" screen
And the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|

Examples:
| Star | max characters											|	
| 1    | This is to test max characters in Feedback Text Field	|
| 2    | This is to test max characters in Feedback Text Field	|
| 3    | This is to test max characters in Feedback Text Field	| 
  

#Rate the app below 3 stars 
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyWhatDoYouThinkOfHHAppPopupAfterTapingOnSendFeedBackWithEnabledAnonymousToggleButtonAndMinMaxAppThrice             @Automated		@--xrayid:ATER-69102
Scenario Outline: What do you think of Honeywell Home app popup when user enables Anonymous toggle button, Sends Feedback, minimizes and maximizes the app three times 
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "3" times
Then user should not receive a "What do you think of Honeywell Home app" popup
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |
  

#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyWhatDoYouThinkOfHHAppPopupAfterTapingOnSendFeedBackWithDisabledAnonymousToggleButtonAndMinMaxAppThrice             @Automated		@--xrayid:ATER-69103
Scenario Outline: Verify what do you think of Honeywell Home app popup when user disables Anonymous toggle button, Sends Feedback, minimizes and maximizes the app three times
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "off"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "3" times
Then user should not receive a "What do you think of Honeywell Home app" popup
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyWhatDoYouThinkOfHHAppPopupAfterCancellingSendFeedbackAndMinMaxAppThrice             @Automated		@--xrayid:ATER-69104
Scenario Outline: Verify if what do you think of Honeywell Home app popup displays when user cancels Sends Feedback and minimizes and maximizes the app three times
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "off"
And user selects "Close Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |
  
  
#Rate the app below 4-5 stars with close 
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyThanksForYourRatingPopupWithFourOrFiveRating             @Automated		@--xrayid:ATER-69105
Scenario Outline: Verify if Thanks for your rating popup displays when user selects four or five rating in What do you think of Honeywell Home app popup
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on close button" the "Thanks for your rating" popup
Then user should be displayed with the "About the app" screen

Examples: 
| Star | 
| 4    | 
| 5	   |
  

#Rate the app below 4-5 stars with continue 
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyNavigationToGooglePlaystoreWithFourOrFiveRating             @Automated		@--xrayid:ATER-69106
Scenario Outline: Verify navigation to Google Playstore when user taps on Continue button in Thanks for your rating popup
Given user launches and logs in to the Lyric Application
When user navigates to "About the app" screen from the "Dashboard" screen
Then user should be displayed with the "About the app" screen
When user selects "Rate the app" from "About the app" screen
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on continue button" the "Thanks for your rating" popup
Then user should be displayed with the "Honeywell Home in Google Playstore" screen

Examples: 
| Star | 
| 4    | 
| 5	   |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyNavToSendFeedbackScreenByMinMaxAppThriceInHomeScreen             @Automated		@--xrayid:ATER-69107
Scenario Outline: Verify if what do you think of Honeywell Home app popup displays when user minimizes and maximizes the app three times in Home screen
Given user launches and logs in to the Lyric Application
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyNavToPlaystoreByMinMaxAppThriceInHomeScreenAndWithFourOrFiveRating            @Automated		@--xrayid:ATER-69108
Scenario Outline: Navigation to Google Playstore when user minimizes and maximizes the app three times in Home screen and taps on Continue button in Thanks for your rating popup
Given user launches and logs in to the Lyric Application
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on continue button" the "Thanks for your rating" popup
Then user should be displayed with the "Honeywell Home in Google Playstore" screen

Examples: 
| Star | 
| 4    | 
| 5	   |  


@GeneralGlobalDrawerLogoutAndLoginThriceAndVerifyFeedbackScreenWithBelowFourRating             @Automated		@--xrayid:ATER-69109
Scenario Outline: Navigation to About the app screen by tapping on below four rating in what do you think of Honeywell Home app popup after logout and log into app thrice
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
And user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginThriceAndVerifyNavToGooglePlaystoreWithFourOrFiveRating             @Automated		@--xrayid:ATER-69110
Scenario Outline: Navigation to Google Playstore by tapping on Continue button in Thanks for your rating popup after logout and log into app thrice
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on continue button" the "Thanks for your rating" popup
Then user should be displayed with the "Honeywell Home in Google Playstore" screen

Examples: 
| Star | 
| 4    | 
| 5	   |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginThriceAndVerifyNavToAboutTheAppScreenWithFourOrFiveRating            @Automated		@--xrayid:ATER-69111
Scenario Outline: Navigation to About the app screen by tapping on Close button in Thanks for your rating popup after logout and log into app thrice
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on close button" the "Thanks for your rating" popup
Then user should be displayed with the "About the app" screen

Examples: 
| Star | 
| 4    |
| 5	   |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyNavToSendFeedbackScreenByMinMaxAppForTwelveTimes             @Automated		@--xrayid:ATER-69112
Scenario Outline: Verify if what do you think of Honeywell Home app popup displays when user minimizes and maximizes the app twelve times in Home screen
Given user launches and logs in to the Lyric Application
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
And user selects <Star> from "Rate the app" screen
And user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |

  
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerVerifyNavToGooglePlaystoreByMinMaxAppForTwelveTimes             @Automated		@--xrayid:ATER-69113
Scenario Outline: Verify if what do you think of Honeywell Home app popup displays when user minimizes and maximizes the app twelve times in Home screen
Given user launches and logs in to the Lyric Application
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
And user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on continue button" the "Thanks for your rating" popup
Then user should be displayed with the "Honeywell Home in Google Playstore" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 4    |
| 5	   |
  

#Requirements : single location with and with out any solution
@GeneralGlobalDrawerMinMaxAppForTwelveTimesAndCloseThanksForYourRatingPopup             @Automated		@--xrayid:ATER-69114
Scenario Outline: Thanks for your rating popup should display when app is minimized and maximized for twelve times in Home screen with feedback above three star rating
Given user launches and logs in to the Lyric Application
When user minimizes and maximizes the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
Then user should be displayed with the "About the app" screen
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on close button" the "Thanks for your rating" popup
Then user should be displayed with the "About the app" screen

Examples: 
| Star | 
| 4    |
| 5	   |
 
 
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginThriceMinMaxAppForTwelveTimesAndVerifyFeedbackScreenWithBelowFourRating             @Automated			@--xrayid:ATER-69115
Scenario Outline: Send Feedback after logout and log into app thrice, minimize and maximize app twelve times with feedback below four star rating
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginThriceMinMaxAppForTwelveTimesAndVerifyNavToGooglePlaystore            @Automated		@--xrayid:ATER-69116
Scenario Outline: Navigate to Google Playstore after logout and log into app thrice, minimize and maximize app twelve times and with feedback four or five rating
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on continue button" the "Thanks for your rating" popup
Then user should be displayed with the "Honeywell Home in Google Playstore" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 4    |
| 5	   |


#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginThriceMinMaxAppForTwelveTimesAndCloseThanksForYourRatingPopup            @Automated		@--xrayid:ATER-69119
Scenario Outline: Close Thanks for your rating popup after logout and log into app thrice, minimize and maximize app twelve times and with feedback four or five rating
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "3" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
When user minimizes and maximizes the app for "12" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should receive a "Thanks for your rating" popup
When user "clicks on close button" the "Thanks for your rating" popup
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 4    |
| 5	   |
  

#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutAndLoginAndMinMaxAppIntermittentlyAndVerifyFeedbackScreenWithBelowFourRating             @Automated		@--xrayid:ATER-69120
Scenario Outline: Send Feedback after logout and log into app, minimize and maximize app intermittently and with feedback below four rating
Given user launches and logs in to the Lyric Application
When user logout and login to the app for "2" times
And user minimizes and maximizes the app for "1" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user "closes" the "What do you think of Honeywell Home app" popup
And user minimizes and maximizes the app for "11" times
And user logout and login to the app for "1" times
Then user should receive a "What do you think of Honeywell Home app" popup
When user selects <Star> from "Rate the app" screen
Then user should be displayed with the "App Feedback" screen
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
| Send Feedback Button		|
When user inputs "some text" in "Feedback Text Field" in the "App Feedback" screen
Then the following "App Feedback" options should be enabled:
| AppFeedbackOptions			|
| Send Feedback Button		|
And the following "App Feedback" options should be disabled:
| AppFeedbackOptions			|
| Anonymous Toggle Button	|
When user changes the "Anonymous Toggle Button" to "on"
And user selects "Send Feedback Button" from "App Feedback" screen
Then user should be displayed with the "About the app" screen
#Helpshift portal to check feedback

Examples: 
| Star | 
| 1    | 
| 2    | 
| 3    |


#FAQs
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerVerifyIfFAQsDisplayedForUKLocation             @Automated		@--xrayid:ATER-69125
Scenario: Navigation to FAQs screen for UK Location under global drawer with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|

 
#FAQs General 
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnYesButtonInWasThisHelpfulDIsplayedForAQuestionInGeneralFAQs            @Automated		@--xrayid:ATER-69126
Scenario: Verify the app behavior by tapping on Yes button in Was this helpful displayed for a question in FAQs General questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "General" from "FAQS" screen 
Then user should be displayed with the "General" screen
When user selects "A Question" from "General" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "Yes button from Was this helpful section" from "Question" screen
Then user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|


#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnNoButtonInWasThisHelpfulDIsplayedForAQuestionInGeneralFAQs            @Automated		@--xrayid:ATER-75786
Scenario: Verify the app behavior by tapping on No button in Was this helpful displayed for a question in FAQs General questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "General" from "FAQS" screen 
Then user should be displayed with the "General" screen
When user selects "A Question" from "General" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "No button from Was this helpful section" from "Question" screen
Then user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|

 
#FAQs Thermostat 
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnYesButtonInWasThisHelpfulDIsplayedForAQuestionInThermostatFAQs             @Automated		@--xrayid:ATER-69127
Scenario: Verify the app behavior by tapping on Yes button in Was this helpful displayed for a question in FAQs Thermostat questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Thermostat" from "FAQS" screen 
Then user should be displayed with the "Thermostat" screen
When user selects "A Question" from "Thermostat" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "Yes button from Was this helpful section" from "Question" screen
Then user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|


#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnNoButtonInWasThisHelpfulDIsplayedForAQuestionInThermostatFAQs            @Automated	@--xrayid:ATER-76410
Scenario: Verify the app behavior by tapping on No button in Was this helpful displayed for a question in FAQs Thermostat questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Thermostat" from "FAQS" screen 
Then user should be displayed with the "Thermostat" screen
When user selects "A Question" from "Thermostat" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "No button from Was this helpful section" from "Question" screen
Then user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|

  
#FAQs WLD 
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnYesButtonInWasThisHelpfulDIsplayedForAQuestionInWLDFAQs            @Automated		@--xrayid:ATER-69129
Scenario: Verify the app behavior by tapping on Yes button in Was this helpful displayed for a question in FAQs Water Leak Detector questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Water leak detector" from "FAQS" screen 
Then user should be displayed with the "Water leak detector" screen
When user selects "A Question" from "Water leak detector" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "Yes button from Was this helpful section" from "Question" screen
Then user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	| 


#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnNoButtonInWasThisHelpfulDIsplayedForAQuestionInWLDFAQs            @Automated		@--xrayid:ATER-76411
Scenario: Verify the app behavior by tapping on No button in Was this helpful displayed for a question in FAQs Water Leak Detector questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Water leak detector" from "FAQS" screen 
Then user should be displayed with the "Water leak detector" screen
When user selects "A Question" from "Water leak detector" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "No button from Was this helpful section" from "Question" screen
Then user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|

 
#FAQs CAMERA 
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnYesButtonInWasThisHelpfulDIsplayedForAQuestionInCameraFAQs              @Automated		@--xrayid:ATER-69131
Scenario: Verify the app behavior by tapping on Yes button in Was this helpful displayed for a question in FAQs Camera questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Camera" from "FAQS" screen 
Then user should be displayed with the "Camera" screen
When user selects "A Question" from "Camera" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "Yes button from Was this helpful section" from "Question" screen
Then user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You found this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|


#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerTapOnNoButtonInWasThisHelpfulDIsplayedForAQuestionInCameraFAQs            @Automated		@--xrayid:ATER-76412
Scenario: Verify the app behavior by tapping on No button in Was this helpful displayed for a question in FAQs Camera questions list
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user selects "Camera" from "FAQS" screen 
Then user should be displayed with the "Camera" screen
When user selects "A Question" from "Camera" screen
Then user should be displayed with the "Question" screen
And user should be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user selects "No button from Was this helpful section" from "Question" screen
Then user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
When user navigates back and forth in "Question" screen
And user should be displayed with "You did not find this helpful" in the "Question" screen
And user should not be displayed with the following "Question" options:
| QuestionOptions							| 
| Was this helpful with Yes and No buttons	|
  

#FAQs search box 
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerVerifySearchResultsInFAQsScreen             @Automated		@--xrayid:ATER-69132
Scenario: As a user i want to Verify if list of questions display for the entered help text in FAQs screen
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user inputs "What happens" in "Help Text" in the "FAQs" screen
Then user should be displayed with the following "Question" options:
| QuestionOptions	|
| Search results	|
 
  
#FAQs search box with no FAQs
#Requirements : single location with and with out any solution , UK location 
@GeneralGlobalDrawerVerifyNoFAQsFoundLabelInFAQsScreen             @Automated		@--xrayid:ATER-69133
Scenario: As a user i want to Verify if No FAQs found label displayed for the entered help text in FAQs screen
Given user launches and logs in to the Lyric Application
When user navigates to "FAQS" screen from the "Dashboard" screen
Then user should be displayed with the "FAQS" screen
And user should be displayed with the following "FAQS" options:
| FAQsOptions			| 
| General             	| 
| Thermostat          	| 
| Water leak detector 	| 
| Camera              	|
When user inputs "abcdefghij" in "Help Text" in the "FAQs" screen
Then user should be displayed with the following "Question" options:
| QuestionOptions	|
| No FAQs found		|
  

#Logout
#Requirements : single location with and with out any solution
@GeneralGlobalDrawerLogoutFromTheAppWithLocation             @Automated		@--xrayid:ATER-69134
Scenario: As a user i want to Verify logout with location under global drawer with and with out solution
Given user launches and logs in to the Lyric Application
When user navigates to "Global Drawer" screen from the "Dashboard" screen
And user selects "Log out" from "Global Drawer" screen
Then user should be displayed with the "Honeywell Home" Screen

  
#Withoutlocation
#Requirements : No location
@GeneralGlobalDrawerLogoutFromAppWithoutAnyLocation             @Automated		@--xrayid:ATER-69135
Scenario: As a user i want to Verify logout from the app without location
Given user launches and logs in to the Lyric application with user account without any location
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Cancel button in" the "Exit Honeywell Home" popup
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Sign Out button in" the "Exit Honeywell Home" popup
Then user should be displayed with the "Honeywell Home" Screen
And user should be able to login to the app after sign out
Then user should be displayed with the "Add New Device" screen
  

#Delete account
#Requirements: No Location, No Device and No Membership
@SingleUserDeleteAccountWithNoLocationNoDeviceNoMembership             @Automated 		@--xrayid:ATER-69136  
Scenario: To verify user is able to delete account if there are no devices, no locations and no Membership linked to the account
Given user launches and logs in to the Lyric application with user account without any location
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Delete Account button in" the "Exit Honeywell Home" popup
Then user should receive a "Sorry to see you go" popup
When user "Clicks on No button in" the "Sorry to see you go" popup
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Delete Account button in" the "Exit Honeywell Home" popup
Then user should receive a "Sorry to see you go" popup
When user "Clicks on Yes button in" the "Sorry to see you go" popup
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL


#Requirements: With Location, No Device and No Membership 
@SingleUserDeleteAccountWithNoDeviceNoMembership             @Automated		@--xrayid:ATER-69137
Scenario Outline: To verify user is able to delete his account if there are no devices in any locations any no Membership linked to the account 
Given user launches and logs in to the Lyric application with user account with location
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go		|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen

Examples: 
      | Default Location		| Default Device Name		| valid zip code        |
      | Home					| Living Room				| 90001                 |	
  

  @SingleUserWithUnsharedDeviceWithCameraSubscriptions             @NotAutomatable		@--xrayid:ATER-69138
  Scenario Outline: To verify user is not able to delete his account when he has a unshared device or a Camera Subscription in it
    Given app is launched
      And user taps on LOGIN
      And user should have <DEVICE> in one LOCATION
      And user should not have any CAMERA SUBSCRIPTIONS
     When user navigates to “Edit Account” screen from “Dashboard” screen
      And user clicks on “DELETE ACCOUNT” link
     Then verify user should receive a pop up saying “Actions required before deleting your account”
     Then verify user can click and navigate to the the “Delete All Devices” FAQ Page from the link.
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
  

@DeleteAccountWithLocationHavingNoDeviceWithCameraSubscription             @Automated		@--xrayid:ATER-69139
Scenario: To verify user is able to delete the account if there are no devices in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution For Camera" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution For Camera" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingDASDeviceWithCameraSubscription             @Automated		@--xrayid:ATER-69140
Scenario: To verify user is able to delete the account if there is DAS DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingLyricRoundWiFiThermostatDeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81293
Scenario: To verify user is able to delete the account if there is LYRIC ROUND Wi-Fi THERMOSTAT DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingD6PRODeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81294
Scenario: To verify user is able to delete the account if there is D6 PRO DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingT5DeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81295
Scenario: To verify user is able to delete the account if there is T5 DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingT6PRODeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81296
Scenario: To verify user is able to delete the account if there is T6 PRO DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingWLDDeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81297
Scenario: To verify user is able to delete the account if there is WLD DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Edit Account" screen from the "Dashboard" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen    


@DeleteAccountWithLocationHavingC1DeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81298
Scenario: To verify user is able to delete the account if there is C1 DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingC2DeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81299
Scenario: To verify user is able to delete the account if there is C2 DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen


@DeleteAccountWithLocationHavingLyricSmartControllerDeviceWithCameraSubscription             @Automated		@--xrayid:ATER-81300
Scenario: To verify user is able to delete the account if there is LYRIC SMART CONTROLLER DEVICE in any location and if Camera Membership is linked to the account
Given user launches and logs in to the Lyric Application
When user navigates to "Account Details" screen from the "Dashboard" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Learn How To Cancel A Membership" from "Delete Account" screen
Then user should be displayed with the "Learn How To Cancel A Membership" screen
And user should be displayed with the following "Learn How To Cancel A Membership" options:
| LearnHowToCancelAMembershipOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Cancel A Membership" screen
Then user should be displayed with the "Delete Account With Solution" screen

  
  @MultipleDeviceDeleteSameAccountRestAllDeviceLogsOut             @NotAutomatable		@--xrayid:ATER-69141
  Scenario Outline: To verify all logged in devices should log out if account is deleted
    Given app is launched in two devices
      And user taps on LOGIN in both the devices with same account.
      And user should have <DEVICE> in one LOCATION
     When user navigates to “Edit Account” screen from “Dashboard” screen in one device
      And user clicks on “DELETE ACCOUNT” link in one device.
     Then verify user should receive a pop up saying “Actions required before deleting your account”
      And verify user can click and navigate to the the “Delete All Devices” FAQ Page from the link.
      And Click on OK/BACK button.
     When user deletes the <DEVICE> from dashboard.
      And user navigates to “Edit Account” screen from “Dashboard” screen in one device
      And user clicks on “DELETE ACCOUNT” link in one device.
     When user clicks on YES button
     Then verify user should receive a pop-up saying “Your Account & Data is Deleted”.
      And verify both users should navigate to Login screen. 
      And verify both users are unable to login with same credentials
     When user clicks of NO button
     Then verify user should navigate back to “Edit Account” screen.
  
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
  
  @SingleAccountMultipleLoginsDeleteLocationRestAllDeviceAddDeviceScreen             @NotAutomatable		@--xrayid:ATER-69142
  Scenario: To verify all logged in devices should navigate to add device screen when a location is deleted
    Given app is launched in two devices 
      And user creates account and email got verified.
      And user created a location only without any device.
     When any device user navigates to “Home Address” screen from “Dashboard” screen in one device
      And any device user clicks on “DELETE LOCATION” link in any device
      And Clicks on DELETE in Confirmation page.
     Then both the devices should navigate to Add Device Screen.
     When any user clicks on BACK button
     Then verify user should receive the Pop up screen with “Exit Honeywell Home?” Pop up.
     When user Clicks on “DELETE ACCOUNT” link         
     Then verify user should receive a ““DELETE ACCOUNT”-Sorry to see you go” ““DELETE ACCOUNT”-Sorry to see you go” Page/Pop up.
     When user Clicks on YES button
     Then verify both device should navigate to Login screen
      And verify user should receive a pop-up saying “Your Account & Data is Deleted” in one device.
      And verify user is unable to login with same credentials in any device.
  
  
  @MultipleAccountSharedLocationDeletedInOneAccount             @NotAutomatable		@--xrayid:ATER-69143
  Scenario Outline: To verify user is navigated to add device screen when a shared location is deleted and if account is deleted
    Given app is launched in two devices
      And both users taps on LOGIN in with different accounts
      And both users should have <DEVICE> in one LOCATION
      And first user must have shared his location with second user account
     When second user navigates to “Home Address” screen from “Dashboard” screen in one device
      And second user clicks on “Delete Address” link in second device
     Then verify second user should be able to delete first users location
      And verify first user should not be able to see that deleted location and device.
      And verify second user can still have access to its own location.
     When first user navigates to “Edit Account” screen from “Dashboard” screen in one device
      And first user clicks on “DELETE ACCOUNT” link in one device
     Then verify first user should receive a ““DELETE ACCOUNT”-Sorry to see you go” Page/Pop up.
     When user clicks of NO button
     Then verify user should navigate back to “Edit Account” screen
     When first user clicks on YES button
     Then verify user should receive a pop-up saying “Your Account & Data is Deleted”
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
  
  @InvitedUserHaveAccessToDeletedPrimaryUserLocationAndDevice             @NotAutomatable		@--xrayid:ATER-69144
  Scenario Outline: To verify invited user is able to access the primary user shared location and device even if primary user deleted its account
    Given app is launched in two devices
      And both users taps on LOGIN in with different accounts
      And both users should have <DEVICE> in one LOCATION
      And primary user must have shared his location with invited user.
     When primary user navigates to “Edit Account” screen from “Dashboard” screen in one device
      And primary user clicks on “DELETE ACCOUNT” link in one device
     Then verify user should receive a ““DELETE ACCOUNT”-Sorry to see you go” ““DELETE ACCOUNT”-Sorry to see you go” Page/Pop up.
     When user Clicks on YES button
     Then verify primary user should navigate to Login screen. 
      And verify primary user should receive a pop-up saying “Your Account & Data is Deleted”.
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
  
 
@DeleteAllLocationsAndThenDeleteAccount             @Automated		@--xrayid:ATER-69147
Scenario Outline: Verify if user is navigated to add device screen when all locations are deleted and account is deleted when user deletes the account
Given user launches and logs in to the Lyric application with user account without any location
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <first location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid first locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <second location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid second locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen
When user clicks on the back arrow in the <Current Screen> screen
Then user should be displayed with the <Previous Screen> screen
And user "deletes location details" by clicking on "delete" button
Then user should be displayed with the "Dashboard" screen
And user "deletes the existing location details" by clicking on "delete" button
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Delete Account button in" the "Exit Honeywell Home" popup
Then user should receive a "Sorry to see you go" popup
When user "Clicks on No button in" the "Sorry to see you go" popup
Then user should be displayed with the "Add New Device" screen
When user selects "Close Button" from "Add New Device" screen
Then user should receive a "Exit Honeywell Home" popup
When user "Clicks on Delete Account button in" the "Exit Honeywell Home" popup
Then user should receive a "Sorry to see you go" popup
When user "Clicks on Yes button in" the "Sorry to see you go" popup
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login" options:
|Login		  								|
|Unable to login Email or password incorrect|
#Then user should receive a "Email or Password incorrect" popup
#And user "Accepts" the "Email or Password incorrect" popup
Then create the deleted user account through CHIL
    
Examples: 
| first location name	| valid first locations zip code	| second location name	| valid second locations zip code		| Current Screen				| Previous Screen	|
| California			| 90001								|  Texas				| 90002									| Add New Device Dashboard		| Dashboard			|


@DeleteAccountWithMultipleLocationsWithoutSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be able to delete account for multiple locations without any solution
Given user launches and logs in to the Lyric application with user account with multiple locations without any solution
When user navigates to "Invite User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Account Details" screen from the "Users" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go			|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
#Then user should be able to view the solution

Examples:
| invite users email address	| Default Location		| Default Device Name		| valid zip code        |
| das_stage5@grr.la				| Home					| Living Room				| 90001                 |


@DeleteAccountAfterInvitingAnotherUserForALocationWithoutSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be able to delete account after inviting another user for a location without solution
Given user launches and logs in to the Lyric application with user account with location
When user navigates to "Invite New User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Account Details" screen from the "Users" screen
Then user should be displayed with the "Account Details" screen
When user selects "Delete Account" from "Account Details" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go			|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user should be able to view the solution

Examples:
| invite users email address	| Default Location		| Default Device Name		| valid zip code        |
| das_stage5@grr.la			| Home					| Living Room				| 90001                 |


@DeleteAccountForAccountWithMultipleLocationsWithSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be able to delete account for the logged in User with multiple locations
Given user launches and logs in to the Lyric application with user account with multiple locations with solution for any location
When user navigates to "Invite User" screen from the "Dashboard" screen for any location
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Manage Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Manage Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Edit Account" screen from the "Manage Users" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go			|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user should be able to view the solution

Examples:
| invite users email address	| Default Location		| Default Device Name		| valid zip code        |
| das_stage5@grr.la			| Home					| Living Room				| 90001                 |


@DeleteAccountAfterInvitingAnotherUserForSingleLocationsWithSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be able to delete account after inviting another user for single location with solution
Given user launches and logs in to the Lyric application with user account with multiple locations
When user navigates to "Invite User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Manage Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Manage Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Edit Account" screen from the "Manage Users" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Action required before deleting your account" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions				| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Close button" from "Delete Account" screen
Then user should be displayed with the "Edit Account" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user should be able to view the solution

Examples:
| invite users email address	|
| das_stage5@grr.la			|


@DeleteAccountAfterInvitingAnotherUserForALocationWithSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be navigated to learn more screen when user tries to delete account after inviting another user to one location with solution
Given user launches and logs in to the Lyric application with user account with location
When user navigates to "Invite User" screen from the "Dashboard" screen
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Manage Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Manage Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Edit Account" screen from the "Manage Users" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Action required before deleting your account" screen
When user selects "Learn How To Delete A Device" from "Delete Account" screen
Then user should be displayed with the "Learn How To Delete A Device" screen
And user should be displayed with the following "Learn How To Delete A Device" options:
| LearnHowToDeleteADeviceOptions			| 
| Was this helpful with Yes and No buttons	|
When user selects "Close button" from "Learn How To Delete A Device" screen
Then user should be displayed with the "Delete Account With Solution" screen
When user selects "Close button" from "Delete Account" screen
Then user should be displayed with the "Edit Account" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
#Then user should be able to view the solution

Examples:
| invite users email address	|
| das_stage5@grr.la				|


@DeleteAccountAfterInvitingAnotherUserForMultipleLocationsWithSolution				@Automatable		@--xrayid:ATER-
Scenario Outline: User should be navigated to learn more screen when user tries to delete account after inviting another user for multiple locations with solution
Given user launches and logs in to the Lyric application with user account with multiple locations
When user navigates to "Invite User" screen from the "Dashboard" screen for any location
And user inputs <invite users email address> in "Email Text Field" in the "Invite New User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user navigates to "Manage Users" screen from the "Dashboard" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList						|
| User who invited the logged in user	|
When user logs out and logs in to the Lyric Application with "logged in users account"
Then user navigates to "Manage Users" screen from the "Dashboard" screen
And user should not be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| Logged in user		|
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user navigates to "Edit Account" screen from the "Manage Users" screen
Then user should be displayed with the "Edit Account" screen
When user selects "Delete Account" from "Edit Account" screen
Then user should be displayed with the "Delete Account Without Solution" screen
And user should be displayed with the following "Delete Account" options:
| DeleteAccountOptions				| 
| We are sorry to see you go			|
When user selects "Delete Account button" from "Delete Account" screen
Then user should receive a "Your Account and Data is deleted" popup
And user "Accepts" the "Your Account and Data is deleted" popup
Then user should be displayed with the "Honeywell Home" screen
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the following "Login Screen Validation Message" options:
| ValidationMessage								|
| Unable to login. Email or password incorrect	|
Then create the deleted user account through CHIL
When user logs in to the Lyric Application with "deleted account credentials"
Then user should be displayed with the "Add New Device" screen
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
And user logs out of the app 
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user should be able to view the solution

Examples:
| invite users email address	| Default Location		| Default Device Name		| valid zip code        |
| das_stage5@grr.la			| Home					| Living Room				| 90001                 |

  
  #Feature: User should be blocked from using app if device is having invalid date and time @LYR23886/22361
  @InvalidmobiledeviceDateOrTimeAndAppisLoggedout             @NotAutomatable		@--xrayid:ATER-69148
  Scenario: To verify the user has blocked using app with device time invalid  
  #Precondition user have invalid date or time or both
    Given app is launched 
     When user taps on LOGIN with valid credential
     Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and time in your mobile device’s settings’ with ‘Close’ button 
     When ‘Close’ is clicked
     Then user should be in login page 
  #invalid time :  +/- 31 min to current time Invalid date : Any dates other than current date
     When user correct the date/time
     Then user should be allowed to login to the app with valid credential
  
  @InvalidmobiledeviceDateOrTimeAndAppisLoggedin             @NotAutomatable		@--xrayid:ATER-69150
  Scenario: To verify the user has blocked using app with device time invalid  
  #Precondition user have invalid date or time or both
      And app is launched 
    Given app got session time out(60 min) or force closed 
  #No session API called during DIY, so no session timeout holds good while DIY
     When user tries to access the app again
     Then  Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and       time in your mobile device’s settings’ with ‘Retry’ button 
     When user clicks on ‘Retry’ user should still see the popup
     When user correct the date/time
     Then user should be allowed to access the app 
  
  @InvalidmobiledeviceDateOrTimeAndCreateAccount             @NotAutomatable		@--xrayid:ATER-69151
  Scenario: To verify the user has blocked using app with device time invalid  
  #Precondition user have invalid date or time or both
    Given app is launched 
     When user tries to Create account
     Then user should get critical alert ‘The date & time of your mobile device is incorrect. To continue, correct the date and       time in your mobile device’s settings’ with ‘Retry’ button
     When user correct the date/time
     Then user should be allowed to access the app 