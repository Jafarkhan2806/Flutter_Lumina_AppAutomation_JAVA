Feature: As an user, I want to Reset my wifi to different network for the devices

@ResetWifiWhenDeviceofflineHBB @LYR25497
  Scenario: To verify that user can change his/her wifi network connection of the devices 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to “Reset Wifi” screen of <Device>
    And click on Reset Wifi 
    Then it starts with Installation page
    Then follow the instruction to broadcast the device
    When device starts broadcasting
    Then connect to thermostat network by navigating to device settings page or through WAC in IOS if WAC mode is enabled
    When mobile device connect to thermostat network 
    Then Connect page will appear for home wifi connection
    Then select the network and provide password and click next
    Then Wi-Fi updated screen will appear 
    And device will appear online with in 5 - 15 min
    
    Example: 
      | Device                              | 
     
@ResetWifiWhenDeviceonlineHBB @LYR25497
  Scenario: To verify that user can change his/her wifi network connection of the devices 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to “Reset Wifi” screen of <Device>
    And click on Reset Wifi 
    Then it starts with Installation page
    Then follow the instruction to broadcast the device
    When device starts broadcasting
    Then connect to thermostat network by navigating to device settings page or through WAC in IOS if WAC mode is enabled
    When mobile device connect to thermostat network click next  
    Then Connect page will appear for home wifi connection
    Then select the network and provide password and click next
    Then Wi-Fi updated screen will appear 
    And device will remain online
    
    Example: 
      | Device                              | 
      | Lyric Round Wi-Fi Thermostat        |
       


     @ResetWifiWhenDeviceofflineJasper @LYR25497
  Scenario: To verify that user can change his/her wifi network connection of the devices 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to “Reset Wifi” screen of <Device>
    And click on Reset Wifi 
    Then it starts with Installation page
    Then follow the instruction to broadcast the device
    When device starts broadcasting
    Then connect to thermostat network by navigating to device settings page or through WAC in IOS if WAC mode is enabled
    When mobile device connect to thermostat network click next 
Then provide thermostat security PIN shown on thermostat and click next
    Then Connect page will appear for home wifi connection
    Then select the network and provide password and click next
    Then Wi-Fi updated screen will appear 
    And device will appear online with in 3 - 10 min
    
    Example: 
      | Device                              | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | T6 Wired Thermostat                 |   
      | T6 Wireless Thermostat              |    
     

@ResetWifiWhenDeviceonlineJasper @LYR25497
  Scenario: To verify that user can change his/her wifi network connection of the devices 
    Given app is launched 
    And user taps on LOGIN
    When user navigates to “Reset Wifi” screen of <Device>
    And click on Reset Wifi 
    Then it starts with Installation page
    Then follow the instruction to broadcast the device
    When device starts broadcasting
    Then connect to thermostat network by navigating to device settings page or through WAC in IOS if WAC mode is enabled
    When mobile device connect to thermostat network click next
    Then provide thermostat security PIN shown on thermostat and click next
    Then Connect page will appear for home wifi connection
    Then select the network and provide password and click next
    Then Wi-Fi updated screen will appear 
    And device will remain online
    
    Example: 
     | Device                              | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | T6 Wired Thermostat                 |   
      | T6 Wireless Thermostat              |



           			

  