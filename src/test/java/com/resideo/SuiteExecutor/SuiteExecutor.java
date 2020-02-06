package com.resideo.SuiteExecutor;

import com.honeywell.commons.coreframework.SuiteUtils;

public class SuiteExecutor {    
	/**
	 * The Starting point of Automation Framework.
	 *
	 * @param groups
	 *            String[] array type, represents the groups to execute passed
	 *            from Command line Arguments.
	 */
	public static void main(String[] commandLineArguments) throws Exception {
		commandLineArguments = new String[] 
				{ 
				"--useXCUITest","true",
//				"--publishResult", 
				"--deviceCloudProviderCredentials",
				"TestObject_Android::jafar.khan@honeywell.com:D28C3F1F16E84DF9BF23125334EE1C8B,"
						+ "TestObject_IOS::jafar.khan@honeywell.com:0B2963D64BBE404C8263CD1D57BF91D3,"
						+ "Pcloudy::jafar.khan@honeywell.com:s9wvg9nnr68yhsrwwj55cw42,"
						+ "Perfecto::lyricautomation@grr.la:Password1,"
						+ "SauceLabs::CIBamboo:c2ae0ade-53ed-47c5-bd4a-c65a77c7a096",
						"--jira_credentials","aterbuild:aterbuild@123",
						"--setResultFolder", "ExecutionResult",
						"--appToInstall","IOS:Dummy,Android:Debug",
						"--groups",
						"LoginToApplication",
						
	
	
//						"--commandlinearguments","DLS_DR_JASPER_NA_IOS.txt",
				

				
		};
		try 
		{
			SuiteUtils suiteUtils = SuiteUtils.getTestSuite(commandLineArguments);
			suiteUtils.executeSuite();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
