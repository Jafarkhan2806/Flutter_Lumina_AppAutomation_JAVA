package com.resideo.lumina.utils;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONObject;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.fazecast.jSerialComm.SerialPort;

import io.appium.java_client.AppiumDriver;

enum HTimers {
	AWAY, LIVE, ENTRY_EXIT, LOGIN, ALARMPOPUP, LIVE_ON_POPUP, DISMISS_ALARM;
}

public class Glv {

	@SuppressWarnings("rawtypes")
	public static AppiumDriver driver = null;
	public static WebDriverWait wait;
	public static String prefix = "com.honeywell.android.lyric:id/";
	/** for serial comm **/
	protected static SerialPort usePortDevice, usePortEBB;
	protected static String dataRead = null;
	public static String cookie;
	public static String sessionID;
	public static String bodyToken;
	public static String verificationToken;
	public static JSONObject jsonObj;
	public static String eventSubType;
	public static String eventDateTime;
	public static ArrayList<Long> Timers = new ArrayList<>();
	public static String excelFile = "D:\\ismv_automation\\sample 2\\sample\\output\\Timers.xls";
	public static String logsFolder = "D:\\ismv_automation\\sample 2\\sample\\output\\Timers.xls";
	public static HashMap<String, Long> timersvalues = new HashMap<String, Long>();
	public static String browser = null;
	public static String adbPath = "/usr/local/Caskroom/android-platform-tools/latest/platform-tools/adb";
	public static String Version = null;
	public static String Username = null;
	public static String Password = null;

}
