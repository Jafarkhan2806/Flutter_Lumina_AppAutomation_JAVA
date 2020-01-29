package com.honeywell.keywords.lyric.common;

import java.util.ArrayList ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordException ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.LyricUtils;

public class SetAirPlaneMode extends Keyword {

	public TestCases testCase;
	public TestCaseInputs inputs;
	public boolean flag = true;
	ArrayList<String> exampleData;

	public SetAirPlaneMode(TestCases testCase, TestCaseInputs inputs, ArrayList<String> exampleData) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.exampleData = exampleData;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user (.*) air plane mode of mobile$")
	public boolean keywordSteps() throws KeywordException {
		try {
			if(exampleData.get(0).equalsIgnoreCase("enable"))
			{
				if(LyricUtils.setAirPlaneMode(testCase , true))
				{
					Keyword.ReportStep_Pass(testCase, "Successfully: Airplane mode of mobile is enable.");
				}
				else
				{
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,"Not able set to Airplane mode of mobile is enable.");
					flag=false;
				}
			}
			else
			{
				if(LyricUtils.setAirPlaneMode(testCase , false))
				{
					Keyword.ReportStep_Pass(testCase, "Successfully: Airplane mode of mobile is disbale.");
				}
				else
				{
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,"Not able set to Airplane mode of mobile is disbale" );
					flag=false;
				}
			}
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,"Error occurred : " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}

	
}
