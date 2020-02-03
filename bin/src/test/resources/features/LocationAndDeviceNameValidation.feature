Feature: As an user, I want to Name and Edit my location and Device name in the app

@CreateLocationandNamingdevice @LYR22113
  Scenario: To verify the user provided names for location and device is cyber security complaint     
     Given app is launched 
     And user taps on LOGIN
     When user taps on add device 
     Then select respective <device> and perform DIY
     When user is in location screen
     Then Make sure provided location name is valid
     And Continue DIY after location entry  
     And Make sure provided device name is valid
     #Valid names constraints 
     #1.Names must be unique within their namespace
     #2.A name can contain only alphanumeric, space, and apostrophe characters
     #3.A name must start and end with an alphabetic or numeric character
     #4.Space and apostrophe characters are ignored in comparisons (for example, home1 and               #home 1 are the same
     #5.A name is not case-sensitive.
     #6.Max length of names will be 30 chars.
     
     #Then user logs out of the app
 Example: 
      | device                              | 
      | Smart Home Security                 |
      | Lyric Round Wi-Fi Thermostat        |
      | D6 Pro Wifi Ductless Controller     | 
      | T5 Wifi Thermostat                  | 
      | T6 Pro Wifi Thermostat              | 
      | Wifi Water Leak and Freeze Detector | 
      | C1 Wifi Security Camera             | 
      | C2 Wifi Security Camera             |  
      | Lyric Smart Controller              |
      | T6 Wired Thermostat                 |   
      | T6 Wireless Thermostat              |

@EditLocationaAndDevice @LYR22113
  Scenario: To verify the user edited names of location and device is cyber security complaint     
     Given app is launched 
     And user taps on LOGIN
     When user Navigates to “Edit location” screen from the "Dashboard" screen
     Then Make sure provided device name is valid
     When user Navigates to “Thermostat configuration” screen from the "Edit location" screen
     Then Make sure provided location name is valid

     #Valid names constraints 
     #1.Names must be unique within their namespace
     #2.A name can contain only alphanumeric, space, and apostrophe characters
     #3.A name must start and end with an alphabetic or numeric character
     #4.Space and apostrophe characters are ignored in comparisons (for example, home1 and               #home 1 are the same
     #5.A name is not case-sensitive.
     #6.Max length of names will be 30 chars.

     Then user Navigates to “Thermostat configuration” screen from the “Dash Board” 
     And user logs out of the app
 
 
 