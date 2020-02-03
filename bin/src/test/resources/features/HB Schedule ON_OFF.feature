@ScheduleON_OFF @Comfort 
Feature: As an user I want to turn schedule OFF or ON So that I can run schedule whenever I want to apply set points automatically 

@ScheduleONOFFHB @Automated @LYR-29410  @--xrayid:ATER-54407
Scenario Outline:Schedule OFF the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr  
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
Then user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
Examples:
|Mode | scheduling |
|Cool|geofence based|
#|Heat|geofence based|
#|Auto|geofence based|
#|Cool|time based    |
#|Heat|time based    |
#|Auto|time based    |

#incaserequired
#|Heat only|geofence based|
#|Cool only|geofence based|
#|Heat only|time based    |
#|Cool only|time based    |

@ScheduleONOFFHBtimebase @Automated @LYR-29409  @--xrayid:ATER-54412
Scenario Outline:Schedule OFF the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr time base schedule
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
Then user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status not displayed" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Examples:
|Mode |scheduling	|
|Cool|time based     |
#|Heat|time based     |
#|Auto|time based     |

#Incaserequried
#|Heat only|time based   |
#|Cool only|time based    |



@ScheduleONOFFHBgeofencebase @Automated @LYR-29388 @--xrayid:ATER-54413
Scenario Outline: Schedule ON the stat   with systems Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user thermostat set <Period> with <Geofence>
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status not displayed" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Examples:
|Mode|scheduling	|Geofence   |Period |
|Cool|Without sleep geofence based|UserArrived | Home|
#|Cool|geofence based|UserArrived |Sleep|
#|Cool|Without sleep geofence based|UserDeparted |Away|
#|Heat|Without sleep geofence based|UserArrived |Home|
#|Heat|Without sleep geofence based|UserDeparted |Away|
#|Heat|geofence based|UserArrived | Sleep|
#|Auto|geofence based|UserArrived |Sleep|
#|Auto|Without sleep geofence based|UserArrived |Home|
#|Auto|Without sleep geofence based|UserDeparted |Away|

#Incaserequried
#|Heat only|Without sleep geofence based|UserArrived |Home|
#|Heat only|Without sleep geofence based|UserDeparted |Away|
#|Heat only|geofence based|UserArrived |Sleep|
#|Cool only|Without sleep geofence based|UserArrived |Home|
#|Cool only|Without sleep geofence based|UserDeparted |Away|
#|Cool only|geofence based|UserArrived |Sleep|



@ScheduleONOFFHBswitchingmodes @Automated @--xrayid:ATER-54414
Scenario Outline:Schedule ON OFF status while switching modes to off and from off for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
When user changes system mode to "OFF"
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
And user selects "Option" from "Scheduling" screen
When user selects "schedule off" from "Option" screen
Then verify the "SCHEDULE OFF OVERLAY" on the "Scheduling" screen
When user navigates to "primary card" screen from the "Scheduling" screen
Then verify the "Schedule off Status not displayed" on the "PRIMARY CARD" screen
When user changes system mode to <UMode>
Then verify the "Schedule off Status not displayed" on the "PRIMARY CARD" screen 
When user changes system mode to "OFF"
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
And user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
When user changes system mode to <UMode>
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Examples:
|Mode| scheduling  | UMode |
|Cool| time based | Heat |
#|Cool| time based | Cool |
#|Cool| time based | Auto |
#|Heat| time based | Heat |
#|Heat| time based | Cool |
#|Heat| time based | Auto |
#|Auto| time based | Heat |
#|Auto| time based | Cool |
#|Auto| time based | Auto |
#|Cool| geofence based | Heat |
#|Cool| geofence based| Cool|
#|Cool| geofence based | Auto |
#|Heat| geofence based  | Heat |
#|Heat| geofence based | Cool |
#|Heat| geofence based | Auto |
#|Auto| geofence based | Heat |
#|Auto|geofence based | Cool |
#|Auto| geofence based| Auto |

@ScheduleONOFFHBgeofencebasefencecross @Automated @--xrayid:ATER-54415
Scenario Outline: As a user want to verify schedule off status when geofence crossed
#Schedule ON the stat   with systems Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user thermostat set <Period> with <Geofence>
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "Scheduling" screen
Then user thermostat set <UPeriod> with <UGeofence>
When user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
Then Verify the "Schedule OFF overlay" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "Scheduling" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
Examples:
|Mode|scheduling				  |Geofence    |Period | UPeriod | UGeofence |
#|Cool|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted |
#|Cool|geofence based			  |UserArrived |Sleep| Away | UserDeparted |
|Cool|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |
#|Cool|geofence based			  |UserDeparted |Away| Sleep | UserArrived |
#|Heat|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted |
#|Heat|geofence based			  |UserArrived |Sleep| Away | UserDeparted |
#|Heat|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |
#|Heat|geofence based			  |UserDeparted |Away| Sleep | UserArrived |
#|Auto|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted |
#|Auto|geofence based			  |UserArrived |Sleep| Away | UserDeparted |
#|Auto|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |
#|Auto|geofence based			  |UserDeparted |Away| Sleep | UserArrived |

#Incaserequried
#|Heat Only|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted |
#|Heat Only|geofence based			  |UserArrived |Sleep| Away | UserDeparted |
#|Heat Only|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |
#|Heat Only|geofence based			  |UserDeparted |Away| Sleep | UserArrived |
#|Cool Only|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted |
#|Cool Only|geofence based			  |UserArrived |Sleep| Away | UserDeparted |
#|Cool Only|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |
#|Cool Only|geofence based			  |UserDeparted |Away| Sleep | UserArrived |


@ScheduleONMultistatHB @Automated @--xrayid:ATER-54417
Scenario Outline:As an user I want to turn schedule OFF and verify in thermostat2
#Schedule ON in the stat1 doesnot affect other stats schedule OFF status in the location with Multi stat(Jasper EMEA) or with Multi stat(Jasper NA,HBB) for time format 24/12hr  
Given user has <Mode> system mode
Then user thermostat1 is set to <scheduling> schedule 
When user thermostat2 is set to <scheduling1> stats 
Then user thermostat2 is set to <scheduled> stats
When user launches and logs in to the Lyric application
Then user navigates to "MULTISTAT LOCATION" screen from the "Dashboard" screen
Then user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then user navigates to "Thermostat2" screen from the "T1PRIMARYCARD" screen
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then verify the "schedule off overlay" on the "Scheduling" screen

Examples:
|Mode | scheduling | scheduling1 |scheduled |
|Cool|geofence based| geofence based | pause |
#|Cool|geofence based| time based  | pause |
#|Cool|time based | geofence based | pause |
#|Cool|time based | time based  | pause |
#|Heat|geofence based| time based | pause |
#|Heat|geofence based| geofence based | pause |
#|Heat|time based | geofence based | pause |
#|Heat|time based | time based  | pause |
#|Auto|geofence based| time based | pause |
#|Auto|geofence based| geofence based | pause |
#|Auto|time based | geofence based | pause |
#|Auto|time based | time based  | pause |


#incaserequired
#|Cool Only|geofence based| time based | pause |
#|Cool Only|geofence based| geofence based | pause |
#|Cool Only|time based | geofence based | pause |
#|Cool Only|time based | time based  | pause |
#|Heat Only|geofence based| time based | pause |
#|Heat Only|geofence based| geofence based | pause |
#|Heat Only|time based | geofence based | pause |
#|Heat Only|time based | time based  | pause |


@ScheduleOFFMultistatHB  @Automated  @--xrayid:ATER-54418
Scenario Outline: As an user I want to turn schedule ON and verify in thermostat2   
#Schedule OFF in the stat1 doesnot affect other stats schedule ON status in the location with Multi stat(Jasper EMEA) or with Multi stat(HBB,Jasper NA) for systems Heat cool,Cool,Heat for Temperture scale Celsius/Fahrenheit and for time format 24/12hr
Given user has <Mode> system mode
Then user thermostat1 is set to <scheduling> schedule
Then user thermostat1 is set to <scheduled> schedule
When user thermostat2 is set to <scheduling1> stats 
When user launches and logs in to the Lyric application
And user navigates to "MULTISTAT LOCATION" screen from the "Dashboard" screen
Then user navigates to "Scheduling" screen from the "Dashboard" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then user navigates to "Thermostat2" screen from the "T1PRIMARYCARD" screen
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen

Examples:
|Mode | scheduling | scheduling1 |scheduled |
|Cool|geofence based| geofence based | pause |
#|Cool|geofence based| time based  | pause |
#|Cool|time based | geofence based | pause |
#|Cool|time based | time based | pause |
#|Heat|geofence based| time based | pause |
#|Heat|geofence based| geofence based | pause |
#|Heat|time based | geofence based | pause |
#|Heat|time based | time based  | pause |
#|Auto|geofence based| time based | pause |
#|Auto|geofence based| geofence based | pause |
#|Auto|time based | geofence based | pause |
#|Auto|time based | time based  | pause |


#incaserequired
#|Cool Only|geofence based| time based | pause |
#|Cool Only|geofence based| geofence based | pause |
#|Cool Only|time based | geofence based | pause |
#|Cool Only|time based | time based  | pause |
#|Heat Only|geofence based| time based | pause |
#|Heat Only|geofence based| geofence based | pause |
#|Heat Only|time based | geofence based | pause |
#|Heat Only|time based | time based  | pause |