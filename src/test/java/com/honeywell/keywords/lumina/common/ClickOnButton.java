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


public class ClickOnButton extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public ArrayList<String> screen;
	public boolean flag = true;
	
	public ClickOnButton(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
		this.screen = screen;
		this.inputs = inputs;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user clicks on \"(.+)\" button$")
	public boolean keywordSteps() throws KeywordException {
		  LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch (screen.get(0).toUpperCase()) {
			case ("NEXT"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("ALLOW"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("YES"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("NO"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("CREATE LOCATION"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("DONE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("BACK"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("CLOSE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("WATER LEAK ALERT"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("MUTE SIREN"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("UNMUTE OPTION"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("ABOVE HUMIDITY RANGE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("BELOW HUMIDITY RANGE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("ABOVE TEMPERATURE RANGE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("BELOW TEMPERATURE RANGE"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("DELETE LEAK DETECTOR"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			default : {
				lumina.ClickOnButton(screen.get(0));
				flag = true;
				break;
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
