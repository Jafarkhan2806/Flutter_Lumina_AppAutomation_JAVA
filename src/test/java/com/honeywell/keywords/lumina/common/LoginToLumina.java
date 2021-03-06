package com.honeywell.keywords.lumina.common;


import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.utils.LuminaUtils;

public class LoginToLumina extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public LoginToLumina(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user launches and logs in to the Lumina application$")
	public boolean keywordSteps() {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		flag = flag && lumina.loginToLuminaApp();
		if (flag == true) 
		{
			Keyword.ReportStep_Pass(testCase,
					"Logged into the Account  : " + inputs.getInputValue("USERID"));
		} 
		else
		{
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , "Could't login to the account : " + inputs.getInputValue("USERID"));
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() 
	{
		return flag;
	}

}
