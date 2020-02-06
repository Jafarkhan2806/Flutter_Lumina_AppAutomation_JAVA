package com.resideo.screens;


import java.io.File;
import java.time.Duration;
import java.util.List;
import static org.junit.Assert.assertEquals;


import org.openqa.selenium.OutputType;
import org.openqa.selenium.support.ui.FluentWait;

import com.google.common.base.Function;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.CustomDriver;
import com.honeywell.commons.mobile.MobileUtils;
import com.resideo.SuiteExecutor.BaseDriver;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import pro.truongsinh.appium_flutter.FlutterFinder;
import pro.truongsinh.appium_flutter.finder.FlutterElement;

@SuppressWarnings({ "unused" })
public  class FlutterElements extends BaseDriver {

	private FlutterFinder find;
	private TestCases testCase;

	public  AppiumDriver<MobileElement> setUp() throws Exception {
		super.setUp();
		find = new FlutterFinder(driver);
		assertEquals(driver.executeScript("flutter:checkHealth"), "ok");
		driver.executeScript("flutter:clearTimeline");
		
		
		driver.executeScript("flutter:forceGC");
		return driver;
	}

	public void clickElementByText(String elements) {
		find.text(elements).click();
	}

	public void clickElementBySemanticsLabel(String elements) {
		 find.bySemanticsLabel(elements).click();
	}

	public void clickElementByTooltip( String elements) {
		find.byTooltip(elements).click();
	}

	public void clickElementbyValueKey( String elements) {
		find.byValueKey(elements).click();
	}

	public void isElementExistByText(String elements) throws InterruptedException {
		find.text(elements);
	}

	public void isElementExistBySemanticsLabel(String elements) {
		find.bySemanticsLabel(elements);
	}

	public void isElementExistByTooltip(String elements) {
		find.byTooltip(elements);
	}

	public void isElementExistByValueKey( String elements) {
		find.byValueKey(elements);
	}


	public String getElementStringByText( String elements) {
		return find.text(elements).getText();
	}

	public String getElementStringByValueKey( String elements) {
		return find.byValueKey(elements).getText();
	}

	public void swicthContext( String Context) {
		driver.context(Context);
	}

	public void clickElementByXpath(String elements) {
		if (driver.findElementByXPath("//*[@text='"+elements+"']").isDisplayed()) {
		driver.findElementByXPath("//*[@text='"+elements+"']").click();
		} else {
			driver.findElementByXPath("//*[@name='"+elements+"']").click();
		}
	}

	public void clickElementsByXpath(String elements , int index) {
		if (driver.findElementsByXPath("//*[@text='"+elements+"']").get(index).isDisplayed()) {
		List<MobileElement> ele = driver.findElementsByXPath("//*[@text='"+elements+"']");
		ele.get(index).click();
		} else {
			List<MobileElement> ele = driver.findElementsByXPath("//*[@name='"+elements+"']");
			ele.get(index).click();	
		}
	}

	@SuppressWarnings("deprecation")
	public String enterEmailID(String input ) {
		driver.getKeyboard().sendKeys(input);
		return input;
	}

	@SuppressWarnings("deprecation")
	public String enterPassword(String input ) {
		driver.getKeyboard().sendKeys(input);
		return input;
	}

	public void hideKeyboard() {
		driver.hideKeyboard();
	}


}
