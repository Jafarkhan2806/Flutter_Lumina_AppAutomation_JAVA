@DASDIY
Feature: DAS DIY Registration
As a user I want to register a DAS device using the Lyric application


@DIYSmartHomeSecurityOptionInAddNewDevice	@WeDon'tHaveAddNewDeviceInGlobalDrawer @--xrayid:ATER-54957
Scenario: As a user I should be able to see Smart Home Security option in Add New Device screen
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user should be displayed with "Smart Home Security" option
When user navigates to "Add New Device in Global Drawer" screen from the "Dashboard" screen
Then user should be displayed with "Smart Home Security" option

@DIYCancelSetUp123	@UIAutomated @--xrayid:ATER-54960
Scenario: User should be able to cancel the set up from choose location and name your base station screens
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Choose Location" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user navigates to "Add New Device Dashboard" screen from the "Choose Location" screen

@DIYDenyAppAccessToLocationServices @--xrayid:ATER-54969
Scenario: As a user I should be prompted with Location services popup when location services access is denied after installation
Given user denies location services access while launching the Lyric app after installation and then logs in to the Lyric app
When user navigates to "Add New Device Dashboard" screen form the "Dashboard" screen
And user selects “Smart Home Security” from “Add device” screen
Then user should be displayed with the "Choose Location" screen
And user clicks on "Location" button
Then user should be displayed with the "Name Your Base Station" screen
And user clicks on "base station name" button
Then user should be displayed with the "Power Base Station" screen
And user clicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
And user clicks on "Next" button
Then user should receive a "Location services" popup
And user "denies access" in "Location services" popup
Then user should be displayed with the "Power Base Station" screen
And user clicks on "Next" button
Then user should receive a "Location services" popup
And user "allows access" in "Location services" popup
Then user should be displayed with the "Looking for Base Station" screen
When user turns "off" location services for Lyric app in mobile settings
And user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user should receive a "Location services" popup
And user "allows access" in "Location services" popup
Then user should be displayed with the "Looking for Base Station" screen 

@DIYWhenNoBaseStationsAreAvailable123	@UIAutomated		@Doesn'tRequireAnyBaseStationsForExecution @--xrayid:ATER-54971
Scenario Outline: As a user I should be prompted with Base Station Not Found popup when there are no base stations available
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Looking for Base Station" screen from the "Power Base Station Instructions" screen
Then user should receive a "Base Station Not Found" popup
And user "clicks on OK in" the "Base Station Not Found" popup
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Looking for Base Station" screen from the "Power Base Station Instructions" screen
And user should receive a "Base Station Not Found" popup
Then user "retries base station pairing in" the "Base Station Not Found" popup
Then user should receive a "Base Station Not Found" popup
And user "clicks on OK in" the "Base Station Not Found" popup

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYCancelSetUpInRegisterBaseStation		@UIAutomated @--xrayid:ATER-54973
Scenario Outline: As a user I should be able to cancel set up in Register Base Station screen
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user "views cancel setup" by clicking on "Back arrow" button
And user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Register Base Station" screen
When user "views cancel setup" by clicking on "Back arrow" button
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYWhenQRCodeIsNotScanned	@UIAutomated @--xrayid:ATER-54975
Scenario Outline: As a user I should be prompted with Scanning Failure screen when QR code is not scanned
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When QR code is not scanned for "2" minutes
Then user should receive a "scanning failure" popup
When user "accepts" the "scanning failure" popup
Then user should be displayed with the "Register Base Station" screen
And user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYWhenInvalidQRCodeIsScanned	@UIAutomated @--xrayid:ATER-54978
Scenario Outline: As a user my DAS device should not be configured when invalid QR code is scanned
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans an invalid QR code
Then user should receive a "scanning failure" popup
When user "accepts" the "scanning failure" popup
Then user should be displayed with the "Register Base Station" screen
And user scans the QR code by showing it to the base station camera

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYRefreshBaseStationsList123	@UIAutomated		@RequiresMultipleBaseStationsForExecution @--xrayid:ATER-54981
Scenario Outline: As a user I should be able to refresh the base stations list when multiple base stations are displayed
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Select Base Station" screen from the "Power Base Station Instructions" screen
And user "views select base station screen" by clicking on "Refresh" button

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYDisconnectDASDevice @--xrayid:ATER-54995
Scenario: As a user I should be prompted with Bluetooth disconnected popup when DAS device is disconnected
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
When user disconnects the DAS device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Power Base Station" screen
And user clicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
And user clicks on "Next" button
Then user should be displayed with the "Looking for Base Station" screen
When there is one base station available
And user should be displayed with the "Register Base Station" screen
And user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
When user disconnects the DAS device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Power Base Station" screen

@DIYTimeoutInDASDevice @--xrayid:ATER-54997
Scenario: As a user I should be prompted with Bluetooth disconnected popup when timeout happens in DAS device
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
When user waits until timeout happens in DAS device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Power Base Station" screen

@DIYTurnOffMobileDeviceBluetooth @--xrayid:ATER-54999
Scenario: As a user I should be prompted with Bluetooth is off popup when mobile device Bluetooth is off
Given user launches and logs in to the Lyric application
When user turns "off" mobile device Bluetooth
Then user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
When user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
And user clicks on "Next" button
Then user should receive a "Bluetooth is Off" popup
And user "clicks on OK" in "Bluetooth is Off" popup
Then user should be displayed with the "Power Base Station" screen
And user turns "on" mobile device Bluetooth
When user opens the DAS app and cicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
And user turns "off" mobile device Bluetooth
When user opens the DAS app and cicks on "Next" button
Then user should receive a "Bluetooth is Off" popup
And user "clicks on SETTINGS" in "Bluetooth is Off" popup
Then user should be displaeyd with the "Device Settings" screen
And user turns "on" mobile device Bluetooth
When user opens the DAS app and clicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
And user clicks on "Next" button
Then user should be displayed with the "Looking for Base Station" screen
When there is one base station available
Then user should be displayed with "Register Base Station" screen
When user turns "off" mobile device Bluetooth
Then user should receive a "Bluetooth Disconnected" popup
And user taps on "OK" button
Then user should be displayed with the "Power Base Station" screen
And user turns "on" mobile device Bluetooth
When user opens the DAS app and cicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
When user opens the DAS app and cicks on "Next" button
Then user should be displayed with the "Looking for Base Station" screen
When there is one base station available
Then user should be displayed with "Register Base Station" screen
When user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
When user turns "off" mobile device Bluetooth
Then user should receive a "Bluetooth Disconnected" popup
And user taps on "OK" button
Then user should be displayed with the "Power Base Station" screen

@DIYCancelSetUpInConnectToNetworkScreen123	@UIAutomated @--xrayid:ATER-55000
Scenario Outline: As a user I should be able to cancel set up in Connect to Network screen
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user "adds a Network" by clicking on "Add A Network" button
And user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Add a Network" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Add New Device Dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYMoveAwayFromDASDeviceAfterScanningQRCode @--xrayid:ATER-55001
Scenario: As a user I should be prompted with Bluetooth Disconnected popup when I move away from DAS device after scanning the QR code
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user should receive a "Bluetooth Disconnected" popup
And user taps on "OK" button
Then user should be displayed with the "Power Base Station" screen
And user clicks on "Next" button
Then user should be displayed with the "Power Base Station Instructions" screen
And user clicks on "Next" button
Then user should be displayed with the "Looking for Base Station" screen
When there is one base station available
And user should be displayed with the "Register Base Station" screen 
And user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
When user moves away from DAS Device
Then user should receive a "Bluetooth Disconnected" popup
And user taps on "OK" button
Then user should be displayed with the "Power Base Station" screen

@DIYAddAWiFiNetwork	@Setuprequired @--xrayid:ATER-55002
Scenario: As a user I should be able to add a new network
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
When user clicks on "Add A Network" button
Then user should be displayed with the "Connect to Network" screen
And user clicks on "security type" button
When user enters "invalid" new network credentials and tries to join the network
Then user should receive a "WiFi Connection timeout" popup
And user clicks on "RETRY" button
Then user should receive a "WiFi Connection timeout" popup
And user clicks on "OK" button
Then user should be displayed with the "Connect to Network" screen
When user enters "valid" new network credentials and tries to join the network
Then added network should be displayed in the list of networks in "Connect to Network" screen

@DIYInvalidWiFiPassword	@UIAutomated @--xrayid:ATER-55003
Scenario Outline: As a user I should not be able to connect to a Wi-Fi network with invalid password
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex444" as the WiFi Password
And user should receive a "Wi-Fi Connection Failed" popup
When user "dismisses" the "Wi-Fi Connection Failed" popup
Then user should be displayed with the "Enter your Wi-Fi password" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Enter your Wi-Fi password" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user navigates to "Add New Device Dashboard" screen from the "Enter your Wi-Fi password" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYRegistrationWhenSingleBaseStationIsAvailable123	@UIAutomated @--xrayid:ATER-55004
Scenario Outline: As a user I want to register a DAS device using the Lyric application
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "dismisses" the "Delete DAS Confirmation" popup
Then user "deletes DAS device" by clicking on "delete" button
And user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |
      
@DIYRegistrationWithNewLocationAndBaseStationName		@UIAutomated @--xrayid:ATER-55005
Scenario Outline: As a user I want to register a DAS device with new location and base station name using the Lyric application
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user inputs <new location name> in the "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <invalid zip code>
Then user should receive a "Invalid zip code" popup
When user "dismisses" the "Invalid zip code" popup
When user inputs <valid zip code>
Then user should be displayed with the "Name Your Base Station" screen
When user inputs <new device name> in the "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
##And user creates a passcode if required
##And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <new device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen
Then user "deletes location details" by clicking on "delete" button

Examples: 
      | new location name		| new device name		| invalid zip code		| valid zip code		|
      | California				| Scrum Room				| 55555					| 90001				|

@DIYRegistrationWithAddSensorAndEnableGeoFencing		@UIAutomated @--xrayid:ATER-55006
Scenario Outline: As a user I want to register a DAS device by adding sensor and enabling geofencing and alexa using the Lyric application
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password
Then user navigates to "Set Up Accessories" screen from the "Connect to Network" screen
And user navigates to "Overview" screen from the "Set Up Accessories" screen
Then user navigates to "Locate Sensor" screen from the "Overview" screen
And user navigates to "Name Sensor" screen from the "Locate Sensor" screen
When user selects <sensor location> from "Name Sensor" screen
Then user should be displayed with the "Name Sensor" screen
When user selects <sensor location area> from "Name Sensor" screen
Then user should be displayed with the "Check Location" screen
And user navigates to "Check Location Signal" screen from the "Check Location" screen
Then user navigates to "Prepare Sensor" screen from the "Check Location Signal" screen
And user navigates to "Place Adhesive strips" screen from the "Prepare Sensor" screen
Then user navigates to "Mount Sensor" screen from the "Place Adhesive strips" screen
And user navigates to "Sensor Ready" screen from the "Mount Sensor" screen
Then user navigates to "Set Up Accessories configured" screen from the "Sensor Ready" screen
And user navigates to "Enable Geofencing" screen from the "Set Up Accessories configured" screen
Then user navigates to "Geofence" screen from the "Enable Geofencing" screen
And user navigates to "Geofence Enabled" screen from the "Geofence" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Geofence Enabled" screen
And user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Sensor Settings" screen from the "Dashboard" screen
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "dismisses" the "Delete Sensor Confirmation" popup
And user "deletes sensor" by clicking on "delete" button
Then user should receive a "Delete Sensor Confirmation" popup
And user "accepts" the "Delete Sensor Confirmation" popup
Then user should not be displayed with "sensors" on the "sensors" screen
When user navigates to "Base Station Configuration" screen from the "Sensor" screen
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name	| device name		| sensor location		| sensor location area		|
      | Home				| Living Room		| Door					| Front Door					|

@DIYMultipleDASRegistrationsForTheSameAccount123	@UIAutomated @--xrayid:ATER-55007
Scenario Outline: As a user I want to register multiple DAS devices for a single account using the Lyric application
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <first device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Select Base Station" screen from the "Power Base Station Instructions" screen
When user selects <Base Station MAC ID> from "Select Base Station" screen
And user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <first device name> device on the "dashboard" screen
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <second device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <second device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "accepts" the "Delete DAS Confirmation" popup
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <first device name> device on the "dashboard" screen
And user should not be displayed with <second device name> device on the "dashboard" screen

Examples: 
      |	location name	|	first device name	|	second device name	|	Base Station MAC ID		|
      |	Home				|	Living Room			|	Kitchen				|	B8:2C:A0:00:07:D8		|

@DIYRegistrationByReceivingCallsAndMsgs @--xrayid:ATER-55010
Scenario Outline: As a user I want to register a DAS device using the Lyric application
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
And user scans the QR code by showing it to the base station camera
When user receives a message/notification/call
Then user should be able to attend the message/notification/call
Then user should be displayed with the "Connect to Network" screen
When user clicks on "Available Network" button
Then user should be displayed with the "Enter your Wi-Fi password" screen
When user inputs "Valid password" as the WiFi Password
And user clicks on "Next" button
When user receives a message/notification/call
Then user should be able to attend the message/notification/call
And user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
Then user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
And user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
Then user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYAddAWiFiNetworkWithInvalidPwdAndTryReconnectingWithAvailableNetwork123	@UIAutomated @--xrayid:ATER-55011
Scenario Outline: As a user I want to register a DAS device by connecting to available network after trying connecting to a invalid Wi-Fi network 
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "MidhunSatya@04" as the WiFi Password
Then user should receive a "Wi-Fi Connection Failed" popup
When user "dismisses" the "Wi-Fi Connection Failed" popup
Then user should be displayed with the "Enter your Wi-Fi password" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |

@DIYConnectingToOpenWiFiNetwork	@SetUpRequired @--xrayid:ATER-55016
Scenario Outline: As a user I should not be able to connect to a open Wi-Fi network and able to perform DAS registration
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Open Wi-Fi Network"
Then user should be displayed with the "Connecting Smart Home Security" screen
And user should be displayed with the "Almost Done" screen
Then user should be displayed with the "Smart Home Security" screen
When user clicks on "No" button
Then user should be displayed with the "Enable Geofencing" screen
And user clicks on "SKIP" button
Then user should be displayed with the "Enable Amazon Alexa" screen
And user clicks on "SKIP" button
#And user creates a passcode if required
And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
And user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |

@DIYRegistrationByNavigatingToOtherApps		@UIAutomated @--xrayid:ATER-55017
Scenario Outline: As a user I want to register a DAS device using the Lyric application by navigating to other apps intermittently
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user navigates to other apps and navigates back to Lyric app
Then user scans the QR code by showing it to the base station camera
And user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
When user navigates to other apps and navigates back to Lyric app
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to other apps and navigates back to Lyric app
Then user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
When user navigates to other apps and navigates back to Lyric app
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to other apps and navigates back to Lyric app
Then user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
When user navigates to other apps and navigates back to Lyric app
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
When user navigates to other apps and navigates back to Lyric app
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | Living Room                     |

@DIYTryToReRegisterDAS123		@UIAutomated @--xrayid:ATER-55019
Scenario Outline: As a user I should be prompted with base station not found popup when I try to reregister DAS using the Lyric application
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <first device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <first device name> device on the "dashboard" screen
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <second device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Looking for Base Station" screen from the "Power Base Station Instructions" screen
And user should receive a "Base Station Not Found" popup
Then user "retries base station pairing in" the "Base Station Not Found" popup
Then user should receive a "Base Station Not Found" popup
And user "clicks on OK in" the "Base Station Not Found" popup
When user navigates to "dashboard" screen from the "Power Base Station Instructions" screen
Then user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <first device name> device on the "dashboard" screen

Examples: 
      | location name | first device name	| second device name		|
      | Home          | Living Room  		| Kitchen				|

@DIYTryToReRegisterDASAfterPerformingFactorySettingsOnDAS @--xrayid:ATER-55023
Scenario Outline: As a user I should be prompted with device already registered popup when I try to reregister DAS after performing factory settings on the registered DAS
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
And user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
Then user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
And user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
Then user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user performs factory settings on the registered DAS
And user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user clicks on "Available Network" button
Then user should be displayed with the "Enter your Wi-Fi password" screen
When user inputs "Valid password" as the WiFi Password
And user clicks on "Next" button
Then user should be displayed with the "Connecting Smart Home Security" screen
And user should be displayed with the "Almost Done" screen
Then user should be displayed with the "Device already registered" screen
When user clicks on "OK" button
Then user should be displayed with the "Power Base Station" screen

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |

@DIYTryToReRegisterDASWhenDASIsOffline @--xrayid:ATER-55025
Scenario Outline: As a user I should not see the DAS device in the list of base stations when I try to reregister DAS after turning off the DAS
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
And user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
Then user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
And user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
Then user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user switches off/unplugs the registered DAS
And user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
And user navigates to "Choose Location" screen from the "Smart Home Security" screen
Then user navigates to "Name Your Base Station" screen from the "Choose Location" screen
And user navigates to "Power Base Station" screen from the "Name Your Base Station" screen
Then user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
And user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
Then user should not see the registered DAS device in the list of base stations

Examples: 
      | location name | device name  | 
      | Home          | Living Room  |

@DIYDeleteExistingDASAndRegisterIt123	@UIAutomated @--xrayid:ATER-55028
Scenario Outline: As a user I want to register a deleted DAS device using the Lyric application
Given user DAS device with ADB ID "9c48da88" is deregistered and booted
And user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "Smart Home Security" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Name Your Base Station" screen
When user selects <device name> from "Name Your Base Station" screen
Then user should be displayed with the "Power Base Station" screen
When user navigates to "Power Base Station Instructions" screen from the "Power Base Station" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station Instructions" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Register Base Station" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password 
Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Smart Home Security Success" screen
Then user navigates to "Enable Amazon Alexa" screen from the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Amazon Alexa" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Security" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Base Station Configuration" screen from the "Dashboard" screen 
And user "deletes DAS device" by clicking on "delete" button
Then user should receive a "Delete DAS Confirmation" popup
When user "accepts" the "Delete DAS Confirmation" popup
Then user should not be displayed with "Security" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples:
      | location name | device name  | 
      | Home          | Living Room  |