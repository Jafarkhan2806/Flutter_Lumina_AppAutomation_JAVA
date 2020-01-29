package com.honeywell.keywords.lyric.common;

import java.util.ArrayList;
import java.util.HashMap;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.MobileObject;
import com.honeywell.commons.mobile.MobileUtils;
import com.honeywell.commons.report.FailType;
import com.honeywell.lyric.utils.LyricUtils;

public class VerifyNotConfigurable extends Keyword {

	private TestCases testCase;
	// private TestCaseInputs inputs;
	public ArrayList<String> expectedButton;
	public boolean flag = true;
	private HashMap<String, MobileObject> fieldObjects;

	public VerifyNotConfigurable(TestCases testCase, TestCaseInputs inputs, ArrayList<String> expectedButton) {
		this.testCase = testCase;
		// this.inputs = inputs;
		this.expectedButton = expectedButton;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should not be able to configure (.*)$")
	public boolean keywordSteps() throws KeywordException {
		switch (expectedButton.get(0).toUpperCase()) {
		case "ZWAVE DEVICE FROM ADD DEVICE LIST": {
			fieldObjects = MobileUtils.loadObjectFile(testCase, "AddNewDevice");
			try {
				LyricUtils.scrollToElementUsingExactAttributeValue(testCase,"name","ZWAVE Device");
			} catch (Exception e) {
				Keyword.ReportStep_Fail(testCase , FailType.FUNCTIONAL_FAILURE ,e.getMessage()) ;
			}
			flag = flag && !MobileUtils.isMobElementExists(fieldObjects, testCase, "ZwaveList");
			break;
		}
		case "ZWAVE DEVICE FROM GLOBAL DRAWER MENU": {
			fieldObjects = MobileUtils.loadObjectFile(testCase, "AddNewDevice");
			flag = flag && !MobileUtils.isMobElementExists(fieldObjects, testCase, "ZwaveMenu");
			break;
		}
		default: {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Invalid Input: " + expectedButton.get(0).toUpperCase());
		}
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
