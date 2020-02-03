package com.honeywell.keywords.lumina.common;

import java.util.ArrayList;
/*
 import com.honeywell.account.information.*;
import com.honeywell.commons.coreframework.*;
import com.honeywell.commons.mobile.MobileUtils;
import com.honeywell.commons.report.FailType;
import com.honeywell.lyric.das.utils.*;
import com.honeywell.lyric.utils.*;
import com.honeywell.screens.*;
 */


import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.resideo.lumina.utils.LuminaUtils;


public class NavigateToScreen extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;

	public ArrayList<String> screen;
	public boolean flag = true;

	public NavigateToScreen(TestCases testCase, TestCaseInputs inputs, ArrayList<String> screen) {
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
	@KeywordStep(gherkins = "^user navigates to \"(.+)\" screen from the \"(.+)\" screen$")
	public boolean keywordSteps() throws KeywordException {
		//System.out.println("1. User Navigates:");
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		//		if (screen.get(1).equalsIgnoreCase("Add New Device Dashboard")) {
		switch (screen.get(1).toUpperCase()) {
		case "ADD NEW DEVICE DASHBOARD":{
			//System.out.println("i. ADD NEW DEVICE");
			switch (screen.get(0).toUpperCase()) {
			case ("WATER LEAK DETECTOR SETUP"):{
				lumina.AddDevice("WATER LEAK DETECTOR SETUP");
				break;
			}
			case ("WATER CARD"):{
				lumina.ClickOnButton("DETECTOR NAME");
				//System.out.println("WC");
				break;
			}
			default : {
				flag = false;
			}
			}
			break;
		}
		// case "HOME":{  // Navigate to WLD Dashboard
		// 	switch (screen.get(0).toUpperCase()) {
		// 	case ("WATER LEAK DETECTOR"):{
		// 		lumina.ClickOnButton("DETECTOR NAME");
		// 		break;
		// 	}
		// 	default : {
		// 		flag = false;
		// 	}
		// 	}
		// 	break;
		// }
		case "WATER LEAK DETECTOR" :{
			switch (screen.get(0).toUpperCase()) {
			case ("SETTINGS OPTION"):{
				System.out.println("WLD");
				lumina.ClickOnButton("DETECTOR NAME");
				lumina.ClickOnButton("SETTINGS OPTION");
				break;
			}
			default : {
				flag = false;
			}
			}
			break;
		}
		case "SETTINGS" :{
			System.out.println("SETTINGS");
			switch (screen.get(0).toUpperCase()) {
			case ("MANAGE ALERTS"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("UPDATE FREQUENCY"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			case ("ABOUT MY DROPLET"):{
				lumina.ClickOnButton(screen.get(0).toUpperCase());
				break;
			}
			default : {
				flag = false;
			}
			}	
			break;
		}
		case "MANAGE ALERTS" :{
			System.out.println("MANAGE ALERT");
			switch (screen.get(0).toUpperCase()) {
			case ("WATER LEAK DETECTOR"):{
				for(int i=1;i<=2;i++) {
					flag = flag && lumina.ClickOnButton("BACK");
				}
				break;
			}
			default : {
				flag = false;
			}
			}	
			break;
		}
		default :{
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
