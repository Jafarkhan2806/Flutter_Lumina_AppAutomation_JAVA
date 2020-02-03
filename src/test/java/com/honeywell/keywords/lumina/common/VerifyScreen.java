package com.honeywell.keywords.lumina.common;


import java.util.ArrayList;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.utils.LuminaUtils;


public class VerifyScreen extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;
	
	public VerifyScreen(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
		this.screen = screen;
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user should be displayed with the \"(.+)\" screen$")
	public boolean keywordSteps() throws KeywordException {
		  LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch (screen.get(0).toUpperCase()) {
			case ("WATER LEAK DETECTOR SETUP"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("LOCATION ACCESS"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CHOOSE LOCATION"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CREATE LOCATION"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("DETECTOR NAME"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("POWER DETECTOR"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("POWER DETECTORS"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			
			case ("CONNECT"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SELECT NETWORK"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CONNECT WIFI"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CONGRATULATIONS"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("MANAGE ALERTS"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SETUP COMPLETE"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("TEMPERATURE GRAPH"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("UPDATE FREQUENCY"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SETTINGS OPTION"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}case ("PLACEMENT OVERVIEW"):{
				lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			
			default : {
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
