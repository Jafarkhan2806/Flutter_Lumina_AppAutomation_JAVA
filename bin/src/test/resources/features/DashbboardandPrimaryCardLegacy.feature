@DashbboardandSolutionCard @Comfort
Feature: As an user I want to verify the Dashboard and primary card for JapserNA , JasperEMEA, HB and Spruce 

#Dashboard view 

#HB, Spruce and JasperNA
@ViewDashboard @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55684
Scenario Outline: As an user I want to verify the Dashboard view with respective system modes 
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user should be displayed with the "Thermostat Dashboard" screen
Then user should be displayed with "Thermostat name" with "XX INSIDE" temperature 
Then the following "Thermostat" options should be enabled:
 |Options|
 |Up Stepper|
 |Down Stepper|
And user "should be displayed" with the "respective setpoint value in dashboard" option
#And user should be displayed with respective <Mode> Color 
Examples:
|Mode|
|Cool| 
#|Heat|
#|Auto|

#incaserequired 
#|Cool only|
#|Heat Only|

#JasperEMEA
@ViewDashboardEMEA @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55685
Scenario Outline: As an user I want to verify the Dashboard view with system modes 
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user should be displayed with the "Thermostat Dashboard" screen
Then user should be displayed with "Thermostat name" with "XX INSIDE" temperature 
Then the following "Thermostat" options should be enabled:
 |Options|
 |Up Stepper|
 |Down Stepper|
And user "should be displayed" with the "respective setpoint value in dashboard" option
#And user should be displayed with respective <Mode> Color 
Examples:
|Mode|
|Heat|

@ViewDashboardOFF @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55686
Scenario Outline: As a user I want to verify the Dashboard view with OFF mode
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen
And the following "Thermostat" options should be disabled:
|Options|
|UP stepper|
|Down stepper|
Then user "should be displayed" with the "--" option
And user should see the "Inside temperature" status as "OFF" on the "thermostat dashboard" 
Examples:
|Mode |
|OFF |


#HB, Spruce and JasperNA
@ViewSolutionCard @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55687
Scenario Outline: As an user I want to verify the SolutionCard view with respective system modes 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
Then user "should be displayed" with the "respective setpoint value in Solution Card" option
And the following "Thermostat icons" options should be enabled:
|Options|
|UP stepper|
|Down stepper|
Examples:
|Mode |
|Cool| 
#|Heat |
##|Auto |
#|Cool |
#|Heat |


#JasperEMEA
@ViewSolutionCardEMEA @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55688
Scenario Outline: As an user I want to verify the SolutionCard view with system modes 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
Then user "should be displayed" with the "respective setpoint value in Solution Card" option
And the following "Thermostat icons" options should be enabled:
|Options|
|UP stepper|
|Down stepper|
Examples:
|Mode |
|Heat |

#HB, Spruce, JasperNA, JasperEMEA.
@ViewSolutionCardOFF @DashbboardandSolutionCard_P1 @Automated @--xrayid:ATER-55689
Scenario Outline: As an user I want to verify the SolutionCard view with OFF mode 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
Then user "should be displayed" with the "--" option
And user should see the "Inside temperature" status as "OFF" on the "thermostat solution card" 
Examples:
|Mode |
|OFF |



#Offline

#HB, Spruce, JasperNA, JasperEMEA
@Offlineverficationdashbaordsolutioncard @NotAutomatable @--xrayid:ATER-55690
Scenario Outline: As an user I want to verify the SolutionCard and dashboard with offline 
Given user launches and "Offline" 
Then user launches and logs in to the lyric application 
When user navigates to "Dashboard" 
Then user should be displayed with "OFFLINE" status 
And user should be displayed with "THERMSTAT IS OFFLINE" below the Tstat name
When user navigates to "SolutionCard"
Then user should be displayed with "Greyed out" indoor tempr
And user should be displayed with "THERMOSTAT IS OFFLINE" Status
And user should be displayed with disabled "System mode", "Schedule" icon 
#EMEA
And user should be displayed with disabled "Fan mode"
And user should not receivce any "Push notification" of stat 



# systemmode
#System mode cancel functionality 

#Requirements : Auto mode should be disabled 
#HB, Spruce, JasperNA
@SystemModeInfoscreenwithCoolandHeatMode @Automated @--xrayid:ATER-55691
Scenario Outline: As an user I want to verify the Systemode info option when both cool and heat configured 
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
When user selects "Info" from "Change mode" screen
Then user should be displayed with the "Mode Info" screen
And user should be displayed with the following "Mode Info" options:
|Options|
|HEAT - HEAT TO REACH TARGET TEMPERATURE|
|COOL - COOL TO REACH TARGET TEMPERATURE|
|OFF - TURN SYSTEM OFF|
When user selects "BACK" from "mode info" screen
Then user should be displayed with the "Change mode" screen
Examples:
|Mode | 
|Cool |
#|Heat |
#|OFF |

#Requirements : Auto mode should enabled
#HB, Spruce, JasperNA
@SystemModeInfoscreenwithCoolandHeatModeWhenautoModeEnabled @Automated @--xrayid:ATER-55692
Scenario Outline: As an user I want to verify the Systemode info option when both cool and heat configured with auto mode enabled
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
When user selects "Info" from "Change mode" screen
Then user should be displayed with the "Mode Info" screen
And user should be displayed with the following "Mode Info" options:
|Options|
|AUTO - COOL OR HEAT AS NEEDED TO REACH TARGET TEMPERATURE|
|HEAT - HEAT TO REACH TARGET TEMPERATURE|
|COOL - COOL TO REACH TARGET TEMPERATURE|
|OFF - TURN SYSTEM OFF|
When user selects "BACK" from "Mode Info" screen
Then user should be displayed with the "Change mode" screen 
Examples:
|Mode | 
#|Cool |
#|Heat |
|Auto | 
#|OFF |

#in case required
#Requirements : Cool only mode should enabled
#HB, Spruce, JasperNA
@SystemModeInfoscreenwithCoolOnly @Automated @--xrayid:ATER-55695
Scenario Outline: As an user I want to verify the Systemmode info option when cool only configured 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
When user selects "Info" from "Change mode" screen
Then user should be displayed with the "Mode Info" screen
And user should be displayed with the following "Mode Info" options:
|Options|
|COOL - COOL TO REACH TARGET TEMPERATURE|
|OFF - TURN SYSTEM OFF|
When user selects "BACK" from "Mode Info" screen
Then user should be displayed with the "Change mode" screen 
Examples:
|Mode | 
|Cool| 
#|OFF|

#in case required
#Requirements : Heat only mode should enabled
#HB, Spruce, JasperNA
@SystemModeInfoscreenwithHeatOnly @Automated @--xrayid:ATER-55696
Scenario Outline: As an user I want to verify the Systemmode info option when heat only configured
Given user has <Mode> system mode 
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
When user selects "Info" from "Change mode" screen
Then user should be displayed with the "Mode Info" screen
And user should be displayed with the following "Mode Info" options:
|Options|
|HEAT - HEAT TO REACH TARGET TEMPERATURE|
|OFF - TURN SYSTEM OFF|
When user selects "BACK" from "Mode Info" screen
Then user should be displayed with the "Change mode" screen 
Examples:
|Mode | 
|Heat|
#|OFF|

#JasperEMEA
@SystemModeInfoscreenwithHeatOnlyEMEA @Automated @--xrayid:ATER-55697
Scenario Outline: As an user I want to verify the Systemmode info option when heat configured 
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
When user selects "Info" from "Change mode" screen
Then user should be displayed with the "Mode Info" screen
And user should be displayed with the following "Mode Info" options:
|Options|
|HEAT - HEAT TO REACH TARGET TEMPERATURE|
|OFF - TURN SYSTEM OFF|
When user selects "BACK" from "Mode Info" screen
Then user should be displayed with the "Change mode" screen 
Examples:
|Mode | 
|Heat |
#|OFF|



#HB, Spruce, JasperNA
@SystemModeswitchSystemmodescreenwithbothcoolandheatandautoenabledCancelfunctionality @Automated @--xrayid:ATER-55698
Scenario Outline: As an user I want to verify the system mode when cancel option while switch between Cool , heat, off , auto
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
|Cool|
|Off|
#Then user "should be displayed" with the "Blue Tick mark on selected mode" option
#And user selects <SystemMode> from "change Mode" Screen
#Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
#And user should be displayed with the <SystemMode> description 
#When user selects "X" from "Change Mode" Screen
#Then user "should not be updated" with the <SystemMode> option
Examples:
|Mode|
|Heat|

#HB, Spruce, JasperNA
@SystemModeswitchSystemmodescreenwithheatonlyCancelfunctionality @Automated @--xrayid:ATER-55699
Scenario Outline: As an user I want to verify the system mode when cancel option while switch Heat only 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
#|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "X" from "Change Mode" Screen
Then user "should not be updated" with the <SystemMode> option
Examples:
 |Mode| SystemMode | 
 |Heat| OFF 	   | 
#|OFF | Heat 	   | 
#|OFF | Heat 	   | 
#|OFF | OFF	       | 

#HB, Spruce, JasperNA
@SystemModeswitchSystemmodescreenwithcoolonlyCancelfunctionality @Automated @--xrayid:ATER-55700
Scenario Outline: As an user I want to verify the system mode when cancel option while switch between cool only
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
#|Heat|
|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "X" from "Change Mode" Screen
Then user "should not be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |Cool | OFF		| 
#|OFF  | Cool		| 
#|OFF  | Cool		| 
#|OFF  | OFF		| 

#JasperEMEA
@SystemModeswitchSystemmodescreenwithheatonlyCancelfunctionalityEMEA @Automated @--xrayid:ATER-55703
Scenario Outline: As an user I want to verify the system mode when cancel option while switch between cool only
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
#|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "X" from "Change Mode" Screen
Then user "should not be updated" with the <SystemMode> option
Examples:
 |Mode| SystemMode | 
 |Heat| OFF 	   | 
#|OFF | Heat	   | 
#|OFF | Heat 	   | 
#|OFF | OFF	 	   | 

#SYSTEM MODE SAVE

#HB, Spruce, JasperNA
@SystemModeswitchSAVEfunctionbothcoolandheat @Automated @--xrayid:ATER-55704
Scenario Outline: As an user I want to verify the system mode save option while switch between cool, heat and off
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |Cool | Heat 		|
#|Heat | Cool 		|
#|Cool | OFF 		|
#|Heat | Cool 		|
#|Heat | Heat 		|
#|Heat | OFF 		|
#|OFF  | Cool 		|
#|OFF  | Heat 		|
#|OFF  | OFF 		|

#HB, Spruce, JasperNA
@SystemModeswitchSAVEfunctionbothcoolandheatandauto @Automated @--xrayid:ATER-55705
Scenario Outline: As an user I want to verify the system mode save option while switch between cool, heat, off, auto
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |Heat | Cool 		|
#|Cool | Heat 		|
#|Cool | OFF 		|
#|Cool | auto 		|
#|Heat | Cool 		|
#|Heat | Heat 		|
#|Heat | OFF 		|
#|Heat | auto 		|
#|OFF  | Cool 		|
#|OFF  | Heat 		|
#|OFF  | OFF 		|
#|OFF  | auto 		|
#|auto | Cool 		|
#|auto | Heat 		|
#|auto | OFF 		|
#|auto | auto 		|

#HB, Spruce, JasperNA
@SystemModeswitchSAVEfunctioncoolonly @Automated @--xrayid:ATER-55706
Scenario Outline: As an user I want to verify the system mode save option while switch between cool, off
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
#|Heat|
|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |Cool | OFF 		|
#|OFF  | Cool 		|
#|OFF  | Cool 		|
#|OFF  | OFF 		|

#HB, Spruce, JasperNA
@SystemModeswitchSAVEfunctionHeatonly @Automated @--xrayid:ATER-55707
Scenario Outline: As an user I want to verify the system mode save option while switch between heat, off
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
#|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |OFF  | Heat 		|
#|Heat | OFF 		|
#|OFF  | Heat 		|
#|OFF  | OFF 		|


#JasperEMEA
@SystemModeswitchSAVEfunctionEMEA @Automated @--xrayid:ATER-55708
Scenario Outline: As an user I want to verify the system mode save option while switch between heat, off
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change mode" screen 
And user should be displayed with the following "Mode" options: 
|Options|
|Heat|
#|Cool|
|Off|
Then user "should be displayed" with the "Blue Tick mark on selected mode" option
And user selects <SystemMode> from "change Mode" Screen
Then user "should be displayed" with the "Blue Tick mark on new selected mode" option
And user should be displayed with the <SystemMode> description 
When user selects "save" from "Change Mode" Screen
Then user "should be updated" with the <SystemMode> option
Examples:
 |Mode | SystemMode | 
 |OFF  | Heat 		|
#|Heat | OFF 		|
#|OFF  | Heat 		|
#|OFF  | OFF 		|


#HB, Spruce, JasperNA
@FanOptionInfoOption @Automated @--xrayid:ATER-55709
Scenario Outline: As an user I want to verify the Fan mode info option
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Fan" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change Fan" screen 
When user selects "Info" from "Change Fan" screen
Then user should be displayed with the "Fan Info" screen
And user should be displayed with the following "Fan Info" options:
|Options|
|AUTO - FAN RUNS WHILE HEATING OR COOLING|
|CIRCULATE - FAN RUNS INTERMITTENTLY TO CIRCULATE AIR|
|ON - FAN RUNS CONTINUOUSLY|
When user selects "BACK" from "Fan info" screen
Then user should be displayed with the "Change fan" screen
Examples:
 |Mode | 
 |Cool |
#|Heat | 
#|Auto | 
#|OFF 	|
#in case required
#|Heat only |
#|Cool only |


#HB, Spruce, JasperNA
@FanModeSwitchcancelfunction @Automated @--xrayid:ATER-55710
Scenario Outline: As an user I want to verify the Fan mode cancel option while switch between Auto, circulate and ON
Given user has <Mode> system mode
And user has <DftFANMode> FAN mode
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Fan" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change Fan" screen 
When user selects <FanMode> from "Change Fan" screen
Then user "should be displayed" with the "Blue Tick mark on selected Fan" option 
And user should be displayed with the <FanMode> description 
When user selects "X" from "Change Fan" screen
Then user should be displayed with the "Thermostat Solution Card" screen
And user "should not be updated" with the <FanMode> option
Examples:
 |Mode | DftFANMode |FanMode  | 
 |Cool | Auto		|On		  |
#|Cool | Circulate  |Auto     |
#|Cool | ON 		|Circulate|
#|Heat | Auto		|On		  |
#|Heat | Circulate  |On       |
#|Heat | ON         |Circulate|	
#|Auto | Auto       |On 	  |
#|Auto | Circulate  |Auto     |
#|Auto | ON         |Circulate|
#|OFF  | Auto       |On       |
#|OFF  | Circulate  |Auto     |
#|OFF  | ON         |Auto     |

#in case required
#|Heat only | Auto Fan	|
#|Heat only | Circulate |
#|Heat only | ON 		| 
#|Cool only | Auto Fan	|
#|Cool only | Circulate |
#|Cool only | ON 		| 

#HB, Spruce, JasperNA
@FanModeSwitchSAVEfunction  @Automated @--xrayid:ATER-55711
Scenario Outline: As an user I want to verify the Fan mode save option while switch between Auto, circulate and ON
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Fan" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change Fan" screen 
When user selects <FanMode> from "Change Fan" screen
Then user "should be displayed" with the "Blue Tick mark on selected Fan" option 
And user should be displayed with the <FanMode> description 
When user selects "SAVE" from "Change Fan" screen
Then user should be displayed with the "Thermostat Solution Card" screen
And user "should be updated" with the <FanMode> option
Examples:
 |Mode  |  FanMode  | 
 |Cool  | Auto 		|
#|Cool  | Circulate |
#|Cool 	| ON 		| 
#|Heat  | Auto 		|
#|Heat  | Circulate |
#|Heat  | ON 		| 
#|Auto  | Auto 		|
#|Auto  | Circulate |
#|Auto  | ON 		| 
#|OFF   | Auto 		|
#|OFF   | Circulate |
#|OFF   | ON 		| 

#in case required
#|Heat only | Auto Fan  |
#|Heat only | Circulate |
#|Heat only | ON        | 
#|Cool only | Auto Fan	|
#|Cool only | Circulate |
#|Cool only | ON 		| 

#JasperEMEA
@FanModeOptionONEMEA @Automated @--xrayid:ATER-55714
Scenario Outline: As an user I want to verify the Fan mode option for JasperEMEA
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And user "SHOULD BE DISPLAYED" with the "FAN" option
Examples: 
|Mode | 
|Heat |
|OFF  |


#Setpoint values SolutionCard

#HB, Spruce, JasperNA
@SetTemperatureSolutionCardMAX @Automated @--xrayid:ATER-55715
Scenario Outline: As an user I want to verify the Max temper throguh TAP on stepper
Given user has <Mode> system mode
Given user thermostat is set to <scheduling> schedule
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "MAX set temperature by taping on UP stepper" from "Primary Card" screen
Then user "should be displayed" with the "MAX set temperature on Solution Card" option
And user navigates to "THERMOSTAT DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "should be displayed" with the "MAX set temperature on Dashboard" option
Examples:
 |Mode	|scheduling		|
 |Heat	|geofence based |
#|Cool	|geofence based	|
#|Heat	|time based		|
#|Cool	|time based		|
#|Heat	|no				|
#|Cool	|no				|
#in case required
#|Cool only|geofence based	|
#|Heat only|time based 		|
#|Cool only|time based		|
#|Heat only|geofence based	|


#HB, Spruce, JasperNA
@SetTemperatureSolutionCardMIN @Automated @--xrayid:ATER-55716
Scenario Outline: As an user I want to verify the Min temper throguh TAP on stepper
Given user has <Mode> system mode
Given user thermostat is set to <scheduling> schedule
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "MIN set temperature by taping on DOWN stepper" from "Primary Card" screen
Then user "should be displayed" with the "MIN set temperature on Solution Card" option
And user navigates to "THERMOSTAT DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "should be displayed" with the "MIN set temperature on Dashboard" option
Examples:
 |Mode|scheduling	 |
 |Heat|geofence based|
#|Cool|geofence based|
#|Heat|time based	 |
#|Cool|time based	 |
#|Heat|no			 |
#|Cool|no			 |
#in case required
#|Cool only|geofence based  |
#|Heat only|time based		|
#|Cool only|time based		|
#|Heat only|geofence based	|

#JasperEMEA
@SetTemperatureSolutionCardMAXEMEA @Automated @--xrayid:ATER-55717
Scenario Outline: As an user I want to verify the Max temper through TAP on stepper
Given user has <Mode> system mode
Given user thermostat is set to <scheduling> schedule
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "MAX set temperature by taping on UP stepper" from "Primary Card" screen
Then user "should be displayed" with the "MAX set temperature on Solution Card" option
And user navigates to "THERMOSTAT DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "should be displayed" with the "MAX set temperature on Dashboard" option
Examples:
 |Mode|scheduling	 |
 |Heat|geofence based|
#|Heat|time based	 |
#|Heat|no			 |

#JasperEMEA
@SetTemperatureSolutionCardMINEMEA @Automated @--xrayid:ATER-55718
#Setpoint value Dashboard
Scenario Outline: As an user I want to verify the Min temper through TAP on stepper
Given user has <Mode> system mode
Given user thermostat is set to <scheduling> schedule
Given user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "MIN set temperature by taping on DOWN stepper" from "Primary Card" screen
Then user "should be displayed" with the "MIN set temperature on Solution Card" option
And user navigates to "THERMOSTAT DASHBOARD" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "should be displayed" with the "MIN set temperature on Dashboard" option
Examples:
 |Mode|scheduling	 |
 |Heat|geofence based|
#|Heat|time based	 |
#|Heat|no			 |



#OFF Mode Dashboard and primary card 
@HB,Spruce
@SetTemperatiureOFFModeHB @Automated @--xrayid:ATER-55719
Scenario Outline: As an user I want to verify the setpoint value on OFF mode 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen 
And the following "Thermostat" options should be disabled:
|Options|
|UP stepper|
|Down stepper|
Then user "should be displayed" with the "--" option
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
And the following "Thermostat" options should be disabled:
|Options|
|UP stepper|
|Down stepper|
Then user "should not be displayed" with the "respective setpoint value" option
And user should see the "Inside temperature" status as "OFF" on the "thermostat solution card" screen  
Examples:
|Mode| 
|OFF|

@JAsperNA,JasperEMEA 
@SetTemperatiureOFFModeNA @Automated @--xrayid:ATER-55722
Scenario Outline: As an user I want to verify the setpoint value on OFF mode 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen 
And the following "Thermostat" options should be disabled:
|Options|
|UP stepper|
|Down stepper|
Then user "should be displayed" with the "--" option
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
And the following "Thermostat" options should be disabled:
|Options|
|UP stepper|
|Down stepper|
Then user "should not be displayed" with the "respective setpoint value" option
And user should see the "Inside temperature" status as "OFF" on the "thermostat solution card" screen  
Examples:
|Mode| 
|OFF|



#Multistats
@SetTemperatureSolutionCardFromJasperNA @NotAutomatable @--xrayid:ATER-55768
Scenario Outline:To set temperature for location with multistat(Jasper NA,HBB)systems Heat cool,Cool,Heat for Temperture scale Celsius/Fahrenheit and for time format 24/12hr
As an user 
I want to set temperature
So that my comfortable indoor temperature maintained   
Given Jasper NA "stat1" with <Mode>
Then user navigates to "SolutionCard"
When User set the temperature from Jasper NA "stat1" in app
And User set the temperature from Jasper NA "stat1" in app from other mobile
And User set the temperature from Jasper NA "stat1"
Then Verify the Jasper NA "stat1" status on the primary card for set temperature
And Verify the Jasper NA "stat1" schedule temperature is override with set temperature
And Verify maximum and minimum set values is followed
And Verify the Jasper NA "stat1" widget on the location dashboard for set temperature
Examples:
 |Mode 		|
#|Heat 		| 
 |Cool 		|
#|Auto 		|
#|Heat only |
#|Cool only |

@SetTemperatureFromHBB @NotAutomatable @--xrayid:ATER-55769
Scenario Outline:To set temperature for location with multistat (Jasper NA,HBB) systems Heat cool,Cool,Heat for Temperture scale Celsius (OR) Fahrenheit and for time format 24 (OR) 12hr
Given HBB "stat1" with <Mode>
When User set the temperature from HBB "stat1" in app
And User set the temperature from HBB "stat1" in app from other mobile
And User set the temperature from HBB "stat1"
Then Verify the HBB "stat1" status on the primary card for set temperature
And Verify the HBB "stat1" schedule temperature is override with set temperature
And Verify maximum and minimum set values is followed
And Verify the HBB "stat1" widget on the location dashboard for set temperature
Examples:
 |Mode |
 |Heat | 
#|Cool |
#|Auto |

@SetTemperatureFromEMEA @Automated @--xrayid:ATER-55770
Scenario: To set temperature for location with multistat with time format 24 OR 12hr 
Given Stat1 with "Heat" mode
When User set the temperature from "Stat1" in app
But User set the temperature from "Stat1" in app from other device
But User set the temperature from "Stat1"
Then Verify the "Stat1" status on the primary card for set temperature
And Verify the "Stat1" schedule temperature is override with set temperature 
And Verify maximum and minimum set values is followed
And Verify the "Stat1" widget on the location dashboard for set temperature


#network error

#HB, Spruce, JasperNA, JasperEMEA
@NetworkdownSolutionCard&SolutionCard @NotAutomatable @--xrayid:ATER-55771
Scenario Outline:To get error messages on network down in primary card
As an user
I want to get error message in primary card 
Given With the <Condition>
Then Verify the error message
Examples:
|Condition                       |
|Mobile internet(3G/wifi) is down|
|Mobile in Airplane mode         |
|Mobile with low signal(3G/wifi) |
|CHIL down                       |
|Switching between the network   |
|Smart network switch            |



#HB, Spruce, JasperNA, JasperEMEA
@NetworkdownDashboard&SolutionCard @NotAutomatable @--xrayid:ATER-55772
Scenario Outline:To get error messages on network down in location Dashboard
As an user
I want to get error message in location Dashboard 
So that I will get notified on network down
Given With the <Condition>
Then Verify the error message
Examples:
|Condition                       |
|Mobile internet(3G/wifi) is down|
|Mobile in Airplane mode         |
|Mobile with low signal(3G/wifi) |
|CHIL down                       |
|Switching between the network   |
|Smart network switch            |


#Feature: As an user I want to change the AutoChangeover option for JapserNA , JasperEMEA, HB and Spruce
#AutoChangeover

#Requirement : One account with  Auto mode enabled
#HB, Spruce, JaperNA
@DashboardandsolutioncardAutochangeover @Automated @--xrayid:ATER-55773
Scenario Outline:As an user i want to view the option for automode 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen 
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change Mode" screen 
Then user "should be provided" with the "automode" option
Examples:
 |Mode  | 
 |Heat  |
#|Cool  |


#HB, Spruce, JaperNA
#Requirement : One account with  Auto mode enabled
@DashboardandsolutioncardAutoModeCheckingFromPrimaryCard @Automated @--xrayid:ATER-55774
Scenario Outline: As an user i should not shown with the option for automode 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen 
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And user navigates to "THERMOSTAT SETTINGS" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "disables auto change over" with the "thermostat settings" option
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT SETTINGS" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user "should not be displayed" with the "Auto Mode description" option 
When user selects "X" from "Change Mode" Screen
And user navigates to "THERMOSTAT SETTINGS" screen from the "THERMOSTAT SOLUTION CARD" screen
Then user "enables auto change over" with the "thermostat settings" option
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT SETTINGS" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user "should be displayed" with the "Auto Mode description" option 
Examples:
 |Mode  |
#|Heat  |
 |Cool  |

#HB, Spruce, JaperNA // negative case
#Requirement :Auto mode should be disabled
@DashboardandsolutioncardAutoModeNegative1 @Automated @--xrayid:ATER-55775
Scenario Outline: As an user i should not shown with the option for automode
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
When user should be displayed with the "thermostat Dashboard" screen 
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
When user selects "Mode" from "Thermostat Solution Card" screen
Then user should be displayed with the "Change Mode" screen 
Then user "should not be provided" with the "automode" option
Examples:
 |Mode  |
 |Heat  |
#|Cool  |

#Not Automatable
#HB, Spruce, JaperNA
@DashboardandsolutioncardAutoModewithMutliOS @NotAutomatable @--xrayid:ATER-55776
Scenario Outline:As an user i want to set the stat with automode 
Given Stat with Heat Cool system
And Autochangeover enabled in stat
When <user> selects auto mode in <mobile device> 
Then verify stat set to auto mode
And verify app logged with <user> in <mobile device> mode icon changed to auto mode
Examples:
|user  |mobile device|
|Actual|android      |
|Actual|iOS          |
|Invite|android      |
|Invite|iOS          |



#HB, Spruce, JaperNA
@DashboardandsolutioncardCheckSetpointInVacationSettings @Automated @--xrayid:ATER-55777
Scenario: As an user i want the Heat setpoint should be always less than the cool setpoint in vacation settings  
Given Stat with Heat Cool system
And Autochangeover enabled in stat
When user selects set points within maximum and minimum range                               
Then verify Heat setpoint should be always less than the cool setpoint

#CoachMark

#JasperNA, HB, Spruce,JasperEMEA
@DashboardCoachmarkverification @Automated @--xrayid:ATER-55778
Scenario Outline:As an user i want to verify coach marks 
Given user has <Mode> system mode
Given user launches and logs in to the Lyric application without closing coach mark
Then user verifies the "THERMOSTAT DASHBOARD" coach marks
Examples:
 |Mode|
 |Cool|
#|Heat|
#|Auto|

#JasperNA, HB, Spruce
@SolutionCardCoachmarkverificationNA @Automated @--xrayid:ATER-55779
Scenario Outline:As an user i want to verify coach marks 
Given user has <Mode> system mode
Given user launches and logs in to the lyric application 
#And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then user verifies the "NA THERMOSTAT SOLUTION CARD" coach marks
Examples:
 |Mode|
 |Cool|
#|Heat|
#|Auto|

#JasperEMEA, HB, Spruce
@SolutionCardCoachmarkverificationEMEA @Automated @--xrayid:ATER-55780
Scenario Outline:As an user i want to verify coach marks 
Given user has <Mode> system mode
Given user launches and logs in to the lyric application 
#And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then user verifies the "EMEA THERMOSTAT SOLUTION CARD" coach marks
Examples:
|Mode|
|Heat|


#Dashboard order  
@Dashboardorderwithallsolutions @NotAutomatable @--xrayid:ATER-55781
Scenario Outline:  user configured with C1, C2 , JasperNA, JasperEMEA, WLD, DAS
Given user launches and logs in to the lyric application
Then user  navigates to "Dashboard"
When user should displayed with "alphanumeric order"

#Requirement:1 account with Emergency heat enabled
#JasperNA, HB, Spruce
#Emergencyheat should be enabled 
@SolutionCardEmergencyHeatbothcoolandheat @Automated @--xrayid:ATER-55782
Scenario Outline: As an user I want to verify Emergency heat on solution card when both heat and cool  mode configured
Given user launches and logs in to the Lyric application
Then user has <Mode> system mode
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
And user changes the "Emergency Heat" to "ON"
When user navigates to "PrimaryCard" screen from the "Thermostat Settings" screen
#Then verify system mode is changed to "Heat"
Then user "should be updated" with the "Heat" option
And verify the "Emergency Heat" on the "Primary Card" screen
#When user selects "Mode" from "Thermostat Solution Card" screen
When user changes system mode to <systemMode>
Then verify the "Emergency Heat Not Displayed" on the "Primary Card" screen
And user navigates to "Thermostat Settings" screen from the "Primary Card" screen
And "Emergency Heat" value should be updated to "OFF" on "Thermostat Settings" screen
Examples:
 |Mode | systemMode |
#|Cool | Cool 		|
#|Cool | Auto 		| 
#|Cool | OFF  		|
#|Cool | Cool 		|
 |Heat | Cool 		|
#|Heat | Auto 		|
#|Heat | OFF 		|
#|Heat | Heat		|
#|Auto | Cool 		|
#|Auto | Heat 		|	 
#|Auto | OFF 		|
#|Auto | Auto 		|
#|OFF  | Cool 		|
#|OFF  | Heat 		|		 
#|OFF  | OFF 		|
#|OFF  | auto		|


#Requirement:1 account with Emergency heat enabled
#JasperNA, HB, Spruce
#Emergencyheat should be enabled 
@SolutionCardEmergencyHeatHeatonly @Automated @--xrayid:ATER-55783
Scenario Outline: As an user I want to verify Emergency heat on solution card when heat only mode configured
Given user launches and logs in to the Lyric application
Then user has <Mode> system mode
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be disabled:
		| ThermostatSettingsOption |
		| Emergency Heat           |
When user navigates to "PrimaryCard" screen from the "Thermostat Settings" screen
Then user "should be updated" with the <Mode> option
Examples:
 |Mode | systemMode |
 |Heat | OFF 		|
#|Heat | Heat 		| 
#|OFF  | OFF 		|
#|OFF  | Heat 		| 

#Requirement:1 account with Emergency heat enabled
#JasperNA, HB, Spruce
#Emergencyheat should be enabled 
@SolutionCardEmergencyHeatCoolonly @Automated @--xrayid:ATER-55784
Scenario Outline: As an user I want to verify Emergency heat on solution card when cool only mode configured
Given user launches and logs in to the Lyric application
Then user has <Mode> system mode
When user navigates to "Thermostat Settings" screen from the "Dashboard" screen
Then the following "Thermostat Settings" options should be disabled:
		| ThermostatSettingsOption |
		| Emergency Heat           |
When user navigates to "PrimaryCard" screen from the "Thermostat Settings" screen
Then user "should be updated" with the "Cool" option
Examples:
 |Mode | 
 |Cool |
#|OFF  | 


#JasperEMEA
#Emergencyheat should be enabled 
@SolutionCardEmergencyHeatHeatonlyEMEA @Automated @--xrayid:ATER-55785
Scenario Outline: As an user I want to verify Emergency heat on solution card 
Given user has <Mode> system mode
Then user launches and logs in to the Lyric application
And user should be displayed with the "thermostat Dashboard" Screen
Then user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user should be displayed with the "thermostat Solution Card" screen
And user navigates to "THERMOSTAT SETTINGS" screen from the "THERMOSTAT SOLUTION CARD" screen
And user "should not be displayed" with the "Emergency heat" option
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT SETTINGS" screen 
Then user "should not be updated" with the "HEAT" option
Examples:
 |Mode 		| 
#|Heat only |
 |OFF		| 



@SolutioncardHeatingTovalidation @Automated @--xrayid:ATER-55786
Scenario: As an user I want to verify the Heating to on solution card 
Given user has "Heat" system mode
Then user launches and logs in to the Lyric application
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user "increase" the setpoint value "above" room temperature in "Primary Card"
Then user "should be displayed" with the "Heating on Primary card" option
And the user should be displayed with "Heating To" setpoint value
And user navigates to "Dashboard" screen from the "thermostat solution card" screen
Then user "should be displayed" with the "Heating on dashboard" option
When user "decrease without wait" the setpoint value "below" room temperature in "dashboard" 
Then user "should not be displayed" with the "Heating on dashboard" option
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user "should not be displayed" with the "Heating on Primary card" option

@SolutioncardCoolingTovalidation @Automated @--xrayid:ATER-55787
Scenario: As an user I want to verify the Heating to on solution card 
Given user has "Cool" system mode
Then user launches and logs in to the Lyric application
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
When user "decrease" the setpoint value "below" room temperature in "Primary Card" 
And user "should be displayed" with the "Cooling on Primary card" option
Then the user should be displayed with "Cooling To" setpoint value
And user navigates to "Dashboard" screen from the "thermostat solution card" screen
Then user "should be displayed" with the "Cooling on dashboard" option
When user "increase" the setpoint value "above" room temperature in "dashboard"
Then user "should not be displayed" with the "Cooling on dashboard" option
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then user "should not be displayed" with the "Cooling on Primary card" option

@DashboardHeatingTovalidation @Automated @--xrayid:ATER-55788
Scenario: As an user I want to verify the Heating to on solution card 
Given user has "Heat" system mode
Then user launches and logs in to the Lyric application
When user "increase" the setpoint value "above" room temperature in "dashboard"
Then user "should be displayed" with the "Heating on dashboard" option
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then the user should be displayed with "Heating To" setpoint value
When user "decrease" the setpoint value "below" room temperature in "Primary Card"
Then user "should not be displayed" with the "Heating on Primary card" option
And user navigates to "Dashboard" screen from the "thermostat solution card" screen
Then user "should not be displayed" with the "Heating on dashboard" option

@DashboardCoolingTovalidation @Automated @--xrayid:ATER-55789
Scenario: As an user I want to verify the Heating to on solution card 
Given user has "Cool" system mode
Then user launches and logs in to the Lyric application
When user "decrease" the setpoint value "below" room temperature in "dashboard"
Then user "should be displayed" with the "Cooling on dashboard" option
And user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
Then the user should be displayed with "Cooling To" setpoint value
When user "increase" the setpoint value "above" room temperature in "Primary Card"
Then user "should not be displayed" with the "Cooling on Primary card" option
And user navigates to "Dashboard" screen from the "thermostat solution card" screen
Then user "should not be displayed" with the "Cooling on dashboard" option

 
