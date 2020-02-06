package com.honeywell.keywords.lumina.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import com.honeywell.commons.bddinterface.DataTable;
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
import com.resideo.lumina.utils.LuminaUtils;

public class VerifyStatusOnScreen extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public ArrayList<String> expectedScreen;
	public boolean flag = true;
	public DataTable data;
	public HashMap<String, MobileObject> fieldObjects;
	private String currentStatus;

	public VerifyStatusOnScreen(TestCases testCase, TestCaseInputs inputs, ArrayList<String> expectedScreen) {
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
	@KeywordStep(gherkins = "^user should be displayed with \"(.+)\" as \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		switch (expectedScreen.get(1).toUpperCase()) {
		case "CELCIUS":{
			flag = lumina.GetTempUnit().contains("°C");
			if (flag = true) {
				Keyword.ReportStep_Pass(testCase,
						"Tempreture unit is displayed " + expectedScreen);
			} else{
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  expectedScreen);
			}
			break;
		}
		case "FAHRENHEIT":{
			flag = lumina.GetTempUnit().contains("°F");
			if (flag = true) {
				Keyword.ReportStep_Pass(testCase,
						"Tempreture unit is displayed " + expectedScreen);
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Could't navigate to " +  expectedScreen);
			}
			break;
		}
		case "SIREN STATUS":{
			if (lumina.GetSirenStatus().contains(expectedScreen.get(0))) {
				Keyword.ReportStep_Pass(testCase,
						"Siren Status is displayed " + expectedScreen.get(0));
			}else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
						"Siren Status is not displayed");
			}
			break;
		}
		case "UPDATE FREQUENCY":{
			switch (expectedScreen.get(0)){
			case "Daily":{
				flag = lumina.VerifyUpdateFrequency(expectedScreen.get(0));
				break;
			}
			case "Twice daily":{
				flag = lumina.VerifyUpdateFrequency(expectedScreen.get(0));
				break;
			}
			case"Three times Daily":{
				flag = lumina.VerifyUpdateFrequency(expectedScreen.get(0));
				break;
			}
			default:{
				flag = false;
			}
			}
			break;
		} case "DETECTOR NAME" :{
			if (expectedScreen.get(0).equalsIgnoreCase("Renamed")) {
				flag = flag && lumina.VerifyScreen("DETECTOR RENAMED");
			} else {
				flag = flag && lumina.VerifyScreen("DETECTOR NAME REVERTED");
			}
			break;
		}
		default:{
			flag = false;
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
