@GeofenceRadius
Feature: GeofenceRadius Setup
As an user I want to set my geofence radius so that geofence trigger happens and setpoint changes when I cross/enter the radius

@GeofenceThisLocation_ToggleON          @Automated
Scenario: Verify if 'Geofence This Location' toggle is turned ON when user turns ON the 'Geofence This Location', log out from the app and logs in back
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
#And user logs out of the app
#When user launches and logs in to the Lyric Application
When user logs out and logs in to the Lyric Application with "logged in users account"
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
And "Geofencing" value should be updated to "ON" on "Geofence Settings" screen
Then user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
#And user logs out of the app

@GeofenceThisLocation_ToggleOFF          @Automed
Scenario: Verify if 'Geofence This Location' toggle is turned OFF when user turns OFF the 'Geofence This Location', log out from the app and logs in back
Given user launches and logs in to the Lyric Application
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "off"
Then the following "Geofence Settings" options should be disabled:
| Options					|
| Geofence this Location	|
And user should not be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
#And user logs out of the app
#When user launches and logs in to the Lyric Application
When user logs out and logs in to the Lyric Application with "logged in users account"
And user navigates to "Global Drawer" screen from the "Dashboard" screen 
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
And "Geofencing" value should be updated to "OFF" on "Geofence Settings" screen
Then the following "Geofence Settings" options should be disabled:
| Options					|
| Geofence this Location	|
And user should not be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
#And user logs out of the app

@GeofenceRadius_Update_Singlestat          @NotAutomatable
  Scenario: Update geofence radius based on the geofence center for user account with single stat 
Given user login to user account with single stat
	And Geofence center is set
  When user navigate to geofence radius screen
  	And user update the Geofence radius
 	And user save the geofence Radius 
  Then verify the updated geofence radius is saved & the updated values retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
    
@GeofenceRadius_Update_MultiStat          @NotAutomatable
  Scenario: Update geofence radius based on the geofence center for user account with multiple stats
Given user login to user account with multiple stats
	And Geofence center is set
  When user navigate to geofence radius screen
  	And user update the Geofence radius
 	And user save the geofence Radius 
  Then verify the updated geofence radius is saved & the updated values retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
    
@GeofenceRadius_UpdateAndCancel_SingleStat          @NotAutomatable
  Scenario: Login to user account with single stat update geofence radius and cancel without saving 
Given user login to user account with single stat
	And Geofence center is set
  When user navigate to geofence radius screen
  	And user update the Geofence radius
 	And user cancel the geofence radius setting screen 
  Then verify the updated geofence radius is not saved & the old value is retained
    And user log out of the app

@GeofenceRadius_UpdateAndCancel_MultiStat          @NotAutomatable
  Scenario: Login to user account with multiple stats update geofence center and cancel without saving
Given user login to user account with multiple stats
	And Geofence center is set
  When user navigate to geofence radius screen
  	And user update the Geofence radius
 	And user cancel the geofence radius setting screen 
  Then verify the updated geofence radius is not saved & the old value is retained
    And user log out of the app
    
@GeofenceRadius_MobileLocation_PopupVerification          @NotAutomatable
  Scenario: Verify Location service popup is displayed when mobile device location is turned off
Given user login to lyric app
	And Geofence center is set
	And mobile location service is turned off
  When user navigate to geofence radius screen
  	Then verify location service popup is displayed with Settings & cancel button
    And user cancel the popup 
    And user log out of the app
    
@GeofenceRadius_APPLocationPermission_PopupVerification          @NotAutomatable
  Scenario: Verify Location service popup is displayed when app location permission is turned off
Given user login to lyric app
	And Geofence center is set
	And app location permission is turned off
  When user navigate to geofence radius screen
  	Then verify location service popup is displayed with Settings & cancel button
    And user cancel the popup 
    And user log out of the app
    
@GeofenceRadius_MobileLocationTurnON          @NotAutomatable
  Scenario: Verify user is able to turn on mobile Location service and update the geofence radius
Given user login to user account 
	And Geofence center is set
	And mobile location service is turned off
  When user navigate to geofence radius screen
    And user goto location settings and turn on location
    And user update the Geofence radius
    And user save the geofence radius 
  Then verify the updated geofence radius is saved & the updated values retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
	    
@GeofenceRadius_AppLocation_PermissionTurnON          @NotAutomatable
  Scenario: Verify user is able to turn on app Location permission and update the geofence radius
Given user login to user account 
	And Geofence center is set
	And app location permission is turned off
  When user navigate to geofence radius screen
    And user goto app location permission and turn on permission
    And user update the Geofence radius
    And user save the geofence radius 
  Then verify the updated geofence radius is saved & the updated values retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
    
@GeofenceRadius_Update_MaximumAndMinimum          @NotAutomatable
  Scenario Outline: verify user is able to update geofence radius to maximum/minimum limit
Given user login to lyric app
	And Geofence center is set
  When user navigate to geofence radius screen
  	And user update the Geofence radius <Allowed> limit
 	And user save the geofence Radius 
  Then verify the updated geofence radius is saved & the updated values retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
    
 Examples:
|Allowed            |
|Maximum-500Miles   |
|Minimum-500Meter   |


@Geofence_LocationStatus          @NotAutomatable
  Scenario Outline: verify Location status is updated based on the user position
Given user login to lyric app
	And Geofence center is set
    And Geofence Radius is set
  When user mobile location move <Status>
  Then verify the Location status is updated to Home/Away based on the user geofence position
    And user log out of the app
    
 Examples:
|Status         |
|Within Radius  |
|Outside Radius |

@GeofenceTirggerVerification_ToggleOff          @NotAutomatable
  Scenario Outline: Verify the geofence trigger Home/Away doesn't happen when the 'Geofence This Location' toggle is OFF
Given user login to user account with single stat
	And Geofence center is set
    And Geofence Radius is set
	And 'Geofence This Location' toggle is OFF
  When user mobile location move <Status>
  Then verify geofence trigger Home/Away doesn't happen & push notification is not received
    And user log out of the app

 Examples:
|Status         |
|Within Radius  |
|Outside Radius |

@GeofenceRadius_Update_MultiLocation          @NotAutomatable
  Scenario: Verify the geofence radius update is location dependent
Given user login to user account with multilocation
	And Geofence center is set for Location1
    And Geofence center is set for Location2
  When user navigate to geofence radius screen of Location1
  	And user update the Geofence radius of Location1
 	And user save the geofence Radius of Location1
  Then verify the updated geofence radius is saved & the updated values retain for Location1
  	And verify the Location2 geofence radius is not updated & old radius retain
    And user log out of the app

@GeofenceCenterUpdate_NewlyConfiguredStat          @NotAutomatable
  Scenario: Verify user is able to updated geofence center for newly congifured stat
Given user configured new Jasper/HB stat by skipping geofence
	And Geofence center is set
  When user navigate to 'Geofence this Location' screen
    And user turn ON 'Geofence this Location'
    And user update the geofence radius 
  Then verify the updated geofence radius is saved & the updated radius retain
  	And user logout and login to verify the updated geofence radius is retained
    And user log out of the app
