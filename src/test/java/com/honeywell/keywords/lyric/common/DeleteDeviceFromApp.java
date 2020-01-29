package com.honeywell.keywords.lyric.common;

import java.util.ArrayList;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.honeywell.lyric.utils.LyricUtils;

public class DeleteDeviceFromApp extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public ArrayList<String> parameters;
	public boolean flag = true;

	public DeleteDeviceFromApp(TestCases testCase, TestCaseInputs inputs,
			ArrayList<String> parameters) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.parameters = parameters;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user deletes (.*) (.*) from (.*) through the application$")
	public boolean keywordSteps() throws KeywordException {
		try {
			if (parameters.get(1).equalsIgnoreCase("DAS")) {
				try
				{
					/*flag = flag & dasDIY.deleteDASDeviceThroughApp(testCase,
							inputs, parameters.get(0));*/
				}
				catch(Exception e)
				{
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Failed to delete from app. Error occurred: " + e.getMessage());
				}
				if (flag) {
					Keyword.ReportStep_Pass(testCase,
							"Successfully deleted DAS Device through UI");
					flag = flag && LyricUtils.verifyDeviceNotDisplayedOnDashboard(testCase, inputs, parameters.get(1));
				} else {
					flag = false;
					Keyword.ReportStep_Fail(testCase,
							FailType.FUNCTIONAL_FAILURE,
							"Failed to delete DAS device through UI");
					/*if (DASRegistrationUtils.deleteDASDeviceThroughCHIL(
							testCase, inputs, parameters.get(2))) {
						Keyword.ReportStep_Pass(testCase,
								"Successfully deleted DAS Device through CHIL");
					} else {
						flag = false;
						Keyword.ReportStep_Fail(testCase,
								FailType.FUNCTIONAL_FAILURE,
								"Failed to delete DAS device through CHIL");
					}*/

				}
			}
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Error occurred : " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
