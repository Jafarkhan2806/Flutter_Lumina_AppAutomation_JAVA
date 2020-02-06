package com.resideo.lumina.utils;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.SuiteExecutor.BaseDriver;
import com.resideo.lumina.relayutils.RelayUtils;
import com.resideo.screens.FlutterElements;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import pro.truongsinh.appium_flutter.FlutterFinder;


public class LuminaUtils extends BaseDriver {
	private TestCaseInputs inputs;
	public ArrayList<String> screen;
	private TestCases testCase;

	public LuminaUtils(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	public static AppiumDriver<MobileElement> driver;

	FlutterElements find = new FlutterElements();

	public LuminaUtils(TestCaseInputs inputs, TestCases testCase) {
		this.inputs = inputs;	
		this.testCase = testCase;
	}
	public boolean loginToLuminaApp() {
		boolean flag = true;
		try {
			driver = find.setUp();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//		this.SetEnvironement();
				assertEquals(find.getElementStringByText("SIGN IN"), "SIGN IN");
				find.clickElementByText("SIGN IN");
				find.swicthContext("NATIVE_APP");
				try
				{
					Thread.sleep(10000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				find.clickElementByXpath("Email Address");
				find.enterEmailID(inputs.getInputValue("USERID"));
				find.hideKeyboard();
				find.clickElementsByXpath("Password",0);
				try 
				{
					Thread.sleep(1000);
				} catch (InterruptedException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				find.enterPassword(inputs.getInputValue("PASSWORD"));
				try 
				{
					Thread.sleep(2000);
				} catch (InterruptedException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				find.clickElementsByXpath("SIGN IN",1);
				find.swicthContext("FLUTTER");

		
				return flag;
	}

	public boolean SetEnvironement() {
		boolean flag = true;
		find.clickElementbyValueKey("Environment");
		find.clickElementByText(inputs.getInputValue("APPENV"));
		return flag;

	}

	public Boolean AddDevice(String screen) {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (screen.toUpperCase()){
		case (("WATER LEAK DETECTOR SETUP")):{
			if (ele.byValueKey("add_device") != null) {
				ele.byValueKey("add_device").click();
				ele.text("Water Leak Detector").click();
				flag = true;
			}else {
				flag = false;
			}
			break;
		}
		default : {
			flag = false;
		}
		}
		return flag;
	}

	public Boolean DeleteDevice() {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		if (ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).getText().equalsIgnoreCase(inputs.getInputValue("LOCATION1_DEVICE1_NAME"))) {
			ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).click();
			ele.byValueKey("settings_menu").click();
			ele.text("DELETE  LEAK  DETECTOR").click();
			flag = true;
		}else {
			flag = false;
		}
		return flag;
	}

	public boolean enrollWld(TestCases testCase, TestCaseInputs inputs,String CommandType) {
		boolean flag = true;
		try {
			switch (CommandType.toUpperCase()){
			case "ENROLL":{
				RelayUtils.WLD_RESET_ON();
				Thread.sleep(5000);
				RelayUtils.WLD_RESET_OFF();
				break;
			} case "DISCONNECT" :{
				RelayUtils.WLD_RESET_OFF();
				break;
			}
			case "TRIGGER SIREN ON" :{
				RelayUtils.WLD_LEAK_ALERT_ON();
				break;
			}
			case "TRIGGER SIREN OFF" :{
				RelayUtils.WLD_LEAK_ALERT_OFF();
				break;
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public Boolean VerifyScreen(String screen) {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (screen.toUpperCase()){
		case ("WATER LEAK DETECTOR SETUP"):{
			if (ele.text("Water Leak Detector Setup Steps").getText().equalsIgnoreCase("Water Leak Detector Setup Steps")) {
				flag = true;
			}else {
				flag = false;
			}
			break;
		}
		case ("LOCATION ACCESS"):{
			if (ele.text("Location Access").getText().equalsIgnoreCase("Location Access")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				flag = false;
			}
			break;
		}
		case ("PLACEMENT OVERVIEW"):{
			if (ele.text("Placement Overview").getText().equalsIgnoreCase("Placement Overview")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				flag = false;
			}
			break;
		}

		case ("BACK"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[contains(@text,'Back')]").isDisplayed()) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("CHOOSE LOCATION"):{
			if (ele.text("Choose Location").getText().equalsIgnoreCase("Choose Location")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("CREATE LOCATION"):{
			if (ele.text("Create Location").getText().equalsIgnoreCase("Create Location")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("DETECTOR NAME"):{
			if (ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).getText().equalsIgnoreCase(inputs.getInputValue("LOCATION1_DEVICE1_NAME"))) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("POWER DETECTOR"):{
			if (ele.text("POWER DETECTOR").getText().equalsIgnoreCase("POWER DETECTOR")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("CONNECT"):{
			if (ele.text("Connect").getText().equalsIgnoreCase("Connect")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("SELECT NETWORK"):{
			if (ele.text("Select Network").getText().equalsIgnoreCase("Select Network")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("CONNECT WIFI"):{
			if (ele.text("Connect").getText().equalsIgnoreCase("Connect")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("CONGRATULATIONS"):{
			if (ele.text("Congratulations!").getText().equalsIgnoreCase("Congratulations!")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("MANAGE ALERTS"):{
			if (ele.text("Manage Alerts").getText().equalsIgnoreCase("Manage Alerts")) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("DEVICE NAME"):{
			if (ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).getText().equalsIgnoreCase(inputs.getInputValue("LOCATION1_DEVICE1_NAME"))) {
				Keyword.ReportStep_Pass(testCase,
						screen + "is displayed on the WLD Card as " + inputs.getInputValue("LOCATION1_DEVICE1_NAME"));
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("SETTINGS OPTION"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("settings_menu")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("key_temperature")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Current Temperature of WLD device : " + ele.byValueKey("key_temperature").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("key_humidity")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Current Humidity of WLD device : " + ele.byValueKey("key_humidity").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("SETUP COMPLETE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("setup_complete")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}

		case ("LAST UPDATED TIME"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("last_updated")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen +  " is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " + screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("NEXT UPDATE TIME"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("next_update")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen +" is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("BATTERY PERCENTAGE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("battery_level")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + ele.byValueKey("battery_level").getText() +  " is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE GRAPH"):{
			if (ele.text("Setup Complete!").getText().isEmpty()) 
			{
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("UPDATE FREQUENCY"):{
			if (ele.text("Update Frequency").getText().equalsIgnoreCase("Update Frequency")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE UNIT"):{
			if (ele.text("Temperature Unit").getText().equalsIgnoreCase("Temperature Unit")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ABOUT MY DROPLET"):{
			if (ele.text("About My Droplet").getText().equalsIgnoreCase("About My Droplet")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("SETTINGS"):{
			if (ele.text("Settings").getText().equalsIgnoreCase("Settings")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("AUTO SHUTOFF"):{
			if (ele.text("Auto Shutoff").getText().equalsIgnoreCase("Auto Shutoff")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "is displayed on the WLD Card ");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE ALERTS"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Switch").get(0).getAttribute("checked").equalsIgnoreCase("true")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "in WLD Card Settings");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY ALERTS"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Switch").get(1).getAttribute("checked").equalsIgnoreCase("true")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						screen + "in WLD Card Settings");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("TEMPERATURE ABOVE"):{
			if (ele.byValueKey("temp_above").getText().equalsIgnoreCase("99°F") || ele.byValueKey("temp_above").getText().equalsIgnoreCase("37°C") ) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("temp_above").getText() + " default Temp Above value is displayed");
				flag = true;
			} else{
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE BELOW"):{
			if (ele.byValueKey("temp_below").getText().equalsIgnoreCase("45°F") || ele.byValueKey("temp_below").getText().equalsIgnoreCase("7°C")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("temp_above").getText() + " is default Temp below value");
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY ABOVE"):{
			if (ele.byValueKey("humidity_above").getText().equalsIgnoreCase("70%")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("humidity_above").getText() + " is default Temp below value");
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY BELOW"):{
			if (ele.byValueKey("humidity_below").getText().equalsIgnoreCase("20%")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("humidity_below").getText() + " is default Temp below value");
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("EMAIL DISABLED"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.CheckBox").get(0).getAttribute("checked").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,"Email Notification status is " +
						driver.findElementsByClassName("android.widget.CheckBox").get(0).getAttribute("checked"));
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						screen.toUpperCase() + " is not enabled ");
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case "MAC ID":{
			if (ele.byValueKey("serial_number").getText() != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase() + "and MAC ID is : " + ele.byValueKey("serial_number").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;

		}
		case "INSTALLED DAY":{
			if (ele.byValueKey("installed_date").getText() != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase() + "and installed is : " + ele.byValueKey("installed_date").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;

		}
		case "ONLINE STATUS":{
			if (ele.byValueKey("online_Status") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase() + "and installed is : " + ele.byValueKey("online_Status").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;

		}
		case "NO ALERTS":{
			if (ele.text("All Good").getText().equalsIgnoreCase("All Good")) {
				Keyword.ReportStep_Pass(testCase,
						"No alerts are displayed in the Dashboard");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts are displayed on the dashabord in newly installed device");
				flag = false;
			}
			break;

		}
		case ("WATER LEAK DETECTED"):{
			if (driver.executeScript("flutter:waitFor",ele.byValueKey("alert_buttontrue")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Water Leak alert is displayed in the Dashboard");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts are not displayed on the dashabord");
				flag = false;
			}
			break;
		}
		case ("WATER LEAK DETECTED TITLE"):{
			if (ele.byValueKey("Alert_Title").getText().equalsIgnoreCase("Leak Detected")) {
				Keyword.ReportStep_Pass(testCase,
						"Alerts Title is displayed in the Leak Card");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts title are not displayed");
				flag = false;
			}
			break;
		}
		case ("TIME STAMP WITH DETECTOR NAME"):{
			if (ele.byValueKey("Alerts_Status").getText().contains(inputs.getInputValue("LOCATION1_DEVICE1_NAME"))) {
				Keyword.ReportStep_Pass(testCase,
						"Alerts time is displayed as " + ele.byValueKey("Alerts_Status").getText());
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts time is not displayed");
				flag = false;
			}
			break;
		}
		case ("MUTE OPTION"):{
			System.out.println(ele.byValueKey("Mute_Siren").getText() + "+ Mute option");
			if (ele.byValueKey("Mute_Siren").getText().equalsIgnoreCase("Mute Siren")) {
				Keyword.ReportStep_Pass(testCase,
						"Alerts Mute buttonn is displayed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts Mute button is not displayed");
				flag = false;
			}
			break;
		}
		case ("UNMUTE OPTION"):{
			System.out.println(ele.byValueKey("Mute_Siren").getText() + "+ UnMute option");
			if (ele.byValueKey("Mute_Siren").getText().equalsIgnoreCase("Unmute Siren")) {
				Keyword.ReportStep_Pass(testCase,
						"Alerts UnMute button is displayed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts Mute button is not displayed");
				flag = false;
			}
			break;
		}
		case ("CLOSE OPTION"):{
			if (ele.byValueKey("Close_button") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Alerts close buttonn is displayed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Alerts close button is not displayed");
				flag = false;
			}
			break;
		}
		case "SIREN STATUS":{
			if (ele.byValueKey("Siren_status") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Siren Status is displayed " + ele.byValueKey("Siren_status").getText() );
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
				flag = false;
			}			break;
		}
		case "DETECTOR NAME TEXTFIELD":{
			if (ele.byValueKey("Device_Name"+inputs.getInputValue("LOCATION1_DEVICE1_NAME")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Detector Name is displayed as " +  inputs.getInputValue("LOCATION1_DEVICE1_NAME"));
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
				flag = false;
			}			break;
		}
		case "DETECTOR RENAMED":{
			if (ele.byValueKey("Device_NameRenamed") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Detector name is displayed as Renamed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
				flag = false;
			}			break;
		}
		case "DETECTOR NAME REVERTED":{
			if (ele.byValueKey("Device_Name"+inputs.getInputValue("LOCATION1_DEVICE1_NAME")) != null) {
				Keyword.ReportStep_Pass(testCase,
						"Detector name is displayed as Renamed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
				flag = false;
			}			break;
		}
		case "ABOUT DEVICE":{
			if (ele.byValueKey("Device_NameRenamed") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Detector name is displayed as Renamed");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
				flag = false;
			}			break;
		}
		default : {
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
					screen.toUpperCase() + " Page not found" );
			flag = false;
		}
		}
		return flag;
	}

	public Boolean ClickOnButton(String button) {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (button){
		case ("NEXT"):{
			if (ele.text("NEXT").getText().equalsIgnoreCase("NEXT")) {
				ele.text("NEXT").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ALLOW"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[@text='Allow']").getText().equalsIgnoreCase("Allow")) {
				driver.findElementByXPath("//*[@text='Allow']").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("YES"):{
			if (ele.byValueKey("delete_confimation_yes") != null) {
				ele.byValueKey("delete_confimation_yes").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("NO"):{
			if (ele.byValueKey("delete_confimation_no")!= null) {
				ele.byValueKey("delete_confimation_no").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("CREATE LOCATION"):{
			driver.context("FLUTTER");
			if (ele.text("CREATE NEW LOCATION").getText().equalsIgnoreCase("CREATE NEW LOCATION")) {
				ele.text("CREATE NEW LOCATION").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("LOCATION NAME"):{
			driver.context("FLUTTER");
			if (ele.text(inputs.getInputValue("LOCATION1_NAME")).getText().equalsIgnoreCase(inputs.getInputValue("LOCATION1_NAME"))) {
				ele.text(inputs.getInputValue("LOCATION1_NAME")).click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("DETECTOR NAME"):{
			driver.context("FLUTTER");
			if (ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).getText().equalsIgnoreCase(inputs.getInputValue("LOCATION1_DEVICE1_NAME"))) {
				ele.text(inputs.getInputValue("LOCATION1_DEVICE1_NAME")).click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case (("DONE")):{
			if (ele.text("Done").getText().equalsIgnoreCase("Done")) {
				ele.text("Done").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case (("BACK")):{
			if (ele.byValueKey("back_button") != null) {
				ele.byValueKey("back_button").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("SETTINGS OPTION"):{
			if (ele.byValueKey("settings_menu") != null) {
				ele.byValueKey("settings_menu").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("MANAGE ALERTS"):{
			if (ele.text("Manage Alerts").getText().equalsIgnoreCase("Manage Alerts")) {
				ele.text("Manage Alerts").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("UPDATE FREQUENCY"):{
			if (ele.text("Update Frequency").getText().equalsIgnoreCase("Update Frequency")) {
				ele.text("Update Frequency").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ABOUT MY DROPLET"):{
			if (ele.text("About My Droplet").getText().equalsIgnoreCase("About My Droplet")) {
				ele.text("About My Droplet").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE UNIT"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(1) != null) {
				driver.findElementsByClassName("android.widget.Button").get(1).click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("CLOSE"):{
			if (ele.byValueKey("Close_button") != null) {
				ele.byValueKey("Close_button").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("WATER LEAK ALERT"):{
			if (ele.byValueKey("alert_buttontrue") != null) {
				ele.byValueKey("alert_buttontrue").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("MUTE SIREN"):{
			if (ele.byValueKey("Mute_Siren") != null) {
				ele.byValueKey("Mute_Siren").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("UNMUTE OPTION"):{
			if (ele.byValueKey("Mute_Siren") != null) {
				ele.byValueKey("Mute_Siren").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case "Daily (Recommended)" :{
			if (ele.text(button).getText().equalsIgnoreCase("Daily (Recommended)")) {
				ele.text(button).click();
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, button + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case "Twice daily" :{
			if (ele.text(button).getText().equalsIgnoreCase("Twice daily")) {
				ele.text(button).click();
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, button + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case "Three times daily" :{
			if (ele.text(button).getText().equalsIgnoreCase("Three times daily")) {
				ele.text("Three times daily").click();
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, button + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ABOVE HUMIDITY RANGE"):{
			if (ele.byValueKey("humidity_abovetrue") != null) {
				ele.byValueKey("humidity_abovetrue").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("BELOW HUMIDITY RANGE"):{
			if (ele.byValueKey("humidity_belowtrue") != null) {
				ele.byValueKey("humidity_belowtrue").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ABOVE TEMPERATURE RANGE"):{
			if (ele.byValueKey("temp_abovetrue") != null) {
				ele.byValueKey("temp_abovetrue").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked one " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("BELOW TEMPERATURE RANGE"):{
			if (ele.byValueKey("temp_belowtrue") != null) {
				ele.byValueKey("temp_belowtrue").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked on " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("DELETE LEAK DETECTOR"):{
			if (ele.byValueKey("delete_wld") != null) {
				ele.byValueKey("delete_wld").click();
				Keyword.ReportStep_Pass(testCase,
						"Succesfully clicked on " + button.toUpperCase());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  button.toUpperCase());
				flag = false;
			}
			break;
		}
		default : {
			driver.context("FLUTTER");
			ele.byValueKey(button).click();
			flag = true;
		}
		}
		return flag;
	}

	public Boolean VerifyPopUp(String popup) {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (popup){
		case ("MOBILE LOCATION SERVICES IS OFF"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[contains(@text,'Allow lumina to access this device')]").getText().equalsIgnoreCase("Allow lumina to access this device's location?")) {
				Keyword.ReportStep_Pass(testCase,
						popup.toUpperCase()  + " pop is displayed");
				flag = true;
			}else {
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}case ("SAVE CHNAGES"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[contains(@text,'Save Changes')]").getText().equalsIgnoreCase("Save Changes")) {
				Keyword.ReportStep_Pass(testCase,
						popup.toUpperCase() + " pop is displayed");
				flag = true;
			}else {
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("DELETE DEVICE"):{
			if (ele.byValueKey("delete_device_description") != null) {
				Keyword.ReportStep_Pass(testCase,
						"Delete device Descriptionn is displayed as  " + ele.byValueKey("delete_device_description").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't click on " +  popup.toUpperCase());
				flag = false;
			}
			break;
		}
		default : {
			flag = false;
		}
		}
		return flag;
	}

	@SuppressWarnings("serial")
	public Boolean EnterTestInputs(String input) {
		boolean flag = true;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (input){
		case ("LOCATION NAME"):{
			driver.context("FLUTTER");
			if (ele.text("Customize Location Name").getText().equalsIgnoreCase("Customize Location Name")) {
				ele.byValueKey("Customize Location Name").click();
				driver.executeScript("flutter:enterText", inputs.getInputValue("LOCATION1_NAME")) ;
				flag = true;
			}else {
				flag = false;
			}
			break;
		}
		case ("VALID ZIP CODE"):{
			driver.context("FLUTTER");
			if (ele.text("Postal Code").getText().equalsIgnoreCase("Postal Code")) {
				driver.executeScript("flutter:scrollUntilVisible", ele.byValueKey("Postal Code"), new HashMap<String, Object>() {{
					put("item", ele.byValueKey("Postal Code"));
					put("dxScroll", 90);
					put("dyScroll", -400);
				}});
				ele.byValueKey("Postal Code").click();
				driver.executeScript("flutter:enterText", "11747") ;
				flag = true;
			}else {
				flag = false;
			}
			break;
		}
		default : {
			driver.executeScript("flutter:enterText", input) ;
			flag = true;
		}
		}
		return flag;
	}

	public void scrollUpToelement (String element){
		FlutterFinder ele = new FlutterFinder(driver);
		int num = 0;
		while (num < 10) {
			driver.executeScript("flutter:scroll", ele.byType("ListView"), new HashMap<String, Object>() {{
				put("item", ele.byValueKey(element));
				put("dx", 50);
				put("dy", 100);
				put("durationMilliseconds", 500);
				put("frequency", 30);
			}});
			num++;
		}
	}

	public void scrollDownToelement (String element){
		FlutterFinder ele = new FlutterFinder(driver);
		int num = 0;
		while (num < 10) {
			driver.executeScript("flutter:scroll", ele.byType("ListView"), new HashMap<String, Object>() {{
				put("item", ele.byValueKey(element));
				put("dx", 100);
				put("dy", 400);
				put("durationMilliseconds", 500);
				put("frequency", 30);
			}});
			num++;
		}
	}

	public boolean ElementEnabled (String element){
		boolean flag;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (element.toUpperCase()) {
		case "THREE TIMES DAILY": {
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey(8)) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case "TWICE DAILY": {
			if (driver.executeScript("flutter:waitFor", ele.byValueKey(12)) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("RECOMMENDED"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey(24)) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		} case "TEMPERATURE ALERTS" :{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("temp_switchtrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE ABOVE VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("temp_abovetrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE BELOW VALUE"):{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("temp_belowtrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY ALERTS"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_switchtrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY ABOVE VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_abovetrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY BELOW VALUE"):{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_belowtrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case "EMAIL NOTIFICATION" :{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("checkbox_emailtrue")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is enabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		default :{
			flag = false;
		}
		}
		return flag;
	}

	public boolean ElementDisabled (String element){
		boolean flag;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (element.toUpperCase()) {
		case "TEMPERATURE ALERTS" :{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("temp_switchfalse")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is disabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE ABOVE VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("temp_abovefalse")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("temp_abovefalse") + " is default Temp below value");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("TEMPERATURE BELOW VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("temp_belowfalse")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("temp_belowfalse") + " is default Temp below value");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case "HUMIDITY ALERTS" :{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_switchfalse")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is disabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY ABOVE VALUE"):{
			if (driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_abovefalse")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("humidity_abovefalse") + " is default Hum Above value");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case ("HUMIDITY BELOW VALUE"):{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("humidity_belowfalse")) != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, ele.byValueKey("humidity_belowfalse") + " is default Hum below value");
				flag = true;
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		case "EMAIL NOTIFICATION" :{
			if ( driver.executeScript("flutter:waitFor", ele.byValueKey("checkbox_emailfalse")) != null) {
				Keyword.ReportStep_Pass(testCase, element + " is disabled");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			break;
		}
		default :{
			flag = false;
		}
		}
		return flag;
	}


	public boolean SetTempUnit(String unit) {
		boolean flag = false;
		FlutterFinder ele = new FlutterFinder(driver);
		if (unit.equalsIgnoreCase("C")) {
			ele.byValueKey("unit_F").click();
			flag = true;
		} else {
			ele.byValueKey("unit_C").click();
			flag = true;
		}
		return flag;
	}

	public String GetTempUnit() {
		String UntiValue ;
		FlutterFinder ele = new FlutterFinder(driver);
		UntiValue = ele.byValueKey("temp_above").getText();
		return UntiValue;
	}

	public String GetSirenStatus() {
		String SirenValue ;
		FlutterFinder ele = new FlutterFinder(driver);
		SirenValue = ele.byValueKey("Siren_status").getText();
		return SirenValue;
	}

	public boolean VerifyUpdateFrequency(String Frequency) {
		FlutterFinder ele = new FlutterFinder(driver);
		boolean flag = false;
		switch (Frequency) {
		case "24" :
		case "Daily" :{
			if (ele.byValueKey("24") != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, Frequency + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  Frequency.toUpperCase());
				flag = false;
			}
			break;
		}
		case "12" :
		case "Twice daily" :{
			if (ele.byValueKey("12") != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, Frequency + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  Frequency.toUpperCase());
				flag = false;
			}
			break;
		}
		case "8" :
		case "Three times Daily" :{
			if (ele.byValueKey("8") != null) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase, Frequency + " is selected as Frequency");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  Frequency.toUpperCase());
				flag = false;
			}
			break;
		}
		default :{
			flag = false;
			break;
		}
		}
		return flag ;
	}

	public void sleepTime(int timeout) {
		try {
			Thread.sleep(timeout);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getAlertValues(String ValueType) {
		String aboveValue;
		String belowValue;
		FlutterFinder ele = new FlutterFinder(driver);
		if (ValueType.equalsIgnoreCase("Humidity")) {
			aboveValue = ele.byValueKey("humidity_above").getText();
			belowValue = ele.byValueKey("humidity_below").getText();
			inputs.setInputValue(InputVariables.HUMIDITY_ABOVE_VALUE, aboveValue);
			inputs.setInputValue(InputVariables.HUMIDITY_BELOW_VALUE, belowValue);
		} else{
			aboveValue = ele.byValueKey("temp_above").getText();
			belowValue = ele.byValueKey("temp_below").getText();
			inputs.setInputValue(InputVariables.TEMPERATURE_ABOVE_VALUE, aboveValue);
			inputs.setInputValue(InputVariables.TEMPERATURE_BELOW_VALUE, belowValue);
		}
	}


}
