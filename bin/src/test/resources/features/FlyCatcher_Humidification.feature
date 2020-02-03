@Humidicationsetup
Feature: As an user 
I want to set my humidity target
So that i can set my room humidity as per my prefrence 

@SetTargetHumidity
  Scenario Outline: To change stat humidity as per my prefrence
  As an user 
  I want to set my humidity 
  So that i can set my room humidity as per my prefrence
    Given user humidification is "Enabled"
    And user launches and logs in to the Lyric application
      And user navigates to "Humidification" screen from the "Dashboard" screen
     When user Sets the humidification <Target Value>
     Then Verify humidifier set to <Target Value>
     
    Examples: 
      | Target Value | 
      | 10           | 
#      | 20           | 
      | 30           | 
#      | 40           | 
#      | 50           | 
      | 60           | 
  
  
  @humidificationIncreamentalof5
  Scenario Outline: To veify if humidification is increamental of 5%
  As an user 
  I want set humidification up/Down stepper increamental of 5%
  so on tapping Incrementing or decrementing stepper increases or reduces 5%
  
    Given user stat humidification is set "20"
      And user launches and logs in to the Lyric application
      And user navigates to "humidification" screen from the "Dashboard" screen
     When user <Control Buttons> the humidity <Target Value>
     Then Verify humidity is "displayed" and set to <Target Value>
    Examples: 
      | Control Buttons | Mintues | 
      | Increment       | 25      | 
      | Increment       | 30      | 
      | Increment       | 35      | 
      | Increment       | 40      | 
      | Decrement       | 35      | 
      | Decrement       | 30      | 
      | Decrement       | 25      | 
  
  @humidificationEnable_Disable
  Scenario Outline: To verify humidification can be enabled or disabled
  As an user 
  I want to know humidification can be enabled or disabled
  so that it can turn on/off humidity respectively 
  
    Given user humidification is <Pre mode>
      And user launches and logs in to the Lyric application
      And user navigates to "humidification" screen from the "Dashboard" screen
     When user <Post mode> humidification from app
     Then Verify if humidification <Post mode> in stat
    Examples: 
      | Pre mode | Post mode | 
      | Enabled  | Disabled  | 
      | Disabled | Enabled   | 
  
  @SetWindowProtection
  Scenario Outline: To change window protection as per my prefrence
  As an user 
  I want to set my window protection 
  So that i can set window protection as per my prefrence
  
    Given user launches and logs in to the Lyric application
      And user navigates to "Window Protection" screen from the "Dashboard" screen
     When user Sets the Window Protection to <Target Value>
     Then Verify Window Protection is displayed and set to <Target Value>
    Examples: 
      | Target Value | 
#      |50|
      |90|