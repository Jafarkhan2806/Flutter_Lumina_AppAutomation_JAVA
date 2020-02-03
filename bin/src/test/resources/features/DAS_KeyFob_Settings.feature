@KeyfobSettings
Feature: Test the enrollment and settings of keyfob

@DAS_KeyFobSettingPreCondition
Scenario: 1- As a user I should be able to successfully enroll KeyFob and Assistance video 
Given user launches and logs in to the Lyric application
And user is set to "Home" mode through CHIL
When user navigates to "KEYFOB list Settings" screen from the "Dashboard" screen
Then user selects "Add button" from "Keyfob List Settings" screen
When user press "enrollment" key from keyfob
And user selects "Keyfob SETUP button" from "Set Up Accessories" screen
Then user should be displayed with the "Keyfob Overview" Screen 
When user selects "WATCH THE HOW TO VIDEO" from "Keyfob Overview" screen
Then user should be displayed with the "Video clip" screen
When user navigates to "Keyfob Overview" screen from the "Video clip" screen
When user selects "Get Started" from "Keyfob Overview" screen
Then user should be displayed with the "NAME KEYFOB" screen
Then user edits the "Keyfob Sensor" name to "Keyfob"
When user selects "Done" from "Configuration Success" screen
Then user should see the "Keyfob" status as "Assigned" on the "Set Up Accessories"
When user selects "Done" from "Set Up Accessories" screen
Then user should be displayed with "keyfob" device on the "Keyfob list" screen

#Requirement :One DAS Panel and one KeyFob should be configured
@DASKeyFobStatusVerification 
  Scenario: 2- As a user I want to view that all KeyFob settings 
    Given user launches and logs in to the Lyric application 
     When user navigates to "Keyfob Settings" screen from the "Dashboard" screen
     Then user should be displayed with the following "Keyfob Settings" options: 
      | Settings                   |
      | Name                       | 
      | Model and Firmware Details |
      | DELETE                     |

#Requirement :One DAS Panel and one KeyFob should be configured
@DASKeyFobRenameVerification 
Scenario Outline: 3 -AS a user I want to rename my KeyFob sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
 When user navigates to "Keyfob Settings" screen from the "Dashboard" screen
Then user edits the "keyfob" name to "new name"
Then user should be displayed with "KeyFob" device on the "Keyfob list" screen
And user reverts back the "KeyFob name" through CHIL
Examples:
|Mode|
|Home|
|OFF|

#Requirement :One DAS Panel and one KeyFob should be configured
@DASDeleteKeyFobVerification
Scenario Outline: 7- As a user I should be able to delete KeyFob configured to my DAS panel from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL 
When user navigates to "Keyfob Settings" screen from the "Dashboard" screen 
When user selects "delete sensor" from "Keyfob Settings" screen
Then user should receive a "Delete keyfob Confirmation" popup
And user "dismisses" the "Delete keyfob Confirmation" popup
When user selects "delete sensor" from "Keyfob Settings" screen
Then user should receive a "Delete Keyfob Confirmation" popup
And user "accepts" the "Delete Keyfob Confirmation" popup
Then user should not be displayed with "Keyfob" device on the "Keyfob list" screen
Examples:
|Mode|
|Home|
|OFF|




#Requirement :One DAS Panel and two KeyFob should be configured
@DASKeyFobDuplicatenameVerification
Scenario Outline:AS a user I want to verify duplicate name my KeyFob sensor through the application
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
When user navigates to "Keyfob list" screen from the "Dashboard" screen
Then user edits the "keyfob" name to "configured door"
Then user should receive a "Sensor Name Already Assigned, Pleases Pleases give different name" popup 
Then user should be displayed with "second keyfob" device on the "keyfob settings" screen
#And user reverts back the "KeyFob" Sensor name through CHIL
Examples:
|Mode|
|Home|
|OFF|

#Requirement :One DAS Panel and one KeyFob should be configured
@DASKeyFobRenamePopUpVerification
Scenario Outline: 4- AS a user I want to rename my KeyFob sensor through the application when in night, away, offline mode
Given user launches and logs in to the Lyric application 
And user is set to <Mode> mode through CHIL
Then user navigates to "Keyfob settings" screen from the "Dashboard" screen
#Then user should display the "you can perform this action only in Home or Off mode" popup
Then the following "keyfob settings" options should be disabled:
|Options|
|Name field| 
Examples:
|Mode|
|Night|
|Away|
#|Offline|


#Requirement :One DAS Panel and one KeyFob should be configured
@DASKeyFobModelAndFirmwareDetailsVerification 
Scenario Outline: 5 - Verify Model details and Firmware details in KeyFob
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL
 When user navigates to "Keyfob Settings" screen from the "Dashboard" screen
When user navigates to "Model and Firmware Details" screen from the "Keyfob Settings" screen
Then user should be displayed with the "Model and Firmware Details" screen
Examples:
|Mode|
|Home|
#|Away|
#|Night|
#|OFF|
#|OFFLINE|



#Requirement:One DAS Panel and one KeyFob should be configured
@DASDeleteKeyFobPopupVerificationNightAwayOffline 
Scenario Outline: 6- As a user I should be able to delete KeyFob configured to my DAS panel from my account through the Lyric application 
Given user launches and logs in to the Lyric application
And user is set to <Mode> mode through CHIL 
When user navigates to "Keyfob settings" screen from the "Dashboard" screen 
#Then user should be displayed the "you can perform this action only in Home or Off mode" pop up 
Then the following "keyfob settings" options should be disabled:
|Options|
|Delete|
Examples:
|Mode|
|Night|
#|Away|



