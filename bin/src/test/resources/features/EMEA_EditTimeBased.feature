@EditEMEATimeschedule @EMEA_Schedule @Comfort
Feature: Edit Time Based schedule
As an user 
I want to Edit Time schedule
so that i can change Time and Set points of individual periods and Days 


@EMEA_AtleastOnePeriodNotDeletableInGroupDay  @Automated
Scenario: Verify User should have atleast one schedule period in set of grouped days 
    Given user thermostat is set to "time based" schedule
     And user launches and logs in to the Lyric application 
     And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
     And user selects "Grouped Days" view
     When user tries to delete "All Periods" in EMEA schedule screen
     And user navigates to "Scheduling" screen from the "DASHBOARD" screen
     Then verify user should have atleast "One" schedule period in "Grouped days" view


@EMEA_AtleastTwoPeriodInIndividualDay  @Automated
Scenario: Verify User should have atleast two schedule period in set of individual days 
    Given user has "time schedule" with "1 Period"
     And user launches and logs in to the Lyric application
     And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
     And user selects "SINGLE DAY" view
     When user tries to delete one of the schedule period of the last two schedule period
     And user navigates to "Scheduling" screen from the "DASHBOARD" screen
     Then verify user should have atleast "Two" schedule period in "Single day" view

@EMEA_EndtimeTimeschedulePeriod  @Automated
Scenario Outline:Verify User should not be allowed to edit end time of last period in a day 
    Given user thermostat is set to "time based" schedule
     And user launches and logs in to the Lyric application 
     And user navigates to "Scheduling" screen from the "Dashboard" screen
     And user selects <Type> view
     Then verify user should not be allowed to edit end time with same as start time
      Examples:
      | Type            | 
      | Grouped days    | 
      
@EMEA_EditingEndtime @Automated
 Scenario Outline:Verify User should not be allowed to edit start time and end time with same time value for both time format
    Given user thermostat is set to "time based" schedule
     And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user selects <Type> view
     Then User edits end time value atleast 10 min less than next day period start value
      
      Examples:
      | Type            | 
      | Grouped days    | 
   #   | Individual days | 
      
@EMEA_EditingStartTime @Automated
  Scenario Outline: Verify User should not be allowed to edit start time and end time with same time value for both time format
    Given user thermostat is set to "time based" schedule
     And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user selects <Type> view
      Then User edits start time value atleast 10 min more than next day period start value
     Examples:
      | Type            | 
      | Grouped days    | 
    #  | Individual days |
      

   @EMEA_GroupEditedDays @Automated
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
   #   | Two days   | 
    #  | Three days | 
    #  | Four days  | 
   #   | Five days  | 
   #   | Six days   | 
      
@EMEA_ViewTimescheduleIndividualdaysEMEA @Automated
  Scenario: To view the Time schedule for EMEA stat
    Given user thermostat is set to "time based" schedule
     And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user selects "SINGLE DAY" view
     Then verify user shown with Time schedule list in Individual days view
     
     

@EMEA_ScheduleOptions  @Automated
  Scenario Outline: As a user i want an Options to Create,Pause, Off and Switch Schdeule
     Given user thermostat is set to "Time based" schedule
    And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects <schedule Options> from Scheduling screen
     Then user should be displayed with the <Expected> screen
  
    Examples: 
      | schedule Options        | Expected            | 
      | Switch to Geofencing    | Geofencing schedule | 
  #    | Create new time schedule | Time based schedule  | 
   #   | Turn Schedule Off   | Tap on Resume       | 
      
@EMEA_ResumeSchedule @Automated
  Scenario: As a user i want an Options to resume Schdeule
      Given user thermostat is set to "Time Based" schedule  
      And user selects "Pause" option on Scheduling 
      And user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user selects "Tap On Resume" from Scheduling screen
     Then "Same Every Day" scheduling is retained
  

@EMEA_VerifySleepSettings @Automated
Scenario: To Verify create geofence schedule in off mode when permanentHold
Given user has "Heat" system mode
And user thermostat is set to "Geofence based" schedule
When user launches and logs in to the Lyric application
And user thermostat set "Home" with "UserArrived"
And user sets sleep start time to "11:00AM" and end time to "11:00AM"
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then Verify the "Using Sleep Settings" on the "PRIMARY CARD" screen

 @EMEA_DeletingDefaultPeriodDifferentOnEveryday @Automated
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Period is "not deleted" on "canceling" Dialog box
  
    Examples: 
    | Periods          |
      | Atleast 1 period |
     # | Atleast 2 period | 
     # | Atleast 3 period | 
    #  | Atleast 4 period | 

@EMEA_DeletingDefaultPeriodDifferentOnEverydaygroupview @Automated
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting <Periods>
     Then verify user should be displayed with confirm pop for period deletion
     And Period is "deleted" on "confirming" Dialog box
      And user navigates to "Thermostat Solution Card" screen from the "Thermostat Dashboard" screen 
      When user selects "SINGLE DAY" view
      And <EditedDays> are grouped separately
  
    Examples: 
      | Periods          | Period Value |EditedDays |
      | Atleast 1 period | Tap to set   |One days |
     # | Atleast 2 period | Tap to set   |One days |
     # | Atleast 3 period | Tap to set   |One days|
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
 #	| Atleast 1 period | Tap to set   |Five days |
      #| Atleast 2 period | Tap to set   | Five days |
      #| Atleast 3 period | Tap to set   | Five days|
      #| Atleast 4 period | Tap to set   | Five days|
      
  @EMEA_DeletingDefaultPeriodDifferentOnSingleday @Automated
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by deleting <Day> of <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Verify the the schedule delete pop up <text> <Day>  
   
    Examples: 
       | Day | Periods          |  text |
	#| Monday |P1 | Delete 1 period for |
	#| Monday |P2 | Delete 2 period for |
	#| Monday |P3 |Delete 3 period for |
	#| Monday |P4 |Delete 4 period for |
	#| Tuesday |P1 | Delete 1 period for |
	#| Tuesday |P2 | Delete 2 period for |
	#| Tuesday |P3 |Delete 3 period for |
	#| Tuesday |P4 |Delete 4 period for |
	#| Wednesday  |P1 | Delete 1 period for |
	#| Wednesday |P2 | Delete 2 period for |
	#| Wednesday |P3 |Delete 3 period for |
	#| Wednesday |P4 |Delete 4 period for |
	#| Thursday   |P1 | Delete 1 period for |
	#| Thursday |P2 | Delete 2 period for |
	#| Thursday |P3 |Delete 3 period for |
	#| Thursday |P4 |Delete 4 period for |
	#| Friday   |P1 | Delete 1 period for |
	#| Friday |P2 | Delete 2 period for |
	#| Friday |P3 |Delete 3 period for |
	#| Friday |P4 |Delete 4 period for |
	#| Saturday    |P1 | Delete 1 period for |
	#| Saturday |P2 | Delete 2 period for |
	| Saturday |P3 |Delete 3 period for |
	#| Saturday |P4 |Delete 4 period for |
	#| Sunday    |P1 | Delete 1 period for |
	#| Sunday |P2 | Delete 2 period for |
	#| Sunday |P3 |Delete 3 period for |
	#| Sunday |P4 |Delete 4 period for |
	
@EMEA_DeletingDefaultPeriodDifferentOnWeekendWeekdays @Automated
  Scenario Outline: As a user i want to delete periods in Different On Weekdays schedule so that only those periods are deleted
    Given user launches and logs in to the Lyric application
     And user navigates to "Scheduling" screen from the "Dashboard" screen
     And user creates "Different On Weekdays" schedule with default schedule value
     And user selects "Grouped days" view
     When user edit Time schedule by deleting <Day> of <Periods>
     Then verify user should be displayed with confirm pop for period deletion
      And Verify the the schedule delete pop up <text> <Day> 
  
    Examples: 
       | Day | Periods          |  text |
	| Monday - Friday |P1 | Delete 1 period for |
	#| Monday - Friday |P2 | Delete 2 period for |
#	| Monday - Friday|P3 |Delete 3 period for |
#	| Monday - Friday|P4 |Delete 4 period for |
#| Saturday - Sunday  |P1 | Delete Home period for  |
#	| Saturday - Sunday  |P2 | Delete Away period for |
#	| Saturday - Sunday  |P3 |Delete Sleep period for  |
#	| Saturday - Sunday  |P4 |Delete Wake period for  |

