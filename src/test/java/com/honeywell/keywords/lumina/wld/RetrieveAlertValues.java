package com.honeywell.keywords.lumina.wld;


import java.util.ArrayList;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.utils.LuminaUtils;


public class RetrieveAlertValues extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;

	public RetrieveAlertValues(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
		this.screen = screen;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user retrieve \"(.+)\" alert Values$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		switch (screen.get(0).toUpperCase()) {
		case "HUMIDITY":{
			lumina.getAlertValues(screen.get(0));
			break;
		}
		case "TEMPERATURE":{
			lumina.getAlertValues(screen.get(0));
			break;
		}
		default : {
			flag = true;
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

