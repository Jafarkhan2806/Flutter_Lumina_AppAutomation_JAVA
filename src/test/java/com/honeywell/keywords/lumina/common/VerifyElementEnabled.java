package com.honeywell.keywords.lumina.common;

import java.util.ArrayList;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.resideo.lumina.utils.LuminaUtils;


public class VerifyElementEnabled extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;
	
	public VerifyElementEnabled(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
		this.screen = screen;
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should be enabled with \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		  LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch (screen.get(0).toUpperCase()) {
			case ("THREE TIMES DAILY"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			case ("RECOMMENDED"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			case ("TEMPERATURE ALERTS"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			case ("HUMIDITY ALERTS"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			case ("HUMIDITY BELOW VALUE"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			case ("HUMIDITY ABOVE VALUE"):{
				lumina.ElementEnabled(screen.get(0));
				break;
			}
			default : {
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


