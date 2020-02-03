@NATimeBasedScheduling @NA_Schedule @Comfort
Feature: Jasper,Sprouce and Flycatcher Scheduling
	As a user I want to create an time based scheduling


@JasperNA_CreateNAScheduleSinglestatwithDefaultvalue @Automated @--xrayid:ATER-54444
Scenario Outline: As a user I want to create an Time based schedule with default schedule value for systems 
Given user thermostat is set to <scheduling> schedule  
And user launches and logs in to the Lyric application
And user navigates to "SCHEDULING" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule with default schedule value
Then <ScheduleType> scheduling gets activated
#And user navigates to "Primary card" screen from the "Scheduling" screen
#Then user is displayed with "Following scheduling"

    Examples: 
      | scheduling| ScheduleType |
#      | no        | Same Every Day|
      | time based        | Same Every Day|
#      | no| Different On Weekdays|
#      | time based| Different On Weekdays|
      
@JasperNA_CancelToRetainExisitngscheduling @Automated @--xrayid:ATER-54446
Scenario Outline: As a user i want to be prompted with an option to Cancel overriding Geofence Schedule
Given user thermostat is set to "geofence based" schedule
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Cancel" option while creating <ScheduleType> schedule with default schedule value
Then "Geofence" scheduling is retained

Examples: 
| ScheduleType |
| Same Every Day|
#| Different On Weekdays|

@JasperNA_ConfirmToCreateNewSchedule @Automated  @--xrayid:ATER-54450
Scenario Outline: As a user i want to be prompted with an option to Confirm and Create new Schedule
Given user thermostat is set to "geofence based" schedule
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen 
When user selects "Confirm" option while creating <ScheduleType> schedule with default schedule value
Then <ScheduleType> scheduling gets activated

Examples: 
| ScheduleType |
#| Same Every Day|
| Different On Weekdays|

@JasperNA_TempretureBandwidthforEachPeriod @Automated @--xrayid:ATER-54451
Scenario Outline: As a user i want to verify Tempreture bandwidth limit for each period
Above Maximum: Above 90, Below Minimum : below 50,At Maximum : max 90, At Minimum : min 50 ,within range : between 50-90
Given user thermostat is set to "time based" schedule
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule by setting temperature value to <Temperature>
Then user displayed temperature within the maximum and minimum range

Examples: 
|ScheduleType       | Temperature   | 
|Same Every Day     | Above Maximum |
#|Same Every Day     | Below Minimum | 
#|Same Every Day     | At Maximum    | 
#|Same Every Day     | At Minimum    | 
#|Same Every Day     | within range  |
#|Different On Weekdays     | Above Maximum | 
#|Different On Weekdays     | Below Minimum | 
#|Different On Weekdays     | At Maximum    | 
#|Different On Weekdays     | At Minimum    | 
#|Different On Weekdays     | within range  | 


@JasperNA_TimerClockIsInCrementalOf15mins @Automated @--xrayid:ATER-54453
Scenario: As a user i want to verify if Timer clock in Each period is incremental of 10mins
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates "Same Every Day" schedule by changing with new time values
Then user should be displayed sleep setting timer with increments of "15 minutes"
  

@JasperNA_DeletingDefaultPeriodSameEveryDay @Automated @--xrayid:ATER-54454
Scenario Outline: As a user I want to delete period in Same Every Day Time based schedule
Given user thermostat is set to <schedule> schedule
And  user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <Period Value> schedule by deleting <Periods> from the default schedule values 	
Then <Period Value> scheduling gets activated

Examples: 
|schedule | Periods |Period Value|
#| time based | Atleast 1 period|Same Every Day|
#| time based | Atleast 2 period|Same Every Day|
#| time based | Atleast 3 period|Same Every Day|
#| time based | All periods     |Triage time base|
#| geofence based | Atleast 1 period|Same Every Day|
| geofence based | Atleast 2 period|Same Every Day|
#| geofence based | Atleast 3 period|Same Every Day|
#| geofence based | All periods     |Triage geofence base|

@JasperNA_DeletingDefaultPeriodDifferentOnWeekdays @Automated @--xrayid:ATER-54456
Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
Given user thermostat is set to <schedule> schedule
And  user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <Period Value> schedule by deleting <Periods> from the default schedule values
Then <Period Value> scheduling gets activated

Examples: 
|schedule | Periods |Period Value|
#| time based | Atleast 1 period|Different On Weekdays|
#| time based | Atleast 2 period|Different On Weekdays|
#| time based | Atleast 3 period|Different On Weekdays|
#| time based | Atleast 1 period|Different On Weekend |
#| time based | Atleast 2 period|Different On Weekend |
#| time based | Atleast 3 period|Different On Weekend |
#| time based | All periods     |Triage time base|
| geofence based | Atleast 1 period|Different On Weekdays|
#| geofence based | Atleast 2 period|Different On Weekdays|
#| geofence based | Atleast 3 period|Different On Weekdays|
#| geofence based | Atleast 1 period|Different On Weekend |
#| geofence based | Atleast 2 period|Different On Weekend |
#| geofence based | Atleast 3 period|Different On Weekend |
#| geofence based | All periods     |Triage geofence base|

@JapserNA_CopyScheduleToMulitpleStat @Automated @--xrayid:ATER-54457
# Given Account has a Location with Multiple Stats
Scenario Outline: As a user i want to copy my New schedule to other stats as well
Given user thermostat is set to "time based" schedule
Given user launches and logs in to the Lyric application
When user creates default <ScheduleType> schedule value <CopyStats> stats
Then verify <ScheduleType> schedule is <VerifyCopyStats> stats

Examples: 
|ScheduleType       |  CopyStats |  VerifyCopyStats |
#|Same Every Day     | without copying schedule to other|not copied to other|
|Same Every Day     | by copying schedule to all|copied to all other|
#|Same Every Day     | by copying schedule to selected|copied to selected|
#|Different On Weekdays     |without copying schedule to other |not copied to other|
#|Different On Weekdays     |by copying schedule to all |copied to all other|
#|Different On Weekdays     |by copying schedule to selected|copied to selected|

@JapserNA_CopyScheduleWhenStatOffline @NotAutomatable @--xrayid:ATER-54458
# Given Account has a Location with Multiple Stats and Offline stats
Scenario Outline: As a user i want to verify that offline Stats are not displayed in the Copystat pop ups
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "CopyStatst" stats while creating <ScheduleType> schedule with default schedule value
Then Offline Stat should't be displayed
Examples: 
|ScheduleType       |  
|Same Every Day     | 
|Same Every Day     | 
|Same Every Day     | 
|Different On Weekdays     |
|Different On Weekdays     |
|Different On Weekdays     |

@JasperNA_CreateTimeBasedScheduleInOffMode @Automated @--xrayid:ATER-54459
Scenario Outline: As a user I want to create an Time based schedule with default schedule value when System is in Off Mode 
Given user thermostat is set to "geofence based" schedule
And  user has "Off" system mode
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule with default schedule value
Then  <ScheduleType> scheduling gets activated
#And user navigates to "Primary card" screen from the "Scheduling" screen
#Then user is displayed with "System is Off" on the screen

    Examples: 
      | scheduling| ScheduleType |
#      | no        | Same Every Day|
#      | time based        | Same Every Day|
#      | Geofence |Same Every Day|
#      | no| Different On Weekdays|
      | time based| Different On Weekdays|
#      |Geofence|Different On Weekdays|
      
@JasperNA_WhenHeat_CoolOnly @Automated @--xrayid:ATER-54460
Scenario Outline: As a user I want to create an Time based schedule with default schedule value when System is in Cool Only Stat
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates "Same Every Day" schedule with default schedule value
Then  "Same Every Day" scheduling gets activated with <Modes>
#And user is displayed with <Modes> in Schedule

Examples: 
|Modes|
#|Heat Only|
|Cool Only|

@NA_CreateTimeBasedScheduleInOffMode @Automated @--xrayid:ATER-54461
Scenario: As a user I want to create an Geofence schedule with default schedule value when System is in Off Mode 
Given user thermostat is set to "geofence based" schedule
And  user has "Off" system mode
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When  user selects "Confirm" option while creating "Same Every Day" schedule with default schedule value
Then "Same Every Day" scheduling gets activated
#And user navigates to "Primary card" screen from the "Scheduling" screen
#Then user is displayed with "System is Off" on the screen

