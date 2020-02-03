@EMEABoilerChangeMode
Feature: 
As an user 
I want to change boiler modes[Resume Schedule, Always ON, AlwaysOFF] to get hot water on domestic purpose

#Japser EMEA Boiler Mode change testcases

@EMEABoilerChangeModes @P1
Scenario Outline:As an user I want to change boiler modes on Jasper EMEA boiler devicebased on that boiler on/off functionality will changes
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
Then Verify the "Modes" shows in Mode Option screen
When User selects <BoilerModes> from Mode Option screen and save
Then Verify the <BoilerModes> on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the <BoilerModes> status on the Dashboard 
Examples:
|BoilerModes|
|Follow Schedule|
|Always ON|
|Always OFF|


@EMEABoilerAlwaysONtoSchedule @P1
Scenario Outline:As an user I want to enable Always ON to boiler and verify boiler on status
later switching to running schedule to override setting on Jasper EMEA boiler
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
Then Verify the "Modes" shows in Mode Option screen
When User selects <BoilerModes> from Mode Option screen and save
Then Verify the <BoilerModes> on the Boiler Dasboard screen
Then User selects "Follow Schedule" from Mode Option screen and save
Then Verify the "Follow Schedule" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Follow Schedule" status on the Dashboard 
Examples:
|BoilerModes|
|Always ON|


@EMEABoilerAlwaysOFFtoSchedule @P1
Scenario Outline:As an user I want to enable Always OFF to boiler and verify boiler on status
later switching to running schedule to override setting on Jasper EMEA boiler
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
Then Verify the "Modes" shows in Mode Option screen
When User selects <BoilerModes> from Mode Option screen and save
Then Verify the <BoilerModes> on the Boiler Dasboard screen
Then User selects "Follow Schedule" from Mode Option screen and save
Then Verify the "Follow Schedule" on the Boiler Dasboard screen
When user navigates to "Dasboard" screen from "Boiler Dasboard"
And Verify the "Follow Schedule" status on the Dashboard 
Examples:
|BoilerModes|
|Always OFF|

@EMEABoilerCheckModeInfo @P2
Scenario Outline:As an user I want to view boiler modes on Jasper EMEA boiler in APP
Given user launches and login to application
Then user has "Follow Schedule" in boiler
And user navigates to "Boiler Dasboard" screen from the "Dashboard" screen
When user selects "Mode Option" from "Boiler Dasboard" screen
Then Verify the Mode Info shows in Mode Option screen
