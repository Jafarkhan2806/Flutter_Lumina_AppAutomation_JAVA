@EMEABoilerScheduling
Feature: As a user I want to create an time based schedule periods to turn on/off the EMEA Boiler

@EMEABoilerTimeSchedulewithDefaultvalue @P1
  Scenario Outline: As a user I want to create an Time based schedule with default schedule periods to boiler
    Given user launches and logs in to the Lyric application
      And user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
     Then user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
     When user creates <ScheduleType> schedule with default schedule value
     Then  <ScheduleType> scheduling gets activated
      And user navigates to "Boiler Dashboard" screen from the "Scheduling" screen
     Then user is displayed with "Scheduled Heating At"
    Examples: 
      | scheduling | ScheduleType          | 
      | time based | Everyday Schedule     | 
      | time based | Weekday & Weekend     | 
  
@EMEABoilerTimeSchedulewithGeoBoostOption @P1
  Scenario Outline: As a user I want to create an Time based schedule with default schedule periods to boiler
    Given user launches and logs in to the Lyric application
      And user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
     Then user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
     When user creates <ScheduleType> schedule with default schedule value and enable <GeoBoost> options
     Then  <ScheduleType> scheduling gets activated
      And user navigates to "Boiler Dashboard" screen from the "Scheduling" screen
     Then user is displayed with "Scheduled Heating At"
    Examples: 
      | scheduling | ScheduleType          | GeoBoost |
      | time based | Everyday Schedule     | enable	  |
      | time based | Weekday & Weekend     | enable   |
      | time based | Everyday Schedule     | disable  |
      | time based | Weekday & Weekend     | disable  |
       
  
@EMEABoiler_TimerClockIsInCrementalOf10mins
  Scenario: As a user i want to verify if Timer clock in Each period is incremental of 10 mins
    Given user launches and logs in to the Lyric application
      And user navigates to "Scheduling" screen from the "Dashboard" screen
     When user creates "Everyday Schedule" schedule by changing the time values
     Then user should be displayed "Everyday Schedule" schedule with timer field incremental of "10 minutes"
  
@EMEABoiler_Adding_PeriodsInSchedule
  Scenario Outline: As an user I want to add periods in schedule to turn-on the boiler functionality 
    Given user launches and logs in to the Lyric application
      And user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
     Then user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
     When user creates <ScheduleType> schedule by adding New periods to turn on the boiler
     Then <ScheduleType> scheduling gets activated
    Examples: 
      | ScheduleType          | 
      | Everyday Schedule     | 
      | Weekday & Weekend     | 
      

@EMEABoiler_Remove_1_PeriodInSchedule
  Scenario Outline: As an user I want to remove a period in schedule, so that time interval the boiler would be moved turn-off state
    Given user launches and logs in to the Lyric application
      And user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
     Then user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
     When user Update <ScheduleType> schedule by reomving a period to turn off the boiler
     Then <ScheduleType> scheduling gets activated
    Examples: 
      | ScheduleType          | 
      | Everyday Schedule     | 
      | Weekday & Weekend     | 

      
@EMEABoiler_Remove_Multiple_PeriodInSchedule
Scenario Outline: As a user i want to delete periods mutliple peridos so that boiler would turned off in those time interval
Given user launches and logs in to the Lyric application
And user has created "Everyday Schedule" schedule with mutlipe periods
Then user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
And user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
When user deletes <Periods> from the Schdeule
Then Periods are Rearranged in Chronology order 
Examples: 
| Periods         |
| Atleast 2 period|

@EMEABoiler_CreateMaximumOfThreePeriods
  Scenario Outline: To create EMEA boiler schedule with 2 and 3[max] periods
  As an user
  I want to create Everyday schedule by adding new periods [Max] 
    Given user launches and logs in to the Lyric application
      And user has created "Everyday Schedule" schedule with one periods
     Then user navigates to "Boiler Dashboard" screen from the "Dashboard" screen
      And user navigates to "Scheduling" screen from the "Boiler Dashboard" screen
     When user creates <ScheduleType> schedule by adding <Periods> to the default schedule values
     Then <ScheduleType> scheduling gets activated
     And User is displayed with <Periods>
Examples: 
| Periods |
| 2nd period|
| 3rd period|

