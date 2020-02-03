@FACERECOGNITION
Feature: Face Recognition
As a user I want DAS panel to recognize person and alert the user on arrival and failure to arrival in pre configured timeline


 @FaceRecognitionFTUEscreen
  Scenario: As a user I should be shown with Facial Recognition introduction during FTUE
     Given user launches and logs in to the Lyric application
       And user has location "permitted" for facial recognition
       And user has a DAS device configured
      Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
       And user navigates to "FTUE" screen from the "Smart Home Security Success" screen
       
  @FaceRecognitionNoFTUEscreen
  Scenario: As a user I should not be shown with Facial Recognition introduction during FTUE
     Given user launches and logs in to the Lyric application
       And user has location "not permitted" for facial recognition
       And user has a DAS device configured
      Then user navigates to "Smart Home Security Success" screen from the "Connect to Network" screen
       And user should not be displayed with the "FR FTUE" screen      
       
 @FaceRecognitionOption
  Scenario: As a user I should be shown with Facial Recognition option in global drawer 
     Given user launches and logs in to the Lyric application
       And user has location "permitted" for facial recognition
       And user has a DAS device configured
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user "should be displayed" with the "FR" option 
      And user logs out of the app
      
      
 @FaceRecognitionRegionspecific
  Scenario: As a user I should not be shown with Facial Recognition option in global drawer 
     Given user launches and logs in to the Lyric application
       And user has location "not permitted" for facial recognition
       And user has a DAS device configured
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user "should not be displayed" with the "FR" option
      And user logs out of the app
      
 @FaceRecognitionDASspecific
  Scenario: As a user I should not be shown with Facial Recognition option in global drawer 
     Given user launches and logs in to the Lyric application
       And user has location without DAS device
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user "should not be displayed" with the "FR" option
      And user logs out of the app
      
  @FaceRecognitionDASspecificChangeLocation
  Scenario: As a user I should not be shown with Facial Recognition option in global drawer 
     Given user launches and logs in to the Lyric application
       And user changes the location from "permitted" to "not permitted" for facial recognition
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user "should not be displayed" with the "FR" option
      And user logs out of the app
      
  @FaceRecognitionDASDeletionFRCautionPopup
  Scenario: As a user I should be shown with caution message on non availability of FR detection fature due to Base station deletion 
     Given user launches and logs in to the Lyric application
       And user has a DAS device configured
      When user deletes basestation
      Then user should be displayed with the "Caution message about FR" popup
  
  @FaceRecognitionDASDeletionNoFRCautionPopup
  Scenario: As a user I should not be shown with caution message on non availability of FR detection fature due to Base station deletion 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in location "not permitted" for facial recognition
      When user deletes basestation
      Then user should be displayed with the "Caution message about FR" popup    
      
  @FaceRecognitionNewFREnrollmentwithETA
  Scenario: As a user I should be able to enroll first face id with ETA in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
       And user should be displayed with "Expected Arrival" screen
      When user adds ETA 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen
       
  @FaceRecognitionNewFREnrollmentwithBackcamera
  Scenario: As a user I should be able to enroll first face id with back camera in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user changes to back camera
      Then user should be displayed with "FR start" screen 
       And user should be displayed with "back camera" in "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
       And user should be displayed with "Expected Arrival" screen
      When user adds ETA 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen 
       
  #Not implemented
  @FaceRecognitionNewFREnrollmentwithImproperPosture
  Scenario: As a user I should not be able to enroll first face id with improper posture in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the any face samples with not matching the guidance
      Then user should be shown with "Retake" popup  
      
  #Not implemented
  @FaceRecognitionNewFREnrollmentwithMixedpersonfaces
  Scenario: As a user I should not be able to enroll first face id with two samples with two different person faces in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the his face 
       And user inputs the other person face 
      Then user should be shown with "Retake" popup 
      
  #Not implemented
  @FaceRecognitionNewFREnrollmentwithMultiplefacesinFrame
  Scenario: As a user I should not be able to enroll first face id with multiple faces in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the his face but frame with multiple faces 
      Then user should be shown with "Retake" popup   
       
  @FaceRecognitionNewFREnrollmentwithoutETA
  Scenario: As a user I should be able to enroll first face id without ETA in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
       And user should be displayed with "Expected Arrival" screen
      When user adds ETA 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen
       
  @FaceRecognitionNewFREnrollmentwithRetake
  Scenario: As a user I should be able to enroll first face id with retake on failed samples in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
       And user face sample is not matching criteria
      Then user should be shown with "Retake" popup
      When user inputs the all failed face samples
      Then user should be displayed with "Expected Arrival" screen
      When user skips ETA 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       And user should be shown without "ETA" in "Facial Recognition summary" screen
       
       
  @FaceRecognitionNewFREnrollmentwithRetry
  Scenario: As a user I should be able to enroll first face id on verification retry in the location  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
       And user retry verification 
      Then user should be displayed with "Expected Arrival" screen
      When user skips ETA 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       And user should be shown without "ETA" in "Facial Recognition summary" screen 
       
  @FaceRecognitionNewFREnrollmentCancel
  Scenario: As a user I should be able to cancel the face id enrollment  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user cancels FR enrollment
      Then user should be displayed with "Facial Recognition" screen
      
  @FaceRecognitionNewFREnrollmentbyCancellingCameraservices
  Scenario: As a user I should not be allowed to add FR id on denying camera access  
     Given user launches and logs in to the Lyric application
       And user has no "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition" screen
      When user starts FR enrollment
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user cancels the "Access the camera for FR"
      Then user should be displayed with "Global drawer" screen

             
  @FaceRecognitionExtraFREnrollment
  Scenario Outline: As a user I should be able to enroll extra face id in the location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ADD FACE"
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       Examples:
       |State     |
       |Home      |
       |Offline   |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Enrollment |
       |Upgrade    |
       |Alarm      |
  
  #Not implemented
  @FaceRecognitionExtraFREnrollmentDuplicate
  Scenario Outline: As a user I should be able to enroll extra face id in the location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ADD FACE"
      Then user should be displayed with "FR naming" screen
      When user names the FR id with available "FR id"
      Then user should be displayed with "Error" popup 
      When user names the FR id with empty field
      Then user should be displayed with "Error" popup 
      When user names the FR id with more characters 
      Then user should be displayed with "Error" popup
      
  @FaceRecognitionFRidValidation
  Scenario Outline: As a user I should be able to enroll extra face id in the location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ADD FACE"
      Then user should be displayed with "FR naming" screen
      When user names the FR id with available "FR id"
      Then user should be displayed with "Error" popup 
      When user names the FR id with empty field
      Then user should be displayed with "Error" popup 
      When user names the FR id with more characters 
      Then user should be displayed with "Error" popup
      
  @FaceRecognitionFRidEdit
  Scenario Outline: As a user I should be able to edit face id in the location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user edits "FR id"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
       
   @FaceRecognitionFRidDelete
  Scenario Outline: As a user I should be able to delete face id in the location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user deletes "FR id"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown without "deleted FR face" in "Facial Recognition summary" screen 
       
  @FaceRecognitionFRidwithETADelete
  Scenario Outline: As a user I should be able to delete face id in the location so that face and associated ETA deleted from location  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "FR id" in the location
       And use  has associated "ETA" with "FR id"
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user deletes "FR id"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown without "deleted FR face" in "Facial Recognition summary" screen
       And user should be shown without "ETA" associated with deleted FR face in "Facial Recognition summary" screen
       
       
  @FaceRecognitionMaximumFREnrollment
  Scenario: As a user I should be able to enroll maximum five face id in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ADD FACE"
      Then user should be displayed with "FR naming" screen
      When user names the FR id with valid naming criteria
      Then user should be displayed with "Access the camera for FR" popup 
      When user accepts the "Access the camera for FR"
      Then user should be displayed with "FR start" screen
      When user starts capturing face
      Then user should be displayed with "FR camera" screen
      When user inputs the all face samples
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added FR face" in "Facial Recognition summary" screen
      When user adds the five "FR id"
      Then user should not be displayed with "ADD FACE" option
      
  @FaceRecognitionAddETA
  Scenario: As a user I should be able to add new alert in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "Add New Alert"
      Then user should be displayed with "Expected Arrival" screen
      When user selects "FR id" 
      Then user shown with toggles "FR id"
      When user navigates to "Expected Arrival" screen
      Then user should be displayed with "default expected arrival time"
      When user sets "expected arrival time" 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen
       
  @FaceRecognitionAddETADuringETATime
  Scenario: As a user I should be able to add new alert in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "Add New Alert"
      Then user should be displayed with "Expected Arrival" screen
      When user selects "FR id" 
      Then user shown with toggles "FR id"
      When user navigates to "Expected Arrival" screen
      Then user should be displayed with "default expected arrival time"
      When user sets "expected arrival time" by accomdating current time within arrival interval
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen     
       
  #Not implemented
  @FaceRecognitionAddETADuplicate
  Scenario: As a user I should not be able to add duplicate new alert in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "Add New Alert"
      Then user should be displayed with "Expected Arrival" screen
      When user selects same "FR id" as ETA1
      When user navigates to "Expected Arrival" screen
       And user sets same "expected arrival time" as ETA1
      Then user should not be allowed to add ETA    
             
       
  @FaceRecognitionAddMaximumETA
  Scenario: As a user I should be able to add maximum two ETA alert in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "Add New Alert"
      Then user should be displayed with "Expected Arrival" screen
      When user selects "FR id" 
      Then user shown with toggles "FR id"
      When user navigates to "Expected Arrival" screen
      Then user should be displayed with "default expected arrival time"
      When user sets "expected arrival time" 
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Added ETA" in "Facial Recognition summary" screen
      When user adds two "ETA" 
      Then user should not be shown with "Add New Alert" option
      
  @FaceRecognitionDeleteETA
  Scenario: As a user I should be able to delete ETA in the location  
     Given user launches and logs in to the Lyric application
       And user has "FR id" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user deletes "ETA"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown without "Deleted ETA" in "Facial Recognition summary" screen 
      
      
  @FaceRecognitionDetection
  Scenario Outline: As a user I should get alerts on detection of face recognition  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in Home
       And user has "ETA" in the location
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log

       
  @FaceRecognitionDetectionLowlightIntensity
  Scenario Outline: As a user I should get alerts on detection of face recognition even in low light intensity till 30 lux 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has light intensity <Range>
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      Examples:
       |Range  |State	|
       |30 Lux |Home	|	
       |50 Lux |Home	|
       |80 Lux |Home	|
       
  @FaceRecognitionDetectionMultipleFace
  Scenario Outline: As a user I should get alerts on detection of face recognition even multiple faces captured in frame along with ETA FR face id 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has light intensity <Range>
      When ETA face detected during ETA time along with other faces
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
        Examples:
       |Range  |State	|
       |30 Lux |Home	|	
       |50 Lux |Home	|
       |80 Lux |Home	|
       
  @FaceRecognitionDetectionMobileSwitchedoff  
  Scenario Outline: As a user I should get alerts on detection of face recognition for switched off mobile during ETA and switched on back till the next day ETA start time    
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has mobile switched off
      When ETA face detected during ETA time
       And user has switched on mobile within next day ETA start time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |
       
  @FaceRecognitionDetectionMobileSwitchedoffExpiry  
  Scenario Outline: As a user I should not get alerts on detection of face recognition for switched off mobile during ETA and switched on back after the next day ETA start time    
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has mobile switched off
      When ETA face detected during ETA time
       And user has switched on mobile after next day ETA start time
      Then user should not receives a "ETA" push notification
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      | 
       
     @FaceRecognitionDetectionMobileSwitchedoff  
  Scenario Outline: As a user I should get not arrived alert for switched off mobile during ETA and switched on back till the next day ETA start time    
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has mobile switched off
      When ETA face not detected during ETA time
       And user has switched on mobile within next day ETA start time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user not arrived home" activity log
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |
       
  @FaceRecognitionDetectionMobileSwitchedoffExpiry  
  Scenario Outline: As a user I should not get user not arrived alert for switched off mobile during ETA and switched on back after the next day ETA start time    
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has mobile switched off
      When ETA face not detected during ETA time
       And user has switched on mobile after next day ETA start time
      Then user should not receives a "ETA" push notification
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |    
       
       
  @FaceRecognitionDetectionDeletedETA
  Scenario Outline: As a user I should not get alerts on detection of face recognition for deleted ETA 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user deletes "ETA"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown without "Deleted ETA" in "Facial Recognition summary" screen 
      When ETA face detected during deleted ETA time
      Then user should not receives a "ETA" push notification
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |     
       
       
  @FaceRecognitionDetectionDifferentRange
  Scenario Outline: As a user I should get alerts on detection of face recognition  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has DAS panel in <Height>
       And user has "ETA" in the location
       And user <Movement nature>
       And user movement distance at <Panel> 
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      Examples:
       |State      |Height|Movement nature              |Panel |
       |Home       |3 Feet|Walk right side facing camera|4 feet|
       |Away       |3 Feet|Walk right side facing camera|4 feet|
       |Night      |3 Feet|Walk right side facing camera|4 feet|
       |Exit Delay |3 Feet|Walk right side facing camera|4 feet|
       |Entry Delay|3 Feet|Walk right side facing camera|4 feet|
       |Alarm      |3 Feet|Walk right side facing camera|4 feet|
       |Home       |4 Feet|Walk right side facing camera|4 feet|
       |Away       |4 Feet|Walk right side facing camera|4 feet|
       |Night      |4 Feet|Walk right side facing camera|4 feet|
       |Exit Delay |4 Feet|Walk right side facing camera|4 feet|
       |Entry Delay|4 Feet|Walk right side facing camera|4 feet|
       |Alarm      |4 Feet|Walk right side facing camera|4 feet|
       |Home       |3 Feet|Walk left side facing camera |4 feet|
       |Away       |3 Feet|Walk left side facing camera |4 feet|
       |Night      |3 Feet|Walk left side facing camera |4 feet|
       |Exit Delay |3 Feet|Walk left side facing camera |4 feet|
       |Entry Delay|3 Feet|Walk left side facing camera |4 feet|
       |Alarm      |3 Feet|Walk left side facing camera |4 feet|
       |Home       |4 Feet|Walk left side facing camera |4 feet|
       |Away       |4 Feet|Walk left side facing camera |4 feet|
       |Night      |4 Feet|Walk left side facing camera |4 feet|
       |Exit Delay |4 Feet|Walk left side facing camera |4 feet|
       |Entry Delay|4 Feet|Walk left side facing camera |4 feet|
       |Alarm      |4 Feet|Walk left side facing camera |4 feet|
       |Home       |3 Feet|Walk right side facing camera|6 feet|
       |Away       |3 Feet|Walk right side facing camera|6 feet|
       |Night      |3 Feet|Walk right side facing camera|6 feet|
       |Exit Delay |3 Feet|Walk right side facing camera|6 feet|
       |Entry Delay|3 Feet|Walk right side facing camera|6 feet|
       |Alarm      |3 Feet|Walk right side facing camera|6 feet|
       |Home       |4 Feet|Walk right side facing camera|6 feet|
       |Away       |4 Feet|Walk right side facing camera|6 feet|
       |Night      |4 Feet|Walk right side facing camera|6 feet|
       |Exit Delay |4 Feet|Walk right side facing camera|6 feet|
       |Entry Delay|4 Feet|Walk right side facing camera|6 feet|
       |Alarm      |4 Feet|Walk right side facing camera|6 feet|
       |Home       |3 Feet|Walk left side facing camera |6 feet|
       |Away       |3 Feet|Walk left side facing camera |6 feet|
       |Night      |3 Feet|Walk left side facing camera |6 feet|
       |Exit Delay |3 Feet|Walk left side facing camera |6 feet|
       |Entry Delay|3 Feet|Walk left side facing camera |6 feet|
       |Alarm      |3 Feet|Walk left side facing camera |6 feet|
       |Home       |4 Feet|Walk left side facing camera |6 feet|
       |Away       |4 Feet|Walk left side facing camera |6 feet|
       |Night      |4 Feet|Walk left side facing camera |6 feet|
       |Exit Delay |4 Feet|Walk left side facing camera |6 feet|
       |Entry Delay|4 Feet|Walk left side facing camera |6 feet|
       |Alarm      |4 Feet|Walk left side facing camera |6 feet|
       |Home       |3 Feet|Walk right side facing camera|8 feet|
       |Away       |3 Feet|Walk right side facing camera|8 feet|
       |Night      |3 Feet|Walk right side facing camera|8 feet|
       |Exit Delay |3 Feet|Walk right side facing camera|8 feet|
       |Entry Delay|3 Feet|Walk right side facing camera|8 feet|
       |Alarm      |3 Feet|Walk right side facing camera|8 feet|
       |Home       |4 Feet|Walk right side facing camera|8 feet|
       |Away       |4 Feet|Walk right side facing camera|8 feet|
       |Night      |4 Feet|Walk right side facing camera|8 feet|
       |Exit Delay |4 Feet|Walk right side facing camera|8 feet|
       |Entry Delay|4 Feet|Walk right side facing camera|8 feet|
       |Alarm      |4 Feet|Walk right side facing camera|8 feet|
       |Home       |3 Feet|Walk left side facing camera |8 feet|
       |Away       |3 Feet|Walk left side facing camera |8 feet|
       |Night      |3 Feet|Walk left side facing camera |8 feet|
       |Exit Delay |3 Feet|Walk left side facing camera |8 feet|
       |Entry Delay|3 Feet|Walk left side facing camera |8 feet|
       |Alarm      |3 Feet|Walk left side facing camera |8 feet|
       |Home       |4 Feet|Walk left side facing camera |8 feet|
       |Away       |4 Feet|Walk left side facing camera |8 feet|
       |Night      |4 Feet|Walk left side facing camera |8 feet|
       |Exit Delay |4 Feet|Walk left side facing camera |8 feet|
       |Entry Delay|4 Feet|Walk left side facing camera |8 feet|
       |Alarm      |4 Feet|Walk left side facing camera |8 feet|
       |Home       |4 Feet|Walk infront camera          |8 feet|
       |Away       |4 Feet|Walk infront camera          |8 feet|
       |Night      |4 Feet|Walk infront camera          |8 feet|
       |Exit Delay |4 Feet|Walk infront camera          |8 feet|
       |Entry Delay|4 Feet|Walk infront camera          |8 feet|
       |Alarm      |4 Feet|Walk infront camera          |8 feet|
                
  @FaceRecognitionNotDetected
  Scenario Outline: As a user I should get alerts on person not arrived during expected timeline  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When ETA face not detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user has not arrived home" activity log
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      | 
       
 
   @FaceRecognitionDetectionPanelState
  Scenario Outline: As a user I wont get alerts on detection of face recognition when panel is offline  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When ETA face detected during ETA time
      Then user wont get ETA alert
      Examples:
       |State     |
       |Offline   |
       |upgrade   |
       |enrollment|
  
  @FaceRecognitionDetectionPanelStaterestored
  Scenario Outline: As a user I should get alerts on detection of face recognition when panel restored to online within ETA period
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
       And user has restored panel from <State>
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      Examples:
       |State     |
       |Offline   |
       |upgrade   |
       |enrollment|     
       
  
  @FaceRecognitionDetectionCameraState
  Scenario Outline: As a user I should get alerts on detection of face recognition when camera is turned Off  
     Given user launches and logs in to the Lyric application
       And user has DAS camera in <State>
       And user has "ETA" in the location
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      Examples:
       |State     |
       |Off       |
       |On        |
       
  @FaceRecognitionDetectionCameraState
  Scenario Outline: As a user I wont get alerts on detection of face recognition when camera is offline  
     Given user launches and logs in to the Lyric application
       And user has DAS camera in <State>
       And user has "ETA" in the location
      When ETA face detected during ETA time
      Then user wont get ETA alert
      Examples:
       |State     |
       |Offline   |
       |Shutter closed|
        
  
      
  @FaceRecognitionEditETAFRid
  Scenario Outline: As a user I should be able to edit ETA alert in the location by changing FR id 
     Given user launches and logs in to the Lyric application
       And user has "ETA" in the location 
       And user wants to edit ETA at <Time>
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ETA"
      Then user should be displayed with "Expected Arrival" screen
      When user selects new "FR id" 
      Then user shown with toggles "FR id"
      When user navigates to "Expected Arrival" screen
      Then user should be displayed with "expected arrival time" 
       And user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Edited ETA" in "Facial Recognition summary" screen
       Examples:
       |Time  |
       |During ETA not detected|
       |During ETA detected    |
       |Not during ETA         |
       
      
       
  @FaceRecognitionEditETATime
  Scenario Outline: As a user I should be able to edit ETA alert in the location by changing ETA time 
     Given user launches and logs in to the Lyric application
       And user has "ETA" in the location 
       And user wants to edit ETA at <Time>
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ETA"
      Then user should be displayed with "Expected Arrival" screen
       And user should be displayed with "expected arrival time"
      When user edits "expected arrival time" 
       And user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Edited ETA" in "Facial Recognition summary" screen
       Examples:
       |Time  |
       |During ETA not detected|
       |During ETA detected    |
       |Not during ETA         |
       
       
  @FaceRecognitionEditETAFRidTime
  Scenario Outline: As a user I should be able to edit ETA alert in the location by changing ETA FR id and time 
     Given user launches and logs in to the Lyric application
       And user has "ETA" in the location 
       And user wants to edit ETA at <Time>
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user selects "ETA"
      Then user should be displayed with "Expected Arrival" screen
      When user selects new "FR id" 
      Then user shown with toggles "FR id"
      When user navigates to "Expected Arrival" screen
      Then user should be displayed with "expected arrival time"
      When user edits "expected arrival time" 
       And user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Edited ETA" in "Facial Recognition summary" screen
       Examples:
       |Time  |
       |During ETA not detected|
       |During ETA detected    |
       |Not during ETA         |
       
       
  @FaceRecognitionInvitedUser
  Scenario: As a invited user I should be able to access any FR feature as same as actual user in the location  
     Given user launches and logs in to the Lyric application
       And user has "ETA" in the location 
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user enrolls new "FR id"
      Then user should be shown with "Facial Recognition summary" screen with enrolled "FR id"
      When user edits "FR id" name
      Then user should be displayed with "edited name"
      When user adds new "ETA"
      Then user should be shown with "Facial Recognition summary" screen with added "ETA"
      When user edits "ETA"
      Then user should be shown with "Edited ETA" in "Facial Recognition summary" screen
      When user deletes "FR id" 
      Then user should be shown with "Facial Recognition summary" screen without deleted "FR id" and associated "ETA"
      When user deletes "ETA" 
       And user should be displayed with "Facial Recognition summary" screen
      Then user should be shown with "Facial Recognition summary" screen without deleted "ETA"   
   

  @FaceRecognitionDetectedInvitedUser
  Scenario Outline: As a invited user I should get alerts on person arrived during expected timeline  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When ETA face detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user has arrived home" activity log
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |
       
       
  @FaceRecognitionDetectedInvitedUser
  Scenario Outline: As a invited user I should get alerts on person not arrived during expected timeline  
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When ETA face not detected during ETA time
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user has not arrived home" activity log
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |   
       
  #Not implemented
  @FaceRecognitionDetectionMorethan1DAS
  Scenario Outline: As a user I should get only one alert on detection of face recognition for location with more than 1 DAS  
     Given user launches and logs in to the Lyric application
       And user has <Number> of DAS panel in Location
       And user has "ETA" in the location
      When ETA face detected during ETA time by any panel
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen of detected panel
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user arrived home" activity log
      When user roams in the location
      Then user should not receives a "ETA" push notification for other panel in location
      Examples:
      |Number|
      |Two   |
      |Three |
      
  #Not implemented
  @FaceRecognitionNotDetectionMorethan1DAS
  Scenario Outline: As a user I should get only one alert on user not arrived home for location with more than 1 DAS  
     Given user launches and logs in to the Lyric application
       And user has <Number> of DAS panel in Location
       And user has "ETA" in the location
      When ETA face not detected during ETA time by any panel
      Then user receives a "ETA" push notification
      When user selects the "ETA" push notification
      Then user should be displayed with the "Security Solution Card" screen of detected panel
      When user navigates to "Activity Log" screen from "Security Solution Card" screen
      Then user receives a "user not arrived home" activity log
       And user should not receives no more "ETA" push notification
      Examples:
      |Number|
      |Two   |
      |Three |
      
  @FaceRecognitionDetectionDisabledETA
  Scenario Outline: As a user I should not get alerts on detection of face recognition if ETA is disabled 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user disables "ETA"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Disabled ETA" in "Facial Recognition summary" screen 
      When ETA face detected during ETA time
      Then user should not receives a "ETA" push notification
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |
       
  @FaceRecognitionDetectionDisabledETA
  Scenario Outline: As a user I should not get alerts on user not arrved home if ETA is disabled 
     Given user launches and logs in to the Lyric application
       And user has DAS panel in <State>
       And user has "ETA" in the location
      When user navigates to "Global drawer" screen from the "Dashboard" screen
      Then user should be displayed with the "FR" option
      When user selects Facial Recognition
      Then user should be displayed with the "Facial Recognition summary" screen
      When user disables "ETA"
      Then user should be displayed with "Facial Recognition summary" screen
       And user should be shown with "Disabled ETA" in "Facial Recognition summary" screen 
      When ETA face not detected during ETA time
      Then user should not receives a "ETA" push notification
      Examples:
       |State     |
       |Home      |
       |Away      |
       |Night     |
       |Exit Delay|
       |Entry Delay|
       |Alarm      |     
