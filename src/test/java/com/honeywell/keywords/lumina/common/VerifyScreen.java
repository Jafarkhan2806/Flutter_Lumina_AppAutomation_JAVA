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
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("LOCATION ACCESS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CHOOSE LOCATION"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CREATE LOCATION"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("DETECTOR NAME"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("POWER DETECTOR"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("POWER DETECTORS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			
			case ("CONNECT"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SELECT NETWORK"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CONNECT WIFI"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("CONGRATULATIONS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("MANAGE ALERTS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SETUP COMPLETE"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("TEMPERATURE GRAPH"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("UPDATE FREQUENCY"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SETTINGS OPTION"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("SETTINGS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}case ("PLACEMENT OVERVIEW"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}case ("NO ALERTS"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case ("WATER LEAK DETECTED"):{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case "WATER LEAK DETECTED TITLE":{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case "SIREN STATUS":{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case "MUTE OPTION":{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case "UNMUTE OPTION":{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
				break;
			}
			case "ABOUT DEVICE":{
				flag = lumina.VerifyScreen(screen.get(0).toUpperCase());
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
