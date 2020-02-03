@WLDSolutionCard
Feature: WLD Solution Card
  As user I should be able to View Solution card of WLD from the app

@viewwldSolutionCard @Automated @--xrayid:ATER-53902
Scenario: As a user I should be able view Contents of my WLD Solution card through the Lyric application 
Given user launches and logs in to the Lyric application  
When user selects "WLD device" from the dashboard
Then user should be displayed with the following "WLDSolutionTemperature" options:
|WLD Solution options|
|Current Temperature|
|Last Updated Time|
#|Temperature Graph|  
#comment out |Temperature Graph| if account is 48 hours post DIY
|Battery percentage|
|Next Update Time|
#And user should be displayed with the "Settings" description
When user navigates to "humidity graph" screen from the "temperature graph" screen
Then user should be displayed with the following "WLDSolutionHumidity" options:
|WLD Humidity Solution options|
|Current Humidity|
|Last Updated Time|
#|Humidity Graph| 
#comment out |Humidity Graph| if account is 48 hours post DIY

@ViewSolutionCardTemperatureunit @Automated @--xrayid:ATER-53903
Scenario: As a user i should be able to view the change in temperature unit on my Solution Card
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard
Then verify Temperature Unit is changed as per the "Temperature Unit" selected below:
|Options|
|Fahrenheit|
|celsius|

@ViewSolutionCardNextupdateTime @Automated @--xrayid:ATER-53904
Scenario: As a user i should be able to view the change in Update frequency on my Solution Card
Given user launches and logs in to the Lyric application
When user selects "WLD device" from the dashboard
Then verify Next Update Time in Solution Card after selecting "Update Frequency" options:
|Options|
|Daily|
|Twice Daily|
|Thrice Daily|

@TemperatureAndHumidityGrapghAfterDIY @AutomatedonlyafterfreshDIY  @--xrayid:ATER-53905
Scenario: As a user i should be able to view a message on my temperature graph of solution card after DIY
Given user launches and logs in to the Lyric application
When user navigates to "Solution Card" screen from the "Dashboard" screen
Then user should be displayed with the "Setup Complete" description
When user navigates to "humidity graph" screen from the "temperature graph" screen
Then user should be displayed with the "Setup Complete" description

@TemperatureAndHumidityGraphAftertwodaysDIY  @Automatedaftertwodaysofdiy @--xrayid:ATER-53906
Scenario: As a user i should be able to view temperature and humidity temperature graph of my WLD after two days of DIY
Given user launches and logs in to the Lyric application
When user navigates to "Solution Card" screen from the "Dashboard" screen
Then user should be displayed with the following "Graph" options:
|Graph Options|
|No of days temperature trend|
|Maximum and minimum temperature trend|
When user navigates to "humidity graph" screen from the "temperature graph" screen
Then user should be displayed with the following "Graph" options:
|Graph Options|
|No of days humidity trend|
|Maximum and minimum humidity trend|

@TemperatureAndHumidityGraphAfterFivedaysDIY @NotAutomated @--xrayid:ATER-53907
Scenario: As a user i should be able to view temperature and humidity temperature graph of my WLD after 5 to 30 days
Given user launches and logs in to the Lyric application
When user navigates to "Solution Card" screen from the "Dashboard" screen
Then user should be displayed with the following "Graph" options:
|Graph Options|
|Dates of which trend is recorded|
|No of days trend|
|Maximum and minimum temperature trend|
|MAXIMUM 5 dates|
When user navigates to "humidity graph" screen from the "temperature graph" screen
Then user should be displayed with the following "Graph" options:
|Dates of which trend is recorded|
|No of days trend|
|Maximum and minimum humidity trend|
|MAXIMUM 5 dates|