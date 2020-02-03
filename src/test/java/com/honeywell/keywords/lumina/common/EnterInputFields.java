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

public class EnterInputFields extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;

	public EnterInputFields(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user inputs \"(.+)\" in the \"(.+)\" screen$")
	public boolean keywordSteps() throws KeywordException {
		boolean flag = true;
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		if (parameters.get(1).equalsIgnoreCase("Create Location")) {
			switch (parameters.get(0).toUpperCase()) {
			case ("LOCATION NAME"):{
				lumina.EnterTestInputs(parameters.get(0).toUpperCase());
				break;
			}
			case ("VALID ZIP CODE"):{
				lumina.EnterTestInputs(parameters.get(0).toUpperCase());
				break;
			}
			default : {
				lumina.EnterTestInputs(parameters.get(0));
				flag = false;
			}
			}
		} else if (parameters.get(1).equalsIgnoreCase("Password")) {
			lumina.EnterTestInputs(parameters.get(0));
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}

