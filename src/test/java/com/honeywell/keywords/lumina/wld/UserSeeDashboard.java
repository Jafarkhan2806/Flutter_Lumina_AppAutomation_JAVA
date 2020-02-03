package com.honeywell.keywords.lumina.wld;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.resideo.lumina.utils.LuminaUtils;


public class UserSeeDashboard extends Keyword  {

	private TestCaseInputs inputs;
	private TestCases testCase;


	public boolean flag = true;



	public UserSeeDashboard(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;

	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}
	@Override
	@KeywordStep(gherkins = "^user sees the wld dashboard$")
	public boolean keywordSteps() {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		lumina.VerifyScreen("TEMPERATURE VALUE");
		
		return flag;
	}
	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
