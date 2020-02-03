@EMEAEnable/DisableVacationSettings
Feature: 
As an user 
I want to Enable / Disable Vacation Settings to turn off EMEA boilers

#Japser EMEA Boiler Vacation Settings testcases

@EMEABoilerEnableVaction @P1
Scenario Outline:As an user I want to enable my vaction setting to turn off my boiler functionality during my vacation period 
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Solution Card" screen from the "Dashboard" screen
When user selects "Vacation" from "Solution Card" screen
Then Verify the vacation "default" settings shows in Vacation screen
When User selects DHW settings from Vacation screen
Then Verify the DHW default settings shows in DHW Vacation screen
When user selects to "Enable" for vacation and bolier turn off option
And user navigates to "Solution Card" screen from the "Vacation" screen
And user navigates to "Dashboard" screen from the "Solution Card" screen
Then Verify vacation enabled status on the Dashboard 


@EMEABoilerDisableVaction @P1
Scenario Outline:As an user I want to disable vaction setting to boiler and boiler functionality should follow current schedule
Given user launches and login to application
Then user has "Enable Vaction" in boiler
And user navigates to "Solution Card" screen from the "Dashboard" screen
When user selects "Vacation" from "Solution Card" screen
Then Verify the vacation "enabled" settings shows in Vacation screen
When User selects "Disbale" option from Vacation screen 
And user selects to "End" option from the End Vacation Mode popup
Then user navigates to "Solution Card" screen from the "Vacation" screen
And user navigates to "Dashboard" screen from the "Solution Card" screen
Then Verify vacation disbaled status on the Dashboard 

@EMEABoilerVactionToAlwaysOFF @P2
Scenario Outline:As an user I want to override my vacation settings into always off mode to boiler
Given user launches and login to application
Then user has "Enable Vaction" in boiler
Then Verify the vacation shows in "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
And User selects "Always OFF" from Mode Option screen and save
Then Verify the "Always OFF" mode shows in Dasboard screen


@EMEABoilerVactionToAlwaysON @P2
Scenario Outline:As an user I want to override my vacation settings into always on mode to boiler
Given user launches and login to application
Then user has "Enable Vaction" in boiler
Then Verify the vacation shows in "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
And User selects "Always ON" from Mode Option screen and save
Then Verify the "Always ON" mode shows in Dasboard screen

@EMEABoilerVactionToAlwaysON @P2
Scenario Outline:As an user I want to override my vacation settings into always on mode to boiler
Given user launches and login to application
Then user has "Enable Vaction" in boiler
Then Verify the vacation shows in "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
And User selects "Always ON" from Mode Option screen and save
Then Verify the "Always ON" mode shows in Dasboard screen