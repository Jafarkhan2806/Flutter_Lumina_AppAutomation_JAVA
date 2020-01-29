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
import com.honeywell.lyric.utils.ADBUtils;

public class DeleteAndRebootDASDevice extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public ArrayList<String> parameters;
	public boolean flag = true;
	public static long rebootStartTimer;

	public DeleteAndRebootDASDevice(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
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
	@KeywordStep(gherkins = "^user DAS device with ADB ID (.*) is deregistered and booted$")
	public boolean keywordSteps() throws KeywordException {
		try {
			inputs.setInputValue("DAS_DEVICE_UDID", parameters.get(0), false);
			// ADBUtils.deregisterDASDevice(parameters.get(0));
			ADBUtils.clearLogcatLogs(parameters.get(0));
			ADBUtils.deleteDASDeviceCFAFiles(parameters.get(0));
			ADBUtils.rebootDASDevice(parameters.get(0));
			rebootStartTimer = System.currentTimeMillis();
			// Thread.sleep(90000);
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
