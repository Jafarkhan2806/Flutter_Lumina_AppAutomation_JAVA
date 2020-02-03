@AccessSensorEnrollment
Feature: Verify Sensor Enrolment Functionally

@DASAccessSensorEnrollmentWithDefaultSensorNameWatchHow-ToVideo
Scenario Outline: a- As a user I should be able to successfully enrol Access Sensor with default sensor name and video should play for assistance in sensor enrolment 
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen 
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects <Sensor Location Area> from <Sensor Location> screen
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user selects "Wont Fit As shown" from "Place Sensor on location" screen
Then user should be displayed with the "Access sensor Install help" screen
When user navigates to "Place Sensor on location" screen from the "Access sensor Install help" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
When user <Sensor Location> access sensor "Opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
When user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
And user "should not be displayed" with the "Test sensor screen cancel" option 
And user "should not be displayed" with the "Test sensor screen back" option 
When user selects "Done" from "Test Sensor" screen
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor Status"
When user navigates to "Dashboard" screen from the "Security Solution Card" screen 
When user navigates to <Access Setting screen> screen from the "Dashboard" screen 
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen

Examples:
|Mode|Sensor Location| Sensor Location Area | Access Status | Access Status Update |Access Setting screen|
|Home | Door | Front Door| open | Closed |Door Access settings|
|Home | Window | Living Room Window | open | Closed |Window Access settings|
|OFF | Door | Back Door| open | Closed |Door Access settings|
|OFF | Window |Dining Room Window | open | Closed |Window Access settings|

#incaserequired
#|Home | Door | Back Door| open | Closed |
#|Home | Door | Side Door| open | Closed |
#|Home | Window |Dining Room Window | open | Closed |
#|Home | Window | Kitchen Window | open | Closed |
#|OFF | Door | Front Door| open | Closed |
#|OFF | Door | Side Door| open | Closed |
#|OFF | Window | Living Room Window | open | Closed |
#|OFF| Window | Kitchen Window | open | Closed |


@DASAccessSensorEnrollmentWithCustomSensorName_Old
Scenario Outline: As a user I should be able to successfully enrol Access Sensor with custom sensor name and video should play for assistance in sensor enrolment
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
Then user edits the <Sensor Location> name to <Sensor Location Area>
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user selects "Wont Fit As shown" from "Place Sensor on location" screen
Then user should be displayed with the "Access sensor Install help" screen
When user navigates to "Place Sensor on location" screen from the "Access sensor Install help" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
Then user <Sensor Location> access sensor "Opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
Then user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
#And user should not display with "cancel" button and "Back" button
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor Status"
When user navigates to <Access Sensor Settings> screen from the "Security Solution card" screen
When user selects "delete sensor" from <Access Sensor Settings> screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
When user selects "delete sensor" from <Access Sensor Settings> screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen
 
 
Examples:
|Mode|Sensor Location| Sensor Location Area | Access Status | Access Status Update |Access Sensor Settings|
|Home | Door |Honeywell| open | Closed |Door Access Settings|
|Home | Window |Honeywell1 | open| Closed |Window Access Settings|
|OFF | Door | Honeywell2| open | Closed |Door Access Settings|
|OFF | Window | Honeywell3 | open | Closed |Window Access Settings|


@DASAccessSensorEnrollmentWithDuplicateSensorName @SpecificAccountRequired
Scenario Outline: As a user I should get a Sensor Name Already Assigned popup when I enrol Access Sensor with duplicate sensor name
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user "door" access sensor "enrolled"
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects "Door" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
Then user names the "Duplicate Door" to "custom name"
Then user should receive a "Sensor Name Already Assigned" popup
Examples:
|Mode |
|Home|
|OFF|

@DASAccessSensorEnrollmentByCancellingAndRetryingAgainWithCustomSensorName
Scenario Outline: As a user I should be able to successfully enroll Access Sensor with custom sensor name after cancelling the enrollment and retrying again
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user <Sensor Location> access sensor "enrolled"
And user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
Then user edits the <Sensor Location> name to <Custom name>
Then user should be displayed with the "Place Sensor" screen
And user selects "cancel" from "Place Sensor" screen
Then user should receive a "Cancel Sensor Setup" popup
When user "accepts" the "Cancel Sensor Setup" popup
Then user should be displayed with the "Set Up Accessories" screen
When user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
Then user edits the <Sensor Location> name to <Custom name>
Then user should be displayed with the "Place Sensor" screen
When user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
When user <Sensor Location> access sensor "Opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
When user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor Status"
When user navigates to <Access Sensor Settings> screen from the "Security Solution card" screen
When user selects "delete sensor" from <Access Sensor Settings> screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
When user selects "delete sensor" from <Access Sensor Settings> screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen

Examples:
|Mode |Sensor Location| Custom name| Access Status | Access Status Update |Access Sensor Settings|
|Home | Door | Honeywell | open | Closed |Door Access Settings|
|Home | Window | Honeywell1 | open | Closed |Window Access Settings|
|OFF | Door | Honeywell2 | open | Closed |Door Access Settings|
|OFF | Window | Honeywell3 | open | Closed |Window Access Settings|


@DASAccessSensorEnrollmentWithSensorNotWorkingAndIsWithInRange
Scenario Outline: As a user I should be able to successfully enroll Access Sensor when sensor is not working but is within range
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Get Started" from "Sensor Overview" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects <Sensor Location Area> from <Sensor Location> screen
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
When user selects "Sensor Not Working" from "Test Access Sensor" screen
Then user should be displayed with the "Access Sensor Help" screen
When user selects "Test Signal Strength" from "Access Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the <Sensor Location> status as <Signal strength> on the "Signal Strength"
And user navigates to "Test Sensor" screen from the "Test Signal Strength" screen
When user <Sensor Location> access sensor "Opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
When user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
And user "should not be displayed" with the "Test sensor screen cancel" option 
And user "should not be displayed" with the "Test sensor screen back" option 
When user selects "Done" from "Test Sensor" screen
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "closed" on the "Sensor Status"
When user navigates to <Access settings> screen from the "Security Solution card" screen 
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen

 
Examples:
|Mode |Sensor Location| Sensor Location Area | Signal strength | Access Status | Access Status Update |Access settings|
|Home | Door |Front Door| High |  open | Closed |Door Access settings|
#|Home | Door | Front Door| Medium |open | Closed |Door Access settings|
#|Home | Door | Front Door| Low |open | Closed |Door Access settings|
|OFF | Window |Kitchen Window| High | open | Closed |Window Access settings|
#|OFF | Window | Kitchen Window| Medium | open | Closed |Window Access settings|
#|OFF | Window | Kitchen Window| Low | open | Closed |Window Access settings|

#Incaserequired
#|Home | Door |Back Door| High |  open | Closed |
#|Home | Door | Back Door| Medium |open | Closed |
#|Home | Door | Back Door| Low |open | Closed |
#|Home | Door |Side Door| High |  open | Closed |
#|Home | Door | Side Door| Medium |open | Closed |
#|Home | Door | Side Door| Low |open | Closed |
#|Home | Window |Living Room Window| High | open | Closed |
#|Home | Window |Living Room Window| Medium | open | Closed |
#|Home | Window |Living Room Window| Low | open | Closed |
#|Home | Window |Dining Room Window| High | open | Closed |
#|Home | Window | Dining Room Window| Medium | open | Closed |
#|Home | Window | Dining Room Window| Low | open | Closed |
#|Home | Window |Kitchen Window| High | open | Closed |
#|Home | Window | Kitchen Window| Medium | open | Closed |
#|Home | Window | Kitchen Window| Low | open | Closed |
#|OFF | Door |Front Door| High |  open | Closed |
#|OFF | Door | Front Door| Medium |open | Closed |
#|OFF | Door | Front Door| Low |open | Closed |
#|OFF | Door |Back Door| High |  open | Closed |
#|OFF | Door | Back Door| Medium |open | Closed |
#|OFF | Door | Back Door| Low |open | Closed |
#|OFF | Door |Side Door| High |  open | Closed |
#|OFF | Door | Side Door| Medium |open | Closed |
#|OFF | Door | Side Door| Low |open | Closed |
#|OFF | Window |Living Room Window| High | open | Closed |
#|OFF | Window |Living Room Window| Medium | open | Closed |
#|OFF | Window |Living Room Window| Low | open | Closed |
#|OFF | Window |Dining Room Window| High | open | Closed |
#|OFF | Window | Dining Room Window| Medium | open | Closed |
#|OFF | Window | Dining Room Window| Low | open | Closed |


@DASAccessSensorEnrollmentWithSensorNotWorkingAndIsOutOfRange
Scenario Outline: As a user I should be able to verify sensor not working functionality when sensor is out of range
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user navigates to "Locate Sensor" screen from the "Sensor Overview" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects <Sensor Location Area> from <Sensor Location> screen
Then user should be displayed with "Place Sensor" screen
When user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
When user selects "Sensor Not Working?" from "Test Sensor" screen
Then user should be displayed with the "Access Sensor Help" screen
When user selects "Test Signal Strength" from "Access Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
When user <Sensor Location> access sensor "offline"
Then user should receive a "Out Of Range" popup
And user "taps on RETRY in" the "Out Of Range" popup
Then user should receive a "Out Of Range" pop up
And user "taps on OK in" the "Out Of Range" popup
Then user should be displayed with the "Access Sensor Help" screen
And user navigates to "Test Sensor" screen from the "Test Signal Strength" screen
		
Examples:
|Mode |Sensor Location| Sensor Location Area | 
|Home | Door | Front Door|
|OFF | Window | Living Room Window | 
#Incaserequired
|Home | Door | Back Door| 
|Home | Door | Side Door| 
|Home | Window | Living Room Window | 
|Home | Window |Dining Room Window | 
|Home | Window | Kitchen Window | 
|OFF | Door | Front Door| 
|OFF | Door | Back Door| 
|OFF | Door | Side Door| 
|OFF | Window |Dining Room Window | 
|OFF| Window | Kitchen Window | 


@DASAccessSensorEnrollmentVerifyCancelFunctionality
Scenario Outline: Verify cancel functionality in all screens while enrolling a Access Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "SENSOR LIST SETTINGS" screen from the "Dashboard" screen
When user navigates to <PreScreen> screen from the "Sensor List" screen
And user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel sensor Setup" popup
When user "dismisses" the "Cancel sensor Setup" popup
Then user should be displayed with the <PreScreen> screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel sensor Setup" popup
When user "accepts" the "Cancel sensor Setup" popup
Then user should be displayed with the "Set Up Accessories" screen
		
Examples:
|Mode|PreScreen |
|Home|Sensor Overview |
|Home|Locate Sensor |
|Home|Name Sensor Location|
|Home|Name sensor Default Name |
|Home|Place Sensor|
|Home|Place Sensor on Location|
|Home|TEST ACCESS SENSOR|
#Incaserequired 
#|OFF|Sensor Overview |
#| OFF |Locate Sensor |
#| OFF |Name Sensor Location|
#| OFF |Name sensor Default Name |
#| OFF |Name sensor Custom name |
#| OFF |Place Sensor|
#| OFF |Place Sensor on Location|
#| OFF |Test Sensor|


@DASAccessSensorEnrollmentVerifyAutodismissofCancelFunctionalityAfterTestSensor
Scenario Outline: Verify cancel functionality in all screens while enrolling a Access Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user "door" access sensor "enrolled"
And user selects "Access sensor SETUP button" from "Set Up Accessories" screen
When user selects "Get Started" from "Sensor Overview" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
And user selects "Door" from "Name Sensor" screen
And user selects "Front Door" from "Name Sensor" screen
When user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
And user selects "cancel" from "Test Sensor" screen
Then user should receive a "Cancel Sensor Setup" popup
When user "door" access sensor "OPENED"
When user "door" access sensor "CLOSED"
Then user "should not be displayed" with the "Cancel Sensor Setup popup" option
Then user should see the "door" status as <Access Status Update> on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
When user selects "Done" from "Set Up Accessories" screen
When user navigates to "Door Access Settings" screen from the "Sensor list" screen
When user selects "delete sensor" from "Door Access Settings" screen
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "Door" device on the "sensor list" screen
 
Examples:
|Mode|Access status | Access Status Update |
|Home|Open | Closed |
 
 
#In case required
#| OFF |Test Sensor | open | Closed |



@DASAccessSensorEnrollmentVerifyBackArrowFunctionality
Scenario Outline: Verify Back arrow functionality in all screens while enrolling a Access Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "SENSOR LIST SETTINGS" screen from the "Dashboard" screen
When user navigates to <PreScreen> screen from the "Sensor List" screen
And user selects "Back" from <PreScreen> screen
Then user should be displayed with the <PostScreen> screen

Examples:
|Mode|PreScreen				 |PostScreen |
|Home|Sensor Overview 			| Set up Accessories |
|Home|Locate Sensor 			|Sensor Overview |
|Home|Name Sensor Location		| Locate Sensor |
|Home|Name sensor Default Name 		|Name Sensor Location|
#|Home|Name sensor Custom name 		| Name sensor Default Name |
|Home|Place Sensor			| Name sensor |
|Home|Place Sensor on Location		| Place sensor |
#|Home|Place Sensor			| Name sensor Custom name | # Navigates from sensor Custom name
|Home|Access Sensor Help 	| Place Sensor on Location |	
|Home|Test ACCESS Sensor			| Place Sensor on Location|
|Home|Signal Strength			| Access Sensor Help |
|Home|Access Sensor Help			| Test ACCESS Sensor |

#incaserequired
#|OFF|Sensor Overview 			| Set up Accessories |
#| OFF |Locate Sensor 			|Sensor Overview |
#| OFF |Name Sensor Location		| Location Sensor |
#| OFF |Name sensor Default Name 	|Name Sensor Location|
#| OFF |Name sensor Custom name 	  	| Name sensor Default Name |
#| OFF |Place Sensor			| Name sensor Default Name |
#| OFF |Place Sensor			| Name sensor Custom name | # Navigates from sensor Custom name
#| OFF |Place Sensor on Location		| Place sensor |
#| OFF |Access Sensor Install Help 	| Place Sensor on Location |	
#| OFF |Test Sensor			| Place Sensor on Location|# Before verification
#| OFF |Acces Sensor Help		| Test Sensor |
#| OFF |Signal Strength			| Access Sensor Help |


@DASAccessSensorEnrollmentflowTimeoutpopupverification
Scenario: verify timeout while Access Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to "Home" mode through CHIL
When user navigates to "SENSOR LIST SETTINGS" screen from the "Dashboard" screen
When user navigates to "Sensor Overview" screen from the "Sensor List" screen
Then user should receive a "Sensor enrollment Time out" popup
When user "accepts" the "Time out" popup
Then user should be displayed with the "Set up Accessories" screen


@DASAccessSensorEnrollmentVerifyBackArrowFunctionalityAfterVerificationTestSensor @coveredAboveTestCase
Scenario Outline: Verify Back arrow functionality in Test Sensor screen after verification
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to the <PreScreen> screen
And user selects "Back arrow" from <PreScreen> screen
Then user should be displayed with <PreScreen> screen
And user should be disabled "Back arrow" button
Examples:
|Mode |PreScreen	|			
|Home|Test Sensor|				
|OFF|Test Sensor|

@DASAccessSensorEnrollmentflowpushnotificationVerification
Scenario: verify push notification while Access Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
And user enrolled the "AccessSensor"
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "ACCESS" sensor
And  user selects "Access sensor SETUP button" from "Set Up Accessories" screen
When user "Triggered" the "Access Sensor"
Then user should not receive "Alerts" and "Push Notifications"



