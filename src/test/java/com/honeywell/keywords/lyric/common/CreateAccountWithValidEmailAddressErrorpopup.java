package com.honeywell.keywords.lyric.common;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class CreateAccountWithValidEmailAddressErrorpopup extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public CreateAccountWithValidEmailAddressErrorpopup(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user Verify Create Account With Valid Email Address Error popup$")
	public boolean keywordSteps() {
		flag = flag && LyricUtils.CreateAccountWithValidEmailAddressErrorpopup(testCase , inputs);
		flag = flag && LyricUtils.CreateAccountWithFirstNameErrorPopup(testCase , inputs);
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
