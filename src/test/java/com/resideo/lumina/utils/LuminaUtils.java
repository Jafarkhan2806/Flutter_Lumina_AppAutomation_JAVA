package com.resideo.lumina.utils;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.touch.TouchActions;

import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;
import com.honeywell.commons.mobile.MobileUtils;
import com.honeywell.commons.report.FailType;
import com.honeywell.keywords.lumina.wld.Temperature;
import com.resideo.SuiteExecutor.BaseDriver;
import com.resideo.lumina.relayutils.RelayUtils;
import com.resideo.screens.FlutterElements;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import pro.truongsinh.appium_flutter.FlutterFinder;
import pro.truongsinh.appium_flutter.finder.FlutterElement;


public class LuminaUtils extends BaseDriver {
	private TestCaseInputs inputs;
	public ArrayList<String> screen;
	private TestCases testCase;
	private float temperatureVal; 
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
		//	System.out.println("launched1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.SetEnvironement();
		assertEquals(find.getElementStringByText("SIGN IN"), "SIGN IN");
		find.clickElementByText("SIGN IN");
		find.swicthContext("NATIVE_APP");
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		find.clickElementByXpath("Email Address");
		find.enterEmailID(inputs.getInputValue("USERID"));
		find.hideKeyboard();
		find.clickElementsByXpath("Password",0);
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		find.enterPassword(inputs.getInputValue("PASSWORD"));
		find.hideKeyboard();
		//find.clickElementByText("SIGN IN");
		//find.clickElementbyValueKey("next");
		
		find.clickElementsByXpath("SIGN IN",1);
//		find.swicthContext("FLUTTER");
//				find.clickElementbyValueKey("Add Water Leak Detector");
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
			ele.byValueKey("droplet_settings_menu").click();
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
			//System.out.println(ele.byValueKey("back"));
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
			if (ele.text("Settings").getText().equalsIgnoreCase("Settings")) {
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
//			System.out.println("Temperature value: "+ele.byValueKey("key_temperature"));
			driver.context("NATIVE_APP");
			sleepTime(5000);
			
			if (driver.findElementsByXPath("//*[contains(@text,'Temperature')]").get(0).getText().contains("Temperature")) {
				String tempVal = driver.findElementsByXPath("//*[contains(@text,'Temperature')]").get(0).getText();
				String temp = null;
				//System.out.println("TempVal: "+tempVal);
				Pattern pattern = Pattern.compile("([+-]?\\d+(\\.\\d+)*)\\s?°");
				Matcher matcher = pattern.matcher(tempVal);
				if (matcher.find())
				{
				    temp = matcher.group(1);
				}
				Temperature t = Temperature.getInstance();
				
				temperatureVal = Float.parseFloat(temp);
				t.setTemperatureVal(temperatureVal);
				System.out.println("Temperated Util Value: "+temperatureVal);
				//System.out.println("T: "+temperatureVal.getTempVal());
				Keyword.ReportStep_Pass(testCase,
						"Current Temperature of WLD device : " + tempVal);
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByXPath("//*[contains(@text,'Humidity')]").get(0).getText().contains("Humidity")) {
				Keyword.ReportStep_Pass(testCase,
						"Current Humidity of WLD device : " + driver.findElementsByXPath("//*[contains(@text,'Humidity')]").get(0).getText());
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
			if (ele.text("Setup Complete!").getText().equalsIgnoreCase("Setup Complete!")) {
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
		case ("TEMPERATURE GRAPH"):{
			if (ele.text("Setup Complete!").getText().equalsIgnoreCase("")) {
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
			driver.context("NATIVE_APP");
			sleepTime(5000);
			try {
				if (SuiteConstants
						.getConstantValue(SuiteConstantTypes.TEST_SUITE, "Requirment_File_Name").contains("Android")) {
				if (driver.findElementsByClassName("android.widget.Button").get(1).getAttribute("text").equalsIgnoreCase("99.0°F") ||
						driver.findElementsByClassName("android.widget.Button").get(1).getAttribute("text").equalsIgnoreCase("37.0°C")	) {
					Keyword.ReportStep_Pass_With_ScreenShot(testCase,
							driver.findElementsByClassName("android.widget.Button").get(1).getAttribute("text") + " is default Temp above value");
					flag = true;
				}else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
							"Could't navigate to " +  screen.toUpperCase());
					flag = false;
				}
				} else {
					if (driver.findElementsByClassName("XCUIElementTypeButton").get(1).getAttribute("name").equalsIgnoreCase("99.0°F") ||
							driver.findElementsByClassName("XCUIElementTypeButton").get(1).getAttribute("name").equalsIgnoreCase("37.0°C")	) {
						Keyword.ReportStep_Pass_With_ScreenShot(testCase,
								driver.findElementsByClassName("XCUIElementTypeButton").get(1).getAttribute("name") + " is default Temp above value");
						flag = true;
					}else {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
								"Could't navigate to " +  screen.toUpperCase());
						flag = false;
					}	
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			driver.context("FLUTTER");
			break;
		}
		case ("TEMPERATURE BELOW"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			try {
				if (SuiteConstants
						.getConstantValue(SuiteConstantTypes.TEST_SUITE, "Requirment_File_Name").contains("Android")) {
				if (driver.findElementsByClassName("android.widget.Button").get(2).getAttribute("text").equalsIgnoreCase("45.0°F") ||
						driver.findElementsByClassName("android.widget.Button").get(2).getAttribute("text").equalsIgnoreCase("7.0°C")	) {
					Keyword.ReportStep_Pass_With_ScreenShot(testCase,
							driver.findElementsByClassName("android.widget.Button").get(2).getAttribute("text") + " is default Temp below value");
					flag = true;
				}else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
							"Could't navigate to " +  screen.toUpperCase());
					flag = false;
				}
				}else {
					if (driver.findElementsByClassName("XCUIElementTypeButton").get(2).getAttribute("name").equalsIgnoreCase("45.0°F") ||
							driver.findElementsByClassName("XCUIElementTypeButton").get(2).getAttribute("name").equalsIgnoreCase("7.0°C")	) {
						Keyword.ReportStep_Pass_With_ScreenShot(testCase,
								driver.findElementsByClassName("XCUIElementTypeButton").get(2).getAttribute("name") + " is default Temp below value");
						flag = true;
					}else {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
								"Could't navigate to " +  screen.toUpperCase());
						flag = false;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY ABOVE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			try {
				if (SuiteConstants
						.getConstantValue(SuiteConstantTypes.TEST_SUITE, "Requirment_File_Name").contains("Android")) {
				if (driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("text").equalsIgnoreCase("70%")) {
					Keyword.ReportStep_Pass_With_ScreenShot(testCase,
							driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("text") + " is default Humidity Above value");
					flag = true;
				}else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
							"Could't navigate to " +  screen.toUpperCase());
					flag = false;
				}
				} else {
					if (driver.findElementsByClassName("XCUIElementTypeButton").get(3).getAttribute("name").equalsIgnoreCase("70%")) {
						Keyword.ReportStep_Pass_With_ScreenShot(testCase,
								driver.findElementsByClassName("XCUIElementTypeButton").get(3).getAttribute("name") + " is default Humidity Above value");
						flag = true;
					}else {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
								"Could't navigate to " +  screen.toUpperCase());
						flag = false;
					}	
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY BELOW"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			try {
				if (SuiteConstants
						.getConstantValue(SuiteConstantTypes.TEST_SUITE, "Requirment_File_Name").contains("Android")) {
				if (driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("text").equalsIgnoreCase("20%")) {
					Keyword.ReportStep_Pass_With_ScreenShot(testCase,
							driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("text") + " is default Humidity Above value");
					flag = true;
				}else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
							"Could't navigate to " +  screen.toUpperCase());
					flag = false;
				}
				}else {
					if (driver.findElementsByClassName("XCUIElementTypeButton").get(4).getAttribute("name").equalsIgnoreCase("20%")) {
						Keyword.ReportStep_Pass_With_ScreenShot(testCase,
								driver.findElementsByClassName("XCUIElementTypeButton").get(4).getAttribute("name") + " is default Humidity Above value");
						flag = true;
					}else {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
								"Could't navigate to " +  screen.toUpperCase());
						flag = false;
					}	
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			driver.context("FLUTTER");
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
		// DEVICE STATUS ---------------------
		case "DEVICE STATUS":{
			//System.out.println("Device status: "+ele.byValueKey("device_status").getText());
			
			if (ele.byValueKey("device_status").getText() != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase() + "and installed is : " + ele.byValueKey("device_status").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case "BATTERY VALUE":{
//			driver.executeScript("flutter:scrollUntilVisible", ele.byValueKey("battery_level"), new HashMap<String, Object>() {{
//				put("item", ele.byValueKey("battery_level"));
//				put("dxScroll", 90);
//				put("dyScroll", -400);
//			}});
			
			scrollToElementByKeyValue("battery_level");
			
			
			System.out.println("Battery Value: "+ele.byValueKey("battery_level").getText());
			
			if (ele.byValueKey("battery_level").getText() != null) {
				Keyword.ReportStep_Pass(testCase,
						"Succesfully navigated to " + screen.toUpperCase() + "and installed is : " + ele.byValueKey("battery_level").getText());
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  screen.toUpperCase());
				flag = false;
			}
			break;
		}
		case "LAST UPDATED":{
//			CompletableFuture<FlutterElement>.runAsync(await ele.byValueKey("last_update"));
			//System.out.println("Hello Last update");
			
			// Scrolling to Element
			driver.executeScript("flutter:scrollUntilVisible", ele.byValueKey("last_updated"), new HashMap<String, Object>() {{
				put("item", ele.byValueKey("last_updated"));
				put("dxScroll", 90);
				put("dyScroll", -400);
				System.out.println("L: "+ele.byValueKey("last_update"));
			}});
			
			//System.out.println("L: "+ele.byValueKey("last_update").getText());
			//System.out.println("L: "+ele.bySemanticsLabel("last_updated").getText());
			
			break;
		}
//		case "NEXT UPDATED":{
//			System.out.println("Device status: "+ele.byValueKey("next_update").getText());
//			
//			if (ele.byValueKey("next_update").getText() != null) {
//				Keyword.ReportStep_Pass(testCase,
//						"Succesfully navigated to " + screen.toUpperCase() + "and installed is : " + ele.byValueKey("next_update").getText());
//				flag = true;
//			}else {
//				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
//						"Could't navigate to " +  screen.toUpperCase());
//				flag = false;
//			}
//			break;
//		}
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
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[@text='Yes']").getText().equalsIgnoreCase("Yes")) {
				driver.findElementByXPath("//*[@text='Yes']").click();
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
		case ("NO"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementByXPath("//*[@text='No']").getText().equalsIgnoreCase("No")) {
				driver.findElementByXPath("//*[@text='No']").click();
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
			flag = false;
		}
		}
		return flag;
	}

	
	public void scrollToelement (String element){
		FlutterFinder ele = new FlutterFinder(driver);
		driver.executeScript("flutter:scrollUntilVisible", ele.byType("ListView"), new HashMap<String, Object>() {{
			put("item", ele.text(element));
			put("dxScroll", 90);
			put("dyScroll", -400);
		}});

	}
	
	public void scrollToElementByKeyValue (String element){
		FlutterFinder ele = new FlutterFinder(driver);
		driver.executeScript("flutter:scrollUntilVisible", ele.byValueKey(element), new HashMap<String, Object>() {{
			put("item", ele.byValueKey(element));
			put("dxScroll", 90);
			put("dyScroll", -400);
		}});

	}

	public boolean ElementEnabled (String element){
		boolean flag;
		FlutterFinder ele = new FlutterFinder(driver);
		switch (element.toUpperCase()) {
		case "THREE TIMES DAILY": {
			driver.context("NATIVE_APP");
			sleepTime(5000);
			List<MobileElement> mobelement = driver.findElementsByClassName("android.widget.RadioButton");
			if (mobelement.size() != 0) {
				for (int i =0;i<=mobelement.size()-1;i++ ) {
					if (mobelement.get(i).getAttribute("content-desc").contains(element)) {
						mobelement.get(i).click();
						if(mobelement.get(i).getAttribute("Checked").equalsIgnoreCase("true") && mobelement.get(i).getAttribute("content-desc").contains(element)) {
							Keyword.ReportStep_Pass(testCase, element + " is selected");
						}
					}
				}
				driver.context("FLUTTER");
				flag = true;
			}else {
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("RECOMMENDED"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			List<MobileElement> mobelement = driver.findElementsByClassName("android.widget.RadioButton");
			if (mobelement.size() != 0) {
				for (int i =0;i<=mobelement.size()-1;i++ ) {
					if (mobelement.get(i).getAttribute("content-desc").contains(element)) {
						mobelement.get(i).click();
						if(mobelement.get(i).getAttribute("Checked").equalsIgnoreCase("true") && mobelement.get(i).getAttribute("content-desc").contains(element)) {
							Keyword.ReportStep_Pass(testCase, element + " is selected");
						}
					}
				}
				driver.context("FLUUTER");
				flag = true;
			}else {
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		} case "TEMPERATURE ALERTS" :{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Switch").get(0).getAttribute("checked").equalsIgnoreCase("true")) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				driver.findElementsByClassName("android.widget.Switch").get(0).click();
				flag = (driver.findElementsByClassName("android.widget.Switch").get(0).getAttribute("checked").equalsIgnoreCase("true") ? true : false);
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
				driver.findElementsByClassName("android.widget.Switch").get(1).click();
				flag = (driver.findElementsByClassName("android.widget.Switch").get(1).getAttribute("checked").equalsIgnoreCase("true") ? true : false);
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY ABOVE VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("clickable").equalsIgnoreCase("true")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("clickable") + " is default Temp above value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY BELOW VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("clickable").equalsIgnoreCase("true")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("clickable") + " is default Temp below value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
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
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Switch").get(0).getAttribute("checked").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				driver.findElementsByClassName("android.widget.Switch").get(0).click();
				flag = (driver.findElementsByClassName("android.widget.Switch").get(0).getAttribute("checked").equalsIgnoreCase("false") ? true : false);
			}
			driver.context("FLUTTER");
			break;
		}
		case ("TEMPERATURE ABOVE VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(1).getAttribute("clickable").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(1).getAttribute("clickable") + " is default Temp above value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("TEMPERATURE BELOW VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(2).getAttribute("clickable").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(2).getAttribute("clickable") + " is default Temp below value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case "HUMIDITY ALERTS" :{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Switch").get(1).getAttribute("checked").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass(testCase, element + " is selected");
				flag = true;
			}else {
				driver.findElementsByClassName("android.widget.Switch").get(1).click();
				flag = (driver.findElementsByClassName("android.widget.Switch").get(1).getAttribute("checked").equalsIgnoreCase("false") ? true : false);
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY ABOVE VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("clickable").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(3).getAttribute("clickable") + " is default Temp above value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
			break;
		}
		case ("HUMIDITY BELOW VALUE"):{
			driver.context("NATIVE_APP");
			sleepTime(5000);
			if (driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("clickable").equalsIgnoreCase("false")) {
				Keyword.ReportStep_Pass_With_ScreenShot(testCase,
						driver.findElementsByClassName("android.widget.Button").get(4).getAttribute("clickable") + " is default Temp below value");
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  element.toUpperCase());
				flag = false;
			}
			driver.context("FLUTTER");
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
		this.ClickOnButton("MANAGE ALERTS");
		for(int j=1;j<=3;j++){  
			driver.context("NATIVE_APP");
			sleepTime(5000);
			String getUnit = driver.findElementsByClassName("android.widget.Button").get(1).getText();
			System.out.println("getUnit "+getUnit);
			if(getUnit.contains(unit)){  
				Keyword.ReportStep_Pass(testCase, unit + " is selected");
				driver.context("FLUTTER");
				flag = true;
				break;  
			} else {
				driver.context("FLUTTER");
				sleepTime(5000);
				ele.byValueKey("back").click();
				this.ClickOnButton("TEMPERATURE UNIT");
				driver.context("FLUTTER");
				this.ClickOnButton("MANAGE ALERTS");
			}
		}
		return flag;
	}
	
	public boolean getTempVal(String unit) {
		boolean flag = false;
		
		
			driver.context("NATIVE_APP");
			sleepTime(5000);
			String getString = driver.findElementById("19f3b580-4d1a-4293-baee-0339d628a7c1").getText();
			//String getUnit = driver.findElementsByClassName("android.widget.Button").get(1).getText();
			System.out.println("getString:  "+getString);
			
		return flag;
	}
	
	
	
	// Todo: refactor
	public boolean SetTemperatureUnitValue(String unit) {
		boolean flag = false;
				
		//this.ClickOnButton("TEMPERATURE UNIT");
		driver.context("NATIVE_APP");
		sleepTime(5000);
		
		String getUnit = driver.findElementsByClassName("android.widget.Button").get(1).getText();
		
		System.out.println("getUnit "+getUnit);
		if(getUnit.contains(unit)){ 
			driver.findElementsByClassName("android.widget.Button").get(1).click();
			Keyword.ReportStep_Pass(testCase, unit + " is selected");
			System.out.println("UNIT clicked");
			flag = true;  
		} else {
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
					unit + " is selected");
			System.out.println("UNIT clicked");
			flag = false;
		}
		
		driver.context("FLUTTER");
		// driver.findElement(By.xpath("//android.widget.Button[@index='0']")).click();;
		
		return flag;
	}

	public void sleepTime(int timeout) {
		try {
			Thread.sleep(timeout);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
