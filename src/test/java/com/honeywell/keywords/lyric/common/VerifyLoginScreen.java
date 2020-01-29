package com.honeywell.keywords.lyric.common;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.lyric.utils.LyricUtils;

public class VerifyLoginScreen extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public VerifyLoginScreen(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user verifies login screen$")
	public boolean keywordSteps() {
		

		flag = flag && LyricUtils.VerifyLoginScreen(testCase, inputs);
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
