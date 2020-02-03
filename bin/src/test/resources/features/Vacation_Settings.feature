@VacationSettings @Comfort
Feature: As an user I want to set the vacation period for my home so that my thermostat will follow vacation setting on my absence from my home during the vacation days  

@Vacations_VerifyStartAndEndDate			@Automated @--xrayid:ATER-54557
 Scenario Outline: Verify Start and End Date
 Given vacation mode is <settings>
 And user launches and logs in to the Lyric application
 When user navigates to "Vacation" screen from the "Dashboard" screen
 Then user is displayed with start date and end date options based on the <settings> vacation
 And user should be displayed with the "Vacation Setpoint" description
 
 Examples: 
      | settings		| 
      | active		| 
 #     | inactive		| 
 
  
@Vacations_VerifyGuideMessage			@Automated @--xrayid:ATER-54558
Scenario Outline: Verify guide Message when vacation is either turned off or on
Given vacation mode is "active"
And user launches and logs in to the Lyric application
And user navigates to <Vacation Option> screen from the "Dashboard" screen
When user changes the <Option> to "Off"
#Then user gets cautioned with guide message about vacation turned off for the location
Then user should receive a "End Vacation Mode Confirmation" popup
#When user "cancels" the guide message
When user "dismisses" the "End Vacation Mode Confirmation" popup
Then user verifies vacation is "on" in <Vacation Option>
When user changes the <Option> to "Off"
#Then user gets cautioned with guide message about vacation turned off for the location
Then user should receive a "End Vacation Mode Confirmation" popup
#When user "cancels" the guide message
When user "accepts" the "End Vacation Mode Confirmation" popup
Then user verifies vacation is "off" in <Vacation Option>

Examples:
		| Vacation Option		| Option		|
		| Vacation				| Vacation		|
	#	| solution card			| Vacation Until|
		

@Vacations_DefaultVacationTimeForNA			@Automated @--xrayid:ATER-54559
Scenario: As a user I want to verify the date inputs
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
#When user turns "on" vacation from "vacation settings card"
Then user is displayed with "From" date as "Current Time" nearest to "15"
And user is displayed with "To" date as "Week from Current Time" nearest to "15"

  
@Vacations_VerifyTimeAndDateBoundaryConditionsForEMEA			@Automated @--xrayid:ATER-54560
Scenario: As a user I want to verify the time and date boundary conditions
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user turns "on" vacation from "vacation settings card"
Then user is displayed with "From" date as "Current Time" nearest to "10"
And user is displayed with "To" date as "Week from Current Time" nearest to "10"


  
@Vacations_VerifyVacationDefaultSetPoints			@Automated @--xrayid:ATER-54561
Scenario: As a user I want to set the vacation set value so that I can put my home with desired temperature on my vacation  
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user navigates back and forth in "Vacation" screen
When user selects the stat to edit
Then verify user should be displayed with default set point value
And user should be displayed with temperature values within maximum minimum limit


@Vacations_VerifyHBBStatsNotPresentOnComfortSettings			@Automated @--xrayid:ATER-54563
Scenario: As a user I want to verify that HBB stats are not present in vacation comfort settings 
When vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user navigates back and forth in "Vacation" screen
Then user should be provided with option to enter vacation start and end date
#And user with HBB is not listed under the review vacation settings in the location
And HBB device should not be listed under the review vacation settings section in Vacation screen

  


@Vacations_MinimumBandwidthTimer	@Automated  @--xrayid:ATER-54564
Scenario Outline: As a user I want to verify the minimum Bandwidth Limit for vacation from and To 
Given vacation mode is "inactive"
And user has <Mode> system mode
When vacation mode is "active"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user edits Vacation Timer 
Then Minimum bandwidth timer between from and to is "1" hour
And user verifies vacation is "on" in "solution card"
And verify user should be displayed with "Vacation" setpoint value in the solution card screen
Examples: 
		| Mode	| 
#		| Auto	|  
#		| Auto	| 
#		| Heat	| 
#		| Heat	|  
		| Cool	| 
#		| Cool	|
  

@Vacation_TimerValueIncreamentOf10EMEA			@Automated  @--xrayid:ATER-54567
Scenario: As a user I want to verify the minimum Bandwidth Limit for vacation from and To 
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
When user edits Vacation Timer
Then user is displayed with "From" date as "Current Time" nearest to "10"
#Then user should be displayed from and to timer field incremental of "10" minutes


@Vacation_TimerValueIncreamentOf15NA				@Automated @--xrayid:ATER-54568
Scenario: As a user I want to verify the minimum Bandwidth Limit for vacation from and To 
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
When user edits Vacation Timer
Then user is displayed with "From" date as "Current Time" nearest to "15"
#Then user should be displayed from and to timer field incremental of "15" minutes
  
  
@Vacation_EditSetPoints			@Automated @--xrayid:ATER-54569
Scenario: As a user I want to edit set points for individual stat in Stats screen
When vacation mode is "active"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user selects the stat to edit
Then user should be able to edit set points in Stats screen


@Vacation_EnableDisableIndividualStat			@Automated @--xrayid:ATER-54570
Scenario Outline: As a user I want to enable or disable stat vacation individually
#Given: User has multiple stats
When vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user selects the stat to edit
When user changes the "Vacation Hold Switch In Stat Screen" to <Condition>
And user navigates to "Vacation" screen from the "Stats" screen
Then user is displayed with stat status <Stats Value In Vacation> in the vacation screen

Examples: 
      | Condition	| Stats Value In Vacation	| 
      | On			| active					| 
   #   | Off			| No Settings				| 
      
      
@Vacation_Enable_DisableMultiStat			@Automated @--xrayid:ATER-54571
Scenario Outline: As a user I want to enable disable multi stat vacation
Given vacation mode is "inactive for multistat"
And user launches and logs in to the Lyric application
And user navigates to "MULTISTAT LOCATION" screen from the "Dashboard" screen
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
Then user <Condition> the "stat2" individually
And verify Vacation mode is <Vacation Status> for the "stat2"
And verify Vacation mode is "Active" for the "stat1"

Examples: 
      | Condition | Vacation Status	| 
  #    | Enable    | Active			| 
      | Disable   | Inactive			|


@Vacation_WhenScheduleEnables			@Automated @--xrayid:ATER-54572
Scenario Outline: As a user I want to activate an Vacation settings when Scheduling is active 
Given user thermostat is set to <Schedule Type> schedule
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
Then Vacation mode is "active" for the Stat
  
Examples: 
      | Schedule Type 		| 
      | Time Based    		| 
   #   | geofence based		| 
  #    | No					| 
  

@Vacation_EditSetPointsFromPrimaryCard			@Automated  @--xrayid:ATER-54573
Scenario Outline: As a user I want to edit set points for individual stat from primary card screen
When vacation mode is "active"
And user launches and logs in to the Lyric application
When user edits set point from <Card>
Then verify user should be displayed with Updated setpoint in <Postcondition>

Examples: 
		| Card				| Postcondition	|
		| Primary card		| Vacation card	|
		| Vacation card		| Primary card	|


#JasperNA
@VacationActiveSwitchingModesNA			@Automated @--xrayid:ATER-54574
Scenario Outline:  To verify when vacation active switching modes is changed for Heat, auto, cool and off system with auto changeover enabled
Given user has <Mode> system mode
And vacation mode is "active"
When user launches and logs in to the Lyric application
Then user navigates to "solution card" screen from the "Dashboard" screen
Then user verifies vacation is "on" in "solution card"
When user change the "OFF" from <Mode>
Then user should be displayed with "SYSTEM IS OFF" status on "solution card"
And user verifies vacation is "off" in "solution card"
When user change the <UMode> from "OFF" 
Then user verifies vacation is "on" in "solution card"
And verify user should be displayed with "Vacation" setpoint value in the solution card screen

Examples:
		| Mode	| UMode		| 
#		| Auto	| Heat		| 
#		| Auto	| Cool		|
#		| Heat	| Cool		|
#		| Heat	| Auto		| 
		| Cool	| Heat		|
#		| Cool	| Auto		|


#JasperEMEA
@VacationActiveSwitchingModesEMEA			@Automated @--xrayid:ATER-54575
Scenario:  To verify geofence schedule switching modes is changed for Heat Cool and Off system with auto changeover enabled
Given user has "Heat" system mode
And vacation mode is "active"
When user launches and logs in to the Lyric application
Then user navigates to "solution card" screen from the "Dashboard" screen
Then user verifies vacation is "on" in "solution card"
When user changes system mode to "Cool" 
Then user verifies vacation is "on" in "solution card"
When user changes system mode to "Off"
And user verifies vacation is "off" in "solution card"


#JasperNA
@VacationTimebaseSolutionCardAfterVacationEndsNA			@NotAutomatable @--xrayid:ATER-54578
Scenario Outline:   I want to verify AdhocOVerride status when vacation ends
Given user launches and logs in to the Lyric application
Then user is set to <Mode> through CHIL
And user is set to "Time base schedule"
When user navigates to "Solutioncard" screen from "Dashboard" screen
Then user should be displayed with <AdhocOverride> on "SolutionCard"
When "Vacation" Ends 
Then user should be display with <UAdhocOverride>  on "Solution card"

Examples:
		| Mode				| AdhocOverride				| UAdhocOverride				| 
		| Cool				| Following Schedule			| Following schedule			|
#		| Cool				| Temporary					| Temporary					|
#		| Cool				| Permanent					| Permanent					| 
#		| Cool				| Specific Time				| specific time				| 
#		| Heat				| Following Schedule			| Following schedule			| 
#		| Heat				| Temporary					| Temporary					|
#		| Heat				| Permanent					| Permanent					|
#		| Heat				| Specific Time				| Specific time				|
#		| Auto				| Following Schedule			| Following Schedule			|
#		| Auto				| Temporary					| Temporary					|
#		| Auto				| Permanent					| Permanent					|
#		| Auto				| Specific Time				| Specific time				|
#		| Cool only			| Following Schedule			| Following schedule			|
#		| Cool only			| Temporary					| Temporary					|
#		| Cool only			| Permanent					| Permanent					|
#		| Cool only			| Specific Time				| Specific time				|
#		| Heat Only			| Following schedule			| Following schedule			|
#		| Heat only			| Temporary					| Temporary					|
#		| Heat only			| Permanent					| Permanent					|
#		| Heat only			| Specific Time				| Specific Time				|
		#Vacation end in text period (After temporary ends )
#		| Cool				| Temporary					| Following Schedule			|
#		| Heat				| Temporary					| Following Schedule			|
#		| Auto				| Temporary					| Following Schedule			|
#		| Cool Only			| Temporary					| Following Schedule			|
#		| Heat only			| Temporary					| Following Schedule			|
#		| Cool				| Specific Time				| Following schedule			| 
#		| Heat				| Specific Time				| Following schedule			| 
#		| Auto				| Specific Time				| Following schedule			| 
#		| Cool Only			| Specific Time				| Following schedule			| 
#		| Heat only			| Specific Time				| Following schedule			| 
		#Vacation ends after permanent hold ends 
#		| Cool				| Permanent					| Following schedule			|
#		| Heat				| Permanent					| Following schedule			|
#		| Auto				| Permanent					| Following schedule			|
#		| Cool Only			| Permanent					| Following schedule			|
#		| Heat only			| Permanent					| Following schedule			|

#JasperEMEA
@VacationTimebaseSolutionCardAfterVacationEndsEMEA			@NotAutomatable @--xrayid:ATER-54580
Scenario Outline:   I want to verify AdhocOVerride status when vacation ends
Given user launches and logs in to the Lyric application
Then user is set to "Heat" through CHIL
And user is set to "Time base schedule"
When user navigates to "Solutioncard" screen from "Dashboard" screen
Then user should be displayed with <AdhocOverride> on "SolutionCard"
When "Vacation" Ends 
Then user should be display with <UAdhocOverride> on "SolutionCard"

Examples:
		| AdhocOverride			| UAdhocOverride				| 
		| Following Schedule 	| Following schedule			|
		| Temporary 				| Temporary					|
		| Permanent				| Permanent					| 
#		| Specific Time			| specific time				| 
		#Vacation ends in next period (After temporary ends)/
#		| Temporary				| Following Schedule			|
		#Vacation ends after permanent hold ends 
#		| Permanent				| Following schedule			|


#JasperNA
@VacationGeofenceSolutionCardAfterVacationEndsNA			@Automated  @--xrayid:ATER-54582
Scenario Outline: I want to verify NA AdhocOVerride status when vacation ends
Given user has <Mode> system mode
And user thermostat is set to <Scheduling> schedule
And user thermostat set <Period> with <Geofence>
When user launches and logs in to the Lyric application
Then user navigates to "solution card" screen from the "Dashboard" screen
And Verify the <AdhocOverride status> on the "PRIMARY CARD" screen
When user has "Temporary" status
Then Verify the "Temporary" on the "PRIMARY CARD" screen
When vacation mode is "active"
Then user verifies vacation is "on" in "solution card"
And user thermostat set <UPeriod> with <UGeofence>
When vacation mode is "inactive"
Then verify the <UAdhocOverride status> on the "PRIMARY CARD" screen

Examples:
| Mode		| Scheduling							| AdhocOverride status	| Period 	| Geofence 		| UPeriod 	| UGeofence 		| UAdhocOverride status 	|
| Cool		| geofence based       				| Using Sleep Settings	| Sleep 		| UserArrived 	| Away 		| UserDeparted 	| Using Away Settings 	|
#| Cool		| with out sleep geofence based		| Using Home Settings	| Home 		| UserD 			|  Away 		| UserDeparted 	| Using Away Settings 	|
#| Cool		| with out sleep geofence based		| Using Away Settings	| Away 		| UserArrived 	| Home 		| UserArrived 	| Using Home Settings 	|
#| Heat		| geofence based       				| Using Sleep Settings	| Sleep 		| UserArrived 	| Away 		| UserDeparted 	| Using Away Settings 	|
#| Heat		| with out sleep geofence based		| Using Home Settings	| Home 		| UserD 			|  Away 		| UserDeparted 	| Using Away Settings 	|
#| Heat		| with out sleep geofence based		| Using Away Settings	| Away 		| UserArrived 	| Home 		| UserArrived 	| Using Home Settings 	|
#| Auto		| geofence based       				| Using Sleep Settings	| Sleep 		| UserArrived 	| Away 		| UserDeparted 	| Using Away Settings 	|
#| Auto		| with out sleep geofence based		| Using Home Settings	| Home 		| UserD 			|  Away 		| UserDeparted 	| Using Away Settings 	|
#| Auto		| with out sleep geofence based		| Using Away Settings	| Away 		| UserArrived 	| Home 		| UserArrived 	| Using Home Settings 	|


#JasperNA
@VacationGeofenceSolutionCardTemporaryHoldAfterVacationEndsNA			@Automated @--xrayid:ATER-54583
Scenario Outline:   I want to verify Temporary hold status when vacation ends
Given user has <Mode> system mode
And user thermostat is set to <Scheduling> schedule
And user thermostat set <Period> with <Geofence>
When user launches and logs in to the Lyric application
Then user navigates to "solution card" screen from the "Dashboard" screen
When user has "Temporary" status
Then Verify the "Temporary" on the "PRIMARY CARD" screen
When vacation mode is "active"
Then user verifies vacation is "on" in "solution card"
When vacation mode is "inactive"
Then user has "Temporary" status

Examples:
| Mode		| Scheduling							| Period 	| Geofence 		|
| Cool		| geofence based       				| Sleep 		| UserArrived 	|
#| Cool		| with out sleep geofence based		| Home 		| UserD 			|
#| Cool		| with out sleep geofence based		| Away 		| UserArrived 	|
#| Heat		| geofence based       				| Sleep 		| UserArrived 	|
#| Heat		| with out sleep geofence based		| Home 		| UserD 			|
#| Heat		| with out sleep geofence based		| Away 		| UserArrived 	|
#| Auto		| geofence based       				| Sleep 		| UserArrived 	|
#| Auto		| with out sleep geofence based		| Home 		| UserD 			|
#| Auto		| with out sleep geofence based		| Away 		| UserArrived 	|


#JasperNA
@VacationGeofenceSolutionCardAfterVacationEndsEMEA			@Automated @--xrayid:ATER-54585
Scenario Outline: I want to verify EMEA AdhocOVerride status when vacation ends
Given user has <Mode> system mode
And user thermostat is set to <Scheduling> schedule
And user thermostat set <Period> with <Geofence>
When user launches and logs in to the Lyric application
Then user navigates to "solution card" screen from the "Dashboard" screen
And Verify the <AdhocOverride status> on the "PRIMARY CARD" screen
When user has "Temporary" status
Then Verify the "Temporary" on the "PRIMARY CARD" screen
When vacation mode is "active"
Then user verifies vacation is "on" in "solution card"
And user thermostat set <UPeriod> with <UGeofence>
When vacation mode is "inactive"
Then verify the <UAdhocOverride status> on the "PRIMARY CARD" screen

Examples:
| Mode		| Scheduling							| AdhocOverride status	| Period 	| Geofence 		| UPeriod 	| UGeofence 		| UAdhocOverride status 	|
| Heat		| geofence based       				| Using Sleep Settings	| Sleep 		| UserArrived 	| Away 		| UserDeparted 	| Using Away Settings 	|
#| Heat		| with out sleep geofence based		| Using Home Settings	| Home 		| UserD 			| Away 		| UserDeparted 	| Using Away Settings 	|
#| Heat		| with out sleep geofence based		| Using Away Settings	| Away 		| UserArrived 	| Home 		| UserArrived 	| Using Home Settings 	|

  
@Vacations_VactionStatusOnDashabord			@Automated @--xrayid:ATER-54586
Scenario: Verify if vacation is active when user is in Dashboard
Given vacation mode is "active"
When user launches and logs in to the Lyric application
#Then user should be displayed "Vacation Active" on Dashboard header
Then user verifies vacation is "on" in "dashboard"

@VacationCreateTimebaseschedule @Automated @--xrayid:ATER-54588
Scenario Outline: To Verify create time base schedule in off mode  
Given user has <Mode> system mode
And user thermostat is set to <Currentschedule> schedule
When user launches and logs in to the Lyric application
Then user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
Then verify the "Vacation status" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user creates "Same Every Day" schedule following specific <Period> time
Then verify the "Vacation status" on the "PRIMARY CARD" screen
Examples:
|Mode| Currentschedule |Period |
|Cool| time based | Home | 
#|Cool| time based | AWAY |
#|Cool| time based | Sleep | 
#|Cool| time based | Wake |  
#|Heat| time based| Home | 
##|Heat| time based| AWAY |
#|Heat| time based | Sleep | 
#|Heat| time based | Wake | 
#|Cool Only| time based | Home | 
#|Cool Only| time based | AWAY |
#|Cool Only| time based | Sleep | 
#|Cool Only| time based | Wake | 
#|Heat Only| time based | Home | 
#|Heat Only| time based | AWAY |
#|Heat Only| time based | Sleep | 
#|Heat Only| time based | Wake | 

@Vacations_VerifyVacationdefaultsetpointwhenonandoff			@Automated @--xrayid:ATER-54590
Scenario: As a user I want to set the vacation set value to minimum so that I can put my home with desired temperature on my vacation  
#Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user navigates back and forth in "Vacation" screen
And user turns "Temperature to" the "Maximum" through the "Vacation Card"
Then user should be displayed with Updated setpoint in "VACATION CARD TO MAXIMUM"
When user selects the stat to edit
And user changes the "Vacation Hold Switch In Stat Screen" to "off"
And user navigates back and forth in "Vacation stat" screen
When user changes the "Vacation Hold Switch In Stat Screen" to "on"
And user navigates back and forth in "Vacation stat" screen
Then verify user should be displayed with default set point value


@Vacations_VerifyVacationMaxSetPoints	@Automated @--xrayid:ATER-54593
Scenario: As a user I want to set the vacation set value to maximum so that I can put my home with desired temperature on my vacation  
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user navigates back and forth in "Vacation" screen
And user turns "Temperature to" the "Maximum" through the "Vacation Card"
Then user should be displayed with Updated setpoint in "VACATION CARD TO MAXIMUM"

@Vacations_VerifyVacationMinSetPoints			@Automated @--xrayid:ATER-54595
Scenario: As a user I want to set the vacation set value to minimum so that I can put my home with desired temperature on my vacation  
Given vacation mode is "inactive"
And user launches and logs in to the Lyric application
And user navigates to "Vacation" screen from the "Dashboard" screen
When user changes the "Vacation" to "On"
And user navigates back and forth in "Vacation" screen
And user turns "Temperature to" the "Minimum" through the "Vacation Card"
Then user should be displayed with Updated setpoint in "VACATION CARD TO MINIMUM"

@VacationCreateTimebaseschedule @Newscenario @Automated @--xrayid:ATER-54596
Scenario Outline: To Verify create time base schedule in off mode
Given user has <Mode> system mode
And user thermostat is set to <Currentschedule> schedule
When user launches and logs in to the Lyric application
Then user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
Then verify the "Vacation status" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user creates "Same Every Day" schedule following specific <Period> time
Then verify the "Vacation status" on the "PRIMARY CARD" screen
Examples:
|Mode| Currentschedule |Period |
|Cool| time based | Home |
#|Cool| time based | AWAY |
#|Cool| time based | Sleep |
#|Cool| time based | Wake |
#|Heat| time based| Home |
##|Heat| time based| AWAY |
#|Heat| time based | Sleep |
#|Heat| time based | Wake |
#|Cool Only| time based | Home |
#|Cool Only| time based | AWAY |
#|Cool Only| time based | Sleep |
#|Cool Only| time based | Wake |
#|Heat Only| time based | Home |
#|Heat Only| time based | AWAY |
#|Heat Only| time based | Sleep |
#|Heat Only| time based | Wake |

@VacationCreateTimebasescheduleOFFMode @Automated @--xrayid:ATER-54598
Scenario Outline: To Verify create time base schedule in off mode when PermanentHold
Given user has <Mode> system mode
And user thermostat is set to <Currentschedule> schedule
When user launches and logs in to the Lyric application
Then user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
Then verify the "Vacation status" on the "PRIMARY CARD" screen
When user changes system mode to "OFF"
Then user "should not be displayed" with the "Vacation" option
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user creates "Same Every Day" schedule following specific <Period> time
And verify the "FOLLOWING SCHEDULE NOT DISPLAYED" on the "PRIMARY CARD" screen
When user changes system mode to <Mode>
Then verify the "Vacation status" on the "PRIMARY CARD" screen

Examples:
|Mode| Currentschedule |Period |
|Cool| time based | Home | 
#|Cool| time based | AWAY |
#|Cool| time based | Sleep | 
#|Cool| time based | Wake |  
#|Heat| time based| Home | 
##|Heat| time based| AWAY |
#|Heat| time based | Sleep | 
#|Heat| time based | Wake | 
#|Cool Only| time based | Home | 
#|Cool Only| time based | AWAY |
#|Cool Only| time based | Sleep | 
#|Cool Only| time based | Wake | 
#|Heat Only| time based | Home | 
#|Heat Only| time based | AWAY |
#|Heat Only| time based | Sleep | 
#|Heat Only| time based | Wake | 

@VacationCreateGeofencebaseschedule @Automated @--xrayid:ATER-54599
Scenario Outline: To Verify create geofence schedule when permanentHold
Given user has <Mode> system mode
And user thermostat is set to "time based" schedule
When user launches and logs in to the Lyric application
Then user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
Then verify the "Vacation status" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user thermostat set <Period> with <Geofence>
And user creates "Geofence based" schedule following specific <Sleep period> time
Then verify the "Vacation status" on the "PRIMARY CARD" screen

Examples:
| Mode	| Period		| Geofence	| Sleep period | 
| HEAT	| Home		| UserArrived		| Without |
#|HEAT	| Home		| UserArrived		| Without |
#|HEAT	| Home		| UserArrived	        | Without |
#| HEAT	| Away		| UserDeparted		| Without |
#|HEAT	| Away		| UserDeparted		| Without |
#|HEAT	| Away		| UserDeparted		| Without |
#| HEAT	| Sleep		| UserArrived		| With |
#|HEAT	| Sleep		| UserArrived		| With |
#|HEAT	| Sleep		| UserArrived		| With |
#| Cool	| Home		| UserArrived		| Without |
#|Cool	| Home		| UserArrived		| Without |
#|Cool	| Home		| UserArrived		| Without |
#| Cool	| Away		| UserDeparted		| Without |
#|Cool	| Away		| UserDeparted		| Without |
#|Cool	| Away		| UserDeparted		| Without |
#| Cool	| Sleep		| UserArrived		| With |
#|Cool	| Sleep		| UserArrived		| With |
#|Cool	| Sleep		| UserArrived		| With |

@VacationCreateGeofencebasescheduleOFF @Automated @--xrayid:ATER-54601
Scenario Outline: To Verify create geofence schedule in off mode when permanentHold
Given user has <Mode> system mode
And user thermostat is set to "time based" schedule
When user launches and logs in to the Lyric application
Then user navigates to "THERMOSTAT SOLUTION CARD" screen from the "THERMOSTAT DASHBOARD" screen
And vacation mode is "active"
Then verify the "Vacation status" on the "PRIMARY CARD" screen
And user changes system mode to "Off"
Then user "should not be displayed" with the "Vacation" option
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
And user thermostat set <Period> with <Geofence>
And user creates "Geofence based" scheduling with default values <Sleep period> sleep settings
And user changes system mode to <Mode>
Then verify the "Vacation status" on the "PRIMARY CARD" screen


Examples:
| Mode	| Period		| Geofence	| Sleep period | 
| HEAT	| Home		| UserArrived		| Without |
#|HEAT	| Home		| UserArrived		| Without |
#|HEAT	| Home		| UserArrived	        | Without |
#| HEAT	| Away		| UserDeparted		| Without |
#|HEAT	| Away		| UserDeparted		| Without |
#|HEAT	| Away		| UserDeparted		| Without |
#| HEAT	| Sleep		| UserArrived		| With |
#|HEAT	| Sleep		| UserArrived		| With |
#|HEAT	| Sleep		| UserArrived		| With |
#| Cool	| Home		| UserArrived		| Without |
#|Cool	| Home		| UserArrived		| Without |
#|Cool	| Home		| UserArrived		| Without |
#| Cool	| Away		| UserDeparted		| Without |
#|Cool	| Away		| UserDeparted		| Without |
#|Cool	| Away		| UserDeparted		| Without |
#| Cool	| Sleep		| UserArrived		| With |
#|Cool	| Sleep		| UserArrived		| With |
#|Cool	| Sleep		| UserArrived		| With |