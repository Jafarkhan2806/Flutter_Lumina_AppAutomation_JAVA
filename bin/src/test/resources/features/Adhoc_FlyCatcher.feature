@AdhocOverride_FlYcatcher @Comfort

Feature: I want to override my running schedule so that i can set my comfortable temperature manually 
I should able to hold the override temperature temporarily for maximum of 12 hrs.
I should able to permanently override scheduling set value from the thermostat primary card. 
I should be able to cancel overrides and resume scheduling

#FlyCatcherNA
@AdhocOverrideCreateGeofencebasescheduleOFFAspecifictime_FlyCatcher	@Automated
Scenario Outline: To Verify create geofence schedule in off mode
Given user has <Mode> system mode
And user thermostat is set to "time based" schedule
When user launches and logs in to the Lyric application
And user edits Fan mode from "Primary card"
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
And user holds the schedule until time "lesser than 12 hours" from current time
And user changes system mode to "Off"
Then verify the "ADHOCOVERRIDE NOT DISPLAYED" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
And user thermostat set <Period> with <Geofence>
And user creates "Geofence based" scheduling with default values <Sleep Period> sleep settings
And user changes system mode to <Mode>
Then verify the <Schedule status> on the "PRIMARY CARD" screen
And user "should be updated" with the <Mode> option 
And user should be displayed with "respective period" Fan mode

Examples:
| Mode	| Period		| Geofence		| Schedule status		| Sleep Period | 
| HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#|HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#|HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#| HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#|HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#|HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#| HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#| Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#|Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#|Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#| Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#|Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#|Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#| Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |


@AdhocOverrideCreateTimebasescheduleOFFModeAspecifictime_FlyCatcher	@Automated
Scenario Outline: To Verify create time base schedule in off mode  
Given user has <Mode> system mode
And user thermostat is set to <Currentschedule> schedule
When user launches and logs in to the Lyric application
And user edits Fan Mode from "Primary card"
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
And user holds the schedule until time "lesser than 12 hours" from current time
And user changes system mode to "Off"
Then verify the "ADHOCOVERRIDE NOT DISPLAYED" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user creates "Same Every Day" schedule following specific <Period> time
And verify the "Following schedule NOT DISPLAYED" on the "PRIMARY CARD" screen
When user changes system mode to <Mode>
And verify the "Following schedule" on the "PRIMARY CARD" screen
And verify respective <Period> period Fan Mode

Examples:
|Mode| Currentschedule |Period |
|Cool| time based | Home | 
#|Cool| time based | AWAY |
#|Cool| time based | Sleep | 
#|Cool| time based | Wake |  
#|Heat| time based| Home | 
#|Heat| time based| AWAY |
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


#FlyCatcherNA
@AdhocOverrideCreateGeofencebasescheduleOFFAspecifictime_FlyCatcherPriority	@Automated
Scenario Outline: To Verify create geofence schedule in off mode
Given user has <Mode> system mode
And user thermostat is set to "time based" schedule
When user launches and logs in to the Lyric application
And user edits "Priority" from "Primary card"
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
And user holds the schedule until time "lesser than 12 hours" from current time
And user changes system mode to "Off"
Then verify the "ADHOCOVERRIDE NOT DISPLAYED" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
And user thermostat set <Period> with <Geofence>
And user creates "Geofence based" scheduling with default values <Sleep Period> sleep settings
And user changes system mode to <Mode>
Then verify the <Schedule status> on the "PRIMARY CARD" screen
And user "should be updated" with the <Mode> option 
And user should be displayed with "respective period" "Priority"

Examples:
| Mode	| Period		| Geofence		| Schedule status		| Sleep Period | 
| HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#|HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#|HEAT	| Home		| UserArrived		| Using Home Settings	| Without |
#| HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#|HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#|HEAT	| Away		| UserDeparted		| Using Away Settings	| Without |
#| HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|HEAT	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#| Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#|Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#|Cool	| Home		| UserArrived		| Using Home Settings	| Without |
#| Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#|Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#|Cool	| Away		| UserDeparted		| Using Away Settings	| Without |
#| Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |
#|Cool	| Sleep		| UserArrived		| Using Sleep Settings	| With |


@AdhocOverrideCreateTimebasescheduleOFFModeAspecifictime_FlyCatcherPriority	@Automated
Scenario Outline: To Verify create time base schedule in off mode  
Given user has <Mode> system mode
And user thermostat is set to <Currentschedule> schedule
When user launches and logs in to the Lyric application
And user edits "Priority" from "Primary card"
When user navigates to "thermostat solution card" screen from the "thermostat Dashboard" screen
And user holds the schedule until time "lesser than 12 hours" from current time
And user changes system mode to "Off"
Then verify the "ADHOCOVERRIDE NOT DISPLAYED" on the "PRIMARY CARD" screen
When user navigates to "scheduling" screen from the "PRIMARY CARD" screen
Then user creates "Same Every Day" schedule following specific <Period> time
And verify the "Following schedule NOT DISPLAYED" on the "PRIMARY CARD" screen
When user changes system mode to <Mode>
And verify the "Following schedule" on the "PRIMARY CARD" screen
And user should be displayed with "respective period" "Priority"

Examples:
|Mode| Currentschedule |Period |
|Cool| time based | Home | 
#|Cool| time based | AWAY |
#|Cool| time based | Sleep | 
#|Cool| time based | Wake |  
#|Heat| time based| Home | 
#|Heat| time based| AWAY |
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
