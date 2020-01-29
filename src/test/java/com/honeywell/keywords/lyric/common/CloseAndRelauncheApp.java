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
import com.honeywell.screens.Dashboard;

public class CloseAndRelauncheApp extends Keyword {
	public ArrayList<String> exampleData;
	HashMap<String, MobileObject> fieldObjects;
	public TestCases testCase;
	public TestCaseInputs inputs;
	public boolean flag = true;

	public CloseAndRelauncheApp(TestCases testCase, TestCaseInputs inputs, ArrayList<String> exampleData) {
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
	@KeywordStep(gherkins = "^user \"(.+)\" the application$")
	public boolean keywordSteps() throws KeywordException {
		
		try
		{
			if (exampleData.get(0).equalsIgnoreCase("foreground"))
			{
				testCase.getMobileDriver().launchApp() ;
				ReportStep_Pass(testCase , "App is in foreground/launched") ;
			}
			else if (exampleData.get(0).equalsIgnoreCase("background"))
			{
				testCase.getMobileDriver().closeApp() ;
				ReportStep_Pass(testCase , "App is in background/closed") ;
			}
			else if (exampleData.get(0).equalsIgnoreCase("minimize"))
			{
				if (!MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.minimizeApp(testCase , 10) ;
				}
				else
				{
					testCase.getMobileDriver().runAppInBackground(MobileUtils.getDuration(10000)) ;
				}
				ReportStep_Pass(testCase , "Minimize the App for 10 Sec.") ;
			}
			else if (exampleData.get(0).equalsIgnoreCase("launches 4 times"))
			{
				if (!MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.minimizeApp(testCase , 10) ;
					MobileUtils.minimizeApp(testCase , 10) ;
					MobileUtils.minimizeApp(testCase , 10) ;
					MobileUtils.minimizeApp(testCase , 10) ;
					
					
				}
				else
				{
					
					
					testCase.getMobileDriver().launchApp() ;
					testCase.getMobileDriver().closeApp() ;				
					testCase.getMobileDriver().launchApp() ;
					testCase.getMobileDriver().closeApp() ;
					testCase.getMobileDriver().launchApp() ;
					
					
					}
				ReportStep_Pass(testCase , "Minimize the App for 4 times") ;
			}
	
			else if(exampleData.get(0).toLowerCase().contains("background and foreground"))
			{
				String str=exampleData.get(0);
				String[]  array = str.split("\\s+");
			  
			       String data=array[3];
			     
			       try {
						for (int i = 0; i < Integer.parseInt(data); i++) 
							{
							MobileUtils.minimizeApp(testCase, 5);
							testCase.getMobileDriver().launchApp() ;
							Thread.sleep(5000);	
							
							
						}			
							
					} catch (Exception e) {
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
					} 
	
					
					Dashboard ds=new Dashboard(testCase);
					if(ds.isGlobalDrawerButtonVisible(5))
					{
						ReportStep_Pass(testCase , "Verified the App backgrounded & then foregrounded successfully.") ;
					}
					else if(ds.isWeatherIconVisible(5))
					{
						ReportStep_Pass(testCase , "Verified the App backgrounded & then foregrounded successfully.") ;
						
					}
					else
					{
						flag = false;
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
								"Unable to Verify App backgrounded & then foregrounded.");
					}
			}
			
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred: " + e.getMessage());
		}
		return flag;
	}

	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		
		return true;
	}
}
