@PriorityMode
Feature: As an user 
I want to change Priority settings 
So that my rooms will be set to average temperature 


@ChangePrioritymode
Scenario: To change priority mode based on my prefernce
As an user 
I want to change mode based on my prefernce
So that my state(sensor) will be set to average temperature

Given user has sensor configured to stat
And user launches and logs in to the Lyric application
And user selects "FlyCatcher device" from the dashboard
When user taps on "Priority mode"
Then verify the following Priority modes displayed:
       | Elements                 | 
       | Selected Rooms | 
       | Active Rooms |
       

@SelectedRoomAsPriority
Scenario: To Select few Sensor to priorities and set average temperature to those rooms 
As an user
I Want to select few sensor in the room 
So that selected rooms are priorities and set to average temperature

Given user has sensor configured to stat
And user selects "FlyCatcher device" from the dashboard
And user taps on "Priority mode"
When user selects priority mode as "Selected Rooms"
And user priorities the Sensor
Then Verify if "Selected" sensors are priorities

@SelectActiveRoomAsPriority
Scenario: To select Sensor which will monitor my motion and set average temperature to those rooms
As an user
I Want my sensors to fallow me using motion sensors
So that my rooms are priorities based on the motion and set to average temperature

Given user has sensor configured to stat
And user selects "FlyCatcher device" from the dashboard
And user taps on "Priority mode"
When user selects priority mode as "Active Rooms"
And user priorities the Sensor
Then Verify if "Selected" sensors are priorities



