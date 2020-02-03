@WLDDIY
Feature: WLD DIY Registration
As a user I want to register a WLD device using the Lyric application


@WLDDIYRegistrationWhenExistingLocationAndWLDNamesAreEntered @NotAutomatable  @--xrayid:ATER-53864
Scenario Outline: As a user I want to verify if error popup displays when existing location and WLD names are entered again
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects the "Custom" from "Choose Location" screen
And user inputs <Existing location name> in the "Choose Location" screen
Then user should receive a "Existing Location Error" popup
When user "clicks on OK in" the "Existing Location Error" popup
Then user should be displayed with the "Choose Location" screen
When user selects <Existing location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user inputs <Existing device name> in the "Name Your Detector" screen
Then user should receive a "Existing Detector Error" popup
When user "clicks on OK in" the "Existing Detector Error" popup
Then user should be displayed with the "Detector Name" screen
When user selects <Existing detector name> from "Detector Name" screen
Then user should be displayed with the "Connect" screen

Examples: 
      | Existing location name      | Existing device name  |
      | Home                        | Living Room           |
      
@WLDDIYWhenUserEntersMaxCharactersInCustomLocationAndDetectorName @NotAutomatable @--xrayid:ATER-53865
Scenario Outline: As a user I want to enter max characters in new location and Detector name
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
And user selects the "Custom" from "Choose Location" screen
And user inputs <max characters> in the "Choose Location" screen
Then user should not be allowed to enter more than "20" characters
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
And user selects "Create Custom Name" from "Name Your Base Station" screen
And user inputs <max characters> in the "Create Custom Name" screen
Then user should not be allowed to enter more than "20" characters

Examples: 
      | max characters                                                              |	location name|
      | This is to test max characters in custom location name and base station     | Home |

@WLDDIYRegistrationWithNewCustomLocationAndWLDName		@P1 @NotAutomatable @--xrayid:ATER-53866
Scenario Outline: As a user I want to register a WLD device with new location and new name using the Home application
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects the "Custom" from "Choose Location" screen
And user inputs <new location name> in the "Choose Location" screen
Then user should be displayed with the "Confirm Your Address Postcode" screen
When user inputs <invalid zip code>
Then user should receive a "Invalid zip code" popup
When user "dismisses" the "Invalid zip code" popup
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Detector" screen
And user selects "Create Custom Name" from "Name Your Detector" screen
When user inputs <new device name> in the "Name Your Detector" screen
Then user should be displayed with the "Connect to Network" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user navigates to "Enter your Wifi Password Screen"
And user inputs "vibex888" as the WiFi Password
And user navigates to "Congratulations " screen from the "Connect to Network" screen
And user navigates to "Dashboard" screen from the "Congratulations" screen
Then user should be displayed with "WLD" device on the "dashboard" screen
And user should be displayed with <new device name> device on the "dashboard" screen
When user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen 
And user "Deletes Leak Detector" by clicking on "delete" button
Then user should receive a "Delete WLD Confirmation" popup
When user "accepts" the "Delete WLD Confirmation" popup
Then user should not be displayed with "WLD" device on the "dashboard" screen
And user should not be displayed with <new device name> device on the "dashboard" screen

Examples: 
      | new location name           | new device name       | invalid zip code            | valid zip code        |
      | California                  | Scrum Room            | 55555                       | 90001                 |
      | Texas                       | War Room              | 55555                       | 73301                 |
      | Texas#$%                    | Ball Room             | 55555                       | 73301                 |


@WLDDIYRegistrationWithAvailableDefaultLocationAndDetectorName @NotAutomatable @--xrayid:ATER-53867
Scenario Outline: As a user I want to verify default location name and default wld name 
Given  user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Power Your Water Leak Detector" screen
And user selects <Default Location> from "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <invalid zip code>
Then user should receive a "Invalid zip code" popup
When user "dismisses" the "Invalid zip code" popup
And user inputs <valid zip code>
Then user should be displayed with the "Name Your Detector" screen
And user selects <Default Device Name> from "Name Your Detector" screen
And user should be displayed with the "Coonecting to honeywell" screen
And user should be displayed with the "Wifi instruction" pop up 
And user should be displayed with the "Connect to Network" screen
When user selects the "Refresh" option 
Then user should displayed with "Refresh" wifi screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password
Then user should be displayed with "Congratulations" screen
When user navigates to "Dashboard" screen from "Congratulations" Screen
Then user should be displayed with <Default Device Name> device on the "dashboard" screen
When user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen
And user "Deletes Leak Detector" by clicking on "delete" button
Then user should receive a "Delete WLD Confirmation" popup
When user "accepts" the "Delete WLD Confirmation" popup
Then user should not be displayed with "WLD" device on the "dashboard" screen
And user should not be displayed with <Default Device Name> device on the "dashboard" screen
And user "deletes location details" by clicking on "delete" button


Examples: 
      | Default Location	| Default Device Name	| invalid zip code            | valid zip code        |
      | Home				| Living room		    | 55555                       | 90001                 |		
      | Vacation Home       | Kitchen	            | 55555                       | 90001                 |
      | Office              | Entryway	            | 55555                       | 90001                 |
      | Lake House          | Dining Room           | 55555                       | 90001                 |
      | Cabin               | Bedroom               | 55555                       | 90001                 |
      | Pool House          | First Floor           | 55555                       | 90001                 |


@WLDDIYRegistrationWhenAlreadyWLDisRegistered @NotAutomatable @--xrayid:ATER-53871
Scenario Outline: As a user I want to verify error message when already my WLD is registered and i am adding it to different location
Given  user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Power Your Water Leak Detector" screen
And user selects <Default Location> from "Choose Location" screen
And user inputs <valid zip code>
Then user should be displayed with the "Name Your Detector" screen
And user selects <Default Device Name> from "Name Your Detector" screen
And user should be displayed with the "Connecting to honeywell" screen
And user should be displayed with the "Connect to Network" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password
Then user should be displayed with "Error"Pop up
When user tap on "retry"
Then user should be displayed with "Error"Pop up
When user tap on "Cancel"
Then user should be displayed with "Add new device" Screen
 
Examples:
      | Default Location      | Default Device Name  |
      | Home                                                          | Living room                         |

@WLDDIYDenyAppAccessToLocationServices	 @NotAutomatable @--xrayid:ATER-53873
Scenario: As a user I should be prompted with Location services popup when location services access is denied after installation
Given user denies location services access while launching the Lyric app after installation 
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user clicks on "Connect" button
Then user should receive a "Location services" popup
When user "denies access" in "Location services" popup
Then user should be displayed with the "Power Your Water Leak Detector" screen
When user clicks on "Connect" button
Then user should receive a "Location services" popup
When user "allows access" in "Location services" popup
Then user should be displayed with the "Looking for detector" spinner


@WLDDIYWhenNoWLDAreAvailable @NotAutomatable @--xrayid:ATER-53874
Scenario: As a user I should be prompted with Base Station Not Found popup when there are no base stations available
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user clicks on "Connect" button
Then user should be displayed with the "Looking for Detector" screen
And user should receive a "Detector Not Found" popup
When user "clicks on OK in" the "Detector Not Found" popup
Then user should be displayed with the "Power Your Water Leak Detector" screen
And user clicks on "Connect" button
And user should receive a "Detector Not Found" popup
When user "Retries Detector pairing in" the "Detector Not Found" popup
Then user should receive a "Detector Not Found" popup
And user "clicks on OK in" the "Detector Not Found" popup
And user should be displayed with the "Power Your Water Leak Detector" screen


@WLDDIYCanncelInRegisterWLD	  @NotAutomatable @--xrayid:ATER-53875
Scenario Outline: As a user I should be able to Cancel the setup in Register wld screen
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user navigates to "Choose Location" screen from the "Power Your Water Leak Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user navigates to "Connecting to Honeywell" screen from the "connect to Network" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Connecting to Honeywell" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user navigates to "Dashboard" screen from the "Connecting to Honeywell" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |
      

@WLDDIYDisconnectWLD @NotAutomatable @--xrayid:ATER-53878
Scenario Outline: As a user I should be prompted with Bluetooth disconnected popup when WLD device is disconnected
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user clicks on "Connect" button
Then user should be displayed with the "Looking for Detector" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user navigates to "Connecting to Honeywell" screen from the "connect to Network" screen
When user disconnects the WLD device
Then user should receive a "Detector Pairing Failed" popup
When user clicks on "OK" button
Then user navigates to "Connecting to Honeywell" screen from the "Connect" screen
When user disconnects the WLD  device
Then user should receive a "Detector Pairing Failed" popup
When user clicks on "Restart Bluetooth" button
Then user should be displayed with the "Power Your Water Leak Detector" screen
And user should be displayed with "Connecting to Detector" spinner

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |


@WLDDIYTurnOffMobileDeviceBluetooth @NotAutomatable @--xrayid:ATER-53881
Scenario: As a user I should be prompted with Bluetooth is off popup when mobile device Bluetooth is off
Given user launches and logs in to the Lyric application
When user turns "off" mobile device Bluetooth
And user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user clicks on "Connect" button
Then user should receive a "Bluetooth is Off" popup
When user "clicks on OK" in "Bluetooth is Off" popup
Then user should be displayed with the "Power Your Water Leak Detector" screen
And user turns "ON" mobile device Bluetooth
When user opens the Lyric app and cicks on "Next" button
Then user should be displayed with the "Looking for detectors screen" screen
And user turns "OFF" mobile device Bluetooth
When user opens the Lyric app and cicks on "Next" button
Then user should receive a "Bluetooth is Off" popup
And user "Clicks On SETTINGS" in "Bluetooth is Off" popup
And user should be displaeyd with the "Device Settings" screen
When user turns "ON" mobile device Bluetooth
When user opens the Lyric app and clicks on "Next" button
Then user should be displayed with the "Power Your Water Leak Detector" screen
When user clicks on "Next" button
Then user should be displayed with the "Pairing with Detector" screen


@WLDDIYRegistrationWithInvalidNetworkPwdAndTryReconnectingWithValidPwd	 	@P2 @NotAutomatable @--xrayid:ATER-53885
Scenario Outline: As a user I want to register a WLD device by connecting to available network after trying connecting to a invalid Wi-Fi network 
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
When user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
And user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "Vibe@04" as the WiFi Password
Then user should receive a "Wi-Fi Connection Failed" popup
When user "dismisses" the "Wi-Fi Connection Failed" popup
Then user should be displayed with the "Enter your Wi-Fi password" screen
When user inputs "vibex888" as the WiFi Password 
Then user should be displayed with "Congratulations" Screen
When user navigates to "Dashboard" screen from the "Congratulations" screen
Then user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |

@WLDDIYRegistrationByConnectingToOpenWiFiNetwork @NotAutomatable @--xrayid:ATER-53887
Scenario Outline: As a user I should not be able to connect to a open Wi-Fi network and able to perform WLD registration
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
And user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
When user selects "Open Wi-Fi Network"
Then user should be displayed with the "Connecting to Wifi" spinner
And user should be displayed with the "Congratulations" screen
When user navigates to "Dashboard" screen from the "Congratulations" screen
Then user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |
      

@WLDDIYAddAWiFiNetworkWithInvalidPwdAndTryReconnectingWithAvailableNetwork	 	@P2 @NotAutomatable @--xrayid:ATER-53888
Scenario Outline: As a user I want to register a WLD device by connecting to available network after trying connecting to a invalid Wi-Fi network 
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
And user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
When user selects "MPRIZE" from "Connect to Network" screen
And user inputs "Vibe@04" as the WiFi Password
Then user should receive a "Wi-Fi Connection Failed" popup
When user "dismisses" the "Wi-Fi Connection Failed" popup
Then user should be displayed with the "Enter your Wi-Fi password" screen
And user navigates to "Connect to Network" screen from the "Enter your Wi-Fi password" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user should be displayed with the "Connecting to Wifi" spinner
And user should be displayed with the "Congratulations" screen
When user navigates to "Dashboard" screen from the "Congratulations" screen
Then user should not be displayed with <device name> device on the "dashboard" screen


Examples: 
      | location name | device name  | 
      | Home          | Living Room  |



@WLDDIYMultipleWLDRegistrationsForTheSameAccount		@P2 @NotAutomatable @--xrayid:ATER-53889
Scenario Outline: As a user I want to register multiple WLD devices for a single account using the Lyric application
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
And user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user should be displayed with the "Connecting to Wifi" spinner
And user should be displayed with the "Congratulations" screen
When user navigates to "Dashboard" screen from the "Congratulations" screen
And user should be displayed with <first device name> device on the "dashboard" screen
And user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
And user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user should be displayed with the "Connecting to Wifi" spinner
And user should be displayed with the "Congratulations" screen
When user navigates to "Dashboard" screen from the "Congratulations" screen
And user should be displayed with <second device name> device on the "dashboard" screen
And user navigates to "Base Station Configuration" screen from the "Dashboard" screen
And user "Deletes Leak Detector" by clicking on "delete" button
Then user should receive a "Deletes WLD Confirmation " popup
And user "accepts" the "Deletes WLD Confirmation" popup
When user navigates to "Leak Detector Configuration" screen from the "Dashboard" screen
And user "Deletes Leak Detector" by clicking on "delete" button
Then user should receive a "Deletes WLD Confirmation" popup
When user "Accepts" the "Deletes WLD Confirmation" popup
Then user should not be displayed with <first device name> device on the "dashboard" screen
And user should not be displayed with <second device name> device on the "dashboard" screen

Examples: 
      |	location name	|	first device name	|	second device name	|	
      |	Home			|	Living Room			|	Kitchen				|


@WLDDIYTimeoutInWLDDevice @NotAutomatable @--xrayid:ATER-53891
Scenario Outline: As a user I should be prompted with Bluetooth disconnected popup when timeout happens in WLD device
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
And user navigates to "Connect to Network" screen from the "Connecting To Honeywell" screen
When user waits until timeout happens in DAS device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Power Your Water Leak Detector" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |
      
      
@WLDDIYRegistrationByMinimizingAndMaximizingTheApp		@P3 @NotAutomatable @--xrayid:ATER-53892
Scenario Outline: As a user I want to register a WLD device using the Lyric application by navigating to other apps intermittently
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Detector" screen
When user selects <device name> from "Name Your Detector" screen
Then user should be displayed with the "Connecting To Honeywell" screen
When user minimizes and maximizes the app
And user navigates to "Connect to Network" screen from the "Register Base Station" screen
And user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
And user minimizes and maximizes the app
Then user should be displayed with the "Connecting to Wifi" spinner
And user should be displayed with the "Congratulations" screen
When user minimizes and maximizes the app
And user navigates to "Dashboard" screen from the "Congratulations" screen
Then user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |
     

@WLDDIYConfigurationVerifyBackArrowFunctionality    @P2 @NotAutomatable @--xrayid:ATER-53893
Scenario Outline: Verify Back arrow functionality while registering WLD
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
And user navigates to "WiFi Water Leak and Freeze Detector" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "WiFi Water Leak and Freeze Detector" screen
When user navigates to the <PreScreen> screen
And user selects "Back arrow" from <PreScreen> screen
Then user should be displayed with the <PostScreen> screen
 
Examples:
|PreScreen                  | PostScreen                |
|Detector Paired            | Power Up Your WLD         |
|Detector Name                         | Location Details          |
|Select your Wifi Network   | Detector Name                             |
|Add Network                                                  | Select your Wifi Network  |