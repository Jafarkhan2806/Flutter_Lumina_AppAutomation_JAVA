@Geofence_monitoring
Feature: Geofence monitoring
As an user 
I want the stat to set my comfortable temperature automatically using geofence
So that my arrival or exit home identified with the help of mobile geofence status for setting up my away temperature settings or home or sleep settings


@GeofenceMonitoringForVariousCombination            @NotAutomatable
Scenario Outline: Verify the geofence scheduling for Location accessed by various combination
As an user 
I want the system to consider the geofence location status by considering all mobile devices accessed to the location
So that my geofencing setting will get applied based on my geofence status
Given Location services is enabled for the lyric app
And Location services is enabled in mobile device
And Geofence settings is on for the location
And <User logged in mobile device> 
When The geofence status of the location changed to the <State>  
Then Verify user should get push notification for departed or arrived
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|User logged in mobile device                           |State |
|Actual user logged in single mobile device             |Home  |
|Actual user logged in multiple mobile device           |Home  |
|Invite user logged in single mobile device             |Home  |
|Invite user logged in multiple mobile device           |Home  |
|Actual and Invite user logged in multiple mobile device|Home  |
|Actual user logged in single mobile device             |Away  |
|Actual user logged in multiple mobile device           |Away  |
|Invite user logged in single mobile device             |Away  |
|Invite user logged in multiple mobile device           |Away  |
|Actual and Invite user logged in multiple mobile device|Away  |


@UserShouldnotRemovedfromGang            @NotAutomatable
Scenario Outline: Verify the mobile device should participate in location geofence status for below status
As an user 
I want the CHIL system to consider user for geofence status 
So that mobile will be considered for the location geofence monitoring
Given Login with User account
And The geofence status of the location is <State>
When User with <Below condition>
And The geofence status of the location is <Changed to the state> 
Then Verify user is part of geofence gang member
And User should get push notification for geofence trigger

Examples:
|Below condition                                |State|Changed to the state|
|App running in background                      |Home |Away                |
|App is upgraded                                |Home |Away                |
|App is forceclosed                             |Home |Away                |
|App is killed                                  |Home |Away                |
|App running in background                      |Away |Home                |
|App is upgraded                                |Away |Home                |
|App is forceclosed                             |Away |Home                |
|App is killed                                  |Away |Home                |


@UserShouldbeRemovedfromGang            @NotAutomatable
Scenario Outline: Verify the user should not participate in location geofence status for below status
As an user 
I want the CHIL system not to consider user for geofence status 
so that user wont be considered for the location geofence monitoring
Given Login with <User account>
And The geofence status of the location is <State>
When User with <Below condition>
And The geofence status of the location is <Changed to the state> 
Then Verify user is not part of geofence gang member
And User should not get push notification for geofence trigger

Examples:
|User account |Below condition                                                  |State|Changed to the state|
|Actual user  |User access is removed for the location                          |Home |Away                |
|Actual user  |User not triggered any change in geofence status for last 7 days |Home |Away                |
|Invite user  |User access is removed for the location                          |Home |Away                |
|Invite user  |User not triggered any change in geofence status for last 7 days |Home |Away                |
|Actual user  |User access is removed for the location                          |Away |Home                |
|Actual user  |User not triggered any change in geofence status for last 7 days |Away |Home                |
|Invite user  |User access is removed for the location                          |Away |Home                |
|Invite user  |User not triggered any change in geofence status for last 7 days |Away |Home                |


@StatShouldnotParticipateGeofenceMonitoring            @NotAutomatable
Scenario Outline: Verify the stat should not participate in location geofence status for below status
As an user 
I want the system to apply geofence setting only to the stat were gofence scheduling  is configured
So that geofence settings will get set automatically on the geofence event 
Given Geofence settings is on for the location
And Login Lyric account with <Stat>
And "Stat1" with <Condition> 
When The geofence status of the location changed to the <State>
Then Verify geofence setting applied only to the stat configured for geofence scheduling

Examples:
|Stat       |Condition                          |State|
|Single stat|Geofence scheduling is configured  |Home |
|Single stat|Geofence scheduling not configured |Home |
|Single stat|Geofence scheduling is configured  |Away |
|Single stat|Geofence scheduling not configured |Away |
|Multi stat |Geofence scheduling is configured  |Home |
|Multi stat |Geofence scheduling not configured |Home |
|Multi stat |Geofence scheduling is configured  |Away |
|Multi stat |Geofence scheduling not configured |Away |


@GeofencemonitoringNetworkfailuresRestored            @NotAutomatable
Scenario Outline: Verify the notifications for Geofence monitoring when network failures restored
As an user 
I want the system to have a logic for network failures restored
So that my geofence settings will be applied
Given Location services is enabled in mobile device 
And Location services is enabled for the lyric app
And Geofence settings is on for the location
And User with <Mobile network status>
And Location status changed to <State>
When User with <Mobile network status> restored
Then Verify location status changed to new <State> in app after <Mobile network status> restored
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|Mobile network status          |State|
|Mobile internet(3G/wifi)down   |Home |
|Mobile with Airplane mode      |Home |
|Mobile with low signal(3G/wifi)|Home |
|Switch between (3G/wifi)       |Home |
|Mobile internet(3G/wifi)down   |Away |
|Mobile with Airplane mode      |Away |
|Mobile with low signal(3G/wifi)|Away |
|Switch between (3G/wifi)       |Away |


@GeofencemonitoringLyricserviceDown            @NotAutomatable
Scenario Outline: Verify the notifications for Geofence monitoring when lyric system is down
As an user 
I want the system to have logic for if lyric service is down 
So that my geofence settings will be applied once the lyric service restored
Given Location services is enabled in mobile device 
And Location services is enabled for the lyric app
And Geofence settings is on for the location
When User with condition <Service status> 
And App <Status> 
Then Verify location status changed to new <State> 
Then User should get push notification "We are having trouble communication with your thermostat. Please check the connection"

Examples:
|Service status|Status       |State|
|CHIL down     |in background|Home |
|LCC down      |in background|Home |
|Stat offline  |in background|Home |
|CHIL down     |in foreground|Home |
|LCC down      |in foreground|Home |
|Stat offline  |in foreground|Home |
|CHIL down     |in background|Away |
|LCC down      |in background|Away |
|Stat offline  |in background|Away |
|CHIL down     |in foreground|Away |
|LCC down      |in foreground|Away |
|Stat offline  |in foreground|Away |


@GeofenceMonitoringLyricserviceRestored            @NotAutomatable
Scenario Outline: Verify the Geofence monitoring when lyric service is restored back
As an user 
I want the system to have logic for lyric service is restored back 
So that my geofence settings will be applied
Given Location services is enabled in mobile device 
And Location services is enabled for the lyric app
And Geofence settings is on for the location
And User with condition <Service status>
And Location status changed to <State>
When User with condition <Service status> restored 
And App <Status>
Then Verify location status changed to new <State> in app after lyric service is restored back 
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|Service status|Status       |State|
|CHIL down     |in background|Home |
|LCC down      |in background|Home |
|Stat offline  |in background|Home |
|CHIL down     |in foreground|Home |
|LCC down      |in foreground|Home |
|Stat offline  |in foreground|Home |
|CHIL down     |in background|Away |
|LCC down      |in background|Away |
|Stat offline  |in background|Away |
|CHIL down     |in foreground|Away |
|LCC down      |in foreground|Away |
|Stat offline  |in foreground|Away |


@UserShouldnotRemovedfromGangExtra             @NotAutomatable
Scenario Outline: Verify the mobile device should not participate in location geofence status for below status
As an user 
I want the CHIL system to consider mobile device for geofence status 
So that user will be considered for the location geofence monitoring
Given Login with User account
And The geofence status of the location is <State>
When User with <Below condition>
And The geofence status of the location is <Changed to the state> 
Then Verify user should not get push notification for geofence trigger

Examples:
|Below condition                                |State|Changed to the state|
|Location services is disabled in mobile device |Home |Away                |
|Location services is disabled for the lyric app|Home |Away                |
|Geofence for location is set to OFF            |Home |Away                |
|App is uninstalled                             |Home |Away                |
|App is logged out                              |Home |Away                |
|Location services is disabled in mobile device |Away |Home                |
|Location services is disabled for the lyric app|Away |Home                |
|Geofence for location is set to OFF            |Away |Home                |
|App is uninstalled                             |Away |Home                |
|App is logged out                              |Away |Home                |


#Expected but yet to be implement
@GeofenceMonitoringForChangedcenter            @NotAutomatable
Scenario Outline: Verify the geofence scheduling for change in Geofence center due to changed address
As an user 
I want the system to consider the geofence location status if center is moved 
So that my new geofence center will be considered for my location geofence status
Given Location services is enabled for the lyric app
And Location services is enabled in mobile device
And Geofence settings is on for the location
When User changes the geofence center for the location 
Then Verify location status changed to new <state> due to change in geofence center
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|State |
|Home  |
|Away  |


#Expected but yet to be implement
@GeofenceMonitoringForChangedradius            @NotAutomatable
Scenario Outline: Verify the geofence scheduling for change in Geofence radius
As an user 
I want the system to consider the geofence location status if radius is changed 
So that my new geofence boundry will be considered for my location geofence status
Given Location services is enabled for the lyric app
And Location services is enabled in mobile device
And Geofence settings is on for the location
When User changes the geofence radius for the location 
Then Verify location status changed to new <state> due to change in geofence radius
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|State |
|Home  |
|Away  |


#Expected but yet to be implement
@GeofencesettingsChangePushedToGangmembers            @NotAutomatable
Scenario Outline:Verify the change in geofence settings pushed to all gang members
As an user 
I want the change in geofence settings to be pushed to all gang members  
So that all mobile GPS location status will be updated on change in geofence settings
Given Location services is enabled in mobile device 
And Location services is enabled for the lyric app
When User does <Geofence settings> of the location
And App <Status>
Then Verify the change in geofence settings pushed to all gang members irrespective of app status

Examples:
|Geofence settings|Status       |
|Geofence ON      |in foreground|
|Geofence OFF     |in foreground|
|Change in center |in foreground|
|Change in radius |in foreground|
|Geofence ON      |in background|
|Geofence OFF     |in background|
|Change in center |in background|
|Change in radius |in background|


#Expected but yet to be implement
@GeofenceMonitoringPoweredback            @NotAutomatable
Scenario Outline: Verify the Geofence monitoring when mobile device is powered on back from power down
As an user 
I want the system to have logic if mobile device is powered on back from power down
So that mobile GPS location status will be considered for my location geofence status
Given Location services is enabled for the lyric app
And Location services is enabled in mobile device
And Geofence settings is on for the location
And Mobile is powered off
And Location status changed to <State>
When Mobile device is powered back
Then Verify location status changed to new <state> after powered back from power down 
And Verify for Geofence schedule period settings applied for the location
And Verify the schedule status in the solution card
And Verify the Location Geofence status updated in geofence settings

Examples:
|State |
|Home  |
|Away  |