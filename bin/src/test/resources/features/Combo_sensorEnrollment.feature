@ComboSensor
Feature:  As a user,i should be able to Enroll an Combo Sensor To my Katana Panel



@ComboSensorEnrollment @UIAutomated @--xrayid:ATER-97715
Scenario Outline: 01 As a user I should be able to successfully enroll Combo Sensor with Default sensor name
Given user is set to <Mode> mode through CHIL
And Delete "Combo" Sensor from Device
And reset relay as precondition
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security Sensor Accessories" screen from the "Add New Device Dashboard" screen
And user <Sensor Type> access sensor "Triger"
And  user selects "COMBO SETUP" from "Set Up Accessories" screen
When user selects "Get Started" from "Detector Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user selects <Custom name> from "NAME DETECTOR" screen
Then user should be displayed with the "CO Mounting Option" screen
Then user selects <Mount Sensor Name> from "PLACE DETECTOR" screen
Then user should be displayed with the "Place Base Plate" screen
And user navigates to "Place Sensor Body" screen from the "Place Base Plate" screen
And user navigates to "Test Detector" screen from the "Place Sensor Body" screen
Then user should be displayed with the "Test Detector" screen
When user Combo sensor "Smoke not detected"
Then user should see the "Smoke sensor" status as "Waiting For Smoke Signal" on the "Test Detector Sensor"
And user <Sensor Type> access sensor "Smoke Test"
When user Combo sensor "Smoke detected"
Then user should see the "Smoke sensor" status as "Smoke Signal Confirmed" on the "Test Detector Sensor"
When user Combo sensor "CO not detected"
Then user should see the "CO sensor" status as "Waiting For CO Signal" on the "Test Detector Sensor"
And user <Sensor Type> access sensor "Co Test"
When user Combo sensor "CO detected"
Then user should see the "CO sensor" status as "CO Signal Confirmed" on the "Test Detector Sensor"
When user selects "Done" from "Test Sensor" screen
Then user should see the "Combo sensor" status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
And user is set to "SENSOR ENROLLMENT DISABLED" mode through CHIL

Examples:
|Mode |Custom name| Mount Sensor Name | Place Sensor |Sensor Type|
|Home | Dining Room |  On the Ceiling | Mount in a Corner |Combo|


@ComboSensorSmokeAlarms  @UIAutomated  @--xrayid:ATER-97914
Scenario Outline: 02 As a user I should receive smoke alarm when smoke detect in any security mode
Given user sets the entry/exit timer to "30" seconds
And user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
#And user clears all push notifications
And user navigates to "Security Solution card" screen from the "Dashboard" screen
When user <Sensor Type> access sensor "Smoke Test"
Then user should be displayed with the "Silence Alarm" screen
And user selects "Silence alarm" from "alarm" screen
Then user status should be set to "Home"
Examples: 
     | Mode | Sensor Type |
     | Away | Combo |
     #| Night| Combo |
     #| Home | Combo |
     #| OFF  | Combo |

     
@ComboSensorCOAlarms  @UIAutomated  @--xrayid:ATER-97915
Scenario Outline: 03 As a user I should receive CO alarm when CO detect in any security mode
Given user sets the entry/exit timer to "30" seconds
And user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
#And user clears all push notifications
And user navigates to "Security Solution card" screen from the "Dashboard" screen
When user <Sensor Type> access sensor "CO Test"
Then user should be displayed with the "Silence Alarm" screen
And user selects "Silence alarm" from "alarm" screen
Then user status should be set to "Home"
 Examples: 
     | Mode | Sensor Type |
     | Away | Combo |
      #| Night| Combo |
     #| Home | Combo |
     #| OFF  | Combo |