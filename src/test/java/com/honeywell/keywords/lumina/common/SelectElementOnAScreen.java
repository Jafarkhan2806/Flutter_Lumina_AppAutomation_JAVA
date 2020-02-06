package com.honeywell.keywords.lumina.common;

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

public class SelectElementOnAScreen extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;

	public SelectElementOnAScreen(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user selects \"(.+)\" from \"(.+)\" screen$")
	public boolean keywordSteps() throws KeywordException {
		boolean flag = true;
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		if(parameters.get(1).equalsIgnoreCase("Choose Location")) {
			switch(parameters.get(0).toUpperCase()) {
			case ("LOCATION NAME"):{
				lumina.ClickOnButton(parameters.get(0).toUpperCase());
				break;
			}
			default : {
				flag = false;
			}	
			}
		}else if (parameters.get(1).equalsIgnoreCase("Detector Name")) {
			switch(parameters.get(0).toUpperCase()) {
			case ("DETECTOR NAME"):{
				lumina.ClickOnButton(parameters.get(0).toUpperCase());
				break;
			}
			default : {
				flag = false;
			}	
			}
		}else if (parameters.get(1).equalsIgnoreCase("CONNECT TO NETWORK")) {
			switch (parameters.get(0).toUpperCase()) {
			case "ADD A NETWORK": {
				lumina.ClickOnButton("addNew_network");
				break;
			}
			default: {
//				lumina.scrollToelement(parameters.get(0));
				lumina.ClickOnButton(parameters.get(0));
				lumina.ClickOnButton("password_textfield");
				break;
			}
			}
		} else if (parameters.get(1).equalsIgnoreCase("UPDATE FREQUENCY")) {
			switch (parameters.get(0).toUpperCase()) {
			case "DAILY": {
				lumina.ClickOnButton("Daily (Recommended)");
				break;
			}
			case "TWICE DAILY": {
				lumina.ClickOnButton(parameters.get(0));
				break;
			}
			case "THREE TIMES DAILY": {
				lumina.ClickOnButton(parameters.get(0));
				break;
			}
			default: {
				break;
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
