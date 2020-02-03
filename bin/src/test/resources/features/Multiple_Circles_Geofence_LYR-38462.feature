@MultipleCirclesGeofenceScenarios         @Platform
Feature: Multiple Circles Geofence
As a user I want to verify the newly implemented multiple circles for Geofence improvements


@VerifyIfGeofenceEventIsReceivedWhenUserCrossesUserDefinedGeofenceRadius        @NotAutomatable
Scenario: Verify if user receives geofence event when user crosses geofence after setting up external geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user crosses the user defined geofence radius
Then user should be displayed "Away" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "Geofence crossed Away" push notification


@VerifyIfGeofenceEventIsReceivedWhenUserCrossesGeofenceExternalToTheUSGR        @NotAutomatable
Scenario: Verify if user receives geofence event when user crosses geofence after setting up external geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user crosses the user defined geofence radius
And if user does not recieve either "Geofence crossed Away" push notification or Geofence status "Away" does not get updated in the app
When user crosses the geofences external to the user specified radii
Then user should be displayed "Away" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "Geofence crossed Away" push notification


@VerifyIfGeofenceEventIsReceivedUSGRIsSameAsMGRAndUserCrossesGeofence        @NotAutomatable
Scenario: Verify if user receives geofence event when USGR is same as minimum geofence radius and user crosses geofence
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
When user crosses the user defined geofence radius
And if user does not recieve either "Geofence crossed Away" push notification or Geofence status "Away" does not get updated in the app
When user crosses the geofence external to the user specified radii which is by default 100 meters
Then user should be displayed "Away" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "Geofence crossed Away" push notification


@VerifyIfGeofenceEventsAreDuplicatedWhenUserCrossesGeofenceExternalToTheUSGR        @NotAutomatable
Scenario: Verify if user receives duplicate geofence events when user crosses geofence after setting up external geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user crosses the user defined geofence radius
Then user should be displayed "Away" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "Geofence crossed Away" push notification
When user crosses the geofences external to the user specified radii
And duplicate events are triggered for AWAY state by the USGR and external radii fences
Then HH app should not display those duplicate events


@VerifyIfGeofenceEventIsReceivedWhenUserEntersUserDefinedGeofenceRadius        @NotAutomatable
Scenario: Verify if user receives geofence event when user enters geofence after setting up internal geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user enters the user defined geofence radius
Then user should be displayed "Home" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "User arrived" push notification


@VerifyIfGeofenceEventIsReceivedWhenUserEntersGeofenceInternalToTheUSGR        @NotAutomatable
Scenario: Verify if user receives geofence event when user enters geofence after setting up internal geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user enters the user defined geofence radius
And if user does not recieve either "User Arrived" push notification or Geofence status "Home" does not get updated in the app
When user enters the geofences internal to the user specified radii
Then user should be displayed "Home" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "User Arrived" push notification


@VerifyIfGeofenceEventIsReceivedUSGRIsSameAsMGRAndUserEntersGeofence        @NotAutomatable
Scenario: Verify if user receives geofence event when USGR is same as minimum geofence radius and user enters geofence
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
When user enters the user defined geofence radius
Then user should be displayed "Home" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "User arrived" push notification


@VerifyIfGeofenceEventsAreDuplicatedWhenUserEntersGeofenceInternalToTheUSGR        @NotAutomatable
Scenario: Verify if user receives duplicate geofence events when user arrives home after setting up internal geofence radius from user specified geofence radius (USGR)
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
And user sets "Geofence Radius" and saves it
And for the set "Geofence Radius" setup 'n' geofences within the user specified radii
And for the set "Geofence Radius" setup 'm' geofences external to the user specified radii
When user enters the user defined geofence radius
Then user should be displayed "Home" status in both "Geofence Status Area" in Dashboard screen and "Geofence this location" screen
And user should receive a "User arrived" push notification
When user enters the geofences internal to the user specified radii
And duplicate events are triggered for HOME state by the USGR and internal radii fences
Then HH app should not display those duplicate events