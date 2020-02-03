@Geofencescenarios
Feature: Verify When geofence cross the fence 


#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabled           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
When user cross the fence <UMode> 
Then user should be receive "Push Notification" 
When user selects the "Push Notification" 
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on the <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperNA|Away| Home |
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | 
|HB|Away| Home |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away | 



#JasperNA, JasperEMEA, HB, spruce, Camera , DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithpushnotificationdisabled           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when push notification disabled 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user Disabled the "Geofence settings" in <Solution>"Settings" screen 
And  user set to the "Geofence Mode"
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
And user should be updated with <UMode>
And user should be updated with based on the <UMode> settings

Examples:
|Solutions||Mode| UMode |
|JasperNA|Home| Away | 
|JasperNA|Away| Home |
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | 
|HB|Away| Home |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away | 



#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithGofencethislocaitondisabled           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when geofence location disabled
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Disabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
And user should be updated with <UMode>
And user should be updated with based on the <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperNA|Away| Home |
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | 
|HB|Away| Home |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away | 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithGofencethislocaitondisabled           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when geofence this location disabled 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Disabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
And user should be updated with <UMode>
And user should be updated with based on the <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperNA|Away| Home |
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | 
|HB|Away| Home |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away | 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithLocationPermissiondisabledApp           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when location permission denied on the app
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user disabled the "Location permission" on the app permission
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
And user should be with <Mode>
And user should be updated with based on the <Mode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 

#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithLocationPermissionenabledaftercrossthefence           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when location permission enabled after cross the fence on the app
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user disabled the "Location permission" on the app permission
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
And user should be with <Mode>
And user should be with based on the <Mode> settings
When user Enabled the "Location permission" on the app permission
Then user should be receive "Push Notification"
And user should be updated with based on the <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithLocationservicedisabledonphone           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when location service disabled on phone
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user disabled the "Location service" on the phone
When user cross the fence <UMode> 
Then user should be receive "Push Notification" as "Turn On Location service..."
When user selects the "Push Notification"
Then user should be navigates to "Dashboard"
And user should be with <Mode>
And user should be with based on the <Mode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithInternetOFF           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when Internet service is OFF and when app is killed 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user "Kill the" application
Then user "Turn OFF" the "Internet service" on the phone
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
When user open the application
Then user should be with <Mode>
And user should be with based on the <Mode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithInternetONAftercrossthefence           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when Internet service is ON after cross the fence and when app is killed 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user "Kill the" application
Then user "Turn OFF" the "Internet service" on the phone
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
When user "Turn ON" the "Internet service" on the phone
Then user should be receive the "Push notification"
When user selects the "Push Notification"
Then user should be navigates to "Dashboard"
And user should be with <UMode>
And user should be with based on the <UMode> setting

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 

#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithInternetOFF           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when Internet service is OFF and when app is in background 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user Kept app in background
Then user "Turn OFF" the "Internet service" on the phone
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
When user open the application
Then user should be with <Mode>
And user should be with based on the <Mode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithInternetONAftercrossthefence           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when Internet service is ON after cross the fence and when app is in background
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user Kept app in background
Then user "Turn OFF" the "Internet service" on the phone
When user cross the fence <UMode> 
Then user should not receive "Push Notification" 
When user "Turn ON" the "Internet service" on the phone
Then user should be receive the "Push notification"
When user selects the "Push Notification"
Then user should be navigates to "Dashboard"
And user should be with <UMode>
And user should be with based on the <UMode> setting

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithPhoneOFF           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality  When user turn off the phone 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user "Turn OFF" the phone
Then user cross the fence <UMode> 
Then user <Solution> should not updated with <UMode>

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithPhoneONAftercrossthefence           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when user turn ON the phone after cross the fence
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user "Turn OFF" the phone
Then user cross the fence <UMode> 
When user "Turn ON" the phone
Then user should be receive the "Push notification"
When user selects the "Push Notification"
Then user should be navigates to "Dashboard"
And user should be with <UMode>
And user should be with based on the <UMode> setting

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithPhoneOFF           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality  When session expiry 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user Kept app in background
Then user wait for "Session Expiry" # one hour
When user cross the fence <UMode> 
Then user should receive "Push Notification" 
When user selects the "Push Notification"
Then user should navigates to "Dashboard
Then user should be updated with <UMode>
And user should be updated based on the <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 



#JasperNA, JasperEMEA, HB, spruce, Camera, DAS
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and disabled solution settings 
@GeofenceCrosswithsolutionswithInternetOFFTurnOFFthePhoneAftercrossthefenceTurnONthephone           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when Internet service is OFF, turn OFF the phone, after cross the fence, turn ON the phone with out internet 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user set to the "Geofence Mode"
And user Enabled the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
When user "Turn OFF" the "Internet service" on the phone
Then user "Turn OFF" the phone 
When user cross the fence <UMode> 
Then user <Solution> should not updated with <UMode>
When user "Turn ON" the phone
Then user should not receive "Push Notification" 
And user <Solution> should not updated with <UMode>
When user "Turn ON" the "Internet service" on the phone
Then user should be receive the "Push notification"
When user selects the "Push Notification"
Then user should be navigates to "Dashboard"
And user should be with <UMode>
And user should be with based on the <UMode> setting

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away |
|JasperNA|Away| Home | 
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away| 


#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithloggedintwodevcies/phone           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and logged in two phone/devices
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
When user "Logged IN" in "Phone1" and "Phone2" with same account
Then user cross the fence of "phone1" <UMode> 
And user "Phone2" not crossed the fence <UMode>
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be in  <Mode>
And user should be in based on <Mode> settings
When user cross the fence of "Phone2"
Then user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperEMEA|Home| Away | 
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Camera|Home| Away | 
|DAS|Home| Away | 
|DAS|Night| Away | 


#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithloggedintwodevcies/phone           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and logged in two phone/devices and fence cross away to home
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
When user "Logged IN" in "Phone1" and "Phone2" with same account
Then user cross the fence of "phone1" <UMode> 
And user "Phone2" not crossed the fence <UMode>
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings
When user cross the fence of "Phone2"
Then user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be in  <UMode>
And user should be in based on <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Away| Home |
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|Spruce|Away| Home |
|Camera|Away| Home |
|DAS|Away| Home |



#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithuserinvited           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and user invited and fence cross home to away
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
And user "User1" Invited to "User2"
When user "Logged IN" in "User1" and "User2" with different phone
Then user cross the fence of "User1" <UMode> 
And user "User2" not crossed the fence <UMode>
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be in  <Mode>
And user should be in based on <Mode> settings
When user cross the fence of "User2"
Then user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperEMEA|Home| Away | 
|HB|Away| Home ||Away |
|Spruce||Home| Away | 
|Camera|Home| Away | 
|DAS|Home| Away | 
|DAS|Night| Away | 


#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithuserinvited           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and user invited and away to home
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
And user "User1" Invited to "User2"
When user "Logged IN" in "User1" and "User2" with different phone
Then user cross the fence of "User1" <UMode> 
And user "User2" not crossed the fence <UMode>
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings
When user cross the fence of "User2"
Then user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be in <UMode>
And user should be in <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Away| Home |
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|Spruce|Away| Home |
|Camera|Away| Home |
|DAS|Away| Home |

#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithuserinvitedandLoggedoutoneuser           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and user invited and  user1 logged out and after cross user1 loggedIN and away to home
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
And user "User1" Invited to "User2"
When user "Logged IN" in "User1" and "User2" with different phone
Then user "Logged out" on "User1"
Then user cross the fence of "User2" <UMode> 
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings
When user "Logged IN" on "User1" #User1 in away state
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be in  <UMode>
And user should be in based on <UMode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Away| Home |
|JasperEMEA|Away| Home |
|HB|Home| Away | Home |
|Spruce|Away| Home |
|Camera|Away| Home |
|DAS|Away| Home |
 
#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: single location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings and user logged in two devices 
@GeofenceCrosswithsolutionswithgoefnecesettingsenabledwithuserinvitedandLoggedoutoneuser           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when all the settings enabled  and user invited and  user1 logged out and after cross user1 loggedIN and home to away
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
And user "User1" Invited to "User2"
When user "Logged IN" in "User1" and "User2" with different phone
Then user "Logged out" on "User1"
Then user cross the fence of "User2" <UMode> 
And user receive the "Push Notification"
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <UMode>
And user should be updated with based on <UMode> settings
When user "Logged IN" on "User1" #User1 in away state
When user selects the "Push Notification"
Then user should be displayed with "Dashboard"
And user should be updated with <Mode>
And user should be updated with based on <Mode> settings

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperEMEA|Home| Away |
|HB|Away| Home ||Away |
|Spruce||Home| Away |
|Camera|Home| Away |
|DAS|Home| Away |
|DAS|Night| Away |



#JasperNA, JasperEMEA, HB, spruce, Camera , DAS 
#Requirements: Two location and should configured with solutions and should be configured geofence radius and should enabled geofence under global drawer and solution settings 
@GeofenceCrosswithsolutionswithtwodiffernetradius           @NotAutomatable
Scenario Outline: As a user I want to verify fence cross functionality when two location different radius 
Given user launches and logs in to the Lyric Application
And user should be configured with <Solutions>
And user "Location2" set the radius different than "Location1"
And user is set to <Mode> through CHIL
And user enables the "Geofence this location" in "global drawer" 
And user enables the "Geofence settings" in <Solution>"Settings" screen 
And user set to the "Geofence Mode"
When user cross the fence <UMode> of "Location1"
Then user should be receive "Push Notification" 
When user selects the "Push Notification" 
Then user should be displayed with "Dashboard"
And user should be updated with <UMode> of "Location1"
And user should be in <Mode> of "Location2"
And user should be updated with based on the <UMode> settings  of "Location1"
And user should be in based on the <Mode> settings of "Location2"

Examples:
|Solutions||Mode| UMode | 
|JasperNA|Home| Away | 
|JasperNA|Away| Home |
|JasperEMEA|Home| Away | 
|JasperEMEA|Away| Home |
|HB|Home| Away | 
|HB|Away| Home |
|Spruce||Home| Away | 
|Spruce|Away| Home |
|Camera|Home| Away | 
|Camera|Away| Home |
|DAS|Home| Away | 
|DAS|Away| Home |
|DAS|Night| Away | 