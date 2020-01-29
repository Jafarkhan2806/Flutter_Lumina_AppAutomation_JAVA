package com.honeywell.keywords.lyric.common;

import java.util.ArrayList ;
import java.util.HashMap ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordException ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.MobileObject ;
import com.honeywell.commons.mobile.MobileUtils ;
import com.honeywell.commons.report.FailType ;

public class UserActionOnElement extends Keyword {

	public TestCases testCase;
	public TestCaseInputs inputs;
	public ArrayList<String> exampleData;
	public boolean flag = true;
	private String currentSwitchStatus;

	public UserActionOnElement(TestCases testCase, TestCaseInputs inputs,
			ArrayList<String> exampleData) {
		this.testCase = testCase;
		this.inputs = inputs;
		this.exampleData = exampleData;
	}

	@Override
	@BeforeKeyword
	public boolean preCondition() throws KeywordException {
		return flag;
	}

	@Override
	@KeywordStep(gherkins = "^user \"(.+)\" the \"(.+)\"$")
	public boolean keywordSteps() throws KeywordException {
		switch (exampleData.get(0)){
		case "enables":{
			if(exampleData.get(1).equalsIgnoreCase("Geofence This Location")){
				HashMap<String, MobileObject> fieldObjects = MobileUtils.loadObjectFile(testCase, "GeofenceManager");
				if(MobileUtils.isMobElementExists(fieldObjects,testCase,"GeofenceLocationButton")){
					if(!MobileUtils.isRunningOnAndroid(testCase)){
						currentSwitchStatus=MobileUtils.getMobElements(fieldObjects,testCase,"GeofenceLocationButton").get(2).getAttribute("value");
					}else{
						currentSwitchStatus=MobileUtils.getFieldValue(fieldObjects,testCase,"GeofenceLocationButton");
					}
					if(currentSwitchStatus.equalsIgnoreCase("OFF")||currentSwitchStatus.equalsIgnoreCase("0")){
						if(!MobileUtils.isRunningOnAndroid(testCase)){
							MobileUtils.getMobElements(fieldObjects,testCase,"GeofenceLocationButton").get(2).click();
							Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" enabled");
						}else{
							if(MobileUtils.clickOnElement(fieldObjects,testCase,"GeofenceLocationButton")){
								Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" enabled");
							}
						}
					}else if(currentSwitchStatus.equalsIgnoreCase("ON")||currentSwitchStatus.equalsIgnoreCase("1")){
						Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" enabled already");
					}else{
						Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE, exampleData.get(0)+" has value "+currentSwitchStatus);
						flag=false;
					}
				}else{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
					flag=false;
				} 
			}else{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Input not handled");
			}


			break;

		}
		case "disables":{
			if(exampleData.get(1).equalsIgnoreCase("Geofence This Location")){
				HashMap<String, MobileObject> fieldObjects = MobileUtils.loadObjectFile(testCase, "GeofenceManager");
				if(MobileUtils.isMobElementExists(fieldObjects,testCase,"GeofenceLocationButton")){
					if(!MobileUtils.isRunningOnAndroid(testCase)){
						currentSwitchStatus=MobileUtils.getMobElements(fieldObjects,testCase,"GeofenceLocationButton").get(2).getAttribute("value");
					}else{
						currentSwitchStatus=MobileUtils.getFieldValue(fieldObjects,testCase,"GeofenceLocationButton");
					}
					if(currentSwitchStatus.equalsIgnoreCase("ON")||currentSwitchStatus.equalsIgnoreCase("1")){
						if(!MobileUtils.isRunningOnAndroid(testCase)){
							MobileUtils.getMobElements(fieldObjects,testCase,"GeofenceLocationButton").get(2).click();
							Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" disabled");
						}else{
							if(MobileUtils.clickOnElement(fieldObjects,testCase,"GeofenceLocationButton")){
								Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" disabled");
							}
						}

					}else{
						/*Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE, exampleData.get(0)+" is found to be enabled");
					flag=false;*/
						Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" disabled already");
					}
				}else{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
					flag=false;
				} 
			}else{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Input not handled");
			}
			break;
		}

		case "accepts":{

			if(exampleData.get(1).equalsIgnoreCase("Disabling Geofencing popup")){
				HashMap<String, MobileObject> fieldObjects = MobileUtils.loadObjectFile(testCase, "GeofenceManager");
				if(!MobileUtils.isRunningOnAndroid(testCase)){
					if(MobileUtils.isMobElementExists(fieldObjects,testCase,"DisablingGeofence",false)){
						Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" displayed");
					}else{
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
						flag=false;
					} 
					if(MobileUtils.isMobElementExists(fieldObjects,testCase,"GeofenceDisableMessage",false)){
						Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" displayed");
					}else{
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
						flag=false;
					}
				}
				
				//correction req
				if(!MobileUtils.isRunningOnAndroid(testCase)){
					if(MobileUtils.isMobElementExists("name","OK",testCase,false)){
						Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" displayed");
						if(!MobileUtils.clickOnElement(testCase,"name","OK")){
							Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, exampleData.get(0)+" not clicked");
						}
					}else{
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
						flag=false;
					}
				}else
				if(MobileUtils.isMobElementExists(fieldObjects,testCase,"ConfirmGeofenceDisable",false)){
					Keyword.ReportStep_Pass(testCase, exampleData.get(0)+" displayed");
					if(!MobileUtils.clickOnElement(fieldObjects,testCase,"ConfirmGeofenceDisable")){
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, exampleData.get(0)+" not clicked");
					}
				}else{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,exampleData.get(0)+ "not displayed");
					flag=false;
				}

			}else{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Input not handled");
			}


			break;
		}
	
		default:{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Case Input not handled");
		}
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		return true;
	}
}
