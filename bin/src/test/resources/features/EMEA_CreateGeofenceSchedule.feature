@EMEA_GeofenceSchedule @EMEA_Schedule @Comfort
Feature: Edit Geofence based scheduling
As an user i want to Create and Edit Geofence Schedule 
so that my home temperature will get set automatically based on geofence settings

@EMEA_CreateGeofenceSchedule @Automated
  Scenario: As a user i want to create an Geofence schdeule with Defualt values for Home Away settings
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
       When user creates "Geofence based" scheduling with default values "Without" sleep settings
     Then "Geofence based" scheduling gets activated

@EMEA_CreateNewGeofenceSchedulewithExistingTimeBasedSchedule @Automated
  Scenario: As a user i want to create New Geofence schdeule when user already running on time based Schedule 
    Given user thermostat is set to "time based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" scheduling with default values "Without" sleep settings
     Then "Geofence based" scheduling gets activated
      
@EMEA_SleepSettings @Automated
  Scenario: As a user i want to Add Edit Geofence Sleeo Settings 
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      When user creates "Geofence based" scheduling with default values "With" sleep settings
    Then "Geofence based" scheduling gets activated
  
@EMEA_EditGeofenceWithTemperature @Automated
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
 
  
 @JasperEMEA_TimerClockIsInCrementalOf15mins @Automated
  Scenario: As a user i want to verify if Sleep settings timer is incremental of 15mins
    Given "Geofence" Schedule "With" sleep Settings
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
    #  When user edits sleep timer with increament of "15 minutes"
     When user edit "Geofence" schedule with new sleep time values

  
@GuidemessagToTurnONLocationservicesNA @NotAutomatable
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
  
@EMEA_GeofenceScheduleOptions @Automated
  Scenario Outline: As a user i want an Options to Pause Off and Switch Geofence Schdeule
     Given user thermostat is set to "time based" schedule
    And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects <schedule Options> from Scheduling screen
     Then user should be displayed with the <Expected> screen
  
    Examples: 
      | schedule Options        | Expected            | 
      | Switch to Geofencing    | Geofencing schedule | 
   #   | Create new time schedule | Time based schedule  | 
   #   | Turn Schedule Off   | Tap on Resume       |

@EMEA_CreateGeofenceScheduleInOffMode @Automated
Scenario Outline: As a user I want to create an Geofence schedule with default schedule value when System is in Off Mode 
Given user thermostat is set to "time based" schedule
And  user has "Off" system mode
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates "Geofence based" scheduling with default values "With" sleep settings
Then <scheduling> scheduling gets activated

    Examples: 
      | scheduling| 
      | Geofence |

@EMEA_CreateGeonceScheduleInLearnMode  @Automated
Scenario: As a user i want to create an Geofence schdeule from Learn More
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When  user creates "Geofence based" schedule using "Learn more" option by editing sleep setting values and default home and away values
     Then "Geofence based" scheduling gets activated
      
@EMEA_CreateGeonceScheduleInLearnModeWhenUserSkipsGeofence @NotAutomatable
Scenario: As a user i want to create an Geofence schdeule from Learn More when geofence skip in DIY
    Given user Skips Geofence while DIY and Configures a stat
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Geofence based" schedule with "Learn More"
     Then <Geofence based> scheduling gets activated
 And user navigates to "Primary card" screen from the "Scheduling" screen
      And user is displayed with "Using Away/Home settings"

     
@EMEA_CopyGeofenceScheduleToMulitpleStat  @Automated
# Given Account has a Location with Multiple Stats
Scenario Outline: As a user i want to copy my New schedule to other stats as well
Given user launches and logs in to the Lyric application
When user creates default <ScheduleType> schedule value <CopyStats> stats
Then verify <ScheduleType> schedule is <VerifyCopyStats> stats
  
  Examples: 
|ScheduleType       |  CopyStats |  VerifyCopyStats |
#|Geofence based  | without copying schedule to other|not copied to other|
|Geofence based     | by copying schedule to all|copied to all other|
#|Geofence based    | by copying schedule to selected|copied to selected|

@EMEA_CopyScheduleWhenStatOffline @NotAutomatable
# Given Account has a Location with Multiple Stats and Offline stats
Scenario: As a user i want to verify that offline Stats are not displayed in the Copystat pop ups
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "CopyStatst" stats while creating "Geofence" schedule with default schedule value
Then Offline Stat should't be displayed

@EMEA_CreateGeofenceWithEditingHome_Sleep_AwaySettings @Automated
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

@EMEA_EditGeofenceScheduleSettingsAndBackNavigation @Automated
  Scenario Outline: As a user i want to create an Geofence schdeule with Editing Home,Sleep and Away setpoint in Geofence and Verify if Values are saved navigating Back 
    Given user thermostat is set to "geofence based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user edit "Geofence based" schedule by editing <Condition> but not saved
     Then "Geofence based" scheduling gets activated
    # Then user should still be displayed with old set points
     Examples: 
|Condition|
#|Sleep|
#|Home|
|Away|

@EMEA_CreateGeofenceScheduleSettingsAndBackNavigation @Automated
  Scenario Outline: As a user i want to create an Geofence schdeule with Editing Home,Sleep and Away setpoint in Geofence and Verify if Values are saved navigating Back 
    Given user thermostat is set to "no" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      When user navigates back while creating "Geofence based" scheduling with default values "With" sleep settings 
     #When user create "Geofence based" schedule by editing <Condition> 
     Then "Geofence based" scheduling gets activated
    # Then user should still be displayed with old set points
     Examples: 
|Condition|
#|Sleep|
#|Home|
|Away|

