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

public class VerifyAlertsInWLD extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;

	

	public VerifyAlertsInWLD(TestCases testCase, TestCaseInputs inputs, DataTable dataTable) {
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
	@KeywordStep(gherkins = "^user should be displayed with the following Manage Alert details:$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		for (int i = 0; i < dataTable.getSize(); i++) {
			switch (dataTable.getData(i, "Manage Alerts").trim().toUpperCase()) {
			case "TEMPERATURE ALERTS":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "TEMPERATURE ABOVE":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "TEMPERATURE BELOW":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "HUMIDITY ALERTS":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "HUMIDITY ABOVE":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "HUMIDITY BELOW":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "EMAIL DISABLED":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
				break;
			}
			case "PUSH ENABLED":{
				lumina.VerifyScreen(dataTable.getData(i, "Manage Alerts").toUpperCase());
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