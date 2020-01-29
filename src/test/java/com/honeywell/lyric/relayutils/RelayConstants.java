package com.honeywell.lyric.relayutils;

public class RelayConstants {
	public static final String RelayBoardCOMPort = "COM29";
	public static final String RelayBoardTTYPort = "/dev/tty.usbmodem1421";
	

	public static String RSI_Contact_Sesor_1_Enroll_ON = "0:1";  // Window
	public static String RSI_Contact_Sesor_1_Enroll_OFF = "0:0";	// Window
	public static String RSI_Contact_Sesor_1_Tamper_ON = "2:1";  // Window
	public static String RSI_Contact_Sesor_1_Tamper_OFF = "2:0";	// Window
	public static String RSI_Contact_Sesor_1_Trip_ON = "1:1";    // Window
	public static String RSI_Contact_Sesor_1_Trip_OFF = "1:0";   // Window
	public static String RSI_Contact_Sesor_2_Enroll_ON = "3:1";  // Door
	public static String RSI_Contact_Sesor_2_Enroll_OFF = "3:0"; // Door
	public static String RSI_Contact_Sesor_2_Tamper_ON = "4:1";  // Door
	public static String RSI_Contact_Sesor_2_Tamper_OFF = "4:0"; // Door
	public static String RSI_Contact_Sesor_2_Trip_ON = "5:1";    // Door
	public static String RSI_Contact_Sesor_2_Trip_OFF = "5:0";   // Door
	public static String RSI_AllSensor_Trip_OFF = "0:0;1:0;2:0;3:0;4:0;5:0;6:0;7:0;8:0;9:0;10:0;11:0;12:0;13:0;14:0;15:0";
	public static String RSI_AllSensor_Trip_ON = "43";
}
