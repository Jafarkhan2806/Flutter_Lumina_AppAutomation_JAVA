package com.honeywell.suiteExecutor;

import com.honeywell.commons.coreframework.SuiteUtils;

public class SuiteExecutor {

	public static void main(String[] commandLineArguments) throws Exception {

		commandLineArguments = new String[] {
				"--useXCUITest","true",
				"--publishResult", 
				"--deviceCloudProviderCredentials",
				"TestObject_Android::jafar.khan@honeywell.com:D28C3F1F16E84DF9BF23125334EE1C8B,"
						+ "TestObject_IOS::jafar.khan@honeywell.com:0B2963D64BBE404C8263CD1D57BF91D3,"
						+ "Pcloudy::jafar.khan@honeywell.com:s9wvg9nnr68yhsrwwj55cw42,"
						+ "Perfecto::lyricautomation@grr.la:Password1,"
						+ "SauceLabs::CIBamboo:c2ae0ade-53ed-47c5-bd4a-c65a77c7a096",
						"--jira_credentials","aterbuild:aterbuild@123",
						"--setResultFolder", "D:/ExecutionResultforJasper",
						"--appToInstall","IOS:DLS_RC_IOS_410_100,Android:DLS_DROID_RC_410_558",
						"--groups",
						"LoginAndLogout",
						
	
	
//						"--commandlinearguments","DLS_DR_JASPER_NA_IOS.txt",
						
					
		};

		try 
		{

			SuiteUtils suiteUtils = SuiteUtils.getTestSuite(commandLineArguments);
			suiteUtils.executeSuite();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

	}
}
