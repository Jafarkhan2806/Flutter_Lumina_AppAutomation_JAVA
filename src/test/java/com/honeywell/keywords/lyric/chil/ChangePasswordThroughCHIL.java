package com.honeywell.keywords.lyric.chil;

import com.honeywell.CHIL.CHILUtil ;
import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordException ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;

public class ChangePasswordThroughCHIL extends Keyword {

	public TestCases testCase;
	public TestCaseInputs inputs,newinputs;
	public boolean flag = true;
	
	public static String OLD_PASSWORD="oldpassword";
	public static String NEW_PASSWORD="newpassword";

	public ChangePasswordThroughCHIL(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@SuppressWarnings("resource")
	@Override
	@KeywordStep(gherkins = "^user change password using CHIL$")
	public boolean keywordSteps() throws KeywordException {
		try {
			CHILUtil chUtil = new CHILUtil(inputs);
			if (chUtil.getConnection()) 
			{

				int result=chUtil.changePassword(testCase, inputs, chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME")), inputs.getInputValue(ChangePasswordThroughCHIL.OLD_PASSWORD),inputs.getInputValue(ChangePasswordThroughCHIL.NEW_PASSWORD));
				if (result == 200) 
				{
					Keyword.ReportStep_Pass(testCase, "Change Password Through CHAPI : Successfully changed Password to " + inputs.getInputValue(ChangePasswordThroughCHIL.NEW_PASSWORD));
				} 
				else
				{
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Change Password Through CHAPI : Failed to change Password. Old password is : " + inputs.getInputValue(ChangePasswordThroughCHIL.OLD_PASSWORD));
				}
				try 
				{
					chUtil.close();
				} catch (Exception e) 
				{
					
				}
			}
		} 
		catch (Exception e) 
		{
			flag = false;
			ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Cancel Away : Error Occured while executing keyword : " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		try {
			if (flag) {
				ReportStep_Pass(testCase, "Change Password Through CHAPI : Keyword successfully executed");
			} else {
				flag = false;
				ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Change Password Through CHAPI : Keyword failed during execution");
			}
		} catch (Exception e) {
			flag = false;
			ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Change Password Through CHAPI : Error Occured while executing post-condition : " + e.getMessage());
		}
		return flag;
	}
}
