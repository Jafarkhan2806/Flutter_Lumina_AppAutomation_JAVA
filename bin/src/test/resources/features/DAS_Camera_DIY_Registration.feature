@CameraDIY 
Feature: Camera DIY Registration
  As a user I want to register a Camera device using the Lyric application
      
      
@DASCameraDIYRegistrationWhenExistingLocationAndCameraNamesAreEntered        @UIAutomated       @P3         
Scenario Outline: As a user I want to verify if error popup displays when existing location and base station names are entered again
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects the "Custom Name" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <Existing location name> in the "Choose Location" screen
Then user should receive a "Existing Location Error" popup
When user "clicks on OK in" the "Existing Location Error" popup
Then user should be displayed with the "Choose Location" screen
When user selects <Existing location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user inputs <Existing device name> in the "Camera Name" screen
Then user should receive a "Existing Camera Name Error" popup
When user "clicks on OK in" the "Existing Camera Name Error" popup
Then user should be displayed with the "Choose Location" screen
When user selects <Existing location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <Existing device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen

Examples:
| Location	|
| Home		|


@DASCameraDIYWhenUserEntersMaxCharactersInCustomLocationAndCameraName       @UIAutomated       @P3           
Scenario Outline: As a user I want to enter max characters in new location and base station name
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects the "Custom Name" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user inputs <max charcters> in the "Custom Name" screen
Then user should not be allowed to enter more than "30" charcters
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects "Create Custom Name" from "Camera Name" screen
And user inputs <max charcters> in the "Create Custom Name" screen
Then user should not be allowed to enter more than "30" charcters

Examples: 
      | max charcters                                                               |
      | This is to test max characters in custom location name and base station     |
  
  
@DASCameraDIYRegistrationWithNewCustomLocationAndCameraName       @UIAutomated       @P1          
Scenario Outline: As a user I want to register a Camera device with new location and camera name using the Lyric application
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects the "Custom Name" from "Choose Location" screen
Then user should be displayed with the "Create Location" screen
When user clicks on "Done" button
Then user should be displayed with the "Create Location" screen
When user inputs <new location name> in the "Choose Location" screen
Then user should be displayed with the "Confirm Your ZIP Code" screen
When user inputs <invalid zip code>
Then user should receive a "Invalid zip code" popup
When user "dismisses" the "Invalid zip code" popup
When user inputs <valid zip code>
Then user should be displayed with the "Camera Name" screen
And user selects "Create Custom Name" from "Camera Name" screen
When user clicks on "Done" button
Then user should be displayed with the "Camera Name" screen
When user inputs <new device name> in the "Camera Name" screen
Then user should be displayed with the "Connect" screen
And user selects the "Next" from "Connect" screen
Then user navigates to "Registering Camera" screen from the "Connect" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Registering Camera" screen
When user selects "Router 4" from "Connect to Network" screen
And user inputs "xxxxxx" as the WiFi Password
When user navigates to "Camera DIY Success" screen from the "Connect to Network" screen
Then user navigates to "Enable Geofencing" screen from the "Camera DIY Success" screen
Then user selects the "Skip" button 
Then user should receive "Confirm skip prompt" button  
Then user selects the "Yes" button
Then user should be displayed with "Camera" device on the "dashboard" screen
And user should be displayed with <new device name> device on the "dashboard" screen
When user navigates to "Camera Configuration" screen from the "Dashboard" screen 
And user "deletes Camera device" by clicking on "Delete" button
Then user should receive a "Delete Camera Confirmation" popup
When user "accepts" the "Delete Camera Confirmation" popup
Then user should not be displayed with "Camera" device on the "dashboard" screen
And user should not be displayed with <new device name> device on the "dashboard" screen
Then user "deletes location details" by clicking on "delete" button

Examples: 
      | new location name           | new device name       | invalid zip code            | valid zip code        |
      | California                  | Scrum Room            | 55555                       | 90001                 |
      | Texas                       | War Room              | 55555                       | 73301                 |
      | Texas#$%                    | Ball Room             | 55555                       | 73301                 |
 

@DASCameraDIYRegistrationWithAvailableDefaultLocationAndCameraName       @UIAutomated       @P1         
Scenario Outline: As a user I want to register a DAS Camera with default location name and default camera name 
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Location Details" screen from the "Add New Device Dashboard" screen
And user selects <location name> from "Location Details" screen
Then user should be displayed with the "Camera Name" screen
When user selects <camera name> from "Camera Name" screen
And user should be displayed with the "Installation" screen
Then user navigates to "Connect Camera" screen from the "Installation" screen
When user scans the QR code by showing it to the base station camera
Then user navigates to "Connect to Network" screen from the "Connect Camera" screen
When user selects "Lenovo VIBE X3" from "Connect to Network" screen
And user inputs "vibex888" as the WiFi Password
Then user should be displayed with the "Enable Geofencing" screen
When user navigates to "Dashboard" screen from the "Enable Geofencing" screen
#And user creates a passcode if required
#And user disables the passcode through CHIL
Then user should be displayed with "Camera" device on the "dashboard" screen
When user navigates to "Camera Configuration" screen from the "Dashboard" screen 
And user "deletes camera device" by clicking on "delete" button
Then user should receive a "Delete Camera Confirmation" popup
And user "dismisses" the "Delete Camera Confirmation" popup
Then user "deletes camera device" by clicking on "delete" button
And user should receive a "Delete Camera Confirmation" popup
When user "accepts" the "Delete Camera Confirmation" popup
Then user should not be displayed with "Camera" device on the "dashboard" screen

Examples: 
      | location name                           | camera name						| 
      | Home                                    | Camera							|
#      | Home                                    | Honeywell Home					|       

            
@DASCameraDIYDenyAppAccessToLocationServices       @CannotAutomate       @P2      
Scenario Outline: As a user I should be prompted with Location services popup when location services access is denied after installation
Given user denies location services access while launching the Lyric app after installation and then logs in to the Lyric app
When user navigates to "Add New Device Dashboard" screen form the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
Then user should be displayed with the "Choose Location" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
When user clicks on "Next" button
Then user should receive a "Location services" popup
And user "denies access" in "Location services" popup
Then user should be displayed with the "Camera Name" screen
When user clicks on "Next" button
Then user should receive a "Location services" popup
And user "allows access" in "Location services" popup
Then user should be displayed with the "Looking for Camera" screen
When user turns "off" location services for Lyric app in mobile device settings
Then user should receive a "Location services" popup
And user "allows access" in "Location services" popup
Then user should be displayed with the "Looking Camera" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |
      
     
@DASCameraDIYWhenNoCamerasAreAvailable             @Doesn'tRequireAnyCameraForExecution       @UIAutomated       @P3  
Scenario Outline: As a user I should be prompted with Camera  Not Found popup when there are no cameras available
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
Then user navigates to "Looking for Camera" screen from the "Connect" screen
Then user should receive a "Camera Not Found" popup
And user "clicks on OK in" the "Camera Not Found" popup
Then user should be displayed with the "Connect" screen
Then user selects "Next" button 
Then user navigates to "Looking for Base Station" screen from the "Connect" screen
And user should receive a "Camera Not Found" popup
Then user "retries base station pairing in" the "Camera Not Found" popup
Then user should receive a "Camera Not Found" popup
And user "clicks on OK in" the "Camera Not Found" popup
Then user should be displayed with the "Connect" screen

Examples:
| Location	|
| Home		|


@DASCameraDIYWhenQRCodeIsNotScannedAndThenScanned      @UIAutomated       @P3        
Scenario Outline: As a user I should be prompted with Scanning Failure screen when QR code is not scanned
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
Then user navigates to "Register Base Station" screen from the "Power Base Station" screen
When QR code is not scanned for "2" minutes
Then user should receive a "scanning failure" popup
When user "accepts" the "scanning failure" popup
Then user should be displayed with the "Register Base Station" screen
And user scans the QR code by showing it to the base station camera
Then user should be displayed with the "Connect to Network" screen
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


@DASCameraDIYWhenInvalidQRCodeIsScannedFirstAndThenScanAValidQRCode       @UIAutomated       @P2  
Scenario Outline: As a user my Camera device should not be configured when invalid QR code is scanned
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C2 Wi-Fi Security camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device Dashboard" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
Then user selects "Next" button from "Connect" screen
Then user navigates to "Register Base Station" screen from the "Connect" screen
When user scans an invalid QR code
Then user should receive a "scanning failure" popup
When user "accepts" the "scanning failure" popup
Then user should be displayed with the "Register Base Station" screen
And user scans the QR code by showing it to the camera
Then user should be displayed with the "Connect to Network" screen
When user selects "Router 4" from "Connect to Network" screen
And user inputs "XXXXXX" as the WiFi Password 
Then user navigates to "Connection Success" screen from the "Connect to Network" screen
When user navigates to "Enable Geofencing" screen from the "Connection Success" screen
When user navigates to "Dashboard" screen from the "Enable Geofence" screen
Then user should be displayed with "Camera" device on the "dashboard" screen
And user should be displayed with <device name> device on the "dashboard" screen
When user navigates to "Camera Configuration" screen from the "Dashboard" screen 
And user "deletes Camera device" by clicking on "delete" button
Then user should receive a "Delete camera Confirmation" popup
And user "dismisses" the "Delete camera Confirmation" popup
Then user "deletes camera device" by clicking on "delete" button
And user should receive a "Delete camera Confirmation" popup
When user "accepts" the "Delete camera Confirmation" popup
Then user should not be displayed with "Camera" device on the "dashboard" screen
And user should not be displayed with <device name> device on the "dashboard" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |
      

@DASCameraDIYTapOnCancelMultipleTimesInRegisterCamera       @CannotAutomate       @P3
Scenario Outline: As a user I should be able to tap on Cancel multiple times in Registering camera screen
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C2 Wi-Fi Security camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device Dashboard" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Conncet" screen
Then user selects "Next" button from "Connect" screen
Then user navigates to "Registering Camera" screen from the "Connect" screen
When user "cancels the set up" by clicking on "cancel" button multiple times
Then user should receive a "Cancel Setup" popup
When user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Registering camera" screen
When user "cancels the set up" by clicking on "cancel" button
Then user should receive a "Cancel Setup" popup
When user "accepts" the "Cancel Setup" popup
Then user navigates to "Dashboard" screen from the "Registering camera" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |
      
      
@DASCameraDIYRefreshCameraList         @RequiresMultipleCamerasForExecution       @UIAutomated       @P3            
Scenario Outline: As a user I should be able to refresh the camera list when multiple cameras are displayed
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-fi Security Camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device Dashboard" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name Your" screen
Then user should be displayed with the "Connect" screen
Then user navigates to "Registering Camera" screen from the "Connect" screen
When user "views cancel setup" by clicking on "Back arrow" button
And user "dismisses" the "Cancel Setup" popup
Then user should be displayed with the "Registering Camera" screen
When user "views cancel setup" by clicking on "Back arrow" button
When user "accepts" the "Cancel Setup" popup
Then user should be displayed with the "Registering Camera" screen 
When user navigates to "Registering Camera" screen from the "Connect" screen
And user navigates to "Select Camera" screen from the "Registering Camera" screen
Then user "views select camera screen" by clicking on "Refresh" button

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |    


@DASCameraDIYDisconnectCameraDevice       @CannotAutomate       @P2          
Scenario Outline: As a user I should be prompted with Bluetooth disconnected popup when Camera device is disconnected
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C2 Wi-Fi Security Camera" screen from the "Add New Device Dashboard" screen
When user navigates to "Choose Location" screen from the "Add New Device Dashboard" screen
And user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name Your" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
Then user navigates to "Registering Camera" screen from the "Connect" screen
When user disconnects the Camera device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user navigates to "Registering Camera" screen from the "Connect" screen
Then user should be displayed with the "Connect to Network" screen
When user disconnects the camera device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Connect" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |  



@DASCameraDIYTimeoutInCameraDevice       @CannotAutomate       @P3        
Scenario Outline: As a user I should be prompted with Bluetooth disconnected popup when timeout happens in Camera device
Given user launches and logs in to the Lyric application
When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen
Then user navigates to "C1 Wi-Fi Security camera" screen from the "Add New Device Dashboard" screen
When user selects <location name> from "Choose Location" screen
Then user should be displayed with the "Camera Name" screen
When user selects <device name> from "Camera Name" screen
Then user should be displayed with the "Connect" screen
Then user navigates to "Registering Camera" screen from the "Connect" screen
When user scans the QR code by showing it to the camera
Then user navigates to "Connect to Network" screen from the "Registering Camera" screen
When user waits until timeout happens in Camera device
Then user should receive a "Bluetooth Disconnected" popup
When user clicks on "OK" button
Then user should be displayed with the "Connect" screen

Examples: 
      | location name                           | device name                     | 
      | Home                                    | My Camera                       |       