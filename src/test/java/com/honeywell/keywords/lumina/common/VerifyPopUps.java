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


public class VerifyPopUps extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;
	
	public VerifyPopUps(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
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
	@KeywordStep(gherkins = "^user should be displayed with the \"(.*)\" popup$")
	public boolean keywordSteps() throws KeywordException {
		  LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch (screen.get(0).toUpperCase()) {
			case ("MOBILE LOCATION SERVICES IS OFF"):{
				lumina.VerifyPopUp(screen.get(0).toUpperCase());
				break;
			}
			case ("SAVE CHANGES"):{
				lumina.VerifyPopUp(screen.get(0).toUpperCase());
				break;
			}
			case ("DELETE DEVICE"):{
				lumina.VerifyPopUp(screen.get(0).toUpperCase());
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

