@DeHumidificationsetup
Feature: As an user 
I want to set my humidity target
So that i can set my room humidity as per my prefrence 

@SetTargetDeHum  @--xrayid:ATER-100392
  Scenario Outline: To change stat humidity as per my prefrence
  As an user 
  I want to set my humidity 
  So that i can set my room De humidifies as per my prefrence
  
    Given user Dehumidification is "Enabled"
    And user launches and logs in to the Lyric application
      And user navigates to "DeHumidification" screen from the "Dashboard" screen
     When user Sets the Dehumidification <Target Value>
     Then Verify Dehumidifier set to <Target Value>
    Examples: 
      | Target Value | 
#      | 40           | 
#      | 50           | 
      | 60           | 
#      | 80           | 
  
  @HumidityBandwidthlimit
  Scenario Outline: To verify the humidity bandiwth limit
  As an user 
  I want to verify my Dehum min and max limits
  So that i check my boundry values
  
    Given user launches and logs in to the Lyric application
      And user selects "Flycatcher device" from the dashboard
      And user navigates to "DeHumidification" screen from the "Primary card" screen
     When User Sets the DeHumidification <Target Value>
     Then Verify DeHumidification cannot set to <Target Value>
  
    Examples: 
      | Target Value | 
      | 35            | 
      | 85           | 
  
  @DeHumidificationIncreamentalof5%
  Scenario Outline: To veify if DeHumidification is increamental of 5%
  As an user 
  I want set DeHumidification up/Down stepper increamental of 5%
  so on tapping Incrementing or decrementing stepper increases or reduces 5%
  
    Given user DeHumidification is set "40%"
      And user launches and logs in to the Lyric application
      And user selects "FlyCatcher device" from the dashboard
      And user navigates to "DeHumidification" screen from the "Primary card" screen
     When user <Control Buttons> the humidity <Target Value>
     Then Verify humidity is "displayed" and set to <Target Value>
    Examples: 
      | Control Buttons | Mintues | 
      | Increment       | 45      | 
      | Increment       | 50      | 
      | Increment       | 55      | 
      | Increment       | 60      | 
      | Decrement       | 55      | 
      | Decrement       | 50      | 
      | Decrement       | 45      | 
  
  @DeHumidificationEnable_Disable
  Scenario Outline: To verify DeHumidification can be enabled or disabled
  As an user 
  I want to know DeHumidification can be enabled or disabled
  so that it can turn on/off humidity respectively 
  
    Given user DeHumidification is <Pre mode>
      And user launches and logs in to the Lyric application
      And user navigates to "DeHumidification" screen from the "Dashboard" screen
     When user <Post mode> DeHumidification from app
     Then Verify if DeHumidification <Post mode> in stat
  
    Examples: 
      | Pre mode | Post mode | 
#      | Enabled  | Disabled  | 
      | Disabled | Enabled   | 
  