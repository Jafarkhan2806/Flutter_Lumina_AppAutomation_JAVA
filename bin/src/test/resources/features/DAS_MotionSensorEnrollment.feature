@MotionSensorEnrollment
Feature: Verify Motion Sensor Enrolment Functionally

@DASMotionSensorEnrollmentWithDefaultSensorName_Old
Scenario Outline: As a user I should be able to successfully enrol Motion Sensor with default name
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Name> from "Name Motion Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user motion sensor "motion not detected"
Then user should see the "Motion sensor" status as <Motion Status> on the "Test Motion Sensor"
When user motion sensor "motion detected"
Then user should see the "Motion sensor" status as <Motion Status Update> on the "Test Motion Sensor"
And user "should not be displayed" with the "Test sensor screen cancel" option 
And user "should not be displayed" with the "Test sensor screen back" option 
When user selects "Done" from "Test Sensor" screen
Then user should see the "Motion sensor" status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor Status"
When user navigates to "Dashboard" screen from the "Security Solution Card" screen 
When user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen 
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "Motion sensor" device on the "sensor list" screen

Examples:
|Mode |Sensor Name| Mount Sensor Name | Place Sensor | Motion Status | Motion Status Update |
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |

#incaserequired 
#|Home | Front Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|Home | Front Hall  | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Back Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|Home | Back Hall |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Living Room |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|Home | Living Room  |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Front Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Back Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Back Hall |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Living Room |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Living Room  |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |


@DASMotionSensorEnrollmentWithCustomName_Old
Scenario Outline: As a user I should be able to successfully enroll Motion Sensor with custom sensor name
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user names the "MOTION" to <Custom name>
Then user should be displayed with the "Mount Sensor" screen
Then user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user motion sensor "motion not detected"
Then user should see the "Motion sensor" status as <Motion Status> on the "Test Motion Sensor"
When user motion sensor "motion detected"
Then user should see the "Motion sensor" status as <Motion Status Update> on the "Test Motion Sensor"
And user "should not be displayed" with the "Test sensor screen cancel" option 
And user "should not be displayed" with the "Test sensor screen back" option 
When user selects "Done" from "Test Sensor" screen
Then user should see the "Motion sensor" status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor Status"
When user navigates to "Dashboard" screen from the "Security Solution Card" screen 
When user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen 
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "Motion sensor" device on the "sensor list" screen

Examples:
|Mode |Custom name| Mount Sensor Name | Place Sensor | Motion Status | Motion Status Update |
|Home | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |

#incaserequired
#|Home | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |


#Requirments: DAS panel configured and one sensor should be enrolled
@DASMotionSensorEnrollmentWithCustomNameDuplicatePopUPVerification
Scenario Outline: As a user I should be able Verify duplicate name pop up
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
And user should be enrolled one sensor with the name "Sensor1"
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "MOTION" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user navigates to "Custom Name Sensor" screen from the "Name Sensor" screen
And user inputs "Sensor1" in the "Custom Name Sensor" screen
When user selects "Done" option on "Keypad"
Then user should display with "Sensor Name Already Assigned, Pleases Pleases give different name" pop up 
Examples:
|Mode |
|Home|
#Incaserequired
|OFF|


@DASMotionSensorEnrollmentByCancellingAndRetryingAgainWithCustomSensorName
Scenario Outline: As a user I should be able to successfully enrol Motion Sensor with custom sensor name after cancelling the enrollment and retrying again
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user names the "MOTION" to <Custom name>
Then user should be displayed with the "Mount Sensor" screen
Then user selects <Mount Sensor Name> from "Mount Sensor" screen
#And user selects "cancel" from <Place Sensor> screen
And user selects "cancel" from "Place Sensor" screen
Then user should receive a "Cancel Sensor Setup" popup
When user "accepts" the "Cancel Sensor Setup" popup
Then user should be displayed with the "Set Up Accessories" screen
And  user selects "MOTION SENSOR SETUP BUTTON" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user names the "MOTION" to <Custom name>
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Test Sensor" screen from the <Place Sensor> screen
When user motion sensor "motion not detected"
Then user should see the "Motion sensor" status as <Motion Status> on the "Test Motion Sensor"
When user motion sensor "motion detected"
Then user should see the "Motion sensor" status as <Motion Status Update> on the "Test Motion Sensor"
And user "should not be displayed" with the "Test sensor screen cancel" option 
And user "should not be displayed" with the "Test sensor screen back" option 
When user selects "Done" from "Test Sensor" screen
Then user should see the "Motion sensor" status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the "Motion sensor" status as "Standby" on the "Sensor Status"
When user navigates to "Dashboard" screen from the "Security Solution Card" screen 
When user navigates to "Motion Sensor Settings" screen from the "Dashboard" screen 
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "Motion sensor" device on the "sensor list" screen

Examples:
|Mode |Custom name| Mount Sensor Name | Place Sensor | Motion Status | Motion Status Update |
|Home | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |

#Incaserequired
#|Home | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |


@DASMotionSensorEnrollmentWithSensorNotWorkingAndIsWithInRange
Scenario Outline: As a user I should be able to successfully enroll Motion Sensor when sensor is not working but is within range
Given user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
When user motion sensor "enrolled"
And  user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Name> from "Name Motion Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Test Sensor" screen from the <Place Sensor> screen
When user selects "Sensor Not Working" from "Test Motion Sensor" screen
Then user should be displayed with the "Motion Sensor Help" screen
#When user selects "Get Additional Help" from "Motion Sensor Help" screen   # can be run for Android
#Then user should be displayed with the "Honeywell help web portal" 
#And user navigates to "Motion Sensor Help" screen from "Honeywell Help web portal" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should see the <Sensor Name> status as <Signal strength> on the "Signal Strength"
And user navigates to "Test Motion Sensor" screen from the "Test Signal Strength" screen
When user motion sensor "motion not detected"
Then user should see the "Motion sensor" status as <Motion Status> on the "Test Motion Sensor"
When user motion sensor "motion detected"
Then user should see the "Motion sensor" status as <Motion Status Update> on the "Test Motion Sensor"
When user selects "Done" from "Test Sensor" screen
Then user should see the "MOTION SENSOR" status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
When user navigates to "MOTION sensor SETTINGS" screen from the "Sensor List" screen
And user selects "delete sensor" from "Motion Sensor settings"
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user selects "delete sensor" from "Motion Sensor settings"
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "motion sensor" device on the "sensors list" screen

Examples:
|Mode |Sensor Name| Mount Sensor Name | Place Sensor | Signal strength |Motion Status | Motion Status Update |
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Front Hall |  In a Wall Corner | Mount in a Corner | Medium |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Front Hall |  In a Wall Corner | Mount in a Corner | Low | NO MOTION DETECTED |MOTION DETECTED |

#incaserequired

#|Home | Front Hall  | Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Back Hall |  In a Wall Corner | Mount in a Corner |  High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Back Hall |   Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Living Room |  In a Wall Corner | Mount in a Corner |  High |NO MOTION DETECTED |MOTION DETECTED |
#|Home | Living Room  |   Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Front Hall |  In a Wall Corner | Mount in a Corner |  High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Back Hall |  In a Wall Corner | Mount in a Corner | High | NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Back Hall |   Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Living Room |  In a Wall Corner | Mount in a Corner |  High |NO MOTION DETECTED |MOTION DETECTED |
#|OFF | Living Room  |   Flat on a Wall     | Mount on the Wall | High |NO MOTION DETECTED |MOTION DETECTED |


@DASMotionSensorEnrollmentWithSensorNotWorkingAndIsOutOfRange
Scenario Outline: As a user I should be able to verify Motion Sensor not working functionality when sensor is out of range
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "MOTION" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
And user selects <Sensor Name> from "Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with <Place Sensor> screen
And user navigates to "Test Sensor" screen from the <Place Sensor> screen
When user selects "Sensor Not Working?" from "Test Sensor" screen
Then user should be displayed with the "Motion Sensor Help" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with the "Signal Strength" screen
Then user should receive a "Out Of Range" popup
And user "taps on RETRY in" the "Out Of Range" popup
Then user should receive a "Out Of Range" pop up
And user "taps on OK in" the "Out Of Range" popup
Then user should be displayed with the "Motion Sensor Help" screen
And user navigates to "Test Sensor" screen from the "Test Signal Strength" screen
		
Examples:
|Mode |Sensor Name| Mount Sensor Name | Place Sensor | 
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | 
|OFF | Back Hall |   Flat on a Wall     | Mount on the Wall |
#incaserequried 
|Home | Front Hall  | Flat on a Wall     | Mount on the Wall |
|Home | Back Hall |  In a Wall Corner | Mount in a Corner | 
|Home | Back Hall |   Flat on a Wall     | Mount on the Wall |
|Home | Living Room |  In a Wall Corner | Mount in a Corner | 
|Home | Living Room  |   Flat on a Wall     | Mount on the Wall |
|OFF | Front Hall |  In a Wall Corner | Mount in a Corner | 
|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall |
|OFF | Back Hall |  In a Wall Corner | Mount in a Corner | 
|OFF | Living Room |  In a Wall Corner | Mount in a Corner | 
|OFF | Living Room  |   Flat on a Wall     | Mount on the Wall |


@DASMotionSensorEnrollmentVerifyCancelFunctionality
Scenario Outline: Verify cancel functionality in all screens while enrolling a Motion Sensor
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
|Mode |PreScreen |
|Home| Locate Motion Sensor |
|Home| Name Motion Sensor Default name|
|Home| Name Motion Sensor Custom name|
|Home| Mount Sensor|
|Home|Mount in a Corner| 
|Home| Mount on the wall|
# Before verification
|Home|Test Motion Sensor|
#Incaserequired
#|OFF| Locate Sensor |
#|OFF| Name Sensor Default name|
#|OFF| Name Sensor Custom name|
#|OFF| Mount Sensor|
#|OFF|Place Sensor| # through "In a Wall Corner"
#|OFF| Place Sensor| # through "Flat on the wall"
#|OFF|Test Sensor| # Before verification

@DASMotionSensorEnrollmentVerifyCancelFunctionalityAfterTestSensor
Scenario Outline: Verify cancel functionality in all screens while enrolling a Access Sensor
Given user launches and logs in to the Lyric application
#And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
#When user triggers <Sensor Location> sensor
And user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user selects "Living Room" from "Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen   
When user selects "In a wall Corner" from "Mount Sensor" screen
Then user should be displayed with the "Mount in a Corner" screen
And user navigates to "Test Sensor" screen from the "MOUNT In a Corner" screen
And user selects "cancel" from "Test Sensor" screen
Then user should receive a "Cancel Sensor Setup" popup
#When Motion Sensor detects motion
Then user "should not be displayed" with the "Cancel Sensor Setup popup" option
Then user should see the "motion sensor" status as "MOTION DETECTED" on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
When user selects "Done" from "Set Up Accessories" screen
When user navigates to "MOTION Access Settings" screen from the "Sensor list" screen
When user selects "delete sensor" from "Motion Sensor settings" screen
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "motion sensor" device on the "sensor list" screen
 
Examples:
|Mode|Access status | Access Status Update |
|Home|Open | Closed |
 
 
#In case required
#| OFF |Test Sensor | Opened | Closed |


@DASMotionSensorEnrollmentVerifyBackArrowFunctionality
Scenario Outline: Verify Back arrow functionality in all screens while enrolling a Motion Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "SENSOR LIST SETTINGS" screen from the "Dashboard" screen
When user navigates to <PreScreen> screen from the "Sensor List" screen
And user selects "Back" from <PreScreen> screen
Then user should be displayed with the <PostScreen> screen

Examples:
|Mode |PreScreen				 |PostScreen |
|Home|Locate Motion Sensor 				| Set up Accessories |
|Home|Name Motion sensor Default Name 	| Locate Motion Sensor|
|Home|Name Motion sensor Custom name 	| Name Motion sensor Default Name |
|Home| Mount Sensor				| Name Motion Sensor Default Name |
##|Home| Mount Sensor				| Name Motion Sensor Custom Name |
|Home|Mount in a Corner				| Mount Sensor 	|
# Before verification
|Home|Test Sensor				| Mount in a Corner |
|Home|Motion Sensor Help			| TEST MOTION SENSOR |
|Home|Motion Sensor Signal Strength			| Motion Sensor Help |
#incaserequired
#|OFF|Locate Sensor 				| Set up Accessories |
#|OFF|Name sensor Default Name 	| Locate Sensor|
#|OFF|Name sensor Custom name 	| Name sensor Default Name |
#|OFF| Mount Sensor				| Name Sensor Default Name |
#|OFF| Mount Sensor				| Name Sensor Custom Name |
#|OFF|Place Sensor				| Mount Sensor 	|
#|OFF|Test Sensor				| Place Sensor |# Before verification
#|OFF|Motion Sensor Help			| Test Sensor |
#|OFF|Signal Strength			| Motion Sensor Help |			


@DASMotionSensorEnrollmentflowpushnotificationVerification
Scenario: verify push notification while Access Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
And user enrolled the "MV"
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "Motion Sensor" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
When user "Triggered" the "Access Sensor"
Then user should not receive "Alerts" and "Push Notifications"

@DASMotionSensorEnrollmentflowtimeoutpopupVerification
Scenario: verify timeout while motion Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to "Home" mode through CHIL
When user navigates to "SENSOR LIST SETTINGS" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensor list" screen
When user motion sensor "enrolled"
And  user selects "MOTION SENSOR SETUP button" from "Set Up Accessories" screen
Then user should receive a "Sensor enrollment Time out" popup
When user "accepts" the "Time out" popup
Then user should be displayed with the "Set up Accessories" screen