
package com.honeywell.keywords.lyric.common;

import java.util.ArrayList ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class CreateNewAccount extends Keyword {

	private TestCases testCase;
	public ArrayList<String> exampleData;
	public boolean flag = true;
	private TestCaseInputs inputs;

	public CreateNewAccount(TestCases testCase, TestCaseInputs inputs, ArrayList<String> exampleData) {
		this.testCase = testCase;
		this.inputs=inputs;
		this.exampleData = exampleData;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user create new account and verify \"(.+)\"$")
	public boolean keywordSteps() {

		if (exampleData.get(0).equalsIgnoreCase("old expiry link and latest link"))
		{
			flag=flag && LyricUtils.CreateAccountActivationLink(testCase,inputs,false);
		}
		else
		{
			flag=flag && LyricUtils.CreateAccountActivationLink(testCase,inputs,true);
		}
		
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
