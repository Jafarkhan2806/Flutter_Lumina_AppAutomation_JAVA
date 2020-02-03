@Weatherforecast
Feature: Weather forecast, As user I want to view the outdoor temperature from weather forecast so that I will aware of my outdoor temperature

#Dashboard weather 
#Requirements: Single location with or with out solution 
@GeneralWeatherForecastWithOrWithoutSolutionDashboard          @Automated
Scenario: As a user I want to verify the weather forecast for the location with temper scale celsius or Fahrenheit on dashboard with or with out solution 
Given user launches and logs in to the Lyric Application
And user should be displayed with the following "Weather" options:
|WeatherOptions					  |
|Weather Icon  					  |
|Weather Temp In Dashboard Screen |

#Weather screen 
#Requirements: Single location with or with out solution 
@GeneralWeatherForecastWithOrWithoutSolutionWeatherScreen          @NotAutomatable
Scenario: As a user I wanted to verify weather forecast screen for the location with temper scale celsius/Fahrenheit on Weather screen with or with out solution  and for time format 24/12hr
Given user launches and logs in to the Lyric Application
Then user navigates to “Forecast” screen 
And verify the current weather forecast for the location with temperature and weather status 
And Verify for three more forecast with interval of 6 hrs from current time 
And Verify the time format in app is same as mobile device

#Weather screen switching temper scale celsius and Fahrenheit 
#Requirements: Single location with or with out solution US location         
@GeneralWeatherForecastWithOrWithoutSolutionWeatherTemperScaleSwitchWithUSLocation				@Automated
Scenario: As a user I wanted to verify weather forecast screen temper scale switch with celsius or Fahrenheit on weather screen with or with out solution  and for time format 24hr or 12hr, US Location
Given user launches and logs in to the Lyric Application
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
When user selects "Farenheit" from "Weather Forecast" screen
Then user should be displayed with the current unit of "Farenheit" in the "Weather Forecast" screen
Then user should be displayed with three forecast with interval of "6" hrs in "Weather Forecast" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
|Humidity      				     |
|Max Weather Temperature         |
|Min Weather Temperature         |
Then user selects "Celsius" from "Weather Forecast" screen
Then user should be displayed with the current unit of "Celsius" in the "Weather Forecast" screen
Then user should be displayed with three forecast with interval of "6" hrs in "Weather Forecast" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
|Humidity      				     |
|Max Weather Temperature         |
|Min Weather Temperature         |
Then user logs out of the app

#Weather screen switching temper scale celsius and Fahrenheit, EMEA Location 
#Requirements: Single location with or with out solution UK location          
@GeneralWeatherForecastWithOrWithoutSolutionWeatherTemperScaleSwitchWithUKLocation				@Automated
Scenario: As a user I wanted to verify weather forecast screen temper scale switch with celsius or Fahrenheit on weather screen with or with out solution  and for time format 24hr or 12hr, UK Location
Given user launches and logs in to the Lyric Application
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
When user selects "Farenheit" from "Weather Forecast" screen
Then user should be displayed with the current unit of "Farenheit" in the "Weather Forecast" screen
Then user should be displayed with three forecast with interval of "6" hrs in "Weather Forecast" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
|Humidity      				     |
|Max Weather Temperature         |
|Min Weather Temperature         |
Then user selects "Celsius" from "Weather Forecast" screen
Then user should be displayed with the current unit of "Celsius" in the "Weather Forecast" screen
Then user should be displayed with three forecast with interval of "6" hrs in "Weather Forecast" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
|Humidity      				     |
|Max Weather Temperature         |
|Min Weather Temperature         |
Then user logs out of the app

#Dashboard weather switching temper switching scale celsius and Fahrenheit, EMEA Location 
#Requirements: Single location with or with out solution           
@GeneralWeatherForecastWithOrWithoutSolutionWeatherTemperScaleSwitchForEMEALocation				@Automated
Scenario: As a user I want to verify weather forecast screen temperature scale switch with celsius or Fahrenheit on Dashboard with or with out solution for UK Location
Given user launches and logs in to the Lyric Application
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
When user selects "Celsius" from "Weather Forecast" screen
Then user should be displayed with "Celsius Unit" temperature scale in "Weather Forecast" screen
When user selects "Farenheit" from "Weather Forecast" screen
Then user should be displayed with "Farenheit Unit" temperature scale in "Weather Forecast" screen
Then user logs out of the app


@GeneralWeatherForecastWithOrWithoutSolutionWeatherTemperScaleSwitchForUSLocation			@Automated
Scenario: As a user I want to verify weather forecast screen temperature scale switch with celsius or Fahrenheit on Dashboard with or with out solution for US Location
Given user launches and logs in to the Lyric Application
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
When user selects "Celsius" from "Weather Forecast" screen
Then user should be displayed with "Celsius Unit" temperature scale in "Weather Forecast" screen
When user selects "Farenheit" from "Weather Forecast" screen
Then user should be displayed with "Farenheit Unit" temperature scale in "Weather Forecast" screen
Then user logs out of the app
           
@GenralWeatherforecast          @NotAutomatable
Scenario: Fetch Weather forecast for systems with mobile time format 24/12hr
Given user launches and logs in to the Lyric Application
Then user navigates to “Forecast” screen from “Dashboard” screen 
And Verify the current weather forecast for the location with temperature and weather status
And Verify for three more forecast with interval of 6 hrs from current time
And Verify the time format in app is same as mobile device

@ErrormessageWeatherforecast          @NotAutomatable
Scenario Outline:To get error messages on system unavailability to fetch weather forecast As an user I want to get error message if app failed to fetch weather forecast for the location  So that I will get notified on system unavailability
Given With the <Condition>
When click the weather forecast   
Then Verify the error message
Examples:
|Condition                       |
|Mobile internet(3G/wifi) is down|
|Mobile in Airplane mode         |
|Mobile with low signal(3G/wifi) |
|CHIL down                       |
|Switching between the network   |
|Smart network switch            |

#Requirment : Multiple location with different zipcode
@GeneralChangeLocationWeatherUpdate           @AlreadyCoveredTheSameStepsInGeneralWeatherTempScaleValidationMultiLocation
Scenario: As a user i want to verify the weather update with lcoation change 
Given user launches and logs in to the Lyric application
When user see the wheather status of location1
Then user changes the location2
And user should be displayed updated weather based on the location2 zipcode
When user changes the location1
Then user should be displayed with weather based on the location1 zipcode

#Requirment: Single location with or without solution
@GeneralWeatherChangeBasedOnLocationZipCodeUpdate          @Automated
Scenario Outline: As a user I want to verify the weather update with zip code
Given user launches and logs in to the Lyric application
Then user should be displayed with the following "Weather" options:
|WeatherOptions					   |
|Weather Icon                      |
|Weather Temp In Dashboard Screen  |
Then user navigates to "Address" screen from the "Dashboard" screen
Then user navigates to "Edit Address" screen from the "Address" screen
Then user gets the current postal code from "Edit Address" screen
Then user clears the text displayed in the following text fields in the "Edit Address" screen:
| TextFieldsInEditAddressScreen		|
| Postal Code Text Field			|
Then user inputs <Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then the following "Edit Address" options should be enabled:
| EditAddressOptions	|
| Save					|
Then user selects "Save button" from "Edit Address" screen
When user clicks on the back arrow in the "Edit Address" screen
Then user navigates to "Dashboard" screen from the "Global Drawer" screen
Then user should be displayed with the following "Weather" options:
|WeatherOptions					  |
|Weather Icon                     |
|Weather Temp In Dashboard Screen |
Then user navigates to "Address" screen from the "Dashboard" screen
Then user navigates to "Edit Address" screen from the "Address" screen
Then user clears the text displayed in the following text fields in the "Edit Address" screen:
| TextFieldsInEditAddressScreen		|
| Postal Code Text Field			|
Then user inputs <Default Postal Code> in "Postal Code Text Field" in the "Edit Address" screen
Then user selects "Save button" from "Edit Address" screen
Then user logs out of the app

Examples:
| Postal Code	| Default Postal Code |
| 14008			| 90001				  |


#Requirment : Mulitple location with different Tempr scale
@GeneralWeatherTempScaleValidationMultiLocation          @Automated
Scenario Outline: As a user I want to verify the weather update for multi location
Given user launches and logs in to the Lyric application with user account without any location
And user changes the country to "United States"
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <first location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your Address Postcode" screen
When user inputs <valid first locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
Then user clicks on the back arrow in the <Current Screen> screen
Then user should be displayed with the <Previous Screen> screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
Then user selects "Celsius" from "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
Then user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
When user selects "Smart Home Security" from "Add New Device" screen
Then user should be displayed with the "What To Expect" screen
When user navigates to "Choose Location" screen from the "What To Expect" screen
And user selects "Create New Location" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <second location name> in the "Create Location" screen
Then user should be displayed with the "Confirm Your Address Postcode" screen
When user inputs <valid second locations zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device" screen
Then user clicks on the back arrow in the <Current Screen> screen
Then user should be displayed with the <Previous Screen> screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
Then user selects "Farenheit" from "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
Then user selects <first location name> from "Dashboard" screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
Then user should be displayed with "Celsius Unit" temperature scale in "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
Then user selects <second location name> from "Dashboard" screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
Then user should be displayed with "Farenheit Unit" temperature scale in "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
And user "deletes location details" by clicking on "delete" button
Then user should be displayed with the "Dashboard" screen
And user "deletes the existing location details" by clicking on "delete" button
Then user should be displayed with the "Add New Device Dashboard" screen

Examples: 
| first location name | valid first locations zip code | second location name   | valid second locations zip code  | Current Screen              | Previous Screen   |
| California          | 90001                          |  Texas                 | 75457                            | Add New Device Dashboard    | Dashboard         |


#Dashboard weather switching temper switching scale celsius and Fahrenheit, login with different device
#Requirements: Single location with or with out solution           @NotAutomatable
@GeneralWeatherForecastWithOrWithoutSolutionWeatherTemperScaleSwitchLoginwithdifferentdevice
Scenario: As a user I want to verify weather forecast screen temper scale switch with celsius or Fahrenheit on Dashboard with or with out solution and check in different device
Given user launches and logs in to the Lyric Application
#Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
#And user set to temper scale “Celsius” 
And user should be displayed with "Celsius" temperature scale in "Add New Device Dashboard" screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
When user selects "Farenheit" from "Weather Forecast" screen 
Then user selects "Back button" from "Weather Forecast" screen 
And user should be displayed with "Farenheit" temper scale in "Add New Device Dashboard" screen
When user launches and logs in to the Lyric Application on phone2
Then user should be displauyed with "Celsius" temperatureYou have this scenario scale in "Add New Device Dashboard" screen


#Requirements: On enabling or disabling the Geofence the Weather should not change  
@GeneralWeatherForecastNoChangeWhenGeofenceIsEnabledOrDisabled      		@Automated
Scenario: As a user I want to verify weather forecast screen temper scale should not change when the Geofence is Enabled or Disabled
Given user launches and logs in to the Lyric Application
#When user changes the "Geofence this location toggle" to "on"
Then user navigates to "Global Drawer" screen from the "Dashboard" screen
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "off"
Then the following "Geofence Settings" options should be disabled:
| Options					|
| Geofence this Location	|
And user should not be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
Then user navigates to "Global Drawer" screen from the "Geofence Settings" screen
Then user navigates to "Dashboard" screen from the "Global Drawer" screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
Then user should be displayed with "Weather Forecast temp" in the "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
#Then user gets the "Weather" from "Add New Device Dashboard" screen
Then user navigates to "Global Drawer" screen from the "Dashboard" screen
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "on"
Then user should be displayed with the following "Geofence this location" options:
| GeofenceThisLocation		|
| Geofence Radius			|
| Location Status			|
| Geofence Alert			|
Then user navigates to "Global Drawer" screen from the "Geofence Settings" screen
Then user navigates to "Dashboard" screen from the "Global Drawer" screen
Then user navigates to "Weather Forecast" screen from the "Add New Device Dashboard" screen
And user should be displayed with the following "Weather" options:
|WeatherOptions			         |
|Weather Temp In Forecast Screen |
Then user should be displayed with "Weather Forecast temp as existing" in the "Weather Forecast" screen
Then user selects "Back button" from "Weather Forecast" screen
Then user navigates to "Global Drawer" screen from the "Dashboard" screen
When user selects "Geofence" from "Global Drawer" screen
Then user should be displayed with the "Geofence Settings" screen
When user changes the "Geofence this location toggle" to "off"
Then the following "Geofence Settings" options should be disabled:
| Options					|
| Geofence this Location	|


#Requirement: Compare the weather displayed on Dashboard and the weather displayed in Weather screen
@GeneralWeatherForecastDisplayedOnDashboardAndWeatherScreen				@Automated
Scenario: As a user I want to verify the weather displayed on Dashboard is same as the Weather displayed in Weather screen
Given user launches and logs in to the Lyric Application
Then user should be displayed with the following "Weather" options:
|WeatherOptions					  										   |
|Weather Temp In Dashboard Screen Is Same As Weather Temp In Weather Screen|