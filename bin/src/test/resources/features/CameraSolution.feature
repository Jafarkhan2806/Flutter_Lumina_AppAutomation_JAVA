@CameraSolution
Feature:  As a user,i should be able to get live streaming of the camera and to get motion alert on motion detection 

   @CameraStatusDashboardDIY @P2  @UIAutomated @--xrayid:ATER-53820
   Scenario: As an user I should be shown with camera in the dashboard after DIY registration
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   When user navigates to "Dashboard" screen from the "Camera Solution Card" screen
   Then user should be displayed with the "Camera is ON" description
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "OFF"
   When user navigates to "Dashboard" screen from the "Camera Solution Card" screen
   Then user should be displayed with the "Camera is OFF" description

   
   @CameraStatusDashboard @P2 @UIAutomated @--xrayid:ATER-53821
   Scenario: I should be shown with latest clip as thumbnail in the dashboard
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   When user navigates to "Dashboard" screen from the "Camera Solution Card" screen
   When user receives a "MOTIONS" push notification
   Then user selects the "MOTION DETECTED" push notification
   Then verify user is in "CAMERA SOLUTION CARD"
   ##And user navigates to "Activity log" screen from "Camera card Solution" screen
   ##Then verify user receives a "Motion Detection" in activity log
   ##When user navigates to "Dashboard" screen from "Activity log"
   ##Then user should be displayed with latest clip as thumbnail in dashboard
    
    
   @CameraStatusPrivacyRingClosed @P2 @UIAutomated @--xrayid:ATER-53822
   Scenario: I should be shown with privacy ring closed status in the dashboard and camera solution card
   Given user launches and logs in to the Lyric application
   Then user should be displayed with the "PRIVACY RING CLOSED DASHBOARD" description
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user "should not be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #|Attention|
    When user camera is set to "OFF"
    And user camera is set to "ON"
    Then user should be displayed with the "PRIVACY RING CLOSED SOLUTION CARD" description
    #And user should not receive "Motion detected" event
     
     
   @CameraStatusOff @P2  @UIAutomated @--xrayid:ATER-53823
   Scenario: I should be shown with off status in the dashboard and camera solution card
   Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    Then user camera is set to "OFF"
    And user navigates to "Dashboard" screen from the "Camera Solution Card" screen
    Then user should be displayed with the "Camera is OFF" description
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user "should not be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #|Attention|
    
    
   @CameraStatusOffline @P2 @UIAutomated @--xrayid:ATER-53824
   Scenario: I should be shown with offline status in the dashboard and camera solution card
    #Given user DAS camera is in <State>
    Given user launches and logs in to the Lyric application
    Then user should be displayed with the "Camera is OFFLINE" description
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user "should not be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #|Attention|
   When user selects "Get Help" from "Camera Solution Card" screen
   Then user should be displayed with the "GET HELP SCREEN" description
    #Examples:
    #|State  |
    #|Offline|
    #|Upgrade|
        
     
   @CameraLivestreamingstatusError @P2 @UIAutomated @--xrayid:ATER-53825
   Scenario: I should be shown with error message on livestreaming status in primary card
   Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user Camera "not streaming"
    And user "SHOULD BE DISPLAYED" with the "Unable to connect, please try again" option
    And user "SHOULD BE DISPLAYED" with the "play icon" option
    And user "should not be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #|Attention|
    #Examples:
    #|Status                |
    #|Camera network is low |
    #|Cloud is not available|
    #|Mobile network is low |
    
     
  @CameraLivestreamingstatus @P2  @UIAutomated @--xrayid:ATER-53826
   Scenario: I should be shown with livestreaming status in primary card
   Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    Then user camera is set to "ON"
    And user "should be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #Attention|
    |Live Stream Progress Bar |
    #When user changes his mobile view to "Landscape"
    #And user "should not be" displayed with options:
    #|Icons    |
    #|Snapshot |
    #|Talk     |
    #|Attention|
    #And user "should be" displayed with options:
    #|Icons    |
    #|Live Stream Progress Bar |
    #When user changes his mobile view to "potrait"
    Then user camera is set to "OFF"
    Then user camera is set to "ON"
    And user Camera "streaming for 90 sec"
    #Then user "SHOULD BE DISPLAYED" with the "Tap to continue live feed" option
    And user "SHOULD BE DISPLAYED" with the "play icon" option
    And user "should not be" displayed with options:
    |Icons    |
    |Snapshot |
    |Talk     |
    #|Attention|
    #Then user should be able to Pause and Play the live streaming

    @Snapshot_WhenCameraOnlineCameraservicesDisabled @P4 @UIAutomated @NeedPreSetup_Android @--xrayid:ATER-53827
   Scenario: As a user i should not be able to take snapshot from live stream when my camera is online
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   And user "should be" displayed with options:
   |Icons    |
   |Snapshot |
   |Talk     |
   #|Attention|
    When user selects "Snapshot" from "Camera Solution Card" screen
    Then user should be displayed with the "Need to enable Phone settings" description

  @Snapshot_WhenCameraOnlineCameraservicesEnabled  @P2 @UIAutomated @--xrayid:ATER-53828
   Scenario: As a user i should be able to take snapshot from live stream when my camera is online
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   #And user "should be" displayed with options:
   #|Icons    |
   #|Snapshot |
   #|Talk     |
   #|Attention|
   #|Live Stream Progress Bar |
   When user selects "Snapshot" from "Camera Solution Card" screen
   Then user should be displayed with the "saved snapshot message" description
   # And verify "snapshot" is available in gallery
   
    
  
    
    
   @Talk_WhenCameraOnlineMicrophoneservicesEnabled @UIAutomated @--xrayid:ATER-53829
   Scenario: As a user i should be able to push to talk from mobile to family members in home via DAS panel 
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   #And user "should be" displayed with options:
   #|Icons    |
   #|Snapshot |
   #|Talk     |
   #|Attention|
   When user selects "PushToTalk" from "Camera Solution Card" screen
   Then user should be displayed with the "pushtotalkmic" description
   And user should be displayed with the "talkcancel" description
   When user selects "TALKMIC" from "Camera Solution Card" screen
   #Then user should be displayed with the "talknow" description
   #Then user should be able to send voice message to DAS for announcement
    
   
   @Talk_WhenCameraOnlineMicrophoneservicesDisabled  @UIAutomated @--xrayid:ATER-53830
   Scenario: As a user i should not be able to push to talk from mobile when microphone service is disabled
   Given user launches and logs in to the Lyric application
   When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
   And user camera is set to "ON"
   And user "should be" displayed with options:
   |Icons    |
   |Snapshot |
   |Talk     |
   #|Attention|
   When user selects "PushToTalk1" from "Camera Solution Card" screen
   Then user should be displayed with the "Need to enable Microphone services" description
    
    
    @Attention_WhenCameraOnline  @P1 @UIAutomated @--xrayid:ATER-53831
   Scenario: As a user i should be able to initiate alarm from camera solution card
    Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    #And user "should be" displayed with options:
    #|Icons    |
    #|Snapshot |
    #|Talk     |
    #|Attention|
    When user selects "Attention" from "Camera Solution Card" screen
  	Then user should be displayed with the "Attention" description
    When user selects "Cancel Attention" from "Camera Solution Card" screen
 	Then user Camera "should be streaming"
 	When user selects "Attention panic icon" from "Camera Solution Card" screen
 	Then user should be displayed with the "Attention Alarm" description
   

  @MotionDetectionCameraOn  @P1 @UIAutomated @--xrayid:ATER-53832
  Scenario Outline: As a user I should receive motion detection with camera on when panel is in all states 
    #Given user is set to <Command> mode through CHIL
    #And user DAS camera is set to "ON" through CHIL
    #And motion detection is "enabled" on user DAS panel through CHIL
    And user launches and logs in to the Lyric application
    And user minimizes the app
    When user receives a "MOTIONS" push notification
    Then user selects the "MOTION DETECTED" push notification
    Then verify user is in "CAMERA SOLUTION CARD"
    #user navigates to "Activity log" screen from the "Camera Solution Card" screen
    #Then user receives a "Motion Detection" in activity log
    Examples:
      |Command|
      |Home   |
      #|Off    |
      #|Night  |
      #|Away   |
      #|Alarm  |
      #|Enrollment |
      #|Entry Delay|
      
      
  @MotionDetectionCameraOn1  @P4 @UIAutomated @--xrayid:ATER-53833
  Scenario Outline: As a user I should not struck in camera clip view on various panel state
    #Given user DAS camera is set to "ON" through CHIL
    #And motion detection is "enabled" on user DAS panel through CHIL
      And user launches and logs in to the Lyric application
      And user minimizes the app
      When user receives a "MOTIONS" push notification
    Then user selects the "MOTION DETECTED" push notification
    Then verify user is in "CAMERA SOLUTION CARD"
     #user navigates to "Activity log" screen from the "Camera Solution Card" screen
     #Then user receives a "Motion Detection" in activity log
     #When user selects clip
     #Then user should be played with clip automatically one after one
     When user is set to <Command> mode through CHIL
     Then user receives a <Command> push notification
     When user selects the <Command> push notification
     #Then user should not be struck in camera clip view
    Examples:
      |Command|
      |Home   |
      |Off    |
      |Night  |
      #|Away   |
      #|Alarm  |
      #|Enrollment |
      #|Entry Delay|    
      
      
  @MotionDetectionPre-eventClip @P2 @NotAutomatable @--xrayid:ATER-53834
  Scenario: As a user I should receive motion detection with camera  
    Given user DAS camera is set to "on" through CHIL
      And motion detection is "enabled" on user DAS panel through CHIL
      And user launches and logs in to the Lyric application
     When user DAS camera detects "Motion detection"
     Then user receives "Motion detection" push notifications
     When user selects "Motion detection" push notifications
     Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
     Then user receives a "Motion Detection" in activity log
     When user play the "Motion Detection"
     Then user should play clip with 5 sec pre event 
      
  
  @NightVisionOnMode  @P2 @NotAutomatable @--xrayid:ATER-53835
  Scenario: As a user I should be able to livestream camera with night vision mode enabled
    Given user launches and logs in to the Lyric application
      And user DAS camera is set to "on" through CHIL
      And user selects "On" from "Night Vision Settings" screen
      And user DAS camera in night time
     When user navigates to "Camera Solution card" screen  
     Then user should be displayed with "Live streaming" with IR specification
     When user DAS camera detects "Motion detection"
     Then user receives "Motion detection" push notifications
     When user selects "Motion detection" push notifications
     Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
     Then user receives a "Motion Detection" in activity log
     When user play the "Motion Detection"
     Then user should be played with clip in IR specification
     # streaming & clip generated with IR light inensity 
     
     
   @NightVisionOffMode @P2 @NotAutomatable @--xrayid:ATER-53836
   Scenario: As a user I should be able to livestream camera with location light intensity
    Given user launches and logs in to the Lyric application
      And user DAS camera is set to "On" through CHIL
      And user selects "Off" from "Night Vision Settings" screen
      And user DAS camera in night time
     When user navigates to "Camera Solution card" screen  
     Then user should be displayed with "Live streaming" based on room light brightness
     When user DAS camera detects "Motion detection"
     Then user receives "Motion detection" push notifications
     When user selects "Motion detection" push notifications
     Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
     Then user receives a "Motion Detection" in activity log
     When user play the "Motion Detection"
     Then user should be played with clip based on room light brightness 
     
  
  @NightVisionAutoMode @P2 @NotAutomatable @--xrayid:ATER-53837
  Scenario: As a user I should be able to livestream camera by switching night vision mode automatically based on my room light brightness 
    Given user launches and logs in to the Lyric application
      And user DAS camera is set to "On" through CHIL
      And user selects "Auto" from "Night Vision Settings" screen
      And user DAS camera in night time
      # Location light lux level thresold is "" to turn on IR night vision mode
     Then user DAS camera IR vision is turned on automatically
     When user navigates to "Camera Solution card" screen  
     Then user should be displayed with "Live streaming" with IR specification
     When user DAS camera detects "Motion detection"
     Then user receives "Motion detection" push notifications
     When user selects "Motion detection" push notifications
     Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
     Then user receives a "Motion Detection" in activity log
     When user play the "Motion Detection"
     Then user should be played with clip in IR specification
     # Location light lux level thresold is "" to turn off IR night vision mode
     Then user DAS camera IR vision is turned off automatically
     When user navigates to "Camera Solution card" screen  
     Then user should be displayed with "Live streaming" with room light brightness
     When user DAS camera detects "Motion detection"
     Then user receives "Motion detection" push notifications
     When user selects "Motion detection" push notifications
     Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
     Then user receives a "Motion Detection" in activity log
     When user play the "Motion Detection"
     Then user should be played with clip

  
    @ActivitylogClipList @P2 @UIAutomated  @--xrayid:ATER-53838
	Scenario: As a user I should be displayed with activity log  
	Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user navigates to "Activity log" screen from the "Camera Solution Card" screen
    #Then user should be displayed with "playing clips"
    And user should be displayed with "recent clip at top"
    #And user should be displayed with "clip thumbnail" for each clip


	@ActivitylogStatus @P2 @UIAutomate @--xrayid:ATER-53839
	Scenario: As a user I should be displayed with activity log with status 
    Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user navigates to "Activity log" screen from the "Camera Solution Card" screen
    Then user should be displayed with "playing clips"
    And user should be displayed with "Viewed status in view list"
    When user selects "DOWNLOAD CLIP" from "Activity Log" screen
    And user should be displayed with "Saved status in view list"
	
	
   @ActivitylogClipactions  @P2 @NOTAUTOMATABLE  @--xrayid:ATER-53840
    Scenario: As a user I should be able to play the clips from activity log 
	Given user logs in to Lyric app
	 When user navigates to "Camera card Solution" screen from "Dashboard" screen
	 Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
	  And user should be displayed with "clip thumbnail"
     Then user should be displayed with "clip details"
      And user should be displayed with "Clip Loading in Progress"
      And user should be played with clip 
      And user clip length with 30 seconds 
     When user changes his mobile view to "Landscape" from "potrait"
     Then user should be displayed with "Clip view" in full screen
     When user changes his mobile view to "potrait" from "Landscape"
     Then user should not be impacted due to orientation
     When user selects the playing clip
     Then user should be displayed with "Pause icon"
      And user should be displayed with "Clip seek bar with progress"
     When user clicks pause icon
     Then user should be displayed with "Paused clip"
      And user should be displayed with "Play icon"
     When user clicks play icon
     Then user should be resumed the clip from paused state
     When user clicks "Full view icon"
     Then user should be displayed with "Clip view" in full screen
     When user clicks "Full view icon"
     Then user should be displayed with "Clip view" in normal screen
     
   @ActivitylogPlayClipusingSeekbar  @P2 @NOTAUTOMATABLE  @--xrayid:ATER-53841
    Scenario: As a user I should be able to play the clips from any point of timeline using seekbar 
	Given user logs in to Lyric app
	 When user navigates to "Camera card Solution" screen from "Dashboard" screen
	 Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
	  And user should be played with clips 
      And user should be displayed with "Clip seek bar with progress"
     When user scrolls the seek bar
     Then user should be played with clips from scrolled point
     When user selects the playing clip
     Then user should be displayed with "Paused clip"
      And user should be displayed with "Play icon"
     When user scrolls the seek bar
     Then user should be played with clips from scrolled point 
 
 
   @ActivitylogClipFetchingStatus @P2 @NotAutomatable @--xrayid:ATER-53842
    Scenario: As a user I should be shown with status on fetching the clips
	Given user logs in to Lyric app
	 When user navigates to "Camera card Solution" screen from "Dashboard" screen
	 Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
	 Then user should be displayed with "Clip Loading in Progress" in thumbail space
     When user clip is older than 24 hours 
     Then user should be displayed with "Clip expired" in thumbail space
     #Edimax cloud is down
     #When user should be displayed with "Failed to load" in thumbail space
   

   @ActivitylogAutoplay @P2 @UIAutomated @--xrayid:ATER-53843
    Scenario: As a user I should be auto played all the recorded clips one after one
	Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user navigates to "Activity log" screen from the "Camera Solution Card" screen
    Then user should be displayed with "playing clips"
    #And user should be played automatically one after one till last clip
      
    @DeleteBaseStationClipPlaying @P2 @NotAutomatable @--xrayid:ATER-53844
    Scenario: As a user I should be auto played all the recorded clips one after one
	Given user logs in to Lyric app
	 When user navigates to "Camera card Solution" screen from "Dashboard" screen
	 Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
	 Then user should be played with clips
      And user should be played automatically one after one till last clip
     When user delete basestation from other mobile during clip playing
      
      
   @ActivitylogMaximumClip @P3 @NotAutomatable @--xrayid:ATER-53845
    Scenario: As a user I should be shown with maximum 50 clips
	Given user logs in to Lyric app
	 When user navigates to "Camera card Solution" screen from "Dashboard" screen
	 Then user should be displayed with "Camera card Solution" screen
     When user navigates to "Activity log" screen from "Camera card Solution" screen
	 Then user should be displayed with maximum 50 clips
     When user deletes any clip from list
     Then user should be displayed with updated 50 clips list by including old clip
     
     
    @ActivitylogDeleteClip @P2 @UIAutomated @--xrayid:ATER-53846
    Scenario: As a user I should be able to delete clip from the clip view
	Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user navigates to "Activity log" screen from the "Camera Solution Card" screen
    Then user should be displayed with "playing clips"
     When user selects "DELETE CLIP" from "Activity Log" screen
     Then user should be displayed with "Delete clip confirm popup"
     When user selects "CANCEL DELETE CLIP" from "Activity Log" screen
     #Then user should be displayed with "Clip" in current status
     Then user should be displayed with "playing clips"
     When user selects "DELETE CLIP" from "Activity Log" screen
     And user selects "DELETE CLIP OK" from "Activity Log" screen
     #Then user should be displayed with "Delete progress"
     Then user should be displayed with "Delete clip success popup"
     #Then user should be displayed without deleted clip
     
    @ActivitylogDownloadClip @P2 @UIAutomated @--xrayid:ATER-53847
    Scenario: As a user I should be able to download my clip in mobile
	Given user launches and logs in to the Lyric application
    When user navigates to "Camera Solution Card" screen from the "Dashboard" screen
    And user camera is set to "ON"
    When user navigates to "Activity log" screen from the "Camera Solution Card" screen
    Then user should be displayed with "playing clips"
    When user selects "DOWNLOAD CLIP" from "Activity Log" screen
    Then user should be displayed with "Download progress"
     When user selects "Cancel Download" from "Activity Log" screen
     Then user should be displayed with "Download cancel popup"
     When user selects "DO NOT CANCEL" from "Activity Log" screen
     Then user should be displayed with "Download progress"
     #Then user should be displayed with download clip in mobile 
     When user selects "DOWNLOAD CLIP" from "Activity Log" screen
     Then user should be displayed with "Download progress"
     When user selects "Cancel Download" from "Activity Log" screen
     Then user should be displayed with "Download cancel popup"
     When user selects "SELECT CANCEL POPUP" from "Activity Log" screen
     Then user should be displayed with "playing clips"
     #And user should be cancelled with download request
      
    @NoMotionDetectionCameraOffInNightMode @P3  @NotAutomatable @--xrayid:ATER-53848
    Scenario Outline: As a user I should not get motion detection in Night mode if camera is turned off
    Given user is set to <Command> mode through CHIL
      And user launches and logs in to the Lyric application 
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
      And user changes the "Camera ON in Home Mode" to "OFF"
     Then "Camera ON in Home Mode" value should be updated to "OFF" on "Camera Settings" screen
     When user navigates to "Security Solution Card" screen from the "Camera Settings" screen
      And user switches to "Night" mode
      And user navigates to "Camera Solution Card" screen from the "Security Solution Card" screen
     Then user camera is "not live streaming"
     When user DAS camera detects "Motion detection"
     Then user should not receives "Motion detection" push notifications
    Examples:
    |Command|
    |Off    |
    |Home   |
    
    
  @CameraSolutionCardCoachMarksDIY @P2 @NotAutomatable @--xrayid:ATER-53849
  Scenario: As a user i should be shown with coach marks for first time user 
    Given user launches and logs in to the Lyric application 
     When user performed camera DIY
     Then user should be displayed with "Dashboard" screen
     When user navigates to "Camera Settings" screen from the "Dashboard" screen
     Then user should be displayed with "Camera Solution Card" screen with coach marks
     
  @CameraSolutionCardCoachMarksAppInstallation @P2 @--xrayid:ATER-53850
  Scenario: As a user i should be shown with coach marks for first time user 
    Given user launches and logs in to the Lyric application
    Then user should be displayed with the "DASHBOARD" screen
    When user navigates to "Camera Settings" screen from the "Dashboard" screen
    Then user should be displayed with the "Coach Mark" screen   
     

     