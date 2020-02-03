@GroupingOfDevicesInDashboardScenarios @Platform
Feature: Devices should be grouped in Dashboard screen 
As a user I want to verify grouping of devices in Dashboard screen

@VerifyGroupingOfDevicesInDashboardScreen			@Automatable
Scenario:  Verify if order in which devices are grouped in dashboard screen
Given user launches and logs in to the Lyric Application
#And security devices should be installed for the logged in account
Then user verifies if the "devices are grouped" and displayed:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Camera devices                                    |
| Z Wave devices                                    |
| Thermostats                                       |
| Skybell                                           |
| Water Leak Detector							   |
And user verifies for each category the devices are displayed in alphabetical order


@VerifyGroupingOfDevicesInDashboardScreenByUpgradingTheApp			@NotAutomatable
Scenario:  Verify if grouping of devices is displayed in dashboard screen when user upgrades the app from app version which does not support grouping of devices
Given user launches and logs in to the Lyric Application
And security devices should be installed for the logged in account
When user receives update about the app
And user updates the app
Then user verifies if the following grouping of devices is present:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Camera devices                                    |
| Z Wave devices                                    |
| Thermostats                                       |
| Skybell                                           |
| Water Leak Detector							   |
And user verifies for each category the devices are displayed in alphabetical order


@VerifyGroupingOfDevicesInDashboardScreenForInvitedUsersInOlderAppVersion			@NotAutomatable
Scenario Outline:  Verify if order in which devices are grouped in dashboard screen for the invited users
Given user launches and logs in to the Lyric Application
And security devices should be installed for the logged in account
Then user verifies if the following grouping of devices is present:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Camera devices                                    |
| Z Wave devices                                    |
| Thermostats                                       |
| Skybell                                           |
| Water Leak Detector							   |
And user verifies for each category the devices are displayed in alphabetical order
Then user inputs <invite users email address> in "Email Text Field" in the "Invite User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address> in the older app version which does not support grouping of devices
Then user verifies if the following grouping of devices is present:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Rest of the devices in alphabetical order         |

Examples:
| invite users email address	|
| das_stage5@grr.la				|


@VerifyGroupingOfDevicesInDashboardScreenForInvitedUsers			@Automatable
Scenario Outline:  Verify if order in which devices are grouped in dashboard screen for the invited users
Given user launches and logs in to the Lyric Application
And security devices should be installed for the logged in account
Then user verifies if the following grouping of devices is present:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Camera devices                                    |
| Z Wave devices                                    |
| Thermostats                                       |
| Skybell                                           |
| Water Leak Detector							   |
And user verifies for each category the devices are displayed in alphabetical order
Then user inputs <invite users email address> in "Email Text Field" in the "Invite User" screen
Then user should be displayed with the following "Invited Users" options:
| InvitedUsersList		|
| das_stage5@grr.la		|
When user logs out and logs in to the Lyric Application with <invite users email address>
Then user verifies if the following grouping of devices is present:
| GroupingOrderOfDevices                            |
| Security devices and associated Security cameras  |
| Camera devices                                    |
| Z Wave devices                                    |
| Thermostats                                       |
| Skybell                                           |
| Water Leak Detector							   |
And user verifies for each category the devices are displayed in alphabetical order

Examples:
| invite users email address	|
| das_stage5@grr.la				|


@VerifyGroupingOfDevicesInDashboardScreenByRenamingTheDevicesDisplayedInAGroup			@Automatable
Scenario Outline:  Verify if order in which devices are grouped in dashboard screen after renaming the existing devices
Given user launches and logs in to the Lyric Application
Then security devices should be installed for the logged in account
And user verifies if devices are displayed in alphabetical order
When user edits the existing devices name displayed in a group to <UpdatedDevicesName>
Then the devices should be displayed in alphabetical order

Examples:
| UpdatedDevicesName     |
| Wld 10177              |
| Wld 13058              |
| Wld 08889              |
| Wld 11286              |