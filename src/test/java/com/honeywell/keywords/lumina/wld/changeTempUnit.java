package com.honeywell.keywords.lumina.wld;

import java.util.ArrayList;
import java.util.HashMap;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.MobileObject;
import com.resideo.lumina.utils.LuminaUtils;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidKeyCode;

public class changeTempUnit extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;
	public static AppiumDriver<MobileElement> driver;
	Temperature temp = Temperature.getInstance();

	public changeTempUnit(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
		this.parameters = parameters;
		this.inputs = inputs;
		this.testCase = testCase;
		
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user selects \"(.+)\" to \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		
		boolean flag = true;
		
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		Temperature t = Temperature.getInstance();
		float currentTempVal = t.getTemperatureVal();
		
		System.out.println("TEMPERATURE: "+ currentTempVal);
		
		if(parameters.get(0).equalsIgnoreCase("Temperature Unit")) {
			switch(parameters.get(1).toUpperCase()) {
				case ("CELCIUS"):{
					
					flag = flag && lumina.SetTemperatureUnitValue("C");
					System.out.println("C");
					double x = ( (currentTempVal- 32) * 5.0) / 9.0;
							//
					float newValue = (float) (Math.floor(x * 10) / 10.0);
					temp.setTempC(newValue);
					System.out.println("Celcius Val: "+temp.getC());
					break;
				}
				case ("FAHRENHEIT"):{
					flag = flag && lumina.SetTemperatureUnitValue("F");
					System.out.println("F");
					double x = ( 9 * (currentTempVal / 5)) + 32;
					float newValue = (float) (Math.floor(x * 10) / 10.0);
					temp.setTempF(newValue);
					System.out.println("Fah Val: "+temp.getF());
					break;
				}
				default : {
					flag = false;
				}	
			}
		}
		
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}


