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
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.utils.LuminaUtils;

public class VerifyAlertValues extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;

	public VerifyAlertValues(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user should be able to see \"(.+)\" updated automatically to \"(.+)\" than \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		boolean flag = true;
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		switch(parameters.get(0).toUpperCase()) {
		case ("ABOVE HUMIDITY VALUE"):{
			lumina.getAlertValues("Humidity");
			String abovehumValue = inputs.getInputValue("humAboveValue").replaceAll("%", "");
			String belowhumValue = inputs.getInputValue("humBelowValue").replaceAll("%", "");
			if (Integer.parseInt(belowhumValue) < Integer.parseInt(abovehumValue)) {
				Keyword.ReportStep_Pass(testCase,
						parameters.get(0).toUpperCase() +  "is "+ parameters.get(1).toUpperCase() +" the " + parameters.get(2).toUpperCase() );
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						parameters.get(0).toUpperCase() +  "is not " + parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase());
				flag = false;
			}
			break;
		}
		case ("BELOW HUMIDITY VALUE"):{
			lumina.getAlertValues("Humidity");
			String abovehumValue = inputs.getInputValue("humAboveValue").replaceAll("%", "");
			String belowhumValue = inputs.getInputValue("humBelowValue").replaceAll("%", "");	
			if (Integer.parseInt(belowhumValue) < Integer.parseInt(abovehumValue)) {
				Keyword.ReportStep_Pass(testCase,
						parameters.get(0).toUpperCase() +  " is "+ parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase() );
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						parameters.get(0).toUpperCase() +  " is not " + parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase());
				flag = false;
			}
			break;
		}
		case ("ABOVE TEMPERATURE VALUE"):{
			lumina.getAlertValues("Humidity");
			String abovehumValue = inputs.getInputValue("tempAboveValue").replaceAll("°F", "");
			String belowhumValue = inputs.getInputValue("tempBelowValue").replaceAll("°F", "");	
			if (Integer.parseInt(belowhumValue) < Integer.parseInt(abovehumValue)) {
				Keyword.ReportStep_Pass(testCase,
						parameters.get(0).toUpperCase() +  " is "+ parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase() );
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						parameters.get(0).toUpperCase() +  " is not " + parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase());
				flag = false;
			}			
			break;
		}
		case ("BELOW TEMPERATURE VALUE"):{
			lumina.getAlertValues("Humidity");
			String abovehumValue = inputs.getInputValue("tempAboveValue").replaceAll("°F", "");
			String belowhumValue = inputs.getInputValue("tempBelowValue").replaceAll("°F", "");	
			if (Integer.parseInt(belowhumValue) < Integer.parseInt(abovehumValue)) {
				Keyword.ReportStep_Pass(testCase,
						parameters.get(0).toUpperCase() +  " is "+ parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase() );
				flag = true;
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						parameters.get(0).toUpperCase() +  "is not " + parameters.get(1).toUpperCase() + " the " + parameters.get(2).toUpperCase());
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

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}


