@DASCameraSettings 
Feature: DAS Camera Settings 
As user I should be able to configure camera settings from the app

@DasCameraSettingsPartialDisabled @P4 @NotAutomatable@--xrayid:ATER-54408
  Scenario Outline: As a user I should be having limited access to configure camera settings when my camera is in offline or in upgrade state 
    Given user camera is in <State> 
      And user launches and logs in to the Lyric application
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
     Then the following "DAS Camera Settings" options should be disabled:
      | Options                 | 
      | Motion Detection        | 
      | Night Vision            | 
      | Video Quality           | 
      | Camera On in Home mode  | 
      | Camera On in Night mode | 
      And the following "Camera Settings" options should be enabled:
      | Options          | 
      | Manage Alerts    | 
      | People Detection | 
    Examples: 
      | State   | 
      | Offline | 
      | Upgrade | 
  
  @DAS_CameraSettingsCameraOff @P3 @Automated @--xrayid:ATER-54443
  Scenario: As a user I should be having limited access to configure camera settings when my camera is in off state 
    Given  user is set to "Home" mode through CHIL
     Then user launches and logs in to the Lyric application
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "OFF"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then the following "DAS Camera Settings" options should be disabled:
      | Options          | 
      | Motion Detection | 
      | Night Vision     | 
      | Video Quality    | 
      And the following "DAS Camera Settings" options should be enabled:
      | Options              | 
      | Manage Alerts        | 
#      | People detection     | 
      | Camera On in Home mode  | 
      | Camera On in Night mode | 
  
  @DAS_CameraSettingsCameraOn @P1 @Automated @--xrayid:ATER-54449
  Scenario: As a user I should be able to configure camera settings when my camera is in on state 
    Given  user is set to "Home" mode through CHIL
     Then user launches and logs in to the Lyric application
     Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then the following "DAS Camera Settings" options should be enabled:
      | Options                 | 
      | Manage alerts           | 
      | Motion Detection        | 
#      | People detection        | 
      | Night Vision            | 
      | Video Quality           | 
      | Camera On in Home Mode  | 
      | Camera On in Night Mode | 
  
  @CameraSettingsCameraOffPanelArmed @P3 @Automated @--xrayid:ATER-54452
  Scenario Outline: As a user I should be having limited access to configure camera settings when my camera is in off state 
    Given  user is set to <State> mode through CHIL
     Then user launches and logs in to the Lyric application
     Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "OFF"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then the following "DAS Camera Settings" options should be disabled:
      | Options          | 
      | Motion Detection | 
      | Night Vision     | 
      | Video Quality    | 
     # | Camera On in Home Mode  | 
     # | Camera On in Night Mode | 
      And the following "DAS Camera Settings" options should be enabled:
      | Options                 | 
      | Manage Alerts           | 
    | People detection        | 
    Examples: 
      | State | 
      | Away  | 
      | Night | 
  
  @CameraSettingsCameraOnPanelArmed @P3 @Automated@--xrayid:ATER-54455
  Scenario Outline: As a user I should be able to configure camera settings when my camera is in on state 
    Given  user is set to <State> mode through CHIL
     Then user launches and logs in to the Lyric application
     Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then the following "DAS Camera Settings" options should be enabled:
      | Options          | 
      | Motion Detection | 
      | Night Vision     | 
      | Video Quality    | 
      | Manage Alerts    | 
#      | People detection | 
      And the following "DAS Camera Settings" options should be disabled:
      |Options|
      | Camera On in Home Mode  | 
      | Camera On in Night Mode | 
    Examples: 
      | State | 
     #| Away  | 
     | Night | 
  
  @DAS_CameraSettingsCameraModeGeofenceAway @P2 @Automated@--xrayid:ATER-54462
  Scenario: As a user I should be able to set to geofencing mode so that my camera turns on when i am away and off when i am in home automatically without manual intervention 
    Given  user is set to "Home" mode through CHIL
    And user thermostat set "Home" with "userArrived"
     Then "location" geofencing is "enabled" on the user account through CHIL
      And user launches and logs in to the Lyric application
      And user thermostat set "Away" with "UserDeparted"
      And timer ends on user device
     When user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
     Then user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
      And the following "DAS Camera Settings" options should be enabled:
      | Options          | 
      | Motion Detection | 
      | Night Vision     | 
      | Video Quality    | 
      | Manage Alerts    | 
      | People detection | 
      And the following "DAS Camera Settings" options should be disabled:
      | Options              | 
      | Camera On Home mode  | 
      | Camera On Night mode | 
  
  @DAS_CameraSettingsCameraModeGeofenceHome @P2 @Automated @--xrayid:ATER-54466
  Scenario: As a user I should be able to set to geofencing mode so that my camera turns on when i am away and off when i am in home automatically without manual intervention 
    Given  user is set to "Home" mode through CHIL
     Then "location" geofencing is "enabled" on the user account through CHIL
      And user launches and logs in to the Lyric application
      And user thermostat set "Home" with "UserArrived"
     When user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
    And  user camera is set to "on"
     Then user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then the following "DAS Camera Settings" options should be enabled:
      | Options              | 
      | Manage Alerts        | 
      | People detection     | 
      | Camera On In Home mode  | 
      | Camera On In Night mode | 
      | Motion Detection | 
      | Night Vision     | 
      | Video Quality    | 
  
  @DAS_CameraSettingsManageAlertsDisabled @P2 @Automated @--xrayid:ATER-54470
  Scenario Outline: As a user I should be able to disable alert of camera status, sound event and motion event on my demand to get alerts in app or in email on alerts detection 
    Given  user is set to "Home" mode through CHIL
     Then user launches and logs in to the Lyric application
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to <State>
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then user navigates to "MANAGE ALERTS" screen from the "Camera Settings" screen
      And user changes the "Camera Face Detection alerts" to "OFF"
     When user navigates back and forth in "Manage Alerts" screen
     Then "Camera Face Detection alerts" value should be updated to "Off" on "Manage Alerts" screen 
     When user changes the "Motion Event Alerts" to "OFF"
     Then user "SHOULD NOT BE DISPLAYED" with the "MOTION EVENT EMAIL ALERTS EMAIL" option
     When user navigates back and forth in "Manage Alerts" screen
      And "Motion Event Alerts" value should be updated to "Off" on "Manage Alerts" screen   
      And user changes the "Camera Face Detection alerts" to "ON"
     When user navigates back and forth in "Manage Alerts" screen
     Then "Camera Face Detection alerts" value should be updated to "ON" on "Manage Alerts" screen 
     When user changes the "Motion Event Alerts" to "ON"
     Then user "SHOULD BE DISPLAYED" with the "MOTION EVENT EMAIL ALERTS EMAIL" option
     When user navigates back and forth in "Manage Alerts" screen
      And "Motion Event Alerts" value should be updated to "ON" on "Manage Alerts" screen    
  
    Examples: 
      | State | 
      | On    | 
#     | Off   | 
#  |Offline|
#  |Upgrade|
  
  @DAS_CameraEnableDisableMotionDetection @P2  @Automated @--xrayid:ATER-54477
  Scenario: As a user I should be able to enable or disable motion detection 
    Given  user is set to "Home" mode through CHIL	
     Then user launches and logs in to the Lyric application
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then user navigates to "MOTION DETECTION SETTINGS" screen from the "Camera Settings" screen
      And user changes the "Motion Detection" to "Off"
     Then "Motion Detection" value should be updated to "Off" on "Motion Detection Settings" screen
      And the following "Motion Detection" options should be disabled:
      | Options               | 
      | Motion Detection Zone | 
      | Motion Sensitivity    | 
     When user navigates to "Camera Settings" screen from the "Motion Detection Settings" screen
     Then "Motion Detection" value should be updated to "Off" on "Camera Settings" screen
     When user navigates to "Motion Detection Settings" screen from the "Camera Settings" screen
     Then the following "Motion Detection" options should be disabled:
      | Options               | 
      | Motion Detection Zone | 
      | Motion Sensitivity    | 
     When user navigates to "Camera Settings" screen from the "Motion Detection Settings" screen
     Then user navigates to "Motion Detection Settings" screen from the "Camera Settings" screen
     When user changes the "Motion Detection" to "On"
     Then "Motion Detection" value should be updated to "On" on "Motion Detection Settings" screen
      And the following "Motion Detection" options should be enabled:
      | Options               | 
      | Motion Detection Zone | 
      | Motion Sensitivity    | 
     When user navigates to "Camera Settings" screen from the "Motion Detection Settings" screen
     Then "Motion Detection" value should be updated to "On" on "Camera Settings" screen
     When user navigates to "Motion Detection Settings" screen from the "Camera Settings" screen
     Then the following "Motion Detection" options should be enabled:
      | Options               | 
      | Motion Detection Zone | 
      | Motion Sensitivity    | 
  
  @ChooseMotionDetectionZones @P3 @NotAutomatable @--xrayid:ATER-54483
  Scenario: As a user I should be able to select and draw all the zones so that i can set different sensitivity for each zones in the camera frame based on my requirement  
    Given user camera is set to "on" through CHIL
      And motion detection is "enabled" on user camera through CHIL
     When user launches and logs in to the Lyric application 
      And user navigates to "Motion Detection Settings" screen from the "Dashboard" screen
     Then user should be displayed with "zone 1" as the default zone
      And user verifies that the entire snapshot is selected as the motion detection zone
     Then user "should be able" to draw on "zone 1"
     When user selects "zone 2" from the "Motion Detection Settings" screen
      And user "enables" detection in "zone 2"
     Then user "should be able" to draw on "zone 2"
     When user selects "zone 3" from the "Motion Detection Settings" screen
      And user "enables" detection in "zone 3"
     Then user "should be able" to draw on "zone 3"
     When user selects "zone 4" from the "Motion Detection Settings" screen
      And user "enables" detection in "zone 4"
     Then user "should be able" to draw on "zone 4"
  #login with different mobiles for the status of configured options to verify the settings as user account level
  
  @ChooseMotionDetectionZoneError @P3 @Notautomatable @--xrayid:ATER-54485
  Scenario: As a user I should be shown with popup message on failure to load snapshot to select and draw all the 2 zones 
    Given user camera is set to "on" through CHIL
      And motion detection is "enabled" on user camera through CHIL
     When user launches and logs in to the Lyric application 
      And user navigates to "Motion Detection Settings" screen from the "Dashboard" screen
     And user selects <Zone> from the "Motion Detection Settings" screen
  	And  user Fail to load screenshot
     Then user should be shown with "Loading spinner"
      And user should be shown with "Retry"
     When user selects "Retry"
     Then user should be shown with "Unable to take the snapshot"
  
  @DAS_CameraVerifyMotionSensitivitySettings @P2 @Automated @--xrayid:ATER-54486
  Scenario Outline: As a user I should be able to set motion sensitivity on DAS camera to Off,Low, Normal and High
    Given  user is set to "Home" mode through CHIL	
     Then user launches and logs in to the Lyric application
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then user navigates to "MOTION DETECTION SETTINGS" screen from the "Camera Settings" screen
     Then user changes the "Motion Detection" to "On"
     When user selects <Zone> from "Motion Detection Settings" screen 
     Then user should be displayed with the following "Motion Sensitivity Settings" options:
      | MotionSensitivityOptionsSettings | 
      | Off                              | 
      | Low                              | 
      | Normal                           | 
      | High                             | 
     When user changes the "Motion Sensitivity" to "Off"
     Then "Motion Sensitivity" value should be updated to "Off" on "Motion Detection Settings" screen
     When user changes the "Motion Sensitivity" to "Low"
     Then "Motion Sensitivity" value should be updated to "Low" on "Motion Detection Settings" screen
     When user changes the "Motion Sensitivity" to "Medium"
     Then "Motion Sensitivity" value should be updated to "Medium" on "Motion Detection Settings" screen
     When user changes the "Motion Sensitivity" to "high"
     Then "Motion Sensitivity" value should be updated to "high" on "Motion Detection Settings" screen
    Examples: 
      | Zone   | 
      | Zone 1 | 
      #| Zone 2 | 
      #| Zone 3 | 
      #| Zone 4 | 
  
  @VerifyMultipleZonesOverlapError  @P3  @Notautomatable @--xrayid:ATER-54488
  Scenario: As a user I want to verify sensitivity area on my zones should not overlap
    Given user camera is set to "on" through CHIL
      And "motion detection" is "enabled" on user camera through CHIL
      And "motion sensitivity" is "high" on user camera through CHIL
     When user launches and logs in to the Lyric application
      And user navigates to "Motion Detection Settings" screen from the "Dashboard" screen
      And user ovelaps motion detection area across multiple zones
      And user navigates to "Camera Settings" screen from the "Motion Detection Settings" screen
     Then user should be displayed with "Error-Zones overlap" popup
  
  @VerifyOutsideZonesWarningMessage  @P3 @Notautomatable @--xrayid:ATER-54489
  Scenario: As a user I should be shown with warning message if any area on my zones is not covered for my confirmation
    Given user camera is set to "on" through CHIL
      And "motion detection" is "enabled" on camera through CHIL
      And "motion sensitivity" is "high" on camera through CHIL
     When user launches and logs in to the Lyric application
      And user navigates to "Motion Detection Settings" screen from the "Dashboard" screen
      And user sets motion detection area for multiple zones without covering few area of frame
      And user navigates to "Camera Settings" screen from the "Motion Detection Settings" screen
     Then user should be displayed with "Warning" popup
     When user "cancels" outside zone "warning" popup
     Then user should be retained in "Motion Detection" screen
     When user "confirms" outside zone "warning" popup
     Then user should be displayed with "Camera settings" screen
  
  @DAS_VerifyNightVisionSettings @P2 @Automated @--xrayid:ATER-54492
  Scenario: As a user I should be able to set my Night Vision Settings so that my camera works even in night 
    Given  user is set to "Home" mode through CHIL
     Then user launches and logs in to the Lyric application
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then user navigates to "Night Vision Settings" screen from the "Camera Settings" screen
     Then user should be displayed with the following "DAS Night Vision Settings" options: 
      | Settings | 
      | Auto     | 
      | On       | 
      | Off      | 
     When user selects "Auto" from "Night Vision Settings" screen 
     Then "Night Vision" value should be updated to "Auto" on "Night Vision Settings" screen 
     When user navigates to "Camera Settings" screen from the "Night Vision Settings" screen 
     Then "Night Vision" value should be updated to "Auto" on "Camera Settings" screen
     When user navigates to "Night Vision Settings" screen from the "Camera Settings" screen
     Then user should be displayed with the following "DAS Night Vision Settings" options: 
      | Settings | 
      | Auto     | 
      | On       | 
      | Off      | 
     When user selects "On" from "Night Vision Settings" screen 
     Then "DAS Night Vision" value should be updated to "On" on "Night Vision Settings" screen 
     When user navigates to "Camera Settings" screen from the "Night Vision Settings" screen 
     Then "DAS Night Vision" value should be updated to "On" on "Camera Settings" screen
     When user navigates to "Night Vision Settings" screen from the "Camera Settings" screen
     Then user should be displayed with the following "DAS Night Vision Settings" options: 
      | Settings | 
      | Auto     | 
      | On       | 
      | Off      | 
     When user selects "Off" from "Night Vision Settings" screen 
     Then "Night Vision" value should be updated to "Off" on "Night Vision Settings" screen 
     When user navigates to "Camera Settings" screen from the "Night Vision Settings" screen 
     Then "Night Vision" value should be updated to "Off" on "Camera Settings" screen
  #login with different mobiles for the status of configured options to verify the settings as user account level
  
  @DAS_VerifyVideoQualitySettings @P2 @Automated @--xrayid:ATER-54495
  Scenario: As a user I should be able to set my Video Quality Settings based on my network connection
    Given user launches and logs in to the Lyric application
     Then user is set to "Home" mode through CHIL
      And user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
      And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
     Then user navigates to "Video Quality Settings" screen from the "Camera Settings" screen
     And user should be displayed with the following "DAS Video Quality Settings" options:
      | Settings | 
      | Auto     | 
      | Low      | 
      | High     |
     When user selects "Auto" from "Video Quality Settings" screen
     Then "Video Quality" value should be updated to "Auto" on "Video Quality Settings" screen 
     When user navigates to "Camera Settings" screen from the "Video Quality Settings" screen 
     Then "Video Quality" value should be updated to "Auto" on "Camera Settings" screen
     When user navigates to "Video Quality Settings" screen from the "Camera Settings" screen
     Then user should be displayed with the following "DAS Video Quality Settings" options:
      | Settings | 
      | Auto     | 
      | Low      | 
      | High     | 
     When user selects "Low" from "Video Quality Settings" screen 
     Then "Video Quality" value should be updated to "Low" on "Video Quality Settings" screen 
     When user navigates to "Camera Settings" screen from the "Video Quality Settings" screen 
     Then "Video Quality" value should be updated to "Low" on "Camera Settings" screen
     When user navigates to "Video Quality Settings" screen from the "Camera Settings" screen
     Then user should be displayed with the following "DAS Video Quality Settings" options: 
      | Settings | 
      | Auto     | 
      | Low      | 
      | High     | 
     When user selects "High" from "Video Quality Settings" screen 
     Then "Video Quality" value should be updated to "High" on "Video Quality Settings" screen
     When user navigates to "Camera Settings" screen from the "Video Quality Settings" screen 
     Then "Video Quality" value should be updated to "High" on "Camera Settings" screen
  
  @DAS_EditCameraName @P2 @Automated @--xrayid:ATER-54496
  Scenario Outline: As a user I should be able to edit the camera name
    Given user launches and logs in to the Lyric application 
     When user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen 
      And user camera is set to <State>
     When user navigates to "Base Station Configuration" screen from the "CAMERA SOLUTION CARD" screen
     Then user edits the "DAS Camera" name to "Camera1"
      And verify the Edited name on "Dashboard" screen
      And user reverts back the "DAS Device name" through CHIL
    Examples: 
      | State | 
      | On    | 
#      | Off   | 
#  |Offline|
#  |Upgrade|
  
  @DAS_VerifyErrorMessagesCameraSettings @P4 @NotAutomable @--xrayid:ATER-54498
  Scenario: As a user I should be shown with error messages on failure to set any values in camera settings screen
    Given user <Camera> is set to "on" through CHIL
     When user launches and logs in to the Lyric application
      And user navigates to "Camera Settings" screen from the "Dashboard" screen
 And Cloud and camera is not responding for any camera settings set value
     Then user should be displayed with "Error" popup 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyCameraOnInHomeMode @Automated @--xrayid:ATER-54500
  Scenario: As a user I should be able to enable Camera Settings in Home Mode
    Given user is set to "Off" mode through CHIL
      When user launches and logs in to the Lyric application 
     Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
     And user camera is set to "off"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
      Then user changes the "Camera ON in Home Mode" to "ON"
     And "Camera ON in Home Mode" value should be updated to "ON" on "Camera Settings" screen
     When user navigates to "Camera Solution Card" screen from the "Camera Settings" screen
     And user is set to "Home" mode through CHIL
     Then user camera is "live streaming"
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyCameraOffInHomeMode @Automated @--xrayid:ATER-54501
  Scenario: As a user I should be able to disable Camera Settings in Home Mode
    Given user is set to "Off" mode through CHIL
      When user launches and logs in to the Lyric application 
      Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
     And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
      And user changes the "People Detection" to "Off"
      And user changes the "Camera ON in Home Mode" to "Off"
     Then "Camera ON in Home Mode" value should be updated to "Off" on "Camera Settings" screen
     When user navigates to "Security Solution Card" screen from the "Camera Settings" screen
      And user switches from "Off" to "Home"
     When user navigates to "Camera Solution Card" screen from the "Security Solution Card" screen
     Then user camera is "not live streaming"
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyCameraOnInNightMode @Automated @--xrayid:ATER-54502
  Scenario: As a user I should be able to enable disable Camera Settings in Home Mode
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application 
     Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
     And user camera is set to "Off"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
      And user changes the "Camera ON in Night Mode" to "ON"
     Then "Camera ON in Night Mode" value should be updated to "ON" on "Camera Settings" screen
     When user navigates to "Security Solution Card" screen from the "Camera Settings" screen
      And user switches from "Home" to "Night"
     When user navigates to "Camera Solution Card" screen from the "Security Solution Card" screen
     Then user camera is "live streaming"
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyCameraOffInNightMode @Automated @--xrayid:ATER-54503
  Scenario: As a user I should be able to enable disable Camera Settings in Home Mode
    Given user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application 
      Then user navigates to "DAS Camera Solution Card" screen from the "Dashboard" screen
     And user camera is set to "ON"
     When user navigates to "Camera Settings" screen from the "Camera Solution Card" screen
      And user changes the "Camera ON in Night Mode" to "Off"
     Then "Camera ON in Night Mode" value should be updated to "Off" on "Camera Settings" screen
     When user navigates to "Security Solution Card" screen from the "Camera Settings" screen
      And user switches from "Home" to "Night"
     When user navigates to "Camera Solution Card" screen from the "Security Solution Card" screen
     Then user camera is "not live streaming"
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyMotionDetectioncameraoff @Automated @--xrayid:ATER-54504
  Scenario Outline: As a user I should be verify geofence status on home or off modeScreen
    Given user is set to <Mode> mode through CHIL
     Then user DAS camera is set to "off" through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
     Then user selects "Motion Detection" from "Camera Settings" screen
     Then user should be displayed with "Ensure the camera is turned on and the privacy ring is open"
    Examples: 
      | Mode | 
      | Away | 
  #|Offline|
#      | Night | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyNightVisioncameraoff @Automated @--xrayid:ATER-54506
  Scenario Outline: As a user I should be verify geofence status on home or off modeScreen
    Given user is set to <Mode> mode through CHIL
     Then user DAS camera is set to "off" through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
     Then user selects "Night Vision" from "Camera Settings" screen
     Then user should be displayed with "Ensure the camera is turned on and the privacy ring is open"
    Examples: 
      | Mode | 
      | Away | 
  #|Offline|
      | Night | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyVideoQualitycameraoff @Automated @--xrayid:ATER-54509
  Scenario Outline: As a user I should be verify geofence status on home or off modeScreen
    Given user is set to <Mode> mode through CHIL
     Then user DAS camera is set to "off" through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
     Then user selects "Video Quality" from "Camera Settings" screen
     Then user should be displayed with "Ensure the camera is turned on and the privacy ring is open"
    Examples: 
      | Mode | 
      | Away | 
  #|Offline|
#      | Night | 
  
  
