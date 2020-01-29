
package com.honeywell.keywords.lyric.common;

import com.honeywell.CHIL.CHILUtil ;
import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class LaunchLyricApplication extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;

	public boolean flag = true;

	public LaunchLyricApplication(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		try
		{
			if(inputs.isInputAvailable("USERID"))
			{
				@SuppressWarnings("resource")
				CHILUtil chUtil = new CHILUtil(inputs);
				if (chUtil.getConnection()) 
				{
				
					
						Keyword.ReportStep_Pass(testCase,"Activate passcode Using CHIL : Successfully enabled passcode using CHIL");
					
				}
			}
			
		}
		catch(Exception e)
		{
			
		}
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user launches lyric application$")
	public boolean keywordSteps() {
		
		flag = flag && LyricUtils.LaunchLyricApplication(testCase, inputs);
		
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
