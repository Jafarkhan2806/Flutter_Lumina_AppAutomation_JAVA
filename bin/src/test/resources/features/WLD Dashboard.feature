@WLDDashboard
Feature: WLD Dashboard
  As user I should be able to View dashboard of WLD from the app


@viewwldDashboard @Automated @--xrayid:ATER-53783
Scenario: As a user I should be able view dashboard of WLD through the Lyric application 
Given user launches and logs in to the Lyric application
Then user should be displayed with the following "WLD Dashboard" options:
|Options|
|Control State|
|WLD device Name|
|Last updated time|
|Current temperature percentage|
|Current humidity percentage|



@ViewDashboardTemperatureunit @Automated @--xrayid:ATER-53784 
Scenario: As a user i should be able to view the change in temperature unit on my dashboard
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard
#User navigates to WLD Settings page and changes Temperature Unit (in Fahrenheit or Celsius)
#User should be able to see the change in temperature unit(in Fahrenheit or Celsius) in WLD Primary card.
Then verify Temperature Unit is changed as per the "Temperature Unit" selected below:
|Options|
|Fahrenheit|
|celsius|



@landingToSolutionCard @Automated @--xrayid:ATER-53785
Scenario: As a user i should be able to land on solution card from dashboard
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard
Then user should be displayed with the following "WLDSolutionTemperature" options:
|WLD Solution options|
|Current Temperature| 