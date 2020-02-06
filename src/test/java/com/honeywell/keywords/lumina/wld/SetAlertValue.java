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

public class SetAlertValue extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;

	public SetAlertValue(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user selects \"(.+)\" value \"(.+)\" than \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		switch (parameters.get(0).toUpperCase()) {
		case "ABOVE HUMIDITY":{
			if(parameters.get(1).equalsIgnoreCase("Below")) {
				String belowValue = inputs.getInputValue("humBelowValue").replaceAll("%", "");
				String setValue = String.valueOf(Integer.valueOf(belowValue) - 5)+ "%";
				lumina.scrollUpToelement(setValue);
				lumina.ClickOnButton(setValue);
			}
			break;
		}
		case "BELOW HUMIDITY":{
			if(parameters.get(1).equalsIgnoreCase("Above")) {
				String aboveValue = inputs.getInputValue("humAboveValue").replaceAll("%", "");
				String setValue = String.valueOf(Integer.valueOf(aboveValue) + 5)+ "%";
				lumina.scrollUpToelement(setValue);
				lumina.ClickOnButton(setValue);
			}
			break;
		}
		case "ABOVE TEMPERATURE":{
			if(parameters.get(1).equalsIgnoreCase("Below")) {
				String belowValue = inputs.getInputValue("tempBelowValue").replaceAll("°F", "");
				String setValue = String.valueOf(Integer.valueOf(belowValue) - 5)+ "°F";
				lumina.scrollDownToelement(setValue);
				lumina.ClickOnButton(setValue);
			}
			break;
		}
		case "BELOW TEMPERATURE":{
			if(parameters.get(1).equalsIgnoreCase("Above")) {
				String belowValue = inputs.getInputValue("tempAboveValue").replaceAll("°F", "");
				String setValue = String.valueOf(Integer.valueOf(belowValue) - 5)+ "°F";
				lumina.scrollUpToelement(setValue);
				lumina.ClickOnButton(setValue);
			}
			break;
		}
		default :{

			break;
		}
		}
		return flag;
	}

	private String valueOf(int i) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
