@DAS_ZwaveLock
Feature: DAS Zwave Lock
As a HH App user, I would like to add a Z-Wave door lock to my home, 
so that I can my entry door connected with Smart Home Security or Katana R2 and automate more parts of my home.

@ZwaveInclusion
Scenario: As a user i want to include Zwave Lock to my HH App 
Given user has an August/Yale lock account 
And user launches and logs in to the Lyric application
And user navigates to "ZWAVE inclusion through Add new device icon" screen from the "Dashboard" screen
Then user should be displayed with the "Activate ZWAVE Device" screen
And user "activates for discovery" the "Lock" from August lock App
And user names the "Lock" to "Lock1"
Then user should be displayed with "Lock1" device on the "dashboard" screen

@ZwaveLockOn/Off  @--xrayid:ATER-88102
Scenario: As a user i want to Lock/Unlock smart locks from HH app on dashabord and Activity logs
Given user turns "off" the "Lock" through the "ZWAVE device function key"
      And user launches and logs in to the Lyric application
     When user navigates to "Lock Primary card" screen from the "Dashboard" screen
     Then user should see the "Lock" status as "off" on the "Lock Primary card"
     When user navigates to "Dashboard" screen from the "Lock Primary card" screen
     Then user should see the "Lock" status as "off" on the "Dashboard"
     And user receives a "Zwave device Off" activity log
  #action on Primary card - verify pc, dashboard and device
     When user navigates to "Lock Primary card" screen from the "Dashboard" screen
      And user turns "on" the "Lock" through the "Lock Primary card"
     Then user should see the "Lock" status as "on" on the "Lock Primary card"
  #  Then user should see the "Timer" status as "Current time" on the "Lock Primary card"
     When user navigates to "Dashboard" screen from the "Lock Primary card" screen
    Then user should see the "Lock" status as "on" on the "Dashboard"
      And user should see the "Lock" status as "on" on the "ZWAVE device"
      And user receives a "Zwave device ON" activity log
  #action on Primary card - verify pc, dashboard and device
     When user navigates to "Lock Primary card" screen from the "Dashboard" screen
      And user turns "off" the "Lock" through the "Lock Primary card"
     Then user should see the "Lock" status as "off" on the "Lock Primary card"
     When user navigates to "Dashboard" screen from the "Lock Primary card" screen
      Then user should see the "Lock" status as "Off" on the "Dashboard"
      And user should see the "Lock" status as "off" on the "ZWAVE device"
      And user receives a "Zwave device Off" activity log
  #action on device - verify pc and device
     When user turns "on" the "Lock" through the "ZWAVE device function key"
     Then user should see the "Lock" status as "on" on the "ZWAVE device"
     When user navigates to "Lock Primary card" screen from the "Dashboard" screen
     Then user should see the "Lock" status as "on" on the "Lock Primary card"
     And user receives a "Zwave device On" activity log
  #action on device - verify pc and device
     When user turns "off" the "Lock" through the "ZWAVE device function key"
     Then user should see the "Lock" status as "off" on the "ZWAVE device"
      And user should see the "Lock" status as "off" on the "Lock Primary card"
      
      @ZwaveRenameLocks @--xrayid:ATER-88104
      Scenario: As a user I should be able to rename my zwave switch
      Given user launches and logs in to the Lyric application
     When user navigates to "Lock settings" screen from the "Dashboard" screen
      And user edits the "Lock" name to "Lock2"
      And user navigates to "Dashboard via ZWAVE card" screen from the "Lock settings" screen
     Then user should be displayed with "Lock2" device on the "dashboard" screen
      And user reverts back the "Lock name" through CHIL
      
