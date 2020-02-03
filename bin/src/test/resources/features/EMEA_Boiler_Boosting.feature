@EMEABoilerBoosting
Feature: 
As an user 
I want to turn on boosting for 30,60 and 90 mins to get instant hot water on domestic purpose and turnoff it

#Japser EMEA Boiler Boosting testcases

@EMEABoilerEnableBoostingFromDasboard @P1
Scenario Outline:As an user I want to turn ON 30 mins boosting on Jasper EMEA boiler from Dashboard 
Given user launches and login to application
Then user has "Follow Schedule" in boiler
When user selects "Boost Enable" option from "Dasboard" screen
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
Then Verify the "Boost enabled" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Boosting" status on the Dashboard 

# Boost Disable == Scheudle Enable option on 
@EMEABoilerDisableBoostingFromDasboard @P1  
Scenario Outline:As an user I want to turn OFF Boosting on Jasper EMEA boiler from Dashboard 
Given user launches and login to application
Then user has enabled "Boosting" in boiler
When user selects "Boost Disable" option from "Dasboard" screen
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
Then Verify the "Scheudle enabled" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Scheudle" status on the Dashboard

@EMEABoilerEnableBoosting @P1
Scenario Outline:As an user I want to turn ON boosting with intervals of 30,60 and 90 mins on Jasper EMEA boiler
So that running schedule should be turned off in boiler 
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Boost Option" from "Boiler Dasboard" screen
Then Verify the "Boost Interval" shows in "Boost Option" screen
Then User selects <BoostInterval> from Boost Option screen
Then Verify the "Boost enabled" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Boosting" status on the Dashboard 
Examples:
|BoostInterval|
|30 MIN|
|60 MIN|
|90 MIN|

# Boost Disable == Scheudle Enable option on 
@EMEABoilerDisableBoosting @P1
Scenario Outline:As an user I want to turn OFF boosting on Jasper EMEA boiler
So that the running schedule should be resumed in boiler 
Given user launches and login to application
Then user has enabled "Boosting" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Boiler Mode" from "Boiler Dasboard" screen
Then Verify the modes shows in "Boiler Mode" screen
Then User selects "Resume Schedule" option and save from "Boiler Mode" screen
Then Verify the "Schedule enabled" on the Boiler Dasboard screen
When user navigates to "Boiler Dasboard" screen from "Dasboard"
And Verify the "Schedule" status on the Dashboard 


@EMEABoilerBoostingtoSchedule @P2
Scenario Outline:As an user I want to turn ON boosting with intervals of 30 mins on Jasper EMEA boiler
later that switching to running schedule to override setting in boiler 
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Boost Option" from "Boiler Dasboard" screen
Then Verify the "Boost Interval" shows in "Boost Option" screen
Then User selects <BoostInterval> from Boost Option screen
Then Verify the "Boost enabled" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Boosting" status on the Dashboard
When user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
Then user selects "Mode Option" from "Boiler Dasboard" screen
And user selects <Mode> from "Mode Option" screen
Then Verify the <Mode> on the Boiler Dasboard screen
And Verify the <Mode> status on the Dashboard

Examples:
|BoostInterval|Mode|
|30 MIN|Resume Schedule|
|60 MIN|Resume Schedule|
|90 MIN|Resume Schedule|