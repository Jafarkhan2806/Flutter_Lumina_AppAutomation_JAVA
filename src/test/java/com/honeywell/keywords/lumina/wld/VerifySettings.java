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

public class VerifySettings extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;

	

	public VerifySettings(TestCases testCase, TestCaseInputs inputs, DataTable dataTable) {
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
	@KeywordStep(gherkins = "^user should be displayed with the following Leak Detector Settings details:$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		for (int i = 0; i < dataTable.getSize(); i++) {
			switch (dataTable.getData(i, "Leak Detector Settings").trim().toUpperCase()) {
			case "MANAGE ALERTS":{
				lumina.VerifyScreen(dataTable.getData(i, "Leak Detector Settings"));
				break;
			}
			case "TEMPERATURE UNIT":{
				lumina.VerifyScreen(dataTable.getData(i, "Leak Detector Settings").toUpperCase());
				break;
			}
			case "UPDATE FREQUENCY":{
				lumina.VerifyScreen(dataTable.getData(i, "Leak Detector Settings").toUpperCase());
				break;
			}
			case "ABOUT MY DROPLET":{
				lumina.VerifyScreen(dataTable.getData(i, "Leak Detector Settings").toUpperCase());
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