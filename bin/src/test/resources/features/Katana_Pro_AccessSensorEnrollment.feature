@KatanaAccessSensorEnrollment
Feature: Verify Sensor Enrolment Functionally

@KATANA_PRO_DoorAccessSensorEnrollment  @UIAutomated @--xrayid:ATER-97982
Scenario Outline: 04 As a user I should be able to successfully enrol RF6 Access Sensor with custom sensor name and video should play for assistance in sensor enrolment
Given reset relay as precondition
And user is set to <Mode> mode through CHIL
And Delete <Sensor Location Area> Sensor from Device
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security Sensor Accessories" screen from the "Add New Device Dashboard" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "RFSIX DOOR ACCESS SENSOR SETUP BUTTON" from "Set Up Accessories" screen
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
Then user edits the "door" name to <Sensor Location Area>
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user selects "Wont Fit As shown" from "Place Sensor on location" screen
Then user should be displayed with the "Access sensor Install help" screen
When user navigates to "Place Sensor on location" screen from the "Access sensor Install help" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
Then user <Sensor Location> access sensor "opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
Then user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
#And user should not display with "cancel" button and "Back" button
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
And user is set to "SENSOR ENROLLMENT DISABLED" mode through CHIL
Examples:
|Mode|Sensor Location| Sensor Location Area | Access Status | Access Status Update |Access Sensor Settings|
|Home | RF Door Sensor | Hall Room | open | Closed |Door Access Settings|
#|OFF | RF Door Sensor | Hall Room | open | Closed |Door Access Settings|

@KATANA_PRO_WindowAccessSensorEnrollment  @UIAutomated @--xrayid:ATER-98142
Scenario Outline: 05 As a user I should be able to successfully enrol RF6 MiniCT Access Sensor with custom sensor name and video should play for assistance in sensor enrolment
Given reset relay as precondition
And Delete <Sensor Location Area> Sensor from Device
And user is set to <Mode> mode through CHIL
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security Sensor Accessories" screen from the "Add New Device Dashboard" screen
When user <Sensor Location> access sensor "enrolled"
And  user selects "RFSIX WINDOW ACCESS SENSOR SETUP BUTTON" from "Set Up Accessories" screen
Then user should be displayed with the "Sensor Overview" Screen
When user selects "Watch The How To video" from "Sensor Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Sensor Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Sensor Overview" screen
Then user should be displayed with the "Locate Sensor" screen
When user navigates to "Name Sensor" screen from the "Locate Sensor" screen
Then user should be displayed with the "Name Sensor" screen
And user selects "Window" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects "Create Custom Name" from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
Then user edits the "window" name to <Sensor Location Area>
Then user should be displayed with the "Place Sensor" screen
And user navigates to "Place Sensor on location" screen from the "Place Sensor" screen
When user selects "Wont Fit As shown" from "Place Sensor on location" screen
Then user should be displayed with the "Access sensor Install help" screen
When user navigates to "Place Sensor on location" screen from the "Access sensor Install help" screen
And user navigates to "Test Sensor" screen from the "Place Sensor on location" screen
Then user <Sensor Location> access sensor "opened"
Then user should see the <Sensor Location> status as <Access Status> on the "Test Access Sensor"
Then user <Sensor Location> access sensor "closed"
Then user should see the <Sensor Location> status as <Access Status Update> on the "Test Access Sensor"
When user selects "Done" from "Test Sensor" screen
#And user should not display with "cancel" button and "Back" button
Then user should see the <Sensor Location> status as "configured" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
And user is set to "SENSOR ENROLLMENT DISABLED" mode through CHIL
Examples:
|Mode|Sensor Location| Sensor Location Area | Access Status | Access Status Update |Access Sensor Settings|
|Home | RF Window Sensor | Kitchen Room | open | Closed |Window Access Settings|
#|Off | RF Window Sensor |Kitchen Room | open| Closed |Window Access Settings|