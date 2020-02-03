@EditNATimeschedule @NA_Schedule @Comfort
Feature: Edit Time Based schedule
As an user 
I want to Edit Time schedule
so that i can change Time and Set points of individual periods and Days 

@NA_GroupEditedDays @Automated @--xrayid:ATER-54463
  Scenario Outline: As a User i want to Edit my Individual days so that those days are grouped
    Given user thermostat is set to "Time Based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user selects "SINGLE DAY" view
     When user edits schedule periods of <EditedDays>
      And user selects "Grouped days" view
     Then <EditedDays> are grouped separately
  
    Examples: 
      | EditedDays | 
      | One day    | 
  #    | Two days   | 
  #    | Three days | 
   #   | Four days  | 
   #   | Five days  | 
  #    | Six days   | 
  
  @NA_EditTempratureInSchedule @Automated @--xrayid:ATER-54464
  Scenario Outline: As a User i want to Edit Temperature value for period and those days are grouped
    Given user thermostat is set to "Time Based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates <ScheduleType> schedule by setting temperature value to <Temperature>
     Then verify temperature is incremental by 1F for fahrenheit and 0.5C for celsius
  
    Examples: 
      | ScheduleType          | Temperature   | 
      | Same Every Day        | Above Maximum | 
   #   | Same Every Day        | Below Minimum | 
   #   | Same Every Day        | At Maximum    | 
   #   | Same Every Day        | At Minimum    | 
    #  | Same Every Day        | within range  | 
   #   | Different On Weekdays | Above Maximum | 
   #   | Different On Weekdays | Below Minimum | 
   #   | Different On Weekdays | At Maximum    | 
    #  | Different On Weekdays | At Minimum    | 
   #   | Different On Weekdays | within range  | 
  
  @NA_EditSetpointsWhenAutoChnageOverEnabled @Automated @--xrayid:ATER-54465
  Scenario Outline: As a User i want to Edit set point when Auto chnage over is enabled so that my 
  cool set point is always greater than or equal to heat set point
    Given user thermostat is set to "Time Based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates <ScheduleType> schedule with default schedule value
     Then Periods cool set point is always greater than or equal to heat set point
      And <ScheduleType> scheduling gets activated
  
    Examples: 
      | ScheduleType          | 
      | Same Every Day        | 
   #   | Different On Weekdays |  
      
  @NA_PeriodTimeShouldNotOverlap @Automated @--xrayid:ATER-54467
  Scenario: As a User i want to edit my period so that each period is independent,On overlap Schule period is removed
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit "Wake" period by changing time value to "06 00 AM"
      And user edit "Away" period by changing time value to "06 00 AM"
     Then user should be displayed "Wake" time as "Tap to set"
  
  @NA_DeletePerioConfirmdAlert @Automated @--xrayid:ATER-54468
  Scenario: As a User i want be shown with confirm pop so that i will be alerted of deleting period 
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting "Atleast 1 period"
     Then verify user should be displayed with confirm pop for period deletion
      And Period is "not deleted" on "canceling" Dialog box
  
  
      
 

 @NA_DeletingAllPeriod @Automated  @--xrayid:ATER-54469
  Scenario Outline: To edit Time schedule by deleting all period for systems Heat cool,Cool,Heat for Temperature scale Celsius or Fahrenheit and for time format 24 or 12hr
    Given user thermostat is set to "Time Based" schedule
    And user launches and logs in to the Lyric application
    And user navigates to "Scheduling" screen from the "Dashboard" screen
    And user selects <Type> view
     When user edit Time schedule by deleting "All 4 periods" on confirming the period deletion
     Then verify "No Schedule" screen is shown in view schedule screen
      Examples:
      | Type            | 
      | Grouped days    | 
#      | SINGLE DAY | 
        
  @NA_ScheduleOptions @Automated @--xrayid:ATER-54471
  Scenario Outline: As a user i want an Options to Create,Pause_Off and Switch Schdeule
    Given user thermostat is set to "Time based" schedule
    And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects <schedule Options> from Scheduling screen
     Then user should be displayed with the <Expected> screen
  
    Examples: 
      | schedule Options        | Expected            | 
      | Switch to Geofencing    | Geofencing schedule | 
   #   | Create new time schedule | Time based schedule  | 
   #   | Turn Schedule Off   | Tap on Resume       | 
  
  @NA_ResumeSchedule @Automated @--xrayid:ATER-54472
  Scenario: As a user i want an Options to resume Schdeule
    Given user thermostat is set to "Time Based" schedule  
      And user selects "Pause" option on Scheduling 
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects "Tap On Resume" from Scheduling screen
     Then "Same Every Day" scheduling is retained
  
  @NA_DeletingCurrentPeriodDifferentOnWeekdays @Automated @--xrayid:ATER-54473
  Scenario: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Different On Weekdays" schedule with default schedule value
      And user selects view by "SINGLE DAY"
     When user deletes "Current Period" from the Schdeule
     Then user is displayed with "Tap to Set" on deleted period
     
     
@NA_EditAway/HomeSettingsGeofence @Automated @--xrayid:ATER-54474
Scenario Outline: As a user i want to edit away/home settings in Geofence Schedule
Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Geofence" schedule with default schedule value
      When user edits <Geofence Status> settings by changing "Temprature" 
      Then user should be displayed "Geofence" schedule with <Geofence Status> settings with "Temprature"
      
Examples:
|Geofence Status|
|Home|
#|Away|
#|Sleep|
 
  @NA_DeletingDefaultPeriodDifferentOnEveryday @Automated @--xrayid:ATER-54475
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Period is "deleted" on "confirming" Dialog box
      And user navigates to "Thermostat Solution Card" screen from the "Thermostat Dashboard" screen 
     Then verify "Time" schedule successfully gets edited
      When user selects "SINGLE DAY" view
	And <EditedDays> are grouped separately
	
  
    Examples: 
      | Periods          | Period Value |EditedDays |
   | Atleast 1 period | Tap to set   |One days |
     # | Atleast 2 period | Tap to set   |One days |
    #  | Atleast 3 period | Tap to set   |One days|
    #  | Atleast 4 period | Tap to set   |One days|
    #  | Atleast 1 period | Tap to set   |Two days |
      #| Atleast 2 period | Tap to set   |Two days |
      #| Atleast 3 period | Tap to set   | Two days|
      #| Atleast 4 period | Tap to set   | Two days|
     #  | Atleast 1 period | Tap to set   |Three days |
      #| Atleast 2 period | Tap to set   | Three days |
      #| Atleast 3 period | Tap to set   | Three days|
      #| Atleast 4 period | Tap to set   | Three days|
   #| Atleast 1 period | Tap to set   |Four days |
      #| Atleast 2 period | Tap to set   | Four days |
      #| Atleast 3 period | Tap to set   | Four days|
      #| Atleast 4 period | Tap to set   | Four days|
 	#| Atleast 1 period | Tap to set   |Five days |
      #| Atleast 2 period | Tap to set   | Five days |
      #| Atleast 3 period | Tap to set   | Five days|
      #| Atleast 4 period | Tap to set   | Five days|
 	#| Atleast 1 period | Tap to set   |Six days |
      #| Atleast 2 period | Tap to set   | Six days |
      #| Atleast 3 period | Tap to set   | Six days|
      #| Atleast 4 period | Tap to set   | Six days|
  
@NA_DeletingDefaultPeriodDifferentOnWeekdays @Automated @--xrayid:ATER-54478
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Different On Weekdays" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Period is "deleted" on "confirming" Dialog box
      And user navigates to "Thermostat Solution Card" screen from the "Thermostat Dashboard" screen 
     Then verify "Time" schedule successfully gets edited
      When user selects "SINGLE DAY" view
	And <EditedDays> are grouped separately
  
   Examples: 
      | Periods          | Period Value |EditedDays |
   #   | Atleast 1 period | Tap to set   |One days |
   #   | Atleast 2 period | Tap to set   |One days |
     # | Atleast 3 period | Tap to set   |One days|
    #  | Atleast 4 period | Tap to set   |One days|
     # | Atleast 1 period | Tap to set   |Two days |
      #| Atleast 2 period | Tap to set   |Two days |
      #| Atleast 3 period | Tap to set   | Two days|
      #| Atleast 4 period | Tap to set   | Two days|
       | Atleast 1 period | Tap to set   |Three days |
      #| Atleast 2 period | Tap to set   | Three days |
      #| Atleast 3 period | Tap to set   | Three days|
      #| Atleast 4 period | Tap to set   | Three days|
 #  | Atleast 1 period | Tap to set   |Four days |
      #| Atleast 2 period | Tap to set   | Four days |
      #| Atleast 3 period | Tap to set   | Four days|
      #| Atleast 4 period | Tap to set   | Four days|
 #	| Atleast 1 period | Tap to set   |Five days |
      #| Atleast 2 period | Tap to set   | Five days |
      #| Atleast 3 period | Tap to set   | Five days|
      #| Atleast 4 period | Tap to set   | Five days|
 	#| Atleast 1 period | Tap to set   |Six days |
      #| Atleast 2 period | Tap to set   | Six days |
      #| Atleast 3 period | Tap to set   | Six days|
      #| Atleast 4 period | Tap to set   | Six days|
      
      
  @NA_DeletingDefaultPeriodDifferentOnSingleday @Newscenario @Automated @--xrayid:ATER-54479
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
     And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Everyday" schedule with default schedule value
      And user selects "SINGLE DAY" view
    When user edit Time schedule by deleting <Day> of <Periods>
   Then verify user should be displayed with confirm pop for period deletion
    And Verify the the schedule delete pop up <text> <Day>
  
    Examples: 
       | Day | Periods          |  text |
	#| Monday |Home | Delete Home Period for  |
	#| Monday |Away | Delete Away Period for |
	#| Monday |Sleep |Delete Sleep Period for |
#	| Monday |Wake |Delete Wake Period for |
#| Tuesday |Home | Delete Home Period for |
#	| Tuesday |Away | Delete Away Period for |
#	| Tuesday |Sleep |Delete Sleep Period for |
#	| Tuesday |Wake |Delete Wake Period for |
#| Wednesday  |Home | Delete Home Period for |
#	| Wednesday |Away | Delete Away Period for |
#	| Wednesday |Sleep |Delete Sleep Period for |
#	| Wednesday |Wake |Delete Wake Period for |
#| Thursday   |Home | Delete Home Period for |
#	| Thursday |Away | Delete Away Period for |
#	| Thursday |Sleep |Delete Sleep Period for |
#	| Thursday |Wake |Delete Wake Period for |
#| Friday   |Home | Delete Home Period for |
#	| Friday |Away | Delete Away Period for |
#	| Friday |Sleep |Delete Sleep Period for |
#	| Friday |Wake |Delete Wake Period for |
#| Saturday    |Home | Delete Home Period for |
#	| Saturday |Away | Delete Away Period for |
#	| Saturday |Sleep |Delete Sleep Period for |
#	| Saturday |Wake |Delete Wake Period for |
#| Sunday    |Home | Delete Home Period for |
#	| Sunday |Away | Delete Away Period for |
	| Sunday |Sleep |Delete Sleep Period for |
#	| Sunday |Wake |Delete Wake Period for |

@NA_VerifySleepSettings @Automated @--xrayid:ATER-54480
Scenario: To Verify create geofence schedule in off mode when permanentHold
Given user has "Heat" system mode
And user thermostat is set to "Geofence based" schedule
When user launches and logs in to the Lyric application
And user thermostat set "Home" with "UserArrived"
And user sets sleep start time to "11:00AM" and end time to "11:00AM"
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then Verify the "Using Sleep Settings" on the "PRIMARY CARD" screen

@NA_DeletingDefaultPeriodDifferentOnEverydaygrouped @Newscenario @Automated @--xrayid:ATER-54481
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "Grouped Days" view
     When user edit Time schedule by deleting <day> of <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Verify the the schedule delete pop up <text> <day>
  
    Examples: 
    | Periods          | text|day|
	|Home | Delete Home Period for |Everyday|
	#|Away |Delete Away Period for |Everyday|
#	|Sleep |Delete Sleep Period for |Everyday|
#	|Wake |Delete Wake Period for |Everyday|

@NA_DeletingDefaultPeriodDifferentOnWeekendWeekdays @Newscenario @Automated @--xrayid:ATER-54484
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Different On Weekdays" schedule with default schedule value
      And user selects "Grouped Days" view
     When user edit Time schedule by deleting <Day> of <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Verify the the schedule delete pop up <text> <Day>
  
    Examples: 
       | Day | Periods          |  text |
	| Monday - Friday |Home | Delete Home Period for|
	#| Monday - Friday |Away | Delete Away Period for |
	#| Monday - Friday|Sleep |Delete Sleep Period for |
#	| Monday - Friday|Wake |Delete Wake Period for |
#| Saturday-Sunday  |Home | Delete Home Period for  |
#	| Saturday-Sunday  |Away | Delete Away Period for |
#	| Saturday-Sunday  |Sleep |Delete Sleep Period for  |
#	| Saturday-Sunday  |Wake |Delete Wake Period for  |

