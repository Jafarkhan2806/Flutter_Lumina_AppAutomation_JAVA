package com.honeywell.keywords.lumina.wld;

import java.util.ArrayList;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.relayutils.SerialComm;
import com.resideo.lumina.utils.LuminaUtils;


public class EnrollWLD extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;
	
	public EnrollWLD(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
		this.screen = screen;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user \"(.+)\" wld device$")
	public boolean keywordSteps() throws KeywordException {
		  LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch (screen.get(0).toUpperCase()) {
			case ("ENROLL"):{
			//	SerialComm.Trigger("WLD_open");
				lumina.enrollWld(testCase, inputs, screen.get(0).toUpperCase());
				Keyword.ReportStep_Pass(testCase, "BLE BROADCAST Started in the device ");
				break;
			}
			case ("DISCONNECT"):{
			//	SerialComm.Trigger("WLD_close");
				lumina.enrollWld(testCase, inputs, screen.get(0).toUpperCase());
				Keyword.ReportStep_Pass(testCase, "BLE BROADCAST disconnected in the device ");
				break;
			}
			default : {
				flag = true;
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
