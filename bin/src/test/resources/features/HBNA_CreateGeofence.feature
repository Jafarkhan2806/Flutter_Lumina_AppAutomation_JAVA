@NA_GeofenceSchedule @NA_Schedule @Comfort
Feature: Edit Geofence based scheduling
As an user i want to Create and Edit Geofence Schedule 
so that my home temperature will get set automatically based on geofence settings

@NA_CreateGeofenceSchedule @Automated @--xrayid:ATER-54419
  Scenario: As a user i want to create an Geofence schdeule with Defualt values Home_Away settings
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" scheduling with default values "With" sleep settings
     Then "Geofence based" scheduling gets activated
#      And user navigates to "Primary card" screen from the "Scheduling" screen
#      And user is displayed with "Using Away/Home settings"
  
  @NA_SleepSettings @Automated @--xrayid:ATER-54420
  Scenario: As a user i want to Add_Edit Geofence Sleep Settings 
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" scheduling with default values "Without" sleep settings
     Then "Geofence based" scheduling gets activated

  @NA_EditGeofenceWithTemperature @Automated  @--xrayid:ATER-54422
  Scenario Outline: As a user i want to verify Tempreture bandwidth limit for  Home,Sleep and Away settings
  Above Maximum: Above 90, Below Minimum : below 50,At Maximum : max 90, At Minimum : min 50 ,within range : between 50-90
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" schedule by setting temperature value to <Temperature>
     Then user displayed temperature within the maximum and minimum range
  
    Examples: 
      | Temperature   | 
      | Above Maximum | 
#      | Below Minimum | 
#      | At Maximum    | 
#      | At Minimum    | 
#      | within range  | 
  
  @NA_EditGeofenceSetpointsWhenAutoChnageOverEnabled @Automated @--xrayid:ATER-54423
  Scenario Outline: As a User i want to Edit set point when Auto change over is enabled so that my 
  cool set point is always greater than or equal to heat set point
    Given user thermostat is set to "Geofence based" schedule
    And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      When user edit "Geofence based" schedule by editing <Geofence Period>
     Then Periods cool set point is always greater than or equal to heat set point
    Examples: 
      |Geofence Period| 
      |Home| 
#      |Sleep|
#      |Away| 
  
  @JasperNA_GeofenceTimerClockIsInCrementalOf15mins @Automated @--xrayid:ATER-54425
  Scenario: As a user i want to verify if Sleep settings timer is incremental of 15mins
    Given user thermostat is set to "Time based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" scheduling with default values "With" sleep settings
     Then user should be displayed sleep setting timer with increments of "15 minutes"

  
  @GuidemessagToTurnONLocationservicesNA @NotAutomatable @--xrayid:ATER-54425
  Scenario Outline:To get guide message to turn ON location services to edit geofence schedule by editing home settings 
  or by editing sleep settings or by editing away settings   
  I want to get guide message to turn ON location services   
  So that I will enable the service for using Geofence schedule
    Given With the <Below condition>
     When User edit "Geofence" schedule <Condition> sleep settings   
     Then User is displayed with guide message to turn ON location services
    Examples: 
      | Below condition                                 | Condition | 
      | Location services is disabled in mobile device  | With      | 
      | Location services is disabled for the lyric app | With      | 
      | Location services is disabled in mobile device  | Without   | 
      | Location services is disabled for the lyric app | Without   | 
  
  @NA_GeofenceScheduleOptions @Automated @--xrayid:ATER-54427
  Scenario Outline: As a user i want an Options to Pause_Off and Switch Geofence Schdeule
    Given user thermostat is set to "Geofence based" schedule
    And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects <schedule Options> from Scheduling screen
     Then user should be displayed with the <Expected> screen
  
    Examples: 
      | schedule Options     | Expected            | 
#      | Switch to Time based| Time based schedule | 
      |Turn Schedule Off| Tap on Resume       | 

@NA_CreateGeofenceScheduleInOffMode @Automated @--xrayid:ATER-54429
Scenario Outline: As a user I want to create an Geofence schedule with default schedule value when System is in Off Mode 
Given user thermostat is set to "time based" schedule
And  user has "Off" system mode
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates "Geofence based" scheduling with default values "With" sleep settings
Then <scheduling> scheduling gets activated
#And user navigates to "Primary card" screen from the "Scheduling" screen
#Then user is displayed with "System is Off" on the screen

    Examples: 
      | scheduling| 
#      | time based|
      | Geofence based |
#      |No|

@NA_CreateGeonceScheduleInLearnMode @Automated @--xrayid:ATER-54430
Scenario: As a user i want to create an Geofence schdeule from Learn More
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When  user creates "Geofence based" schedule using "Learn more" option by editing sleep setting values and default home and away values
     Then "Geofence based" scheduling gets activated
# And user navigates to "Primary card" screen from the "Scheduling" screen
#      And user is displayed with "Using Away/Home settings"
      
      @NA_CreateGeonceScheduleInLearnModeWhenUserSkipsGeofence @NotAutomatable @--xrayid:ATER-54432
Scenario: As a user i want to create an Geofence schdeule from Learn More
    Given user Skips Geofence while DIY and Configures a stat
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" schedule with "Learn More"
     Then "Geofence based" scheduling gets activated
# And user navigates to "Primary card" screen from the "Scheduling" screen
#      And user is displayed with "Using Away/Home settings"
     
     
     #Given Account has a Location with Multiple Stats
@NA_CopyScheduleToMulitpleStat @Automated @--xrayid:ATER-54434
Scenario Outline: As a user i want to copy my New schedule to other stats as well
Given user thermostat is set to "time based" schedule
Given user launches and logs in to the Lyric application
When user creates default <ScheduleType> schedule value <CopyStats> stats
Then verify <ScheduleType> schedule is <VerifyCopyStats> stats
  
  Examples: 
|ScheduleType       |  CopyStats |  VerifyCopyStats |
#|Geofence based  | without copying schedule to other|not copied to other|
|Geofence based     | by copying schedule to all|copied to all other|
#|Geofence based    | by copying schedule to selected|copied to selected|


# Given Account has a Location with Multiple Stats and Offline stats
@NA_CopyScheduleWhenStatOffline @NotAutomatable @--xrayid:ATER-54435
Scenario: As a user i want to verify that offline Stats are not displayed in the Copystat pop ups
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "CopyStatst" stats while creating "Geofence" schedule with default schedule value
Then Offline Stat should't be displayed

@NA_WhenHeat_CoolOnly @Automated @--xrayid:ATER-54438
Scenario Outline: As a user I want to create an Goefence schedule with Heat OR Cold only modes
#Given user thermostat is configures with "Modes" system mode
Given user thermostat is set to "time based" schedule
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates "Geofence based" scheduling with default values "Without" sleep settings
Then  "Geofence based" scheduling gets activated with <Modes>
#And user is displayed with <Modes> in Schedule

Examples: 
|Modes|
#|Heat Only|
|Cool Only|

@NA_CreateGeofenceWithEditingHome_Sleep_AwaySettings @Automated @--xrayid:ATER-54439
  Scenario Outline: As a user i want to create an Geofence schdeule with Editing Home,Sleep and Away setpoint in Geofence
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     And user creates "Geofence based" schedule using "Use Geofence" option by editing sleep setting values and default home and away values
     When user edit "Geofence based" schedule by editing <Condition>
    Then "Geofence based" scheduling gets activated
#    And user is displayed with "Condition" settings
Examples: 
|Condition|
|Sleep|
#|Home|
#|Away|

@NA_EditGeofenceScheduleSettingsAndBackNavigation @Automated @--xrayid:ATER-54441
  Scenario Outline: As a user i want to create an Geofence schdeule with Editing Home,Sleep and Away setpoint in Geofence and Verify if Values are saved navigating Back 
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     And user creates "Geofence based" schedule using "Use Geofence" option by editing sleep setting values and default home and away values
     When user edit "Geofence based" schedule by editing <Condition>
     And user Navigates taps on "Back" button
     Then user should still be displayed with edited set points
     Examples: 
|Condition|
|Sleep|
#|Home|
#|Away|