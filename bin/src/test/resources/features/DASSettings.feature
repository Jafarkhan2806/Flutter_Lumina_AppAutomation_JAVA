@DASSettings 
Feature: DAS Settings 
As user I should be able to control my DAS panel settings from the app

#Requirements: Single Location Single DAS Device, No Sensors Required
@VerifyDASSettings @Automated @--xrayid:ATER-54562
  Scenario Outline: As a user I want to verify that all DAS Settings options are available to me 
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then the following "DAS Security Settings" options should be enabled:
      | Settings 	               | 
      | Manage Alerts              | 
      | Amazon Alexa               | 
      | Geofencing                 | 
      | OK Security Voice Commands | 
      | Entry/Exit Delay           | 
      | About Security Modes       | 
      | Key Fob                    | 
      | Sensors                    | 
      | Z-Wave Devices             | 
      | Base Station Volume	       | 
      | Reset Wi-Fi                | 
      | Base Station Configuration | 
    Examples: 
      | Mode | 
      | Home | 
  	#|OFF|
  
  #Requirements: Single Location Single DAS Device, OSMV required
  @VerifyDASSettingsOSMV @Automated @--xrayid:ATER-54566
  Scenario Outline: As a user I want to verify that all DAS Settings options are available to me when OSMV configured
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen 
     Then the following "DAS Security Settings" options should be enabled:
      | Settings                               | 
      | Manage Alerts                          | 
      | Amazon Alexa                           | 
      | Geofencing                             | 
      | OK Security Voice Commands             | 
      | Enhanced Deterrence                    | 
      | Outdoor motion viewers on in Home Mode | 
      | Entry/Exit Delay                       | 
      | About Security Modes                   | 
      | Key Fob                                | 
      | Sensors                                | 
      | Z-Wave Devices                         | 
      | Base Station Volume                    | 
      | Reset Wi-Fi                            | 
      | Base Station Configuration             | 
    Examples: 
      | Mode | 
      | Home | 
  |OFF|
  
  #Requirements: Single Location Single DAS Device OSMV required
  @VerifyDASSettingswhenmodechange @Automated @--xrayid:ATER-54576
  Scenario Outline: As a user I want to verify that all DAS Settings options on away and night mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then the following "DAS Security Settings" options should be enabled:
      | Settings                   | 
      | Manage Alerts              | 
      | Amazon Alexa               | 
      | OK Security Voice Commands | 
      | About Security Modes       | 
      | Key Fob                    | 
      | Sensors                    | 
      | Z-Wave Devices             | 
      | Base Station Configuration | 
     When user navigates to "Dashboard" screen from the "DAS Security Settings" screen
     Then user navigates to "Security Settings" screen from the "Dashboard" screen
     Then the following "DAS Security Settings" options should be disabled:
      | Settings            | 
      | Geofencing          | 
      | Entry/Exit Delay    | 
      | Base Station Volume | 
      | Reset Wi-Fi         | 
    Examples: 
      | Mode  | 
      | Away  | 
      #| Night | 
  
  #Requirements: Single Location Single DAS Device OSMV required
  @VerifyDASSettingswhenmodechangeOSMV @Automated	@--xrayid:ATER-54577
  Scenario Outline: As a user I want to verify that all DAS Settings options when OSMV is configured on away and night mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then the following "DAS Security Settings" options should be enabled:
      | Settings                   | 
      | Manage Alerts              | 
      | Amazon Alexa               | 
      | OK Security Voice Commands | 
      | About Security Modes       | 
      | Key Fob                    | 
      | Sensors                    | 
      | Z-Wave Devices             | 
      | Base Station Configuration | 
     When user navigates to "Dashboard" screen from the "DAS Security Settings" screen
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then the following "DAS Security Settings" options should be disabled:
      | Settings                               | 
      | Geofencing                             | 
      | Enhanced Deterrence                    | 
      | Outdoor motion viewers on in Home Mode | 
      | Entry/Exit Delay                       | 
      | Base Station Volume                    | 
      | Reset Wi-Fi                            | 
    Examples: 
      | Mode  | 
      #| Away  | 
      | Night | 
  
  #ManageAlert 
  
  #Requirements: DAS panel configured newly, No Sensors Required
  @VerifyManageAlertsScreen @Automated @--xrayid:ATER-54579
  Scenario Outline: As a user I should be verify default Manage Alerts Screen
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     When user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then the following "Security Manage Alerts" options should be enabled:
      | Alerts               | 
      | Security Mode change | 
      |DOOR AND WINDOWS |
    Examples: 
      | Mode  | 
      | Home  | 
      #| Night | 
      #| Away  | 
      #| OFF   | 
  
  #Requirements: DAS panel configured newly, Access sensor
  @VerifyManageAlertsScreenwithAccessSensor @Automated @--xrayid:ATER-54581
  Scenario Outline: As a user I should be verify default Manage Alerts Screen
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then user navigates to "Manage alerts" screen from the "Security Settings" screen
      And the following "Security Manage Alerts" options should be enabled:
      | Alerts               | 
      | Security Mode change | 
      | Doors and Windows    | 
    Examples: 
      | Mode  | 
      | Home  | 
     | Night | 
      | OFF   | 
  
  #Requirements: DAS panel configured newly, No Sensors Required
  @VerifyManageAlertsScreenEnableDisableSecurityModeChange @Automated @--xrayid:ATER-54584
  Scenario Outline: As a user I should be verify security mode change enable and disable option in Manage alerts screen
    Given user is set to <Mode> mode through CHIL
     Then user sets the entry/exit timer to "15" seconds
      And user launches and logs in to the Lyric application
      And user navigates to "Security Settings" screen from the "Dashboard" screen
     When user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then user changes the "Security mode change" to "Off"
     When user navigates to "Security Solution Card" screen from the "Manage alerts" screen
     Then user switches from <Mode> to <UMode>
      And user should be displayed with a switching to <UMode> text
      And user should be displayed with switching timer
      And timer ends on user device
      And user status should be set to <UMode>
      And user should not receive a <Push Notification> push notification
     When user navigates to "DAS Security Settings" screen from the "Security Solution Card" screen
     Then user navigates to "Manage alerts" screen from the "Security Settings" screen
      And user changes the "Security mode change" to "ON"
     When user navigates to "Security Solution Card" screen from the "Manage alerts" screen
     Then user switches from <UMode> to <Mode>
      #And user should be displayed with a switching to <Mode> text
      And user status should be set to <Mode>
      And user receives a <UPush Notification> push notification
      
    Examples: 
      | Mode | UMode | Push Notification | UPush Notification | 
      | Home | Away  | Set to Away       | Set to Home        | 
  |Home|Night| Set to Night |Set to Home |
 # |Home| Off| Set to Off | Set to Home |
 # |OFF| Away |Set to Away |Set to Off | 
  #|OFF| Night |Set to Night |Set to Off | 
 # |OFF| Home | Set to Home |Set to Off | 
 # |Night|Home | Set to Home |Set to Night |
 # |Night|Away |Set to Away |Set to Night |
 # |Night| Off|Set to Off | Set to Night |
 # |Away|Home | Set to Home |Set to Away |
  #|Away|Night |Set to Night |Set to Away |
 # |Away| Off|Set to Off | Set to Away |
  
  #Requirements: DAS panel configured newly, One access sensor
  @VerifyManageAlertsScreenEnableDisableDoorsAndWindowsModeChangeHomeAwayNight @Automated @--xrayid:ATER-54587
  Scenario Outline: As a user I should be verify Doors and Windows change enable and disable option in Manage alerts screen
    Given user is set to <Mode> mode through CHIL
     Then user sets the entry/exit timer to "15" seconds
      And user launches and logs in to the Lyric application
      And user navigates to "Security Settings" screen from the "Dashboard" screen
     When user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then user changes the "Doors and windows" to "Off"
     When user navigates to "Security Solution Card" screen from the "Manage alerts" screen
     Then user <AS> access sensor <Event>
      And user should not receive a <Push Notification> push notification
     When user navigates to "DAS Security Settings" screen from the "Security Solution Card" screen
     Then user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then user changes the "Doors and windows" to "On"
     Then user navigates to "Security settings" screen from the "Manage Alerts" screen
      And user <AS> access sensor <Event1>
      And user receives a <UPush Notification> push notification
    Examples: 
      | Mode | AS   | Event  | Event1 | Push Notification | UPush Notification | 
      | Home | door | Opened | Closed | DOOR OPENED       | DOOR CLOSED        | 
      |Home| door |Closed | Opened |DOOR CLOSED | DOOR OPENED|
      |Night|door |Opened | Closed | DOOR OPENED | DOOR CLOSED|
      |Night|door |Closed | Opened |DOOR CLOSED | DOOR OPENED|
      |Away|door |Opened | Closed | DOOR OPENED | DOOR CLOSED|
      |Away|door |Closed | Opened |DOOR CLOSED | DOOR OPENED|
  |Home| WINDOW | Opened | Closed | WINDOW OPENED | WINDOW CLOSED|
  |Home| WINDOW |Closed | Opened |WINDOW CLOSED | WINDOW OPENED|
  |Night|WINDOW |Opened | Closed | WINDOW OPENED | WINDOW CLOSED|
  |Night|WINDOW |Closed | Opened |WINDOW CLOSED | WINDOW OPENED|
  |Away|WINDOW |Opened | Closed | WINDOW OPENED | WINDOW CLOSED|
  |Away|WINDOW |Closed | Opened |WINDOW CLOSED | WINDOW OPENED|
  
  #Requirements: DAS panel configured newly, One access sensor
  @VerifyManageAlertsScreenEnableDisableDoorsAndWindowsModeChangeOff @Automated @--xrayid:ATER-54591
  Scenario Outline: As a user I should be verify Doors and Windows change enable and disable option in Manage alerts screen
    Given user is set to <Mode> mode through CHIL
     Then user sets the entry/exit timer to "15" seconds
      And user launches and logs in to the Lyric application
      And user navigates to "Security Settings" screen from the "Dashboard" screen
     When user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then user changes the "Doors and windows" to "Off"
     When user navigates to "Security Solution Card" screen from the "Manage alerts" screen
     Then user <AS> access sensor <Event>
      And user should not receive a <Push Notification> push notification
     When user navigates to "DAS Security Settings" screen from the "Security Solution Card" screen
     Then user navigates to "Manage alerts" screen from the "Security Settings" screen
     Then user changes the "Doors and windows" to "On"
     Then user navigates to "Security settings" screen from the "Manage Alerts" screen
      And user <AS> access sensor <Event1>
      And user should not receive a <Push Notification> push notification
  
    Examples: 
      | Mode | AS     | Event  | Event1 | Push Notification | UPush Notification | 
      | OFF  | WINDOW | Opened | Closed | WINDOW OPENED     | WINDOW CLOSED      | 
      #| OFF  | WINDOW | Closed | Opened | WINDOW CLOSED     | WINDOW OPENED      | 
      #| OFF  | door   | Opened | Closed | DOOR OPENED       | DOOR CLOSED        | 
      #| OFF  | door   | Closed | Opened | DOOR CLOSED       | DOOR OPENED        | 
  
  #Geofence
  
  #Requirements: DAS panel configured newly, No Sensors Required
  @VerifySecuritySettingsGeofenceoptionAwayNightOffline @Automated @--xrayid:ATER-54594
  Scenario Outline: As a user I should be verify geofence stgatus on home or off modeScreen
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then user selects "Geofencing" from "Security Settings" screen
     Then user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode | 
      | Away | 
  #|Offline|
     #| Night | 
  
  #Requirements: DAS panel configured , No Sensors Required
  @VerifySecuritySettingsGeofenceoptionHomeOff @Automated @--xrayid:ATER-54603
  Scenario Outline: As a user I should be verify geofence status in home and off mode
    Given user is set to <Mode> mode through CHIL
      And user sets the entry/exit timer to "45" seconds
     Then user launches and logs in to the Lyric application
      And user changes the "Geofencing this location" to "off" 
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then user changes the "Geofencing Option" to "ON"
      And user navigates to "Security Solution Card" screen from the "DAS Security Settings" screen
     Then user thermostat set <Period> with <Geofence>
      And user should be displayed with a switching to <Period> text
      And user should be displayed with switching timer
      And timer ends on user device
      And user status should be set to <Period>
      And user receives a <Push Notification> push notification
     When user navigates to "DAS Security Settings" screen from the "Security Solution Card" screen 
     Then user changes the "Geofencing Status" to "off"
      And user navigates to "Security Solution Card" screen from the "DAS Security Settings" screen
     Then user thermostat set <UPeriod> with <UGeofence>
      And user should not receive a <UPush Notification> push notification
      And user status should be set to <UPeriod>
  
    Examples: 
      | Mode | Period | Geofence     | Push Notification | UPeriod | UGeofence    | UPush Notification | 
      | Home | Away   | UserDeparted | Away              | Home    | UserArrived  | GEOFENCE HOME      | 
     #| Away | Home   | UserArrived  | Home              | Away    | UserDeparted | GEOFENCE AWAY      | 
  
  #Requirements: DAS panel configured, No Sensors Required and "geofence this location" should be disabled under global drawer
  @VerifySecuritySettingsGeofenceoptionHomeOffDisbaledgeofencethislocation @Automated @--xrayid:ATER-54604
  Scenario Outline: As a user I should be verify default Manage Alerts Screen on home and off mode 
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
      And user changes the "Geofence this location" to "off" 
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then user changes the "Geofencing Status" to "ON"
      And user should receive a "Geofencing" popup
    When user "DISMISSES" the "Geofencing" popup
     Then user should be displayed with the "DAS security settings" screen
     When user changes the "Geofencing Status" to "ON"
     Then user "ACCEPTS" the "Geofencing" popup
      And user should be displayed with the "Geofence" screen
     When user selects "BACK" from "Geofence this location" screen
    Then user should be displayed with the "Geofence" screen
     When user changes the "Geofencing Status" to "ON"
     Then user "ACCEPTS" the "Geofencing" popup
      And user should be displayed with the "Geofence" screen
     When user changes the "Geofence this location toggle" to "ON" 
     Then user selects "BACK" from "Geofence this location" screen
      And "Geofencing" value should be updated to "OFF" on "DAS Security settings" screen
     When user changes the "Geofencing Status" to "ON"
     Then user navigates to "Security Solution Card" screen from the "DAS Security Settings" screen
     When user navigates to "DAS Security settings" screen from the "Security Solution Card" screen
      And "Geofencing" value should be updated to "ON" on "DAS Security settings" screen
    Examples: 
      | Mode | 
      | Home | 
      #| Off  | 
      
  @EnableDisableGeofencing @Automated @--xrayid:ATER-54606
  Scenario: As a user I should be able to enable or disable geofencing on my DAS Panel account   
    Given "location" geofencing is "enabled" on the user account through CHIL
    And user is set to "Home" mode through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Security Settings" screen from the "Dashboard" screen
      And user changes the "Geofencing Status" to "ON"
     Then "Geofencing" value should be updated to "ON" on "Security Settings" screen
     When user changes the "Geofencing Status" to "OFF"
     Then "Geofencing" value should be updated to "OFF" on "Security Settings" screen
  
  
  #AmazonAlexad
  
  #Requirements: DAS panel configured with out Amazon Alexa
  @VerifySetUpAmazonAlexa @NotAutomatable @--xrayid:ATER-54611
  Scenario Outline: As a user I should be verify Amazon Alexa setup
    Given user launches and logs in to the Lyric application
      And user is set to <Mode> mode through CHIL
     Then user navigates to "Enable Amazon Alexa" screen from "Dashboard"
      And user Navigates to "Sign in to Amazon" screen from "Enable Amazon Alexa" screen
      And user enter the <amazon Email ID> and <amazon Password>
     And user select the "Sign In" button
     Then user should be displayed with "Alexa Voice Service T&C" screen
     When user "Allows Alexa T&C" by clicking on "Allow" button
     Then user should  be displayed with the "Feature Setup Completed" screen
     When user completes "Alexa Configuration" by clicking on "Done" button
     And user should navigates to "Security settings" screen
     Then user verifies that the DAS Panel "responds" to "Amazon Alexa Voice Commands"
    Examples: 
      | Mode  | amazon Email ID | amazon Password | 
      | Home  | mdsdas@grr.la   | Honeywell@1234  | 
      | OFF   | mdsdas@grr.la   | Honeywell@1234  | 
      | Away  | mdsdas@grr.la   | Honeywell@1234  | 
      | Night | mdsdas@grr.la   | Honeywell@1234  | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @AmazonAlexaLogoff   @NotAutomatable @--xrayid:ATER-54615
  Scenario: As a user I should be able to log off Amazon Alexa from my DAS account
    Given user launches and logs in to the Lyric application
     When user navigates to "Amazon Alexa Settings" screen from the "Dashboard" screen
      And user "signs out of Amazon Alexa" by clicking on "sign out" button
     Then user should receive a "Confirm Amazon Alexa Logout" pop up
     When user "accepts" the "Confirm Amazon Alexa Logout" popup 
     Then user verifies that the DAS Panel "does not respond" to "Amazon Alexa Voice Commands"
  
  #Requirements: DAS panel configured with Amazon Alexa
  @VerifySignoutAmazonAlexa @NotAutomatable @--xrayid:ATER-54620
  Scenario Outline: As a user I should be verify Amazon Alexa sign out
    Given user launches and logs in to the Lyric application
      And user is set to <Mode> mode through CHIL
     Then user navigates to "Amazon Alexa Voice commands" screen from "Dashboard" screen
      And user selects the "Sign Out" option
     Then user should receive a "Confirm Amazon Alexa Logout" pop up
     When user "accepts" the "Confirm Amazon Alexa Logout" popup
     And user should navigates to "Security settings" screen
     Then user verifies that the DAS Panel "does not respond" to "Amazon Alexa Voice Commands"
    Examples: 
      | Mode  | 
      | Home  | 
      | OFF   | 
      | Night | 
  
  # Need to check the HUE Amazon Alexa flow for offline 
  
  #Requirements DAS panel configured, No Sensors Required and "geofence this location" should be disabled under global drawer and one sensor should be in <Error>
  @VerifyGeofencecrossinsensorfault @NotAutomatable @--xrayid:ATER-54623
  Scenario Outline: As a user I should be verify geofence cross when sensor has error
    Given user launches and logs in to the Lyric application
      And user is set to <Mode> mode through CHIL
     When user enables "Geofencing" option from the "Security Settings" screen
     And user DAS panel <Sensors> has <Error>
     And user cross the geofence <Gmode> to <GMode update>
      Then user DAS Panel and Camera should not update with <GMode update> status
  
    Examples: 
      | Mode | Sensors      | Error          | Gmode | Gmode update | 
      | Home | AccessSensor | Motion         | Home  | Away         | 
      | Home | AccessSensor | Cover Tampered | Home  | Away         | 
      | Home | AccessSensor | Low            | Home  | Away         | 
      | Home | AccessSensor | Offline        | Home  | Away         | 
      | Home | MotionViewer | Motion         | Home  | Away         | 
      | Home | MotionViewer | Cover Tampered | Home  | Away         | 
      | Home | MotionViewer | Low            | Home  | Away         | 
      | Home | MotionViewer | Offline        | Home  | Away         | 
      | Home | ISMV         | Motion         | Home  | Away         | 
      | Home | ISMV         | Cover Tampered | Home  | Away         | 
      | Home | ISMV         | Low            | Home  | Away         | 
      | Home | ISMV         | Offline        | Home  | Away         | 
  
  #VoiceCommands
  
  #LYDAS-6643
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyOKSecurityVoiceCommandsHomeOFFNight   @NotAutomatable @--xrayid:ATER-54627
  Scenario Outline: As a user I should be able to enable disable OK Security Voice Commands in offline and away mode
    Given user launches and logs in to the Lyric application
      And user is set to <Mode> mode through CHIL
     Then user Navigates to "Security settings" screen from "dashboard" screen
     When user navigates to "Voice Commands" screen from "Security settings" screen
     Then user should display with "OK security voice commands" and with the following "Voice commands" options
      | Commands          | 
      | Trigger Phrase    | 
      | Security Commands | 
      | Camera Commands   | 
     When user enables the "OK security Voice Commands" button
      Then user receive DAS Panel "Responds" to "OK security voice commands"
     When user disables the "OK security Voice Commands" button
      Then user should display with "OK security voice commands" and with the following "Voice commands" options
      | Commands          | 
      | Trigger Phrase    | 
      | Security Commands | 
      | Camera Commands   | 
      And user should not receive DAS Panel "Responds" to "OK security voice commands"
    Examples: 
      | Mode  | 
      | Home  | 
      | OFF   | 
      | Night | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyOKSecurityVoiceCommandsOfflineAway  @NotAutomatable @--xrayid:ATER-54629
  Scenario Outline: As a user I should be able to enable disable OK Security Voice Commands in offline and away mode
    Given user launches and logs in to the Lyric application
     When user navigates to "Voice Commands" screen from the "Dashboard" screen
      And user is set to <Mode> mode through CHIL
     Then user navigates to "Security settings" screen from " dashboard" screen
      And user navigates to "Voice Commands" screen from "Security settings" screen
      Then user should display with disabled "OK Security voice commands" and with the following "Voice commands" options
      | Commands          | 
      | Trigger Phrase    | 
      | Security Commands | 
      | Camera Commands   | 
     When user selects the "OK Security voice commands"
     Then user should display the "This Feature is not available in <Mode> mode" pop up
    Examples: 
      | Mode    | 
      #| Offline | 
      | Away    | 
  

  @VerifyEnhancedDeterrenceHomeOFFmode @Automated
  Scenario Outline: As a user i should able to enable, disable and change the deterrence music
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "security settings" screen from the "Dashboard" screen
     Then user navigates to "Enhanced deterrence" screen from the "DAS security settings" screen
     When user changes the "Enhanced deterrence" to "ON"
     Then user should be displayed with the following "Deterrence settings" options:
      | Settings            | 
      | Select Chime        | 
      | Play Dog bark sound | 
      | Party is On         | 
      | Vacuum              | 
     When user selects "Play Dog bark sound" from "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Play Dog bark sound" on "Enhanced deterrence" screen
     When user navigates back and forth in "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Play Dog bark sound" on "Enhanced deterrence" screen
     When user selects "Party is On" from "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Party is On" on "Enhanced deterrence" screen
     When user navigates back and forth in "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Party is On" on "Enhanced deterrence" screen
     When user selects "Vacuum" from "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Vacuum" on "Enhanced deterrence" screen
     When user navigates back and forth in "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "Vacuum" on "Enhanced deterrence" screen
     When user changes the "Enhanced deterrence" to "OFF"
     Then user navigates back and forth in "Enhanced deterrence" screen
     Then "Enhanced deterrence" value should be updated to "OFF" on "Enhanced deterrence" screen
     Then user should not be displayed with the following "Deterrence settings" options:
      | Settings            | 
      | Select Chime        | 
      | Play Dog bark sound | 
      | Party is On         | 
      | Vacuum              | 
    Examples: 
      | Mode | 
      | Home | 
      #| OFF  | 
  
  @VerifyEnhancedDeterrenceAwayNightmode @Automated @--xrayid:ATER-54640
  Scenario Outline: As a user i should able to verify enable or disable in away or night mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "security settings" screen from the "Dashboard" screen
     #Then user navigates to "Enhanced deterrence" screen from the "DAS security settings" screen
     When user selects "Enhanced deterrence" from "Security Settings" screen
     Then user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode  | 
      | Away  | 
      | Night | 
  
  @VerifyoutdorrmotionviewersoninhomemodeHomeOFFmode @Automated @--xrayid:ATER-54642
  Scenario Outline: As a user i should able to verify enable or disable in away or night mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "security settings" screen from the "Dashboard" screen
     Then user changes the "Outdoor Motion viewers on in home mode" to "ON"
     When user navigates back and forth in "DAS security settings UP" screen
     Then "outdoor motion viewers on in home mode" value should be updated to "ON" on "DAS security settings" screen
     Then user changes the "Outdoor Motion viewers on in home mode" to "OFF"
     When user navigates back and forth in "DAS security settings UP" screen
     Then "outdoor motion viewers on in home mode" value should be updated to "OFF" on "DAS security settings" screen
    Examples: 
      | Mode | 
      | Home | 
      #| Off  | 
  
  @Verifyoutdorrmotionviewersoninhomemodenightawaymode @Automated @--xrayid:ATER-54644
  Scenario Outline: As a user i should able to verify enable or disable in away or night mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "security settings" screen from the "Dashboard" screen
     Then user selects "Outdoor Motion viewers on in home mode" from "Security Settings" screen
      And user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode  | 
      | Away  | 
      #| Night | 
  
  #Entry exit delay 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @DASEntryExitDelaySettings @Automated @--xrayid:ATER-54645
  Scenario Outline: As user I want to verify if entry exit delay time displayed on settings and user can update the value 
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Entry-Exit Delay" screen from the "Dashboard" screen
     Then user should be displayed with the following "Entry-Exit Delay" options:
      | Delays | 
      | 15     | 
      | 30     | 
      | 45     | 
      | 60     | 
     When user selects "15" from "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "15" on "Entry-Exit Delay" screen
     When user navigates to "Security Settings" screen from the "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "15" on "Security Settings" screen
     When user navigates to "Entry-Exit Delay" screen from the "Security Settings" screen
     Then "Entry-Exit Delay" value should be updated to "15" on "Entry-Exit Delay" screen
      And user should be displayed with the following "Entry-Exit Delay" options:
      | Delays | 
      | 15     | 
      | 30     | 
      | 45     | 
      | 60     | 
     When user selects "30" from "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "30" on "Entry-Exit Delay" screen
     When user navigates to "Security Settings" screen from the "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "30" on "Security Settings" screen
     When user navigates to "Entry-Exit Delay" screen from the "Security Settings" screen
     Then "Entry-Exit Delay" value should be updated to "30" on "Entry-Exit Delay" screen
      And user should be displayed with the following "Entry-Exit Delay" options:
      | Delays | 
      | 15     | 
      | 30     | 
      | 45     | 
      | 60     | 
     When user selects "45" from "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "45" on "Entry-Exit Delay" screen
     When user navigates to "Security Settings" screen from the "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "45" on "Security Settings" screen
     When user navigates to "Entry-Exit Delay" screen from the "Security Settings" screen
     Then "Entry-Exit Delay" value should be updated to "45" on "Entry-Exit Delay" screen
      And user should be displayed with the following "Entry-Exit Delay" options:
      | Delays | 
      | 15     | 
      | 30     | 
      | 45     | 
      | 60     | 
     When user selects "60" from "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "60" on "Entry-Exit Delay" screen
     When user navigates to "Security Settings" screen from the "Entry-Exit Delay" screen
     Then "Entry-Exit Delay" value should be updated to "60" on "Security Settings" screen
     When user navigates to "Entry-Exit Delay" screen from the "Security Settings" screen
     Then "Entry-Exit Delay" value should be updated to "60" on "Entry-Exit Delay" screen
      And user should be displayed with the following "Entry-Exit Delay" options:
      | Delays | 
      | 15     | 
      | 30     | 
      | 45     | 
      | 60     | 
    Examples:
      | Mode | 
      | home | 
      #| Off  | 
  
  #Requirements Single Location Single DAS Device, No Sensors Required
  @DASEntryExitDelaySettingsNightAway @Automated @--xrayid:ATER-54648
  Scenario Outline: As user I want to verify if entry exit delay time displayed on settings and user can update the value in home and off mode
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     #When user navigates to "security settings" screen from the "Dashboard" screen
      When user navigates to "Entry-Exit Delay" screen from the "Dashboard" screen
     Then user selects "Entry-Exit Delay" from "Security Settings" screen
      And user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode  | 
      | Away  | 
      #| Night | 
  #|Offline|
  
  #Requirements Single Location Single DAS Device, No Sensors Required
  @DASAboutSecurityModesVerification  @Automated @--xrayid:ATER-54649
  Scenario Outline: As user I want to verify About Security modes screen
    Given user is set to <Mode> mode through CHIL
     And user launches and logs in to the Lyric application
     When user navigates to "security settings" screen from the "Dashboard" screen
     When user navigates to "About security modes" screen from the "DAS security settings" screen
     Then user should be displayed with the following "Security Modes" options:
      | Options                | 
      | Home Mode icon         | 
      | Home mode text         | 
      | Home mode description  | 
      | Away Mode icon         | 
      | Away mode text         | 
      | Away mode description  | 
      | Night Mode icon        | 
      | Night mode text        | 
      | Night mode description | 
      | Off Mode icon          | 
      | Off mode text          | 
      | Off mode description   | 
    Examples: 
      | Mode    | 
      | Home    | 
      #| Away    | 
      #| Night   | 
      #| Off     | 
      #| Offline | 
  
  #Requirements Single Location Single DAS Device, No Sensors Required
  @ChangeBaseStationVolumeHomeOff @Automated @--xrayid:ATER-54650
  Scenario Outline: As a user I should be able to change the base station volume in Home and off mode
    Given user launches and logs in to the Lyric application
      And User is set to <Mode> mode through CHIL
     When user navigates to "Security Settings" screen from the "Dashboard" screen
      And user changes the "Base Station Volume" to "~0%"
     Then "Base Station Volume" value should be updated to "~0%" on "Security Settings" screen
     When user changes the "Base Station Volume" to "~50%"
     Then "Base Station Volume" value should be updated to "~50%" on "Security Settings" screen
     When user changes the "Base Station Volume" to "~99%"
     Then "Base Station Volume" value should be updated to "~99%" on "Security Settings" screen
    Examples: 
      | Mode | 
      | Home | 
     # | Off  | 
  
  #Requirements Single Location Single DAS Device, No Sensors Required
  @ChangeBaseStationVolumeNightAwayOffline @Automated @--xrayid:ATER-54651
  Scenario Outline: As a user I should be able to change the base station volume in away, night, offline mode
   Given user launches and logs in to the Lyric application
      And User is set to <Mode> mode through CHIL
     When user navigates to "Security Settings" screen from the "Dashboard" screen
     Then user selects "Base Station Volume" from "Security Settings" screen
      And user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode | 
      | Away | 
      | Night  | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @ResetWiFi   @NotAutomatable @--xrayid:ATER-54652
  Scenario Outline: As a user I want to reset my DAS Panel WiFi 
    Given user launches and logs in to the Lyric application 
      And user navigates to "Security Settings" screen from the "Dashboard" screen	
      And user should display with configured "Wifi network" name
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user presses the context button for 5 seconds on the DAS Panel
     Then the DAS panel should start flashing blue
     When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
      And user adds a <Network Type> WiFi network with WiFi SSID as <WiFi SSID> and WiFi Password as <WiFi Password>
     Then user "wifi name" should be updated to <WiFi SSID> in the "Base Station WiFi" screen.
      And user should be display base station and camera "online"
    Examples: 
      | Network Type        | WiFi SSID | WiFi Password | 
      | open                | abcd      | none          | 
      | WEP_SHARED          | abcd      | abcd          | 
      | WPA_PERSONAL_TKIP   | abcd      | abcd          | 
      | WPA_PERSONAL_AES    | abcd      | abcd          | 
      | WPA2_PERSONAL_AES   | abcd      | abcd          | 
      | WPA2_PERSONAL_TKIP  | abcd      | abcd          | 
      | WPA2_PERSONAL_MIXED | abcd      | abcd          | 
      | WPA2                | abcd      | abcd          | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required	  
  @ResetWiFiByAddingNetwork  @NotAutomatable @--xrayid:ATER-54653
  Scenario Outline: As a user I want to reset my DAS Panel WiFi 
    Given user launches and logs in to the Lyric application 
      And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user presses the context button for 5 seconds on the DAS Panel
     Then the DAS panel should start flashing blue
     When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
      And user selects <WiFi SSID> from the available WiFi list
      And user inputs <WiFi Password> as the WiFi Password
     Then user "wifi name" should be updated to <WiFi SSID> in the "Base Station WiFi" screen.
    Examples: 
      | WiFi SSID | WiFi Password | 
      | abcd      | abcd          | 
  
  #Only for android OS above 6
  #Requirements: Single Location Single DAS Device, No Sensors Required, and location service should OFF on the Phone device
  @VerifyLocationservicePopupWhenLocationServiceOFFonPhone @NotAutomatable @--xrayid:ATER-54654
  Scenario Outline: As a user I want to reset my DAS Panel WiFi 
    Given user launches and logs in to the Lyric application 
      And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
      And user should be displayed with "Turn on Location service" pop up 
     When user "Dismiss" the "Turn on Location Service" pop up
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user selects the "NEXT" button 
     Then user should be displayed with "Turn on Location service" pop up 
     When user selects the "Settings" option on the pop up 
     Then user should navigates to "Location Service" screen on the phone
      And user enables the "location service" option  on "Location service" screen
      And user navigates to "Reset WiFi Instructions" screen
     When user selects the "NEXT" button
     And user navigates to "Select wifi" screen from the "Reset WiFi Instruction" screen
      And user selects <WiFi SSID> from the available WiFi list
      And user inputs <WiFi Password> as the WiFi Password
     Then user "wifi name" should be updated to <WiFi SSID> in the "Base Station WiFi" screen.
    Examples: 
      | WiFi SSID | WiFi Password | 
      | abcd      | abcd          | 
  
  #Requirements Single Location Single DAS Device, No Sensors Required
  @ResetWifiFailedPopupverification @NotAutomatable @--xrayid:ATER-54655
  Scenario: As a user I want to verify Reset wifi failed pop up 
    Given user launches and logs in to the Lyric application 
      And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user selects the "NEXT" button on the "Reset Wifi Instructions" screen
  #none of the panel should not be in broadcast mode
     Then user received "Reset WiiFi Failed" pop up 
      When user selects the "OK" option
     And user selects the "NEXT" button on the "Reset Wifi Instructions" screen
  #none of the panel should not be in broadcast mode
     Then user received "Reset WiiFi Failed" pop up 
      When user selects the "Cancel" option
     Then user Should navigates to "Base Station WiFi" screen
  
    #Requirements: Single Location Single DAS Device, No Sensors Required
  @ResetWiFiByAddingNetworkOpenNetwork  @NotAutomatable  @--xrayid:ATER-54656
  Scenario Outline: As a user I want to reset my DAS Panel WiFi with open network
    Given user launches and logs in to the Lyric application 
      And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user presses the context button for 5 seconds on the DAS Panel
     Then the DAS panel should start flashing blue
      When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
     And user selects "ADD Network" from "Select wifi" screen
     And user selects "None" option from "wifi connect" screen
      And user selects <None Open network> from the available WiFi list
     Then user "wifi name" should be updated to <WiFi SSID> in the "Base Station WiFi" screen.
    Examples: 
      | None Open network | 
      | Abcd              | 
  
    #Requirements: Single Location Single DAS Device, No Sensors Required
  @ResetWiFiIncorrectPassword  @NotAutomatable @--xrayid:ATER-54657
  Scenario Outline: As a user I want to reset my DAS Panel WiFi 
    Given user launches and logs in to the Lyric application 
      And user navigates to "Base Station WiFi" screen from the "Dashboard" screen 
     When user "resets WiFi" by clicking on "Reset WiFi" button  
     Then user should be displayed with the "Reset WiFi Instructions" screen
     When user presses the context button for 5 seconds on the DAS Panel
     Then the DAS panel should start flashing blue
     When user navigates to the "Select WiFi" screen from the "Reset WiFi Instruction" screen
      And user selects <WiFi SSID> from the available WiFi list
      And user inputs <Incorrect WiFi Password> as the WiFi Password
     Then user should receive a "Incorrect WiFi Password" pop up
    Examples: 
      | WiFi SSID | Incorrect WiFi Password | 
      | abcd      | abcd                    | 
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @VerifyDASPanelModelAndFirmwareDetails @Automated @--xrayid:ATER-54658
  Scenario Outline: As a user I want to view that all model, firmware and panel details
    Given user is set to <Mode> mode through CHIL
     Then user launches and logs in to the Lyric application
     When user navigates to "Base Station Configuration" screen from the "Dashboard" screen
     Then user should be displayed with the following "Base Station Configuration" options:
      | Settings                   | 
      | Name                       | 
      | Battery                    | 
      | Model and Firmware Details | 
     When user navigates to "Model and Firmware Details" screen from the "Base Station Configuration" screen
     Then user should be displayed with the following "Panel Model and Firmware Details" options:
      | Settings         | 
      | Model Details    | 
      | Firmware Details | 
    Examples:
      | Mode  | 
      | Home  | 
      #| Away  | 
      #| Night | 
      #| Off   | 
  #|Offline|
  

  @DeleteDASBaseStationAwayNightOffline @Automated @--xrayid:ATER-54659
  Scenario Outline: DAS should not be deleted when user tries to delete the DAS panel which is in Away, Night or Offline status
   Given user is set to <Mode> mode through CHIL
     When user launches and logs in to the Lyric application
     And user navigates to "Base Station Configuration" screen from the "Dashboard" screen
     Then user selects "Delete" from "Security Settings" screen
      And user should be displayed with "You can perform this action only in home or off mode"
    Examples: 
      | Mode  | 
      | Away  | 
      #| Night | 
  #|Offline|
  
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @DeleteBaseStation @Automated @--xrayid:ATER-54660
  Scenario Outline: As a user I should be able to delete my DAS panel from my account through the Lyric application 
    Given user is set to <Mode> mode through CHIL
      And user launches and logs in to the Lyric application
     When user navigates to "Base Station Configuration" screen from the "Dashboard" screen
      And user "deletes DAS device" by clicking on "delete" button
     Then user should receive a "Delete DAS Confirmation" popup
      And user "dismisses" the "Delete DAS Confirmation" popup
    Examples: 
      | Mode | 
      | Home | 
      | Off  | 
  
  #LYDAS-7075,LYDAS-4088,LYDAS-4058,LYDAS-4011,LYDAS-3294,LYDAS-3271,LYDAS-3116,LYDAS-2982,LYDAS-2808,LYDAS-2610,LYDAS-2563,LYDAS-2497,LYDAS-2408,LYDAS-2404,LYDAS-2231,LYDAS-2167
  #Requirements: Single Location Single DAS Device, No Sensors Required
  @DeleteBaseStation2 @NotAutomatable @--xrayid:ATER-54661
  Scenario Outline: As a user I should be able to delete my DAS panel from my account through the Lyric application 
    Given user is set to <Mode> mode through CHIL
      And user launches and logs in to the Lyric application 
     When user navigates to "Base Station Configuration" screen from the "Dashboard" screen
      And user "deletes DAS device" by clicking on "delete base station" button
     Then user should receive a "Delete DAS Confirmation" popup
      And user "dismisses" the "Delete DAS Confirmation" popup
     When user selects the "delete base station" button on "Base station configuration" screen
     Then user should receive a "Delete DAS Confirmation" popup
     When user accepts the "Delete DAS confirmation" pop up
     Then user should be navigates to "Dashboard" screen
      And user should receive "Push Notification"
    Examples: 
      | Mode | 
      | Home | 
      | OFF  | 

      
 @DeleteKATANABaseStationAwayNightOffline  @--xrayid:ATER-97713
  Scenario Outline: KATANA should not be deleted from app when user tries to delete the DAS panel which is in Away, Night or Offline status
   Given user is set to <Mode> mode through CHIL
     When user launches and logs in to the Lyric application
     And user navigates to "Base Station Configuration" screen from the "Dashboard" screen
     Then user selects "Delete" from "Security Settings" screen
      And user should be displayed with "Delear Info Screen"
    Examples: 
      | Mode  | 
      | Away  | 
      #| Night | 
  #|Offline|