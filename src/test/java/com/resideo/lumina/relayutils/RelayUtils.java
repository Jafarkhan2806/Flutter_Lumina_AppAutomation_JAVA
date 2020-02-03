package com.resideo.lumina.relayutils;

public class RelayUtils {

	public static void WLD_RESET_ON() throws Exception {
		SerialDriverArduino.initialize();
		SerialDriverArduino.setrelay(RelayConstants.WLD_RESET_TRIP_ON);
		SerialDriverArduino.closePort();

	}
	public static void WLD_RESET_OFF() throws Exception {
		SerialDriverArduino.initialize();
		SerialDriverArduino.setrelay(RelayConstants.WLD_RESET_TRIP_OFF);
		SerialDriverArduino.closePort();
	}
	public static void WLD_LEAK_ALERT_ON() throws Exception {
		SerialDriverArduino.initialize();
		SerialDriverArduino.setrelay(RelayConstants.WLD_LEAK_ALERT_ON);
		SerialDriverArduino.closePort();
	}
	public static void WLD_LEAK_ALERT_OFF() throws Exception {
		SerialDriverArduino.initialize();
		SerialDriverArduino.setrelay(RelayConstants.WLD_LEAK_ALERT_OFF);
		SerialDriverArduino.closePort();
	}
	
}
