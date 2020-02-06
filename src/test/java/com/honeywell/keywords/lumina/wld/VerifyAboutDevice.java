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

public class VerifyAboutDevice extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;



	public VerifyAboutDevice(TestCases testCase, TestCaseInputs inputs, DataTable dataTable) {
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
	@KeywordStep(gherkins = "^user should be displayed with About Device details:$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		for (int i = 0; i < dataTable.getSize(); i++) {
			switch (dataTable.getData(i, "About Device").trim().toUpperCase()) {
			case "MAC ID":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			case "INSTALLED DAY":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			case "DETECTOR NAME TEXTFIELD":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			case "ONLINE STATUS":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			case "SIGNAL STRENGTH":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			case "BATTERY VALUE":{
				lumina.VerifyScreen(dataTable.getData(i, "About Device").toUpperCase());
				break;
			}
			default:{
				flag = false;
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
