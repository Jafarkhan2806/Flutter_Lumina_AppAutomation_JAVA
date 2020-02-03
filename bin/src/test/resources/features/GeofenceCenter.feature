@GeofenceCenter
Feature: GeofenceCenter Setup
As an user I want to determine my geofence center through location service so that I can configure my geofence radius

@GeofenceCenter_Update_SingleStat           @NotAutomatable
  Scenario: update geofence center for user account with single stat 
Given user login to user account with single stat
  When user navigate to geofence center screen
  	And user update the Geofence center
 	And user save the geofence center 
  Then verify the updated geofence center is saved & the updated values retain
  	And user logout and login to verify the updated geofence center is retained
    And user log out of the app
    
@GeofenceCenter_Update_MultiStat           @NotAutomatable
  Scenario: update geofence center for user account with multiple stats
Given user login to user account with multiple stats
  When user navigate to geofence center screen
  	And user update the Geofence center
 	And user save the geofence center 
  Then verify the updated geofence center is saved & the updated values retain
  	And user logout and login to verify the updated geofence center is retained
    And user log out of the app
    
@GeofenceCenter_UpdateAndCancel_SingleStat           @NotAutomatable
  Scenario: Login to user account with single stat update geofence center and cancel without saving 
Given user login to user account with single stat
  When user navigate to geofence center screen
  	And user update the Geofence center
 	And user cancel the geofence radius setting screen 
  Then verify the updated geofence center is not saved & the old value is retained
    And user log out of the app

@GeofenceCenter_UpdateAndCancel_MultiStat           @NotAutomatable
  Scenario: Login to user account with multiple stats update geofence center and cancel without saving
Given user login to user account with multiple stats
  When user navigate to geofence center screen
  	And user update the Geofence center
 	And user cancel the geofence radius setting screen 
  Then verify the updated geofence center is not saved & the old value is retained
    And user log out of the app
    

@GeofenceCenter_MobileLocation_PopupVerification           @NotAutomatable
  Scenario: Verify Location service popup is displayed when mobile device location is turned off
Given user login to lyric app
	And mobile location service is turned off
  When user navigate to geofence center screen
  	Then verify location service popup is displayed with Settings & cancel button
    And user cancel the popup 
    And user log out of the app
    
@GeofenceCenter_APPLocationPermission_PopupVerification           @NotAutomatable
  Scenario: Verify Location service popup is displayed when app location permission is turned off
Given user login to lyric app
	And app location permission is turned off
  When user navigate to geofence center screen
  	Then verify location service popup is displayed with Settings & cancel button
    And user cancel the popup 
    And user log out of the app
    
@GeofenceCenter_MobileLocationTurnON           @NotAutomatable
  Scenario: Verify user is able to turn on mobile Location service and update the geofence center
Given user login to user account 
	And mobile location service is turned off
  When user navigate to geofence center screen
    And user goto location settings and turn on location
    And user update the Geofence center
    And user save the geofence center 
  Then verify the updated geofence center is saved & the updated values retain
  	And user logout and login to verify the updated geofence center is retained
    And user log out of the app
	    
@GeofenceCenter_AppLocation_PermissionTurnON           @NotAutomatable
  Scenario: Verify user is able to turn on app Location permission and update the geofence center
Given user login to user account 
	And app location permission is turned off
  When user navigate to geofence center screen
    And user goto app location permission and turn on permission
    And user update the Geofence center
    And user save the geofence center 
  Then verify the updated geofence center is saved & the updated values retain
  	And user logout and login to verify the updated geofence center is retained
    And user log out of the app
    
@GeofenceCenter_UpdateInRadiusSetttingScreen           @NotAutomatable
  Scenario: update geofence center and verify the center in radius setting screen
Given user login to user account
  When user navigate to geofence center screen
  	And user update the Geofence center
 	And user save the geofence center 
    And user navigate to geofence radius setting screen
  Then verify the geofence center is updated in radius setting screen
  	And user logout and login to verify the updated geofence center in radius setting screen is retained
    And user log out of the app
    
@GeofenceCenter_Update_MultiLocation           @NotAutomatable
  Scenario: Verify the geofence center update is location dependent
Given user login to user account with multilocation
  When user navigate to geofence center screen of Location1
  	And user update the Geofence center of Location1
 	And user save the geofence center of Location1
  Then verify the updated geofence center is saved & the updated values retain for Location1
  	And verify the Location2 geofence center is not updated & old center retain
    And user log out of the app

@GeofenceCenterUpdate_NewlyConfiguredStat           @NotAutomatable
  Scenario: Verify user is able to updated geofence center for newly congifured stat
Given user configured new Jasper/HB stat by skipping geofence
  When user navigate to geofence center screen
    And user update the Geofence center
    And user save the geofence center 
  Then verify the updated geofence center is saved & the updated values retain
  	And user logout and login to verify the updated geofence center is retained
    And user log out of the app
