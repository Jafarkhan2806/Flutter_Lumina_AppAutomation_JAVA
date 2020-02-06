package com.honeywell.keywords.lumina.wld;

import java.util.ArrayList;
import java.util.HashMap;


import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.MobileObject;
import com.resideo.lumina.utils.LuminaUtils;

public class EnableDisable_Switch extends Keyword {

	private TestCaseInputs inputs;
	private TestCases testCase;
	public boolean flag = true;
	public ArrayList<String> parameters;
	public HashMap<String, MobileObject> fieldObjects;

	public EnableDisable_Switch(TestCases testCase, TestCaseInputs inputs, ArrayList<String> parameters) {
		this.parameters = parameters;
		this.inputs = inputs;
		this.testCase = testCase;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user \"(.+)\" the \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		boolean flag = true;
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
			switch(parameters.get(0).toUpperCase()) {
			case ("ENABLES"):{
				if (parameters.get(1).equals("Humidity Alerts")) {
					lumina.ClickOnButton("humidity_switchfalse");
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				} else if (parameters.get(1).equals("Temperature Alerts")){
					lumina.ClickOnButton("temp_switchfalse");
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				} else if (parameters.get(1).equals("Email Notification")) {
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					lumina.ClickOnButton("checkbox_emailfalse");
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				}
				break;
			}
			case ("DISABLES"):{
				if (parameters.get(1).equals("Humidity Alerts")) {
					lumina.ClickOnButton("humidity_switchtrue");
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				} else if (parameters.get(1).equals("Temperature Alerts")){
					lumina.ClickOnButton("temp_switchtrue");
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				} else if (parameters.get(1).equals("Email Notification")) {
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					lumina.ClickOnButton("checkbox_emailtrue");
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Keyword.ReportStep_Pass(testCase, parameters.get(0) + " is selected");
					flag = true;
				}
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

