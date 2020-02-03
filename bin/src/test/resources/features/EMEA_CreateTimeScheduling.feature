@EMEATimeBasedScheduling @EMEA_Schedule @Comfort
Feature: Jasper,Sprouce and Flycatcher Scheduling
As a user I want to create an time based scheduling

@JasperEMEA_CreateEMEAScheduleSinglestatwithDefaultvalue @JasperEmeaScheduleP1 @--xrayid:ATER-44515 @Automated
  Scenario Outline: As a user I want to create an Time based schedule with default schedule value for systems 
    Given user thermostat is set to <scheduling> schedule  
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates <ScheduleType> schedule with default schedule value
     Then  <ScheduleType> scheduling gets activated
     Then user verifies the following on the primary card:
      | Elements                               | 
     |Following schedule|

    Examples: 
      | scheduling | ScheduleType          | 
      | no         | Same Every Day        | 
   #   | time based | Same Every Day        | 
   #   | no         | Different On Weekdays | 
   #   | time based | Different On Weekdays | 
 
@JasperEMEA_CreateEMEAEverydayscheduleAddingperiod @JasperEmeaScheduleP1 @--xrayid:ATER-44641 @Automated
  Scenario Outline: To create EMEA schedule by setting up with new period with new time value for both time format
  As an user
  I want to create Everyday schedule by adding new period for both time format
  Given user thermostat is set to "no" schedule 
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates <ScheduleType> schedule by adding period to the default schedule values
     Then <ScheduleType> scheduling gets activated
  
    Examples: 
      | ScheduleType          | 
      | Same Every Day        | 
   #   | Different On Weekdays | 
  
@JasperEMEA_CancelToRetainExisitngscheduling @JasperEmeaScheduleP3 @Automated
  Scenario Outline: As a user i want to be prompted with an option to Cancel overriding Geofence Schedule
    Given user thermostat is set to "geofence based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects "Cancel" option while creating <ScheduleType> schedule with default schedule value
     Then "Geofence" scheduling is retained
  
    Examples: 
      | ScheduleType          | 
      | Same Every Day        | 
   #   | Different On Weekdays | 
  
@JasperEMEA_ConfirmToCreateNewSchedule @JasperEmeaScheduleP2 @Automated
  Scenario Outline: As a user i want to be prompted with an option to Confirm and Create new Schedule
    Given user thermostat is set to "geofence based" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen 
     When user selects "Confirm" option while creating <ScheduleType> schedule with default schedule value
     Then <ScheduleType> scheduling gets activated
  
    Examples: 
      | ScheduleType          | 
  #    | Same Every Day        | 
      | Different On Weekdays | 
  
@JasperEMEA_TempretureBandwidthforEachPeriod @JasperEmeaScheduleP3 @Automated
  Scenario Outline: As a user i want to verify Tempreture bandwidth limit for each period
  Above Maximum: Above 90, Below Minimum : below 50,At Maximum : max 90, At Minimum : min 50 ,within range : between 50-90
    Given user thermostat is set to "No" schedule
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      When user creates <ScheduleType> schedule by setting temperature value to <Temperature>
  
    Examples: 
      | ScheduleType          | Temperature   | 
   #   | Same Every Day        | Above Maximum | 
   #   | Same Every Day        | Below Minimum | 
   #   | Same Every Day        | At Maximum    | 
      | Same Every Day        | At Minimum    | 
   #   | Same Every Day        | within range  | 
   #   | Different On Weekdays | Above Maximum | 
   #   | Different On Weekdays | Below Minimum | 
   #   | Different On Weekdays | At Maximum    | 
    #  | Different On Weekdays | At Minimum    | 
    #  | Different On Weekdays | within range  | 
  
@JasperEMEA_DeletingDefaultPeriodDifferentOnWeekdays @JasperEmeaScheduleP4 @Automated
Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
Given user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
And user creates "Different On Weekdays" schedule by deleting <Periods> from the default schedule values
#Then Periods are Rearranged in Chronology order 

Examples: 
| Periods |
| Atleast 1 period|
#| Atleast 2 period|

@JasperEMEA_CanCreateMaximumOfSixPeriods @JasperEmeaScheduleP4 @Automated
  Scenario Outline: To create EMEA schedule with Maximum of 6 periods
  As an user
  I want to create Everyday schedule by adding new period for both time format
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
	When user creates "Same Every Day" schedule by adding <Number of Periods> period to the default schedule values
     Then "Same Every Day" scheduling gets activated
   #  And User is displayed with <Number of Periods> periods
     
Examples: 
| Number of Periods |
#|  5|
|  6|

@JasperEMEA_CreateTimeBasedScheduleInOffMode @JasperEmeaScheduleP3 @Automated
Scenario Outline: As a user I want to create an Time based schedule with default schedule value when System is in Off Mode 
Given user thermostat is set to <scheduling> schedule
And  user has "Off" system mode
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule with default schedule value
Then <ScheduleType> scheduling gets activated
Then user verifies the following on the primary card:
      | Elements                               | 
     |Following schedule|
    Examples: 
      | scheduling| ScheduleType |
      | no        | Same Every Day|
   #   | time based        | Same Every Day|
   #   | no| Different On Weekdays|
   #   | time based| Different On Weekdays|

@JasperEMEA_CopyTimeBasedScheduleInOffMode @Automated
# Given Account has a Location with Multiple Stats and Offline stats
Scenario Outline: As a user i want to verify that offline Stats are not displayed in the Copystat pop ups
Given user has "Off" system mode
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

@JasperEMEA_CopyTimeBasedScheduleInOfflineMode @NotAutomatable
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

@JasperEMEA_CopyScheduleToMulitpleStat @JasperEmeaScheduleP2 @Automated
# Given Account has a Location with Multiple Stats
Scenario Outline: As a user i want to copy my New schedule to other stats as well
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