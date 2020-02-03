@EditNATimeschedule_FlyCatcher @NA_Schedule @Comfort
Feature: Edit Time Based schedule
As an user 
I want to Edit Time schedule
so that i can change Time and Set points of individual periods and Days 


@NA_CreatingTimeBasedSchedule_WithPriority @Newscenario
  Scenario Outline: As a user i want create an TimeBased schedule with Priotity with selected Sensor
 #Requirement:  Multiple sensor added to accouunt 
    Given user thermostat is set to "time based" schedule
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule by selecting "Priority" for each period
Then <Priority> scheduling gets activated
Examples: 
|ScheduleType       |  
|Same Every Day     |
|Same Every Day     |
|Same Every Day     |
|Different On Weekdays     |
|Different On Weekdays     |
|Different On Weekdays     |


@NA_CreatingTimeBasedSchedule_WithFanMode @Newscenario
  Scenario Outline: As a user i want create an TimeBased schedule with Fan Mode with selected Sensor
 #Requirement:  Multiple sensor added to accouunt 
    Given user thermostat is set to "time based" schedule
And user launches and logs in to the Lyric application
And user navigates to "Scheduling" screen from the "Dashboard" screen
When user creates <ScheduleType> schedule by selecting "Fan Mode" for each period
Then <Priority> scheduling gets activated
Examples: 
|ScheduleType       |  
|Same Every Day     | 
|Same Every Day     | 
|Same Every Day     | 
|Different On Weekdays     |
|Different On Weekdays     |
|Different On Weekdays     |

 
 @NA_EditingPFanModeInScheduling @NewScenario
 Scenario Outline: As a user i want to Edit fna mode for periods in Different On Weekdays schedule so that only those periods are listed separtly
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by <Fan Mode>
      And user navigates to "Thermostat Solution Card" screen from the "Thermostat Dashboard" screen 
     Then verify "Time" schedule successfully gets edited
      When user selects "SINGLE DAY" view
	And <EditedDays> are grouped separately
        Examples: 
|Fan Mode|
|Circlulate|
|Auto|
|Off|

 @NA_EditingPriorityInScheduling @NewScenario
 Scenario Outline: As a user i want to Edit fna mode for periods in Different On Weekdays schedule so that only those periods are listed separtly
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
      And user creates "Same Every Day" schedule with default schedule value
      And user selects "SINGLE DAY" view
     When user edit Time schedule by <Sensor Priority>
      And user navigates to "Thermostat Solution Card" screen from the "Thermostat Dashboard" screen 
     Then verify "Time" schedule successfully gets edited
      When user selects "SINGLE DAY" view
	And <EditedDays> are grouped separately
        Examples: 
|Sensor Priority|
|Sensor1,Sensor2|
|Sensor2|
|Sensor1

