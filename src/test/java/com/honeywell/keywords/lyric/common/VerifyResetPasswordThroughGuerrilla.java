
package com.honeywell.keywords.lyric.common;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class VerifyResetPasswordThroughGuerrilla extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;


	public boolean flag = true;

	public VerifyResetPasswordThroughGuerrilla(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		this.inputs=inputs;

	}
	
	
	@Override
	@BeforeKeyword
	public boolean preCondition() {
	//	flag =flag &&  LyricUtils.closeAppLaunchPopupsLocal(testCase);
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user tries to log in with an invalid password$")
	public boolean keywordSteps() {
		
		flag = flag && LyricUtils.VerifyResetPasswordThroughGuerrilla(testCase,inputs);
		
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
