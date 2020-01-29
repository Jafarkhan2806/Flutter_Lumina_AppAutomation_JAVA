package com.honeywell.keywords.lyric.common;

import java.io.File ;
import java.io.PrintWriter ;

import com.honeywell.CHIL.CHILUtil ;
import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.SuiteConstants ;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.LyricUtils ;

public class LoginToLyric extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public LoginToLyric(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		try {
			if (inputs.isInputAvailable("COLLECT_LOGS")) {
				if (inputs.getInputValue("COLLECT_LOGS").equalsIgnoreCase("true")) {
					File appiumLogFile = new File(SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
							"APPIUM_LOG_FILE_PATH"));
					PrintWriter writer = new PrintWriter(appiumLogFile);
					writer.print("");
					writer.close();
				}
			}
		} catch (Exception e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Failed to collect logs" + e.getMessage());
			
		}
		try
		{
			@SuppressWarnings("resource")
			CHILUtil chUtil = new CHILUtil(inputs);
			if (chUtil.getConnection()) {
				
					Keyword.ReportStep_Pass(testCase,"Activate passcode Using CHIL : Successfully enabled passcode using CHIL");
				
			}
		}
		catch(Exception e)
		{
			
		}
		
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user logs in to the Lyric application$")
	public boolean keywordSteps() {
		flag = flag && LyricUtils.launchAndLoginToApplication(testCase, inputs);
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
