@OffsetWithOptOutableFalse @comfort
Feature: Offset with OptOutable set to false
As a user, I should not be able to opt out of DR when my OptOutable is disbaled

@VerifySavingEventCancelByUserMessageforHeatmode @UIAutomatable
  Scenario Outline: Verify Saving Event Cancel By User Message
  As a user, I should be able to cancel a DR Event and receive a saving event cancel message on  Activity History screenfor HBB and Jasper Devices in heat mode when delta value is passed 
    Given user <Thermostat> is enrolled with DR
      And user has triggered DR event with "offset" and "is not" optoutable
      And DR event has started on the user device
     When user logs in to the Lyric Application
     Then user should be displayed with a "Saving event until" green label on the Dashboard
     When user naviagtes to "Primary card" screen 
     Then user should be displayed with a "saving event until" green label on the primary card
     And user decreases the set point below the heat set value
     Then user would be allowed to set a temperature below the set value 
     When user increases heat set upto the heat set delta vlaue 
     Then user should be allowed to set temperature upto the set value
      And user increases the set point above the heat set value
     Then user "receives" a cancel saving event message with a "OK" option
     When user taps on the "OK" option
     Then user should be displayed with a "saving event until" green label on the primary card
      And set point value should not change
      And user logs out of the application
      Examples:
      |HB|
      |JapserNA|
      
      @VerifySavingEventCancelByUserMessageforcoolmode @UIAutomatable
  Scenario Outline: Verify Saving Event Cancel By User Message
  As a user, I should be able to cancel a DR Event and receive a saving event cancel message on  Activity History screen for HBB and Jasper Devices in cool mode when delta value is passed 
    Given user thermostat is enrolled with DR
      And user has triggered DR event with "offset" and "is not" optoutable
      And DR event has started on the user device
     When user logs in to the Lyric Application
     Then user should be displayed with a "Saving event until" green label on the Dashboard
     When user naviagtes to "Primary card" screen 
     Then user should be displayed with a "saving event until" green label on the primary card
     And user increase the set point below the cool set value 
     Then user would be allowed to set a temperature below the set value 
     When user decreases cool set value upto the cool set delta vlaue 
     Then user should be allowed to set temperature upto the set value
      And user decreases the set point below the cool set value
     Then user "receives" a cancel saving event message with a "OK" option
     When user taps on the "OK" option
     Then user should be displayed with a "saving event until" green label on the primary card
      And set point value should not change
      And user logs out of the application
       Examples:
      |HB|
      |JapserNA|
