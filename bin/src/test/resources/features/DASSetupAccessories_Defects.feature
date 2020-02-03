@DefectMapingBDD
Feature: Verify Sensor enrolment and settings functionality 



#Requirements: DAS panel should be configured 
@DASSetUpAccessoriesScreenVerificationWithOutSensorBroadCasting
Scenario Outline: As a user I should be verify Set up accessories screen with out sensor broadcasting
Given user launches and logs in to the Lyric application
#And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
#When user motion sensor "enrolled"
#Then user "should not be displayed" with the "Done" option
When user selects "Help" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Pairing Help" screen 
When user selects "Get Additional Help" from "Sensor Pairing Help" screen
#Then user should navigates to "Honeywell Help web portal portal" 
And user navigates to "Sensor Pairing Help" screen from the "Honeywell Help web portal" screen 
And user navigates to "Set Up Accessories" screen from the "Sensor Pairing Help" screen
Then user "should not be displayed" with the "Done" option
Examples:
|Mode|
|Home|
#|OFF|


#Requirements: DAS panel should be configured and KeyFob, OSMV, ISMV, Motion Viewer, Access sensors should be in broadcasting mode 
@DASSetUpAccessoriesScreenVerificationWithSensorBroadCasting
Scenario Outline: As a user I should be verify Set up accessories screen with out sensor broadcasting
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Set Up Accessories" screen from the "Dashboard" screen
Then user broadcast the <Sensors> at the same time
Then user should display with following "Sensors" order with "SETUP option :
|Sensors|
|AccessSensors|
|Motion Viewers|
|ISMV|
|OSMV|
And user should display "more accessories" option on bottom of the screen if not able to visable
When user selects the "Mote accessories" option
Then user should display with complete available "sensors list"
And user should not display with "more accessories" option
Examples
|Mode| Sensors |
|Home| Access Sensor|
|Home |  Motion Viewer|
|Home | OSMV |
| Home | ISMV |
|OFF| Access Sensor |
|OFF| Motion Viewer |
|OFF | OSMV |
| OFF| ISMV |


#Requirements: DAS panel should configured 
@DASSensorEnrolmentWithDefaultSensorNameTotal30Sensors
Scenario Outline: As a user I should be able to Enrol 30 sensors
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers <Sensors> sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should complete the Sensor enrolment for "30" sensors
Examples:
|Mode| Sensors |
|Home| Access Sensor|
|Home |  Motion Viewer|
|Home | OSMV |
| Home | ISMV |
|OFF| Access Sensor |
|OFF| Motion Viewer |
|OFF | OSMV |
| OFF| ISMV |

#Requirements: DAS panel should configured and phone location service should be OFF
@DASSensorEnrollmentwithLocationServiceONandOFF
Scenario Outline: As a user I should be able to verify location service turn ON and OFF while doing sensor enrolment 
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers <Sensors>
And  user selects "SETUP button" from "Set Up Accessories" screen
When user navigates to "Name Sensor" screen from the "Set Up Accessories" screen
And user selects <Sensor Location> from "Name Sensor" screen
When user "Turn OFF location service" on phone and "Turn ON location service " on the phone
Then user should receive "Timeout" pop up
Examples:
|Mode| Sensors |
|Home| Access Sensor|
|Home |  Motion Viewer|
|Home | OSMV |
| Home | ISMV |
|OFF| Access Sensor |
|OFF| Motion Viewer |
|OFF | OSMV |
| OFF| ISMV |


 
#Requirement: DAS Panel should be configured and ISMV,OSMV, Motion Viewer, KeyFob sensors should be in broad cast mode
@DASSensorOrderinSetupAccessoriesScreen
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
Then user should display with following "Sensors" order with "SETUP option :
|Sensors|
|AccessSensors|
|Motion Viewers|
|ISMV|
|OSMV|
|KeyFob|
 
Examples:
|Mode|
|Home|
|OFF|