
package com.honeywell.keywords.lyric.common;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class CreateAccount extends Keyword {

	private TestCases testCase;
	
	public boolean flag = true;
	private TestCaseInputs inputs;

	public CreateAccount(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		this.inputs=inputs;
		
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user create account and activate$")
	public boolean keywordSteps() {


		flag=flag && LyricUtils.CreateAccount(testCase,inputs);
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
