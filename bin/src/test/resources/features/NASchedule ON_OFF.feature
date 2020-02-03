@ScheduleON_OFF @Comfort
Feature: As an user I want to turn schedule OFF or ON so that I can run schedule whenever I want to apply set points automatically 


@ScheduleOFFONNA @Automated @LYR-29388 @--xrayid:ATER-54541
Scenario Outline: As an user I want to turn schedule OFF So that I will be able to turned off schedule whenever I don't want to run schedule 
#Schedule OFF ON the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
Then user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
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



@ScheduleOFFONNAtimebase  @Automated @LYR-29389 @--xrayid:ATER-54542
Scenario Outline:As an user I want to turn schedule ON while running time base schedule   
#Schedule OFF the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr 
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
Then user navigates to "Scheduling" screen from the "Dashboard" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the <Schedule status> on the "PRIMARY CARD" screen

Examples:
|Mode | scheduling | Schedule status |
|Cool|time based |following schedule |
#|Heat|time based | following schedule |
#|Auto|time based  | following schedule |

#incaserequired
#|Heat only|time based  | following schedule |
#|Cool only|time based  | following schedule |

@ScheduleONOFFNAgeofencebase @Automated @LYR-29390 @--xrayid:ATER-54543
Scenario Outline:As an user I want to turn schedule ON from OFF So that schedule will be turned back to geofence based 
#Schedule ON the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user thermostat set <Period> with <Geofence>
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And Verify the <Schedule status> on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the <Schedule status> on the "PRIMARY CARD" screen
Examples:
|Mode|scheduling	|Schedule status	 |Geofence   |Period |
|Cool|Without sleep geofence based|Using Home Settings|UserArrived | Home|
#|Cool|geofence based|Using Sleep Settings |UserArrived |Sleep|
#|Cool|Without sleep geofence based|Using Away Settings|UserDeparted |Away|
#|Heat|Without sleep geofence based|Using Home Settings|UserArrived |Home|
#|Heat|Without sleep geofence based|Using Away Settings|UserDeparted |Away|
#|Heat|geofence based|Using Sleep Settings |UserArrived | Sleep|
#|Auto|geofence based|Using Sleep Settings |UserArrived |Sleep|
#|Auto|Without sleep geofence based|Using Home Settings |UserArrived |Home|
#|Auto|Without sleep geofence based|Using Away Settings |UserDeparted |Away|

#Incaserequried
#|Heat only|Without sleep geofence based|Using Home Settings |UserArrived |Home|
#|Heat only|Without sleep geofence based|Using Away Settings |UserDeparted |Away|
#|Heat only|geofence based|Using Sleep Settings |UserArrived |Sleep|
#|Cool only|Without sleep geofence based|Using Home Settings|UserArrived |Home|
#|Cool only|Without sleep geofence based|Using Away Settings |UserDeparted |Away|
#|Cool only|geofence based|Using Sleep Settings |UserArrived |Sleep|


@ScheduleOFFAdhocOverrideNAtimebaseGeofence @Automated @LYR-29397  @--xrayid:ATER-54544
Scenario Outline:As an user I want to turn schedule OFF So that I will be able to turned off schedule whenever I don't want to run schedule  
#Schedule OFF the stat  with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr  
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then user has <Adhocoverride> status
And Verify the <Adhocoverride> on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
Examples:
|Mode|scheduling | Adhocoverride    |
|Heat| time based| Temporary |
#|Heat| time based| Permanent |
#|Heat|geofence based| Temporary |
#|Cool| time based| Temporary |
#|Cool| time based| Permanent |
#|Cool|geofence based| Temporary |
#|auto| time based| Temporary |
#|auto| time based| Permanent |
#|auto|geofence based| Temporary |

#incaserequired
#|Cool only| time based| Temporary |
#|Cool only | time based| Permanent |
#|Heat only| time based| Temporary |
#|Heat only | time based| Permanent |
#|Cool only|geofence based| Temporary |
#|Heat only|geofence based| Temporary |

@ScheduleONOFFNNAadhocoverrideTimebase @Automated @LYR-29392  @--xrayid:ATER-54545
Scenario Outline: As an user I want to turn schedule ON from OFFSo that schedule will be turned back to follow schedule 
#Schedule ON the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And user has <Adhocoverride> status
And Verify the <Adhocoverride> on the "PRIMARY CARD" screen
And user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the <Schedule status> on the "PRIMARY CARD" screen

Examples:
|Mode|scheduling | Adhocoverride   | Schedule status |
|Heat| time based| Temporary | following schedule |
#|Heat| time based| Permanent | following schedule |
#|Cool| time based| Permanent | following schedule |
#|Cool| time based| Temporary | following schedule |
#|auto| time based| Temporary | following schedule |
#|auto| time based| Permanent | following schedule |

#incaserequired
#|Cool only| time based| Permanent |following schedule |
#|Heat only| time based| Temporary |following schedule |
#|Cool only| time based| Permanent |following schedule |
#|Heat only| time based| Temporary |following schedule |


@ScheduleONOFFNAadhocoverrideGeofence @Automated @LYR-29391 @--xrayid:ATER-54546
Scenario Outline:As an user I want to turn schedule ON from OFF So that schedule will be turned back to geofence schedule 
#Schedule ON the stat   with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user thermostat set <Period> with <Geofence>
And user launches and logs in to the Lyric application
When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then Verify the <Schedule status> on the "PRIMARY CARD" screen
When user has <Adhocoverride> status
Then Verify the <Adhocoverride> on the "PRIMARY CARD" screen
And user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "PRIMARY CARD" screen from the "SCHEDULING" screen
Then Verify the <Schedule status> on the "PRIMARY CARD" screen

Examples:
|Mode | scheduling 					| Adhocoverride | Schedule status |Geofence | Period |
|Heat|Without sleep geofence based| Temporary | Using Home Settings| UserArrived |Home|
#|Heat|Without sleep geofence based| Temporary | Using Away Settings| UserDeparted |Away|
#|Heat|geofence based| Temporary | Using Sleep Settings|UserArrived |Sleep|
#|Cool|Without sleep geofence based| Temporary |Using Home Settings| UserArrived |Home|
#|Cool|Without sleep geofence based| Temporary |Using Away Settings| UserDeparted |Away|
#|Cool|geofence based| Temporary |Using Sleep Settings|UserArrived |Sleep|
#|auto|Without sleep geofence based| Temporary |Using Home Settings| UserArrived |Home|
#|auto|Without sleep geofence based| Temporary |Using Away Settings|UserDeparted |Away|
#|auto|geofence based| Temporary |Using Sleep Settings|UserArrived |Sleep|

#Incaserequired
#|Cool only|Without sleep geofence based| Temporary |Using Home Settings|Home|
#|Cool only|Without sleep geofence based| Temporary |Using Away Settings|Away|
#|Cool only|geofence based| Temporary |Using Sleep Settings|Sleep|
#|Heat only|Without sleep geofence based| Temporary |Using Home Settings|Home|
#|Heat only|Without sleep geofence based| Temporary |Using Away Settings|Away|
#|Heat only|geofence based| Temporary |Using Sleep Settings|Sleep|


@ScheduleOFFVacationNA @Automated @LYR-29393  @--xrayid:ATER-54547
Scenario Outline: As an user  I want to turn schedule OFF while vacation is active  So that I will be able to turned off schedule whenever I don't want to run schedule
#Schedule OFF for stat  with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr     
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
And verify the "Vacation status" on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user selects "Schedule OFF overlay" from "Scheduling" screen
Then verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
And user navigates to "primary card" screen from the "SCHEDULING" screen
And vacation mode is "inactive"
Examples:
|Mode| scheduling | 
|Cool| time based |
#|Heat| time base |
#|Auto| time based |
#|Cool|geofence based |
#|Heat| geofence based |
#|Auto| geofence based |

#incaserequired
#|Cool only| time based |
#|Heat Only|time based |
#|Cool only| geofence based |
#|Heat Only| geofence based |



@ScheduleONOFFNAVacationNA @Automated @LYR-29394  @--xrayid:ATER-54548
Scenario Outline:As an user I want to turn schedule ON So that my vaction will be back  
#Schedule ON the stat  with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr 
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
When vacation mode is "active"
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then verify the "Vacation status" on the "PRIMARY CARD" screen
And user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Vacation status" on the "PRIMARY CARD" screen
And vacation mode is "inactive"
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen
When user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
Examples:
|Mode| scheduling | 
|Cool| time based |
#|Heat| time based |
#|Auto| time based |
#|Cool|geofence based |
#|Heat| geofence based |
#|Auto| geofence based |

#incaserequired
#|Cool only| time based |
#|Heat Only| time based |
#|Cool only| geofence based |
#|Heat Only| geofence based |


@ScheduleOFFVacationStatusNA @Automated @LYR-29393 @--xrayid:ATER-54549
Scenario Outline: As an user  I want to turn schedule OFF while vacation is active  So that I will be able to turned off schedule whenever I don't want to run schedule
#Schedule OFF for stat  with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr     
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
And verify the "Vacation status" on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Vacation status" on the "PRIMARY CARD" screen
And user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Schedule OFF overlay" from "Scheduling" screen
Then verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
And user navigates to "primary card" screen from the "SCHEDULING" screen
And verify the "Vacation status" on the "PRIMARY CARD" screen
And vacation mode is "inactive"
Examples:
|Mode| scheduling | 
|Cool| time based |
#|Heat| time base |
#|Auto| time based |
#|Cool|geofence based |
#|Heat| geofence based |
#|Auto| geofence based |

#incaserequired
#|Cool only| time based |
#|Heat Only|time based |
#|Cool only| geofence based |
#|Heat Only| geofence based |



@ScheduleONOFFNAVacationStatusNA @Automated @LYR-29394 @--xrayid:ATER-54550
Scenario Outline:As an user I want to turn schedule ON So that my vaction will be back  
#Schedule ON the stat  with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr 
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
When vacation mode is "active"
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then verify the "Vacation status" on the "PRIMARY CARD" screen
And user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Vacation status" on the "PRIMARY CARD" screen 
And vacation mode is "inactive"
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen
When user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And verify the "Schedule OFF overlay disabled" on the "Scheduling" screen

Examples:
|Mode| scheduling | 
|Cool| time based |
#|Heat| time based |
#|Auto| time based |
#|Cool|geofence based |
#|Heat| geofence based |
#|Auto| geofence based |

#incaserequired
#|Cool only| time based |
#|Heat Only| time based |
#|Cool only| geofence based |
#|Heat Only| geofence based |


@ScheduleONOFFNAswitchingmodes @Automated  @--xrayid:ATER-54551
Scenario Outline: Schedule ON OFF status while switching modes to off and from off for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user launches and logs in to the Lyric application
When user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
Then user has <Adhocoverride> status
And Verify the <Adhocoverride> on the "PRIMARY CARD" screen
When user changes system mode to "OFF"
Then verify the "Adhocoverride not displayed" on the "PRIMARY CARD" screen
When user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
Then user selects "Option" from "Scheduling" screen
When user selects "schedule off" from "Option" screen
Then verify the "SCHEDULE OFF OVERLAY" on the "Scheduling" screen
When user navigates to "primary card" screen from the "Scheduling" screen
Then verify the "SCHEDULE OFF STATUS NOT DISPLAYED" on the "PRIMARY CARD" screen
When user changes system mode to <UMode>
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user changes system mode to "OFF"
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
And user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then Verify the "Schedule status not displayed" on the "PRIMARY CARD" screen
When user changes system mode to <UMode>
Then Verify the "Schedule status TimeGeofence" on the "PRIMARY CARD" screen
Examples:
|Mode| scheduling |Adhocoverride | UMode |
|Cool| time based |Temporary | Heat |
#|Cool| time based  |Permanent| Heat |
#|Cool| time based |Temporary | Cool |
#|Cool| time based  |Permanent| Cool |
#|Cool| time based |Temporary | Auto |
#|Cool| time based  |Permanent| Auto |
#|Heat| time based |Temporary | Heat |
#|Heat| time based  |Permanent| Heat |
#|Heat| time based |Temporary | Cool |
#|Heat| time based  |Permanent| Cool |
#|Heat| time based |Temporary | Auto |
#|Heat| time based  |Permanent| Auto |
#|Auto| time based |Temporary | Heat |
#|Auto| time based  |Permanent| Heat |
#|Auto| time based |Temporary | Cool |
#|Auto| time based  |Permanent| Cool |
#|Auto| time based  |Temporary| Auto |
#|Auto| time based  |Permanent| Auto |
#|Cool| geofence based |Temporary | Heat |
#|Cool| geofence based|Temporary | Cool |
#|Cool| geofence based|Temporary | Auto |
#|Heat| geofence based |Temporary | Heat |
#|Heat| geofence based|Temporary | Cool |
#|Heat| geofence based|Temporary | Auto |
#|Auto| geofence based|Temporary | Heat |
#|Auto|geofence based |Temporary | Cool |
#|Auto| geofence based |Temporary| Auto |


@ScheduleONOFFNAgeofencebasefencecross @Automated @--xrayid:ATER-54552
Scenario Outline:As a user want to verify schedule off status when geofence crossed
#Schedule ON the stat with systems Heat cool,Cool,Heat for Temperture scale Celsius Fahrenheit and for time format 24 12hr
Given user has <Mode> system mode
Then user thermostat is set to <scheduling> schedule 
And user thermostat set <Period> with <Geofence>
And user launches and logs in to the Lyric application
And user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And Verify the <Schedule status> on the "PRIMARY CARD" screen
Then user navigates to "Scheduling" screen from the "PRIMARY CARD" screen
When user selects "Option" from "Scheduling" screen
Then user selects "schedule off" from "Option" screen
And verify the "schedule off overlay" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user thermostat set <UPeriod> with <UGeofence>
Then verify the "Schedule off Status" on the "PRIMARY CARD" screen 
When user navigates to "SCHEDULING" screen from the "PRIMARY CARD" screen
Then user selects "Schedule OFF overlay" from "Scheduling" screen
And Verify the "Schedule OFF overlay disabled" on the "Scheduling" screen
When user navigates to "primary card" screen from the "SCHEDULING" screen
Then Verify the <USchedule status> on the "PRIMARY CARD" screen
Examples:
|Mode|scheduling				  |Geofence    |Period | UPeriod | UGeofence | Schedule status | USchedule status |
#|Cool|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted | Using Home Settings | Using Away Settings|
|Cool|geofence based			  |UserArrived |Sleep| Away | UserDeparted | Using Sleep Settings | Using Away Settings|
#|Cool|Without sleep geofence based|UserDeparted |Away| Home | UserArrived | Using Away Settings| Using Home Settings | 
#|Cool|geofence based			  |UserDeparted |Away| Sleep | UserArrived |Using Away Settings| Using Sleep Settings |
#|Heat|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted | Using Home Settings | Using Away Settings|
#|Heat|geofence based			  |UserArrived |Sleep| Away | UserDeparted |Using Sleep Settings | Using Away Settings|
#|Heat|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |Using Away Settings| Using Home Settings | 
#|Heat|geofence based			  |UserDeparted |Away| Sleep | UserArrived |Using Away Settings| Using Sleep Settings |
#|Auto|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted | Using Home Settings | Using Away Settings|
#|Auto|geofence based			  |UserArrived |Sleep| Away | UserDeparted |Using Sleep Settings | Using Away Settings|
#|Auto|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |Using Away Settings| Using Home Settings | 
#|Auto|geofence based			  |UserDeparted |Away| Sleep | UserArrived |Using Away Settings| Using Sleep Settings |

#Incaserequried
#|Heat Only|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted | Using Home Settings | Using Away Settings|
#|Heat Only|geofence based			  |UserArrived |Sleep| Away | UserDeparted | Using Sleep Settings | Using Away Settings|
#|Heat Only|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |Using Away Settings| Using Home Settings | 
#|Heat Only|geofence based			  |UserDeparted |Away| Sleep | UserArrived |Using Away Settings| Using Sleep Settings |
#|Cool Only|Without sleep geofence based|UserArrived | Home  | Away    | UserDeparted | Using Home Settings | Using Away Settings|
#|Cool Only|geofence based			  |UserArrived |Sleep| Away | UserDeparted | Using Sleep Settings | Using Away Settings|
#|Cool Only|Without sleep geofence based|UserDeparted |Away| Home | UserArrived |Using Away Settings| Using Home Settings | 
#|Cool Only|geofence based			  |UserDeparted |Away| Sleep | UserArrived |Using Away Settings| Using Sleep Settings |

#Negative scenario
@ScheduleON/OFFEMEANA  @NotAutomatable @--xrayid:ATER-54553
Scenario Outline:Schedule ON/OFF when there is no schedule for stat   with systems Heat cool,Cool,Heat for Temperture scale Celsius/Fahrenheit and for time format 24/12hr
Given Stat with <Condition>
Then Verify there is no option to Schedule ON/OFF
Examples:
|Condition   |
|No schedule |
|Stat Offline|




@ScheduleONMultistatNA @Automated @--xrayid:ATER-54554
Scenario Outline: As an user I want to turn schedule OFF and verify in thermostat2
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
#|Cool Only|time based | time based | pause |
#|Heat Only|geofence based| time based | pause |
#|Heat Only|geofence based| geofence based | pause |
#|Heat Only|time based | geofence based | pause |
#|Heat Only|time based | time based  | pause |


@ScheduleOFFMultistatNA  @Automated @--xrayid:ATER-54555
Scenario Outline: As an user I want to turn schedule ON and verify in thermostat2   
#Schedule OFF in the stat1 doesnot affect other stats schedule ON status in the location with Multi stat(Jasper EMEA) or with Multi stat(HBB,Jasper NA) for systems Heat cool,Cool,Heat for Temperture scale Celsius OR Fahrenheit and for time format 24 OR 12hr
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
#|Cool|geofence based| time based | pause |
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


@ErrormessageScheduleON/OFFEMEANA @NotAutomatable @--xrayid:ATER-54555
Scenario Outline:To get error messages on Schedule ON/OFF for stat   with systems Heat cool,Cool,Heat for Temperture scale Celsius/Fahrenheit and for time format 24/12hr
As an user
I want to get error message while attempt to Schedule ON/OFF  
So that I will get notified on system unavailability
Given With the <Condition>
When Schedule ON/OFF from schedule screen   
Then Verify the error message
Examples:
|Condition                       |
|Mobile internet(3G/wifi) is down|
|Mobile in Airplane mode         |
|Mobile with low signal(3G/wifi) |
|CHIL down                       |
|Switching between the network   |
|Smart network switch            |