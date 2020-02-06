package com.honeywell.keywords.lumina.wld;

import java.util.ArrayList;

import com.honeywell.commons.bddinterface.DataTable;
import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.resideo.lumina.utils.LuminaUtils;

import pro.truongsinh.appium_flutter.FlutterFinder;

public class VerifyDashboard extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;

	

	public VerifyDashboard(TestCases testCase, TestCaseInputs inputs, DataTable dataTable) {
		this.testCase = testCase;
		this.screen = screen;
		this.dataTable = dataTable;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should be displayed with the following Water Leak Detector details:$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		for (int i = 0; i < dataTable.getSize(); i++) {
			switch (dataTable.getData(i, "Water Leak Detector").trim().toUpperCase()) {
			case "DEVICE NAME":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector"));
				break;
			}
			case "SETTINGS OPTION":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "TEMPERATURE VALUE":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "HUMIDITY VALUE":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "Connection Status":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "LAST UPDATED TIME":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "BATTERY PERCENTAGE":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			case "NEXT UPDATE TIME":{
				lumina.VerifyScreen(dataTable.getData(i, "Water Leak Detector").toUpperCase());
				break;
			}
			default:{
			}

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
