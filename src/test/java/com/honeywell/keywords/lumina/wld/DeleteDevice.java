package com.honeywell.keywords.lumina.wld;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.TITAN.AuthLoginWeb;
import com.resideo.TITAN.TITANUtil;
import com.resideo.lumina.utils.LuminaUtils;
import com.resideo.lumina.utils.LyricUtils;


public class DeleteDevice extends Keyword  {

	private TestCaseInputs inputs;
	private TestCases testCase;


	public boolean flag = true;



	public DeleteDevice(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;

	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}
	@Override
	@KeywordStep(gherkins = "^user deletes WLD Device from App$")
	public boolean keywordSteps() {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		flag = flag && lumina.DeleteDevice();
		if (flag == true) {
			Keyword.ReportStep_Pass(testCase,
					"Logged into the Account  : " + inputs.getInputValue("USERID"));
		} else {
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , "Could't login to the account : " + inputs.getInputValue("USERID"));
		}
		return flag;
	}
	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
