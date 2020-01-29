package com.honeywell.keywords.lyric.common;

import java.util.ArrayList ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordException ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.MobileUtils ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.screens.LoginScreen ;



public class TaponElement extends Keyword {

	private TestCases testCase;
	private ArrayList<String> expectedLocator;
	private TestCaseInputs inputs;
	private boolean flag=true;


	public TaponElement(TestCases testCase, TestCaseInputs inputs, ArrayList<String> expectedLocator) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.expectedLocator = expectedLocator;
	}


	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return true;
	}

	@Override
	@KeywordStep(gherkins = "^user taps on (.*)$")
	public boolean keywordSteps() throws KeywordException {
		//	if (testCase.isTestSuccessful()) {
		switch (expectedLocator.get(0).toUpperCase()) {
		
		
		case "OK BUTTON":{
			LoginScreen pc=new LoginScreen(testCase);
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if (pc.isOKButtonVisible()) {
					if (pc.clickOnOKButton()) {
						Keyword.ReportStep_Pass(testCase, "Tap On Ok Button : Successfully tapped on Ok Button");
					} else {
						flag = false;
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Tap On Yes Button : Failed to tap on Ok Button");
					}
				} else {
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Tap On Yes Button : Could not find Ok Button");
				}
			}
			else
			{
				Keyword.ReportStep_Pass(testCase, "Tap On Ok Button : For iOS OK button is not displayed.");
			}
			break;
		}
		
		case "LOGIN BUTTON":{
			LoginScreen ls=new LoginScreen(testCase);
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			
			if (ls.isLoginButtonVisible()) {
				flag = flag && ls.clickOnLoginButton();
			} else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
			}
				break;
		}
			
		default: {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,expectedLocator.get(0) + " input not handled");
		}
		}
		/*} else {
			flag = false;
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Scenario steps failed already, hence skipping the verification");
		}*/
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return flag;
	}
}
