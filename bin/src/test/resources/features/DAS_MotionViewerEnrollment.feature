@MotionViewerEnrollment
Feature: Verify Motion Viewer Enrolment Functionally

@DASMotionViewer_EnrollmentWithDefaultSensorNameWatchHow-ToVideo
Scenario Outline: As a user I should be able to successfully enroll Access Sensor with default sensor name and video should play for assistance in sensor enrollment
 
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
When user navigates to "Sensor List Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Sensor List Settings" screen
#When user triggers <Sensor Location> sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects <Sensor Location> from "Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Sensor Location Area> from "Mount Sensor" screen
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Test Sensor" screen from the "Place Sensor" screen
#When Motion Sensor detects motion
Then user should see the <Sensor Location> status as "Motion Detected" on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should see the <Sensor Location> status as "Good" on the "Sensor List"
When user navigates to "Security Solution card" screen from the "Sensor List" screen
When user navigates to "Sensor Status" screen from the "Security Solution Card" screen
Then user should see the <Sensor Location> status as "Good" on the "Sensor Status"
When user navigates to "Motion Sensor Settings" screen from the "Security Solution card" screen
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
When user selects "delete sensor" from "Motion Sensor Settings" screen
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with <Sensor Location> device on the "sensor list" screen
 
Examples:
|Mode|Sensor Location| Sensor Location Area|
#|Home | Front Hall |In a Wall Corner |
#|Home | Back Hall |Flat On a Wall|
|Home | Living Room | In a Wall Corner|
#|Home | Front Hall | Flat On a Wall |
#|Home | Back Hall |In a Wall Corner |
#|Home | Living Room | Flat On a Wall |
#|Off | Front Hall |In a Wall Corner |
#|Off | Back Hall |Flat On a Wall|
#|Off | Living Room | In a Wall Corner|
#|Off | Front Hall | Flat On a Wall |
#|Off | Back Hall |In a Wall Corner |
#|Off | Living Room | Flat On a Wall |


@DASMotionViewerEnrollmentWithCustomName
Scenario Outline: As a user I should be able to successfully enrol Motion Viewer with custom sensor name
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "MOTION" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user navigates to "Custom Name Sensor" screen from the "Name Sensor" screen
And user inputs <Custom name> in the "Custom Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Test Sensor" screen from the <Place Sensor> screen
Then user <Sensor Name> <Motion Status>
And user <Sensor Name> <Motion Status Update>
Then user navigates to "Set Up Accessories Configured" screen from the "Test Sensor" screen
When user navigates to "Dashboard" screen from the "Set Up Accessories Configured" screen
Then user should be displayed with "Security" device on the "dashboard" screen
When user navigates to "Sensor Settings" screen from the "Dashboard" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "sensors" on the "sensors" screen

Examples:
|Mode |Custom name| Mount Sensor Name | Place Sensor | Motion Status | Motion Status Update |
|Home | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|Home | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |

#REquirments: DAS panel configured and one sensor should be enrolled
@DASMotionViewerEnrollmentWithCustomNameDuplicatePopUPVerification
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
|OFF|


@DASMotionViewerEnrollmentByCancellingAndRetryingAgainWithCustomSensorName
Scenario Outline: As a user I should be able to successfully enrol Motion Viewer with custom sensor name after cancelling the enrollment and retrying again
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "MOTION" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user navigates to "Custom Name Sensor" screen from the "Name Sensor" screen
And user inputs <Custom name> in the "Custom Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
And user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Set Up Accessories" screen
When user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Locate Sensor" Screen
Then user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user navigates to "Custom Name Sensor" screen from the "Name Sensor" screen
And user inputs <Custom name> in the "Custom Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Test Sensor" screen from the <Place Sensor> screen
Then user <Sensor Name> <Motion Status>
And user <Sensor Name> <Motion Status Update>
Then user navigates to "Set Up Accessories Configured" screen from the "Test Sensor" screen
When user navigates to "Dashboard" screen from the "Set Up Accessories Configured" screen
Then user should be displayed with "Security" device on the "dashboard" screen
When user navigates to "Sensor Settings" screen from the "Dashboard" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "sensors" on the "sensors" screen

Examples:
|Mode |Custom name| Mount Sensor Name | Place Sensor | Motion Status | Motion Status Update |
|Home | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|Home | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Honeywell |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Honeywell | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |


@DASMotionVeiwerEnrollmentWithSensorNotWorkingAndIsWithInRange
Scenario Outline: As a user I should be able to successfully enrol Motion Viewer when sensor is not working but is within range
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "MOTION" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
Then user navigates to "Locate Sensor" screen from the "Sensor Overview" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
And user selects <Sensor Name> from "Name Sensor" screen
Then user should be displayed with the "Mount Sensor" screen
When user selects <Mount Sensor Name> from "Mount Sensor" screen
Then user should be displayed with the <Place Sensor> screen
And user navigates to "Test Sensor" screen from <Place Sensor> screen
When user selects "Sensor Not Working?" from "Test Sensor" screen
Then user should be displayed with the "Motion Sensor Help" screen
And user should be displayed with "Get Additional Help" link
When user select the "Get Additional Help" link
Then user should navigates to "Honeywell help web portal" on goole chrome
And user navigates to "Access Sensor Help" screen from "Honeywell Help web portal" screen
When user selects "Test Signal Strength" from "Motion Sensor Help" screen
Then user should be displayed with "Signal Strength" screen
Then user should be displayed with <Signal strength> status
And user navigates to "Test Sensor" screen from "Test Signal Strength" screen
Then user <Sensor Name> <Motion Status>
Then user <Sensor Name> <Motion Status Update>
Then user navigates to "Set Up Accessories Configured" screen from the "Test Sensor" screen
When user navigates to "Dashboard" screen from the "Set Up Accessories Configured" screen
Then user should be displayed with "Security" device on the "dashboard" screen
When user navigates to "Sensor Settings" screen from the "Dashboard" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "sensors" on the "sensors" screen

Examples:
|Mode |Sensor Name| Mount Sensor Name | Place Sensor | Signal strength |Motion Status | Motion Status Update |
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | High |NO MOTION DETECTED |MOTION DETECTED |
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | Medium |NO MOTION DETECTED |MOTION DETECTED |
|Home | Front Hall |  In a Wall Corner | Mount in a Corner | Low | NO MOTION DETECTED |MOTION DETECTED |

#incaserequired

|Home | Front Hall  | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|Home | Back Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|Home | Back Hall |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|Home | Living Room |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|Home | Living Room  |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Front Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Back Hall |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Back Hall |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |
|OFF | Living Room |  In a Wall Corner | Mount in a Corner | NO MOTION DETECTED |MOTION DETECTED |
|OFF | Living Room  |   Flat on a Wall     | Mount on the Wall |NO MOTION DETECTED |MOTION DETECTED |


@DASMotionViewerEnrollmentWithSensorNotWorkingAndIsOutOfRange
Scenario Outline: As a user I should be able to verify Motion Viewer not working functionality when sensor is out of range
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
|Home | Front Hall  | Flat on a Wall     | Mount on the Wall |
|Home | Back Hall |  In a Wall Corner | Mount in a Corner | 
|Home | Back Hall |   Flat on a Wall     | Mount on the Wall |
|Home | Living Room |  In a Wall Corner | Mount in a Corner | 
|Home | Living Room  |   Flat on a Wall     | Mount on the Wall |
|OFF | Front Hall |  In a Wall Corner | Mount in a Corner | 
|OFF | Front Hall  | Flat on a Wall     | Mount on the Wall |
|OFF | Back Hall |  In a Wall Corner | Mount in a Corner | 
|OFF | Back Hall |   Flat on a Wall     | Mount on the Wall |
|OFF | Living Room |  In a Wall Corner | Mount in a Corner | 
|OFF | Living Room  |   Flat on a Wall     | Mount on the Wall |


@DASMotionViewerEnrollmentVerifyCancelFunctionality
Scenario Outline: Verify cancel functionality in all screens while enrolling a Motion Viewer
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to the <PreScreen> screen 
And user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the <PreScreen> screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Set Up Accessories" screen without displaying any sensor
		
Examples:
|Mode |PreScreen |
|Home| Locate Sensor |
|Home| Name Sensor Default name|
|Home| Name Sensor Custom name|
|Home| Mount Sensor|
|Home|Place Sensor| # through "In a Wall Corner"
|Home| Place Sensor| # through "Flat on the wall"
|Home|Test Sensor| # Before verification
|OFF| Locate Sensor |
|OFF| Name Sensor Default name|
|OFF| Name Sensor Custom name|
|OFF| Mount Sensor|
|OFF|Place Sensor| # through "In a Wall Corner"
|OFF| Place Sensor| # through "Flat on the wall"
|OFF|Test Sensor| # Before verification

@DASOSMVEnrollmentVerifyCancelFunctionalityAfterTestSensor
Scenario Outline: Verify cancel functionality in all screens while enrolling a Access Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to the <PreScreen> screen 
And user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
And user displayed the <Access status>
Then user received the <Access Status update>
Then user should displayed with disappear "Cancel Setup" pop up
And user should displayed with "Done" button
		
Examples:
|Mode||PreScreen |
|Home|Test Motion Viewer|
| OFF |Test Motion Viewer|


@DASMotionViewerEnrollmentVerifyBackArrowFunctionality
Scenario Outline : Verify Back arrow functionality in all screens while enrolling a Motion Sensor
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to the <PreScreen> screen
And user selects "Back arrow" from <PreScreen> screen
Then user should be displayed with the <PostScreen> screen

Examples:
|Mode |PreScreen				 |PostScreen |
|Home|Locate Sensor 				| Set up Accessories |
|Home|Name sensor Default Name 	| Locate Sensor|
|Home|Name sensor Custom name 	| Name sensor Default Name |
|Home| Mount Sensor				| Name Sensor Default Name |
|Home| Mount Sensor				| Name Sensor Custom Name |
|Home|Place Sensor				| Mount Sensor 	|
|Home|Test Sensor				| Place Sensor |# Before verification
|Home|Motion Sensor Help			| Test Sensor |
|Home|Signal Strength			| Motion Sensor Help |
|OFF|Locate Sensor 				| Set up Accessories |
|OFF|Name sensor Default Name 	| Locate Sensor|
|OFF|Name sensor Custom name 	| Name sensor Default Name |
|OFF| Mount Sensor				| Name Sensor Default Name |
|OFF| Mount Sensor				| Name Sensor Custom Name |
|OFF|Place Sensor				| Mount Sensor 	|
|OFF|Test Sensor				| Place Sensor |# Before verification
|OFF|Motion Sensor Help			| Test Sensor |
|OFF|Signal Strength			| Motion Sensor Help |

@DASMotionViewerEnrollmentVerifyBackArrowFunctionalityAfterVerificationTestSensor
Scenario Outline : Verify Back arrow functionality in Test Sensor screen after verification
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to the <PreScreen> screen
And user selects "Back arrow" from <PreScreen> screen
Then user should be displayed with <PreScreen> screen
And user should be disabled "Back arrow" button
Examples:
|Mode |PreScreen				
|Home|Test Sensor|				
|OFF|Test Sensor|				




@DASMotionViewerEnrollmentflowpushnotificationVerification
Scenario Outline : verify push notification while Access Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
And user enrolled the "ISMV" , "OSMV", "MV" , "AccessSensor"
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "Motion Viewer" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
When user "Triggered" the "Access Sensor"
Then user should not receive "Alerts" and "Push Notifications"

@DASMotionViewerEnrollmentflowpushnotificationVerification
Scenario Outline : verify push notification while Access Sensor Enrolment
Given user launches and logs in to the Lyric application
And user is set to <Mode> through CHIL
When user navigates to "Sensors" screen from the "Dashboard" screen
Then user navigates to "Set Up Accessories" screen from the "Sensors" screen
When user triggers "Motion Viewer" sensor
And  user selects "SETUP button" from "Set Up Accessories" screen
When user "Triggered" the "Access Sensor"
Then user should receive "Time out" pop up
When user "accepts" the "Time out" pop up
Then user should navigate to "Setup Accessories" screen