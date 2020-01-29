package com.honeywell.keywords.lyric.common;

import java.util.ArrayList;
import java.util.HashMap;

import com.honeywell.commons.bddinterface.DataTable;
import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.MobileObject;
import com.honeywell.commons.report.FailType;
import com.honeywell.lyric.utils.InputVariables;
import com.honeywell.lyric.utils.LyricUtils;
import com.honeywell.screens.Dashboard;

public class VerifyScreen extends Keyword {

	private TestCases testCase;
	// private TestCaseInputs inputs;
	public ArrayList<String> expectedScreen;
	public boolean flag = true;
	public DataTable data;
	public HashMap<String, MobileObject> fieldObjects;
	public TestCaseInputs inputs;

	public VerifyScreen(TestCases testCase, TestCaseInputs inputs, ArrayList<String> expectedScreen) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.expectedScreen = expectedScreen;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should be displayed with the (.*) screen$")
	public boolean keywordSteps() throws KeywordException {
		try {
			switch (expectedScreen.get(0).toUpperCase()) {
			
			
			case "INVITER LOCATION ADDED WITH INVITED LOCATION ON": {


				Dashboard ds= new Dashboard(testCase);
				
			
				if(!inputs.getInputValue("LOCATION1_NAME").equalsIgnoreCase(inputs.getInputValue("INVITE_LOCATION_NAME")))
				{
					if(ds.getCureentLocation().equalsIgnoreCase(inputs.getInputValue("LOCATION1_NAME")))
					{
						Keyword.ReportStep_Pass(testCase, "User A location : "+ inputs.getInputValue("LOCATION1_NAME") + "is added to User B Location :" + inputs.getInputValue("INVITE_LOCATION_NAME"));

					}
				}
				else
				{

					String NLocation=inputs.getInputValue(InputVariables.Userblocation);
					String BL1=ds.getCureentLocation();
					
					if(!BL1.equalsIgnoreCase(NLocation))
					{
						
						String BL2=ds.getCureentLocation();
						if(BL2.equalsIgnoreCase(NLocation))
						{
							Keyword.ReportStep_Pass(testCase, "User A location is added to User B.");
						}
						else
						{
							flag = false;
							Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
									"User A location is not added to User B.");
						}
					}
					else
					{
						String BL2=ds.getCureentLocation();
						if(BL2.equalsIgnoreCase(NLocation))
						{
							Keyword.ReportStep_Pass(testCase, "User A location is added to User B.");
						}
						else
						{
							flag = false;
							Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
									"User A location is not added to User B.");
						}
					}
				}
				break;


			}
			
			
			default: {
				flag = false;
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Invalid Screen " + expectedScreen.get(0));
			}
			
			}
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred: " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
