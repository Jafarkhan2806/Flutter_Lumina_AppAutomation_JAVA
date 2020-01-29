package com.honeywell.lyric.utils;

public class GlobalVariables {

	public static final String LOCATION_SERVICES = "adb shell settings put secure location_providers_allowed network";

	public static String forceStopApp = "adb shell am force-stop com.honeywell.acs.startapp";

	public static String FAHRENHEIT = "Fahrenheit";

	public static final String CELSIUS = "Celsius";

	public static final String RelayURL = "192.168.1.4/30000/";

	public static String status = "";

	public static String Current_StatName = "currentStatName";
	
	public static String Original_OutdoorUnitConfigurationName = "currentOutdoorUnitConfigurationName";

	public static final String MIN = "Min";

	public static final String MAX = "Max";

	public static final String GRADIENT = "GRAD";

	public static final String CURRENT_VALUE_XPATH = "Curr_Value_Locator";

	public static final String EXPECTED_VALUE = "expect_value";

	public static String JASPER_STAT_TYPE = "jasperStatType";
	public static String SCHEDULE_TYPE = "schedule_type";

	public static String JASPER_NA = "JASPER_NA";
	public static String JASPER_EMEA = "JASPER_EMEA";

	public static String SET_GEOFENCE_SLEEP_TIMER = "setGeofenceSleepTimer";
	public static String GEOFENCE_SLEEP_START_TIME = "GeofenceSleepStartTime";
	public static String GEOFENCE_SLEEP_END_TIME = "GeofenceSleepEndTime";

	public static String GEOFENCE_AWAY_HEAT_SETPOINT = "geofenceAwayHeatSetPoint";
	public static String GEOFENCE_AWAY_COOL_SETPOINT = "geofenceAwayCoolSetPoint";
	public static String GEOFENCE_HOME_HEAT_SETPOINT = "geofenceHomeHeatSetPoint";
	public static String GEOFENCE_HOME_COOL_SETPOINT = "geofenceHomeCoolSetPoint";
	public static String GEOFENCE_SLEEP_HEAT_SETPOINT = "geofenceSleepHeatSetPoint";
	public static String GEOFENCE_SLEEP_COOL_SETPOINT = "geofenceSleepCoolSetPoint";

	public static String GEOFENCE_PERIOD = "geofencePeriod";
	public static String GEOFENCE_HOME = "geofenceHome";
	public static String GEOFENCE_AWAY = "geofenceAway";
	public static String GEOFENCE_SLEEP = "geofenceSleep";

	public static String UNITS = "units";

	public static final String EDIT_GEOFENCE_SCHEDULE = "editGeofenceSchedule";

	public static String ABOVE_MAXIMUM = "aboveMaximum";
	public static String AT_MAXIMUM = "atMaximum";
	public static String AT_MINIMUM = "atMinimum";
	public static String BELOW_MINIMUM = "belowMinimum";
	public static String IN_RANGE = "inRange";
	public static String SETPOINT_RANGE = "setPointRange";

	public static String TYPE_OF_TIME_SCHEDULE = "TypeOfTimeSchedule";
	public static String TYPE_OF_SCHEDULE_RETAINED = "TypeOfScheduleRetained";

	public static final String TIME_BASED_SCHEDULE = "Time";
	public static final String GEOFENCE_BASED_SCHEDULE = "Geofence";
	public static final String EVERYDAY_SCHEDULE = "EveryDay";
	public static final String WEEKDAY_AND_WEEKEND_SCHEDULE = "WeekdayAndWeekend";
	public static final String WEEKDAY_SCHEDULE = "Weekday";
	public static final String WEEKEND_SCHEDULE = "Weekend";

	public static String PERIOD_NUMBER_EMEA = "periodNumberEMEA";
	public static String PERIOD_NAME_NA = "periodNameNA";
	public static String EVERYDAY_WAKE = "everydayWake";
	public static String EVERYDAY_AWAY = "everydayAway";
	public static String EVERYDAY_HOME = "everydayHome";
	public static String EVERYDAY_SLEEP = "everydaySleep";

	public static String EVERYDAY_WAKE_TIME = "everydayWakeUpTime";
	public static String EVERYDAY_AWAY_TIME = "everydayAwayTime";
	public static String EVERYDAY_HOME_TIME = "everydayhomeTime";
	public static String EVERYDAY_SLEEP_TIME = "everydaySleepTime";
	public static String EVERYDAY_WAKE_HEAT_SETPOINT = "everydayWakeHeatSetPoint";
	public static String EVERYDAY_WAKE_COOL_SETPOINT = "everydayWakeCoolSetPoint";
	public static String EVERYDAY_AWAY_HEAT_SETPOINT = "everydayAwayHeatSetPoint";
	public static String EVERYDAY_AWAY_COOL_SETPOINT = "everydayAwayCoolSetPoint";
	public static String EVERYDAY_HOME_HEAT_SETPOINT = "everydayHomeHeatSetPoint";
	public static String EVERYDAY_HOME_COOL_SETPOINT = "everydayHomeCoolSetPoint";
	public static String EVERYDAY_SLEEP_HEAT_SETPOINT = "everydaySleepHeatSetPoint";
	public static String EVERYDAY_SLEEP_COOL_SETPOINT = "everydaySleepCoolSetPoint";

	public static String WEEKDAY_WAKE_TIME = "weekdayWakeUpTime";
	public static String WEEKDAY_AWAY_TIME = "weekdayAwayTime";
	public static String WEEKDAY_HOME_TIME = "weekdayhomeTime";
	public static String WEEKDAY_SLEEP_TIME = "weekdaySleepTime";
	public static String WEEKDAY_WAKE_HEAT_SETPOINT = "weekdayWakeHeatSetPoint";
	public static String WEEKDAY_WAKE_COOL_SETPOINT = "weekdayWakeCoolSetPoint";
	public static String WEEKDAY_AWAY_HEAT_SETPOINT = "weekdayAwayHeatSetPoint";
	public static String WEEKDAY_AWAY_COOL_SETPOINT = "weekdayAwayCoolSetPoint";
	public static String WEEKDAY_HOME_HEAT_SETPOINT = "weekdayHomeHeatSetPoint";
	public static String WEEKDAY_HOME_COOL_SETPOINT = "weekdayHomeCoolSetPoint";
	public static String WEEKDAY_SLEEP_HEAT_SETPOINT = "weekdaySleepHeatSetPoint";
	public static String WEEKDAY_SLEEP_COOL_SETPOINT = "weekdaySleepCoolSetPoint";

	public static String EVERYDAY_1 = "everyday1";
	public static String EVERYDAY_2 = "everyday2";
	public static String EVERYDAY_3 = "everyday3";
	public static String EVERYDAY_4 = "everyday4";
	public static String EVERYDAY_5 = "everyday5";
	public static String EVERYDAY_6 = "everyday6";
	public static String WEEKDAY_WAKE = "weekdayWake";
	public static String WEEKDAY_AWAY = "weekdayAway";
	public static String WEEKDAY_HOME = "weekdayHome";
	public static String WEEKDAY_SLEEP = "weekdaySleep";
	public static String WEEKEND_WAKE = "weekendWake";
	public static String WEEKEND_AWAY = "weekendAway";
	public static String WEEKEND_HOME = "weekendHome";
	public static String WEEKEND_SLEEP = "weekendSleep";

	public static String EVERYDAY_1_TIME = "everyday1Time";
	public static String EVERYDAY_2_TIME = "everyday2Time";
	public static String EVERYDAY_3_TIME = "everyday3Time";
	public static String EVERYDAY_4_TIME = "everyday4Time";
	public static String EVERYDAY_5_TIME = "everyday5Time";
	public static String EVERYDAY_6_TIME = "everyday6Time";
	public static String EVERYDAY_1_HEAT_SETPOINT = "everyday1HeatSetPoint";
	public static String EVERYDAY_1_COOL_SETPOINT = "everyday1CoolSetPoint";
	public static String EVERYDAY_2_HEAT_SETPOINT = "everyday2HeatSetPoint";
	public static String EVERYDAY_2_COOL_SETPOINT = "everyday2CoolSetPoint";
	public static String EVERYDAY_3_HEAT_SETPOINT = "everyday3HeatSetPoint";
	public static String EVERYDAY_3_COOL_SETPOINT = "everyday3CoolSetPoint";
	public static String EVERYDAY_4_HEAT_SETPOINT = "everyday4HeatSetPoint";
	public static String EVERYDAY_4_COOL_SETPOINT = "everyday4CoolSetPoint";
	public static String EVERYDAY_5_HEAT_SETPOINT = "everyday5HeatSetPoint";
	public static String EVERYDAY_5_COOL_SETPOINT = "everyday5CoolSetPoint";
	public static String EVERYDAY_6_HEAT_SETPOINT = "everyday6HeatSetPoint";
	public static String EVERYDAY_6_COOL_SETPOINT = "everyday6CoolSetPoint";

	public static String PERIOD_NUMBER_TO_DELETE = "periodNumberEMEAToDelete";
	public static String DELETE_PERIOD = "deletePeriod";
	public static String DELETE_MULTIPLE_PERIODS = "deleteMultiplePeriods";
	public static String NUMBER_OF_PERIODS_TO_DELETE = "numberOfPeriodsToDelete";
	public static String ADD_PERIOD = "addPeriod";
	public static String OVERRIDE_PERIOD = "overridePeriod";
	public static String ADD_PERIOD_START_TIME = "ADD_PERIOD_START_TIME";
	public static String ADD_PERIOD_END_TIME = "ADD_PERIOD_END_TIME";
	public static String ADD_PERIOD_HEAT_SETPOINT = "ADD_PERIOD_HEAT_SETPOINT";
	public static String ADD_PERIOD_COOL_SETPOINT = "ADD_PERIOD_COOL_SETPOINT";

	public static String TYPE_OF_SCHEDULE = "TypeOfSchedule";
	public static String SHOW_VIEW_TYPE = "showViewType";
	public static String INDIVIDUAL_TYPE = "Individual Days";
	public static String GROUP_TYPE = "Group Days";

	public static final String OFF_MODE = "Off";

	public static final Double AwayLatitude = 39.91221;
	public static final Double AwayLongitude = 116.40703;
	public static final Double HomeLatitude = 12.924681;
	public static final Double HomeLongitude = 77.686474;

	public static final int Geofence_DefaultRadius = 500;

	//public static String InvitE_User_Password = "Password123";
	public static String InvitE_User_Password="Password1";

	public static  String DefaultCoolsetPoint = "defaultcoolsetpoint";
	
	public static  String DefaultHeatsetPoint = "defaultheatsetpoint";

	//public static String INVITE_USER = "jk_test_223@grr.la";
	public static String INVITE_USER = "at0201@grr.la";
	
	public static String valid_EmailID = "Prod_wld_slsd1@grr.la";
	
	public static String Invalid_EmailID = "Prod_wld_sls@grr.la";
	
	public static String valid_EmailID_space = "  Prod_wld_slsd1@grr.la";
	
	public static String valid_Pwd = "Password1";
	
	public static String Invalid_Pwd = "Balaji123";
	
	public static String NEW_PASSWORD = "Password111";
	
	public static String MOBILE_LOCATION_OFF="mobilelocationoff";
	
	public static String New_EmailID = "ad@grr.la";
	
	public static String Scenario = "Scenario";
	
}
