package com.honeywell.keywords.lyric.common;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.lyric.utils.LyricUtils;

public class LaunchAndLoginToLyricWithoutClosingCoachMarks extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public LaunchAndLoginToLyricWithoutClosingCoachMarks(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user launches and logs in to the Lyric application without closing the coach marks$")
	public boolean keywordSteps() {
		flag = flag && LyricUtils.launchAndLoginToApplication(testCase, inputs, false);
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
