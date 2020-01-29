package com.honeywell.lyric.relayutils;

public class RelayUtils {

	public static void RSIContactSensorOpen_Window() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_1_Trip_ON);
		SerialDriver.closePort();

	}
	public static void RSIContactSensorClosed_Window() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_1_Trip_OFF);
		SerialDriver.closePort();
	}
	public static void RSIWindowContactSensorTamperON() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_1_Tamper_ON);
		SerialDriver.closePort();
	}
	public static void RSIWindowContactSensorTamperCleared() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_1_Tamper_OFF);
		SerialDriver.closePort();
	}

	public static void RSIContactSensorOpen_Door() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_2_Trip_ON);
		SerialDriver.closePort();

	}
	public static void RSIContactSensorClosed_Door() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_2_Trip_OFF);
		SerialDriver.closePort();
	}
	public static void RSIDoorContactSensorTampered() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_2_Tamper_ON);
		SerialDriver.closePort();
	}
	public static void RSIDoorContactSensorTamperCleared() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_Contact_Sesor_2_Tamper_OFF);
		SerialDriver.closePort();
	}
	public static void RSIAllSensorOff() throws Exception{
		SerialDriver.initialize();
		SerialDriver.setrelay(RelayConstants.RSI_AllSensor_Trip_OFF);
		SerialDriver.closePort();
	}

}
