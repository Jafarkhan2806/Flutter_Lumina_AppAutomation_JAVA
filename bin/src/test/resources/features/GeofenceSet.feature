Feature: As an user 
i want to set the geofence for my location
so that my stat will set my comfortable indoor temperature in home/office automatically on my arrival & exit 

@NotAutomatable
Scenario Outline:               
As an user 
i want to view the geofence settings 
so that i can change the geofence center and radius 
Given geofence is <set> for the location
When user selects geofence radius
Then verify user provided with location map
And option to update the geofence centre

Examples:
|set        |
|already set|
|yet to set |


@NotAutomatable
Scenario Outline:               
As an user 
i want to get guide message if user try to change the geofence center
so that i should get cautioned on my attempt to change geofence center
Given geofence is <set> for the location
When user selects geofence 
Then verify user provided with guide message to turn on location services

Examples:
|set        |
|already set|
|yet to set |


@NotAutomatable
Scenario Outline:               
As an user 
i want to get guide message if user not turned on location services in mobile settings or app
so that i should turn on location services in mobile settings or app to use geofence feature
Given geofence is <set> for the location
When user selects geofence radius
Then verify user gets cautioned with guide message to turn on location services

Examples:
|set        |
|already set|
|yet to set |


@NotAutomatable
Scenario:               
As an user 
i want to get message 
so that i should get cautioned with guide message about geofence turned off for the location
Given geofence is set for the location
When user turn off the geofence
Then verify user gets cautioned with guide message about geofence turned off for the location 


@NotAutomatable
Scenario Outline:               
As an user 
i want to turn on the geofence
Given geofence <status> for the location
|status		|
|set        |
|already set|
|yet to set |
When <user> selects geofence on control button in <mobile device> 
Then verify app logged with <user> in <mobile device> geofence is ON

Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |


@NotAutomatable
Scenario Outline:               
As an user 
i want to turn off the geofence
Given geofence <status> for the location
|status		|
|set        |
|already set|
|yet to set |
When <user> selects geofence on control button in <mobile device> 
Then verify app logged with <user> in <mobile device> geofence is OFF

Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |


@NotAutomatable
Scenario Outline:               
As an user 
i want to change the geofence center
Given geofence <status> for the location
|status		|
|set        |
|already set|
|yet to set |
When <user> changes geofence center in <mobile device> 
Then verify app logged with <user> in <mobile device> geofence is updated

Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |


@NotAutomatable
Scenario Outline:               
As an user 
i want to change the geofence radius for the location
Given geofence <status> for the location
|status		|
|set        |
|already set|
|yet to set |
When <user> changes geofence radius in <mobile device> 
Then verify app logged with <user> in <mobile device> geofence radius is updated

Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |


@NotAutomatable
Scenario Outline:               
As an user
i want to create the geofence scheduling for my location
so that my stat will set my comfortable indoor temperature in home/office automatically on my arrival & exit  
Given geofence <status> for the location
|status		|
|set        |
|already set|
|yet to set |
When user selects Geofence based schedule                            
Then verify app logged with <user> in <mobile device> geofence is ON 

Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |


@NotAutomatable
Scenario Outline:               
As an user
i want to create the geofence scheduling for my location
so that my stat will set my comfortable indoor temperature in home/office automatically on my arrival & exit  
Given stat with <scheduling>
When user selects Geofence based schedule                            
Then verify user is able to update the geofence center and radius

Examples:
|scheduling           |
|no scheduling        |
|time based scheduling|
|geofence scheduling  |