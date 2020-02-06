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

public class VerifyLeakDetectorScreen extends Keyword {

	private TestCases testCase;
	private TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;

	

	public VerifyLeakDetectorScreen(TestCases testCase, TestCaseInputs inputs, DataTable dataTable) {
		this.testCase = testCase;
		this.dataTable = dataTable;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should be displayed with Leak Detector Card details:$")
	public boolean keywordSteps() throws KeywordException {
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		for (int i = 0; i < dataTable.getSize(); i++) {
			switch (dataTable.getData(i, "Card details").trim().toUpperCase()) {
			case "WATER LEAK DETECTED TITLE":{
				lumina.VerifyScreen(dataTable.getData(i, "Card details").toUpperCase());
				break;
			}
			case "TIME STAMP WITH DETECTOR NAME":{
				lumina.VerifyScreen(dataTable.getData(i, "Card details").toUpperCase());
				break;
			}
			case "MUTE OPTION":{
				lumina.VerifyScreen(dataTable.getData(i, "Card details").toUpperCase());
				break;
			}
			case "UNMUTE OPTION":{
				lumina.VerifyScreen(dataTable.getData(i, "Card details").toUpperCase());
				break;
			}
			case "CLOSE OPTION":{
				lumina.VerifyScreen(dataTable.getData(i, "Card details").toUpperCase());
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