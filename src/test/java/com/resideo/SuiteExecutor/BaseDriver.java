package com.resideo.SuiteExecutor;

import java.net.URL;

import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.SuiteUtils;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;

public  class BaseDriver  {

	public AppiumDriver<MobileElement> driver;
	public WebDriverWait wait;
	private TestCaseInputs inputs;
	

	public AppiumDriver<MobileElement> setUp() throws Exception {
		if (SuiteConstants
				.getConstantValue(SuiteConstantTypes.TEST_SUITE, "Requirment_File_Name").contains("Android")) {
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability("platformVersion", "9"); // 8
			capabilities.setCapability("deviceName", "3242553131593098");
			capabilities.setCapability("noReset", true);
			capabilities.setCapability("app", "/Users/e844455/Documents/LANTERN_APP/LUMINA_APP/Android/Lumina_1_5_0_1426.apk");
			capabilities.setCapability("automationName", "Flutter");
			capabilities.setCapability("newCommandTimeout", "36000");
			
			driver = new AndroidDriver<MobileElement>(new URL("http://localhost:4723/wd/hub"), capabilities);
		} else{
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability("platformName", "iOS");
			capabilities.setCapability("platformVersion", "13.3");
			capabilities.setCapability("deviceName", "iPhone 11 Pro Max");
//			capabilities.setCapability("udid", "07842d39a65dc39b77bb5135de39ee205b98d39d");
			capabilities.setCapability("udid", "AF7ECEA5-4806-49F5-92D9-7F12499813BE");
			capabilities.setCapability("bundleId", "com.resideo.rezi.wld");
			capabilities.setCapability("noReset", true);
//			capabilities.setCapability("wdaLocalPort", "53367");
			capabilities.setCapability("app", "/Users/Resideo/Downloads/REZI_141_3000/Runner.ipa");
//			capabilities.setCapability("app", "/Users/Resideo/Downloads/Runner_WLD1/Runner.ipa");
			capabilities.setCapability("automationName", "Flutter");
			capabilities.setCapability("newCommandTimeout", "36000");
			driver = new IOSDriver<MobileElement>(new URL("http://localhost:4723/wd/hub"), capabilities);
		}
		//    driver = new IOSDriver<MobileElement>(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
		wait = new WebDriverWait(driver, 10);
		return driver ;
	}

}
