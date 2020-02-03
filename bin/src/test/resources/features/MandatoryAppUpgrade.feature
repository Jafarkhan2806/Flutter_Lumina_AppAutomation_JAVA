  @Mandatoryappupgrade @Platform
  Feature: As a user I want to verify Mandatory app upgrade flow
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @Mandatoryappupgradepopup							@NotAutomatable
  Scenario Outline: As a user wanted to verify mandatory app upgrade pop up
    Given user launches the Lyric application
     When user should be displayed with "Update your app" pop up
     Then user should be displayed with <Description> text 
      And user should be displayed with "Update Now" option
      And user should be displayed with "Learn More" option
      And user should be displayed with "Honeywell flash" screen in background
    Examples: 
      | Description                                                                                                                                   | 
      | The all-new Honeywell Home app is now available. To continue remotely controlling your devices, please udpate your app to the latest version. | 
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @MandatoryappupgradeUpgradenowflow							@NotAutomatable
  Scenario: As a user wanted to verify Upgrade now flow
    Given user launches the Lyric application
     When user should be displayed with "Update your app" pop up
     Then user selects the "Update Now" option
      And user should navigates to "Playstore/Appstore" screen
      And user should be displayed with "Update" option
     When user selects the "Update" option
     Then user should start install the app
      And after complete the installation
      And user should be dsiplayed with "Open" option
      And user open the app 
      And user should not display "Update your app" pop up
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @MandatoryappupgradeLearnMore							@NotAutomatable
  Scenario: As a user wanted to verify Learnmore now flow
    Given user launches the Lyric application
     When user should be displayed with "Update your app" pop up
     Then user selects the "Learn More" option
      And user should navigates to "What's new" screen
      And user should be dispalyed with "update now"
      And user should navigates to "Playstore/Appstore" screen
      And user should be displayed with "Update" option
     When user selects the "Update" option
     Then user should start install the app
      And after complete the installation
      And user should be dsiplayed with "Open" option
      And user open the app 
      And user should not display "Update your app" pop up
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @MandatoryappupgardeUpgradenowcancelflow							@NotAutomatable
  Scenario: As a user wanted to verify Upgrade now flow with cancel option
    Given user launches the Lyric application
     When user should be displayed with "Update your app" pop up
     Then user selects the "Update Now" option
      And user should navigates to "Playstore/Appstore" screen
      And user should be displayed with "Update" option
     When user selects the "Back" option
     Then user should be navigates to application
      And user should be displayed with "Update your app" pop up
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @Mandatoryappupgradelearnmorebackfunction							@NotAutomatable
  Scenario: As a user wanted to verify Learnmore now flow back functionality
    Given user launches the Lyric application
     When user should be displayed with "Update your app" pop up
     Then user selects the "Learn More" option
      And user should navigates to "What's new" screen
      And user select "Back" option
      And user should be displayed with "Update your app" pop up
  
  #Requirement : with solution and with out solution app mandatory app upgrade
  @Mandatoryappupgradelogout							@NotAutomatable
  Scenario: As a user wanted to verify mandatory app upgrade pop up in login screen
    Given user launches the Lyric application
     When user logout from the app
      And user should be not displayed with "Update your app"
  
  