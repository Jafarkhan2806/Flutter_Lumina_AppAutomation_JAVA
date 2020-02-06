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

public class SelectTemperatureScale extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;

	public SelectTemperatureScale(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user selects \"(.+)\" with \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		boolean flag = true;
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		if(parameters.get(0).equalsIgnoreCase("Temperature Unit")) {
			switch(parameters.get(1).toUpperCase()) {
			case ("CELCIUS"):{
				flag = flag && lumina.SetTempUnit("C");
				break;
			}
			case ("FAHRENHEIT"):{
				flag = flag && lumina.SetTempUnit("F");
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

