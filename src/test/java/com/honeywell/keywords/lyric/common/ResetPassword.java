package com.honeywell.keywords.lyric.common;

import java.util.ArrayList ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.LyricUtils ;

public class ResetPassword extends Keyword {

	private TestCases testCase;
	public boolean flag = true;
	private TestCaseInputs inputs;
	public ArrayList<String> exampleData;

	public ResetPassword(TestCases testCase, TestCaseInputs inputs,ArrayList<String> exampleData) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.exampleData = exampleData;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user reset the password and verify password link and Login check with \"(.+)\"$$")
	public boolean keywordSteps() {
		try {
			if (exampleData.get(0).equalsIgnoreCase("old password"))
			{
				inputs.setInputValue("NEWPASSWORD", "Password123", false);
				inputs.setInputValue("VERIFYPASSWORD", "Password1", false);
				LyricUtils.resetPassword(testCase , inputs, exampleData.get(0));
			}
			else if (exampleData.get(0).equalsIgnoreCase("New password"))
			{
				inputs.setInputValue("NEWPASSWORD", "Password123", false);
				inputs.setInputValue("ORIPASSWORD", inputs.getInputValue("PASSWORD").toString(), false);
				//inputs.setInputValue("VERIFYPASSWORD", inputs.getInputValue("PASSWORD").toString(), false);
				LyricUtils.resetPassword(testCase , inputs, exampleData.get(0));
			}
		} catch (Exception e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Exception : Update And Save Geofence :" + e.getMessage());
		}

		return flag;
	}

	/*
	 * ========================================After
	 * method============================================================= Check
	 * if the Keyword has been executed successfully.
	 * =========================================================================
	 * ==========================================
	 */
	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}
}
