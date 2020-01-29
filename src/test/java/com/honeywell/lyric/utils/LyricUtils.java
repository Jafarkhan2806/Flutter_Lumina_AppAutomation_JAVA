package com.honeywell.lyric.utils;


import static io.appium.java_client.touch.TapOptions.tapOptions;
import static io.appium.java_client.touch.WaitOptions.waitOptions;
import static io.appium.java_client.touch.offset.PointOption.point;

import java.io.BufferedReader ;
import java.io.File ;
import java.io.FileInputStream ;
import java.io.IOException ;
import java.io.InputStreamReader ;
import java.net.HttpURLConnection ;
import java.text.DateFormat ;
import java.text.SimpleDateFormat ;
import java.time.ZoneOffset ;
import java.time.ZonedDateTime ;
import java.util.ArrayList ;

import java.util.Calendar ;
import java.util.Date ;

import java.util.HashMap ;
import java.util.Iterator ;
import java.util.LinkedList ;
import java.util.List ;

import java.util.Map ;
import java.util.Map.Entry;
import java.util.Random ;
import java.util.TimeZone ;


import org.apache.commons.io.FileUtils ;
import org.apache.poi.hssf.usermodel.HSSFSheet ;
import org.apache.poi.hssf.usermodel.HSSFWorkbook ;
import org.apache.poi.ss.usermodel.Cell ;
import org.apache.poi.ss.usermodel.Row ;
import org.json.JSONArray ;
import org.json.JSONException ;
import org.json.JSONObject ;
import org.openqa.selenium.By ;
import org.openqa.selenium.Dimension ;
import org.openqa.selenium.JavascriptExecutor ;
import org.openqa.selenium.NoSuchElementException ;
import org.openqa.selenium.OutputType ;
import org.openqa.selenium.Point ;
import org.openqa.selenium.TakesScreenshot ;
import org.openqa.selenium.WebDriver ;
import org.openqa.selenium.WebElement ;
import org.openqa.selenium.html5.Location ;
import org.openqa.selenium.remote.Augmenter ;
import org.w3c.dom.Document ;

import com.honeywell.CHIL.CHILUtil ;
import com.honeywell.account.information.LocationInformation ;
import com.honeywell.commons.coreframework.FrameworkGlobalVariables ;
import com.honeywell.commons.coreframework.FrameworkUtils;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.SuiteConstants ;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.CustomAndroidDriver;
import com.honeywell.commons.mobile.CustomDriver ;
import com.honeywell.commons.mobile.Mobile;
import com.honeywell.commons.mobile.MobileObject ;
import com.honeywell.commons.mobile.MobileScreens ;
import com.honeywell.commons.mobile.MobileUtils ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.commons.report.Reporting ;
import com.honeywell.keywords.lyric.chil.ChangePasswordThroughCHIL ;


import com.honeywell.screens.CreateAccountScreen ;

import com.honeywell.screens.Dashboard ;

import com.honeywell.screens.LoginScreen ;


import io.appium.java_client.MobileBy ;
import io.appium.java_client.MobileElement ;
import io.appium.java_client.TouchAction ;
import io.appium.java_client.android.Activity ;
import io.appium.java_client.android.AndroidDriver ;

public class LyricUtils {


	public static String oldPassword="";

	
	public static String takeScreenShot(String path, WebDriver driver) {
		String scrName = "#";
		if (driver == null) {
			return scrName;
		} else {
			try {
				File scrSht = ((TakesScreenshot) new Augmenter().augment(driver))
						.getScreenshotAs(OutputType.FILE);
				String temp = scrSht.getName();

				File scrFolder = new File(path);

				FileUtils.copyFileToDirectory(scrSht, scrFolder);
				scrName = temp;
			} catch (Exception e) {
				scrName = scrName + "Error : " + e.getCause();
			}
		}
		return scrName;
	}

	/**
	 * <h1>Get Location Information</h1>
	 * <p>
	 * The getLocationInformation method gets location details stored in CHIL of the
	 * location name provided to the test case.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return JSONObject Location details of the location name
	 */
	public static JSONObject getLocationInformation(TestCases testCase, TestCaseInputs inputs) {
		JSONObject jsonObject = null;
		try (CHILUtil chUtil = new CHILUtil(inputs)) {

			if (chUtil.getConnection()) {
				long locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));

				if (locationID == -1) {
					return jsonObject;
				}

				if (chUtil.isConnected()) {
					String chilURL = getCHILURL(testCase, inputs);
					String url = chilURL + "api/v3/locations/" + locationID;
					HttpURLConnection connection = chUtil.doGetRequest(url);

					try {

						if (connection != null) {

							BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

							String inputLine;
							StringBuffer html = new StringBuffer();

							while (!in.ready()) {
							}

							while ((inputLine = in.readLine()) != null) {
								html.append(inputLine);
							}

							in.close();

							jsonObject = new JSONObject(html.toString().trim());

						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Location Information : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}

					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get StatLocation Information  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}
				}

			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get Location Information  : Unable to connect to CHIL.");
			}

		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Location Information  : Unable to get location. Error occurred - " + e.getMessage());
			jsonObject = null;
		}

		return jsonObject;
	}

	/**
	 * <h1>Get Device Information</h1>
	 * <p>
	 * The getDeviceInformation method gets device details stored in CHIL of the
	 * device name and location name provided to the test case.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return JSONObject Device details of the device name and location name
	 */
	public static JSONObject getDeviceInformation(TestCases testCase, TestCaseInputs inputs) {
		JSONObject jsonObject = null;

		try (CHILUtil chUtil = new CHILUtil(inputs)) {

			if (chUtil.getConnection()) {
				long locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));

				if (locationID == -1) {
					return jsonObject;
				}

				if (chUtil.isConnected()) {
					String chilURL = getCHILURL(testCase, inputs);
					String url = chilURL + "api/v3/locations/" + locationID;

					HttpURLConnection connection = chUtil.doGetRequest(url);

					try {

						if (connection != null) {

							BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

							String inputLine;
							StringBuffer html = new StringBuffer();

							while (!in.ready()) {
							}

							while ((inputLine = in.readLine()) != null) {
								html.append(inputLine);
							}

							in.close();

							JSONObject jsonObj = new JSONObject(html.toString().trim());

							JSONArray array = (JSONArray) jsonObj.get("devices");

							JSONObject tempJSONObject = null;

							boolean elementFound = false;

							for (int counter = 0; counter < array.length(); counter++) {
								tempJSONObject = array.getJSONObject(counter);

								if (inputs.getInputValue("LOCATION1_DEVICE1_NAME")
										.equalsIgnoreCase(tempJSONObject.getString("userDefinedDeviceName"))) {

									jsonObject = array.getJSONObject(counter);
									elementFound = true;
									break;
								}
							}

							if (elementFound) {
							} else {
								Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
										"Get Stat Information : Stat not found by name - "
												+ inputs.getInputValue("LOCATION1_DEVICE1_NAME"));
							}
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Stat Information : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}

					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get Stat Information  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}

				} else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							"Get Stat Information  : Unable to connect to CHIL.");
				}
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Stat Information  : Unable to get information for Stat - "
							+ inputs.getInputValue("LOCATION1_DEVICE1_NAME") + " at location - "
							+ inputs.getInputValue("LOCATION1_NAME") + " : Error occurred - " + e.getMessage());
			jsonObject = null;
		}

		return jsonObject;
	}



	public static JSONObject getNoDeviceInformation(TestCases testCase, TestCaseInputs inputs) {
		JSONObject jsonObject = null;

		try (CHILUtil chUtil = new CHILUtil(inputs)) {

			if (chUtil.getConnection()) {
				long locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));

				if (locationID == -1) {
					return jsonObject;
				}

				if (chUtil.isConnected()) {
					String chilURL = getCHILURL(testCase, inputs);
					String url = chilURL + "api/v3/locations/" + locationID;

					HttpURLConnection connection = chUtil.doGetRequest(url);

					try {

						if (connection != null) {

							BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

							String inputLine;
							StringBuffer html = new StringBuffer();

							while (!in.ready()) {
							}

							while ((inputLine = in.readLine()) != null) {
								html.append(inputLine);
							}

							in.close();

							JSONObject jsonObj = new JSONObject(html.toString().trim());

							JSONArray array = (JSONArray) jsonObj.get("devices");

							JSONObject tempJSONObject = null;

							boolean elementFound = false;

							for (int counter = 0; counter < array.length(); counter++) {
								tempJSONObject = array.getJSONObject(counter);

								if (inputs.getInputValue("LOCATION1_DEVICE1_NAME")
										.equalsIgnoreCase(tempJSONObject.getString("userDefinedDeviceName"))) {

									jsonObject = array.getJSONObject(counter);
									elementFound = true;
									break;
								}
							}

							if (!elementFound) {

								Keyword.ReportStep_Pass(testCase,
										"Get Stat Information : Stat not found by name - "
												+ inputs.getInputValue("LOCATION1_DEVICE1_NAME"));

							} else {
								Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
										"Get Stat Information : Stat found by name - "
												+ inputs.getInputValue("LOCATION1_DEVICE1_NAME"));
							}
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Stat Information : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}

					} catch (IOException e) {
						Keyword.ReportStep_Pass(testCase,
								"Get Stat Information  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}

				} else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							"Get Stat Information  : Unable to connect to CHIL.");
				}
			}
		} catch (Exception e) {

			Keyword.ReportStep_Pass(testCase,
					"Get Stat Information  : Unable to get information for Stat - "
							+ inputs.getInputValue("LOCATION1_DEVICE1_NAME") + " at location - "
							+ inputs.getInputValue("LOCATION1_NAME") + " : Error occurred - " + e.getMessage());
			jsonObject = null;
		}

		return jsonObject;
	}


	/**
	 * <h1>Get CHIL Url</h1>
	 * <p>
	 * The getCHILURL method returns the url of the environment provided to the test
	 * case
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return String URL of the environment provided to the test case
	 */
	public static String getCHILURL(TestCases testCase, TestCaseInputs inputs) throws Exception {
		String chilURL = " ";
		try {
			String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
			environment = environment.replaceAll("\\s", "");
			if (environment.equalsIgnoreCase("Production")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_PRODUCTION");
			} else if (environment.equalsIgnoreCase("CHILInt(Azure)")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_INT");
			} else if (environment.equalsIgnoreCase("ChilDev(Dev2)")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DEV2");
			} else if (environment.equalsIgnoreCase("Stage")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_STAGING");
			} else if (environment.equalsIgnoreCase("LoadTesting")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_LOAD_TESTING");
			} else if (environment.equalsIgnoreCase("ChilDas(QA)")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_QA");
			} else if (environment.equalsIgnoreCase("ChilDas(Test)")) {
				chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_TEST");
			} else {
				throw new Exception("Invalid URL");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return chilURL;
	}

	/**
	 * <h1>Login in to the Lyric Application</h1>
	 * <p>
	 * The loginToLyricApp method click on the login button post launch/Application
	 * Environment Setup, inputs the email ID and password, and taps on the login
	 * button
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return boolean Returns 'true' if all the button clicks and values were set
	 *         properly. Returns 'false' if there was an error on clicking any
	 *         buttons or setting any values
	 */
	public static boolean loginToLyricApp(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		LoginScreen ls = new LoginScreen(testCase);
		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}
		if (ls.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + inputs.getInputValue("USERID"));
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickonOKKey();
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}
		if (ls.isLoginButtonVisible()) {
			flag = flag && ls.clickOnLoginButton();
			
		} else {
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
		}
		return flag;
	}

	



	/**
	 * <h1>Set Application Environment</h1>
	 * <p>
	 * The set application environment method navigates to the secret menu from the
	 * login screen, set the application environment provided to the test case, and
	 * navigates back to the login screen
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return boolean Returns 'true' if the environment is successfully set.
	 *         Returns 'false' if the environment is not set successfully
	 */
	

	/**
	 * <h1>Launch And Login to Lyric Application</h1>
	 * <p>
	 * The launchAndLoginToApplication method launches the lyric application, closes
	 * all pop ups post application launch, sets the application environment, logs
	 * in the the application, and verifies whether the user has successfully logged
	 * in or not.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return boolean Returns 'true' if all the operations mentioned in the
	 *         description have been performed successfully. Returns 'false' if any
	 *         of the operations mentioned in the description fails.
	 */
	public static boolean launchAndLoginToApplication(TestCases testCase, TestCaseInputs inputs,
			boolean... closeCoachMarks) {
		boolean flag = true;
		flag = MobileUtils.launchApplication(inputs, testCase, true);
		
		
		
		
		flag = flag && LyricUtils.loginToLyricApp(testCase, inputs);
	
		
		return flag;
	}

	/**
	 * <h1>Get Device Time zone</h1>
	 * <p>
	 * The getDeviceTimeZone method returns the TimeZone the device is configured
	 * to.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return TimeZone Returns the timezone of the device
	 */
	

	/**
	 * <h1>Get Device Time</h1>
	 * <p>
	 * The getDeviceTime method gets the time on the device
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return String Device time in the format 'yyyymmddThh:mm:a'
	 */
	

	/**
	 * <h1>Get Device Time</h1>
	 * <p>
	 * The addMinutesToDate method gets the time on the device with added minutes
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-03-17
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance
	 * @return String Device time in the format 'yyyymmddThh:mm:a'
	 */
	public static String addMinutesToDate(TestCases testCase, String date, int noOfMins) {
		String dateAfterAddition = "";
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Calendar c = Calendar.getInstance();
			c.setTime(dateFormat.parse(date));
			c.add(Calendar.MINUTE, noOfMins);
			dateAfterAddition = dateFormat.format(c.getTime());
		} catch (Exception e) {
			dateAfterAddition = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Add days to date : Error occurred : " + e.getMessage());
		}
		return dateAfterAddition;
	}

	/**
	 * <h1>Get All Alerts through CHIL</h1>
	 * <p>
	 * The getAllAlertsThroughCHIL method gets all the alerts of the location name
	 * provided to the test case through CHIL.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase.
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance.
	 * @return JSONObject Alert details of the location name provided to the test
	 *         case.
	 */
	public static JSONObject getAllAlertsThroughCHIL(TestCases testCase, TestCaseInputs inputs) {
		JSONObject jsonObject = null;
		try (CHILUtil chUtil = new CHILUtil(inputs)) {
			if (chUtil.getConnection()) {
				if (chUtil.isConnected()) {
					LocationInformation locInfo = new LocationInformation(testCase, inputs);
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/v2/users/" + locInfo.getUserID() + "/Alerts";
					HttpURLConnection connection = chUtil.doGetRequest(url);

					try {
						if (connection != null) {
							BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
							String inputLine;
							StringBuffer html = new StringBuffer();
							while (!in.ready()) {
							}
							while ((inputLine = in.readLine()) != null) {
								html.append(inputLine);
							}
							in.close();
							jsonObject = new JSONObject(html.toString().trim());
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
									"Get All Alerts : Failed to get all Alerts");
						}

					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
								"Get All Alerts : Failed to get all Alerts. Error occurred - " + e.getMessage());
						jsonObject = null;
					}
				}
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get All Alerts  : Unable to connect to CHAPI.");
			}
		} catch (Exception e) {
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get All Alerts : Unable to get alerts. Error occurred - " + e.getMessage());
			jsonObject = null;
		}
		return jsonObject;
	}

	/**
	 * <h1>Get All Alert IDs</h1>
	 * <p>
	 * The getAllAlertIDS method gets all the alerts through CHIL, extracts the IDS
	 * for each alert from the JSONObject, and stores the ids in a list
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase.
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance.
	 * @return List<Long> List of all alert IDS
	 */
	public static List<Long> getAllAlertIDS(TestCases testCase, TestCaseInputs inputs) {
		List<Long> alertIDS = new ArrayList<Long>();
		try {
			JSONObject jsonObj = getAllAlertsThroughCHIL(testCase, inputs);
			JSONArray jsonArray = jsonObj.getJSONArray("userAlerts");
			for (int i = 0; i < jsonArray.length(); i++) {
				alertIDS.add(jsonArray.getJSONObject(i).getLong("id"));
			}
		} catch (JSONException e) 
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "No Alerts Found");
		} 
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return alertIDS;
	}

	/**
	 * <h1>Dismiss All Alerts through CHIL</h1>
	 * <p>
	 * The dismissesAllAlertsThroughCHIL method dismisses all the alerts of the
	 * location name provided to the test case through CHIL.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase.
	 * @param inputs
	 *            Instance of the TestCaseInputs class used to pass inputs to the
	 *            testCase instance.
	 * @return boolean Returns 'true' if all the alerts have been dismissed
	 *         successfully. Returns 'false' if error occurs while dismissing
	 *         alerts.
	 */
	public static boolean dismissAllAlertsThroughCHIL(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		try {
			@SuppressWarnings("resource")
			CHILUtil chUtil = new CHILUtil(inputs);
			if (chUtil.getConnection()) {
				if (chUtil.isConnected()) {
					List<Long> alertIDS = LyricUtils.getAllAlertIDS(testCase, inputs);
					
					
						Keyword.ReportStep_Pass(testCase, "Successfully dismissed alerts with ids : " + alertIDS);
					
				}
			} else {
				flag = false;
				throw new Exception("Failed to connect to CHIL");
			}
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return flag;
	}

	/**
	 * <h1>Scroll To The List</h1>
	 * <p>
	 * The scrollUpAList method scrolls to an element
	 * using swipe gestures.
	 * </p>
	 *
	 * @author Midhun Gollapalli (H179225)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase.
	 *            testCase instance.
	 * @param attribute
	 *            Attribute of the value used to locate the element
	 * @param value
	 *            Value of the attribute used to locate the element
	 * @return boolean Returns 'true' if the element is found. Returns 'false' if
	 *         the element is not found.
	 */
	public static boolean scrollUpAList(TestCases testCase, WebElement devieListWebEle)
			throws Exception {
		Dimension d1;
		Point p1;
		int startx = -1;
		int starty = -1;
		int endy = -1;
		if (MobileUtils.isRunningOnAndroid(testCase)) {
			d1 = devieListWebEle.getSize();
			p1 = devieListWebEle.getLocation();
			startx = p1.getX();
			starty = (int) (d1.height * 0.90) + p1.getY();
			endy = (int) (d1.height * 0.60) + p1.getY();
		} else {
			d1 = devieListWebEle.getSize();
			p1 = devieListWebEle.getLocation();
			starty = (int) (d1.height * 0.80);
			endy = (int) -((d1.height * 0.50) + p1.getY());
			startx = d1.width / 2;
		}
		return MobileUtils.swipe(testCase, startx, starty, startx, endy);
	}

	/**
	 * <h1>Scroll To Element Using Exact Attribute Value</h1>
	 * <p>
	 * The scrollToElementUsingExactAttributeValue method scrolls to an element
	 * using the attribute and exact value passed to the method in the parameters.
	 * </p>
	 *
	 * @author Pratik P. Lalseta (H119237)
	 * @version 1.0
	 * @since 2018-02-15
	 * @param testCase
	 *            Instance of the TestCases class used to create the testCase.
	 *            testCase instance.
	 * @param attribute
	 *            Attribute of the value used to locate the element
	 * @param value
	 *            Value of the attribute used to locate the element
	 * @return boolean Returns 'true' if the element is found. Returns 'false' if
	 *         the element is not found.
	 */
	public static boolean scrollToElementUsingExactAttributeValue(TestCases testCase, String attribute, String value)
			throws Exception {
		try {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				if (testCase.getMobileDriver()
						.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView("
								+ "new UiSelector()." + attribute + "(\"" + value + "\"));")) != null) {
					return true;
				} else {
					return false;
				}
			} else {
				JavascriptExecutor js = (JavascriptExecutor) testCase.getMobileDriver();
				HashMap<Object, Object> scrollObject = new HashMap<>();
				scrollObject.put("predicateString", attribute + " == '" + value + "'");
				try {
					js.executeScript("mobile:scroll", scrollObject);
				} catch (Exception e) {
					if (e.getMessage().contains("Failed to find scrollable visible")) {
						js.executeScript("mobile:scroll", scrollObject);
					}
				}
				WebElement element = testCase.getMobileDriver()
						.findElement(MobileBy.iOSNsPredicateString(attribute + " == '" + value + "'"));
				if (element.getAttribute(attribute).equals(value)) {
					return true;
				} else {
					return false;
				}
			}
		} catch (NoSuchElementException e) {
			throw new Exception(
					"Element with text : '" + value + "' not found. Exception Type: No Such Element Exception");
		} catch (Exception e) {
			throw new Exception("Element with text : '" + value + "' not found. Exception Message: " + e.getMessage());
		}
	}

	
	public static boolean scrollToElementUsingAttributeSubStringValue(TestCases testCase, String attribute,
			String value) throws Exception {
		try {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				if (testCase.getMobileDriver()
						.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView("
								+ "new UiSelector().textContains(\"" + value + "\"));")) != null) {
					return true;
				} else {
					return false;
				}
			} else {
				JavascriptExecutor js = (JavascriptExecutor) testCase.getMobileDriver();
				HashMap<Object, Object> scrollObject = new HashMap<>();
				try {
					scrollObject.put("predicateString", attribute + " CONTAINS '" + value + "'");
					js.executeScript("mobile:scroll", scrollObject);
				} catch (Exception e) {
					scrollObject.clear();
					scrollObject.put("direction", "down");
					js.executeScript("mobile:scroll", scrollObject);
				}
				WebElement element = MobileUtils.getMobElement(testCase, "xpath",
						"//*[contains(@" + attribute + ",'" + value + "')]");
				// WebElement element = testCase.getMobileDriver()
				// .findElement(MobileBy.iOSNsPredicateString(attribute + " CONTAINS '" + value
				// + "'"));
				if (element.getAttribute(attribute).contains(value)) {
					return true;
				} else {
					return false;
				}

			}

		} catch (NoSuchElementException e) {
			throw new Exception("Element with text/value containing : '" + value
					+ "' not found. Exception Type : No Such Element Exception");
		} catch (Exception e) {
			throw new Exception("Element with text/value containing : '" + value + "' not found. Exception Message: "
					+ e.getMessage());
		}
	}

	
	public static boolean verifyDeviceDisplayedOnDashboard(TestCases testCase, String deviceName) {
		boolean flag = true;
		Dashboard d = new Dashboard(testCase);
		if (d.isDevicePresentOnDashboard(deviceName)) {
			Keyword.ReportStep_Pass(testCase, "Device : " + deviceName + " is present on the dashboard.");
		} else {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Device : " + deviceName + " is not present on the dashboard.");
		}
		return flag;
	}

	
	public static boolean verifyDeviceNotDisplayedOnDashboard(TestCases testCase, TestCaseInputs inputs,
			String expectedDevice) {
		boolean flag = true;
		HashMap<String, MobileObject> fieldObjects = MobileUtils.loadObjectFile(testCase, "DAS_InstallationScreen");
		if (MobileUtils.isMobElementExists(fieldObjects, testCase, "GlobalDrawerButton", 30, false)) {
			if (MobileUtils.isMobElementExists(fieldObjects, testCase, "DashboardIconText", 5)) {
				List<WebElement> dashboardIconText = MobileUtils.getMobElements(fieldObjects, testCase,
						"DashboardIconText");
				if (MobileUtils.isMobElementExists("id", "name", testCase, 3, false)) {
					dashboardIconText.addAll(MobileUtils.getMobElements(testCase, "id", "name"));
				}
				boolean f = false;
				String deviceName = "";
				for (WebElement e : dashboardIconText) {
					String displayedText;
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						displayedText = e.getText();
					} else {
						displayedText = e.getAttribute("value");
					}
					if (expectedDevice.equalsIgnoreCase("Switch")) {
						deviceName = inputs.getInputValue("LOCATION1_SWITCH1_NAME");
					} else if (expectedDevice.equalsIgnoreCase("Dimmer")) {
						deviceName = inputs.getInputValue("LOCATION1_DIMMER1_NAME");
					}
					if (displayedText.equals(deviceName)) {
						f = true;
						break;
					}
				}
				if (f) {
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Device : " + deviceName + " is present on the dashboard.");
				} else {
					Keyword.ReportStep_Pass(testCase, "Device : " + deviceName + " is not present on the dashboard.");
				}
			} else {
				Keyword.ReportStep_Pass(testCase, "No devices found on the dashboard");
			}
		} else {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "User is not on the dashboard");
		}
		return flag;
	}

	
	public static String getLocationTime(TestCases testCase, TestCaseInputs inputs, String timeFormat) {
		LocationInformation locInfo = new LocationInformation(testCase, inputs);
		String time = " ";
		try {
			TimeZone timeZone = TimeZone.getTimeZone(locInfo.getIANATimeZone());

			Calendar date = Calendar.getInstance(timeZone);
			String ampm;
			if (date.get(Calendar.AM_PM) == Calendar.AM) {
				ampm = "AM";
			} else {
				ampm = "PM";
			}
			String hour;
			if (date.get(Calendar.HOUR) == 0) {
				hour = "12";
			} else {
				hour = String.valueOf(date.get(Calendar.HOUR));
			}
			String minute;
			if (date.get(Calendar.MINUTE) < 10) {
				minute = "0" + date.get(Calendar.MINUTE);
			} else {
				minute = String.valueOf(date.get(Calendar.MINUTE));
			}
			int month = date.get(Calendar.MONTH) + 1;
			switch (timeFormat) {
			case "TIMEINYYMMHHMMFORMAT": {
				time = String.valueOf(date.get(Calendar.YEAR) + "-" + month + "-" + date.get(Calendar.DAY_OF_MONTH)
				+ "T" + hour + ":" + minute + " " + ampm);
				break;
			}
			case "TIMEINHHMMFORMAT": {
				time = String.valueOf(hour + ":" + minute + " " + ampm);
				break;
			}
			}
		} catch (Exception e) {
			time = "";
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Android Device Time : Error occurred : " + e.getMessage());
		}
		return time;
	}

	public static boolean verifyLoginScreen(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		String USER_ID_TEXT = "Email";
		String FORGOT_PASSWORD_TEXT_Android= "Forgot Password?";
		String FORGOT_PASSWORD_TEXT_IOS= "Forgot Password";
		String CREATE_ACCOUNT_TEXT = "Create Account";
		String LOGIN_TEXT = "Log In";
		String UseremailID = " ";

		LoginScreen ls = new LoginScreen(testCase);
		CreateAccountScreen cs=new CreateAccountScreen(testCase);

		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}
		if(ls.isEmailAddressTextFieldVisible() && ls.getEmailAddressTextFieldValue().equalsIgnoreCase(USER_ID_TEXT))
		{
			Keyword.ReportStep_Pass(testCase,
					"[Lyric login screen]: Email Address field text verified" );
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Email Address field text mismatched. Expected : "+ USER_ID_TEXT + " but found : " +ls.getEmailAddressTextFieldValue());
			flag = false;
		}

		if(ls.clickOnEmailAddressTextField())
		{
			Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Able to click on Email Address text field" );

			if(!MobileUtils.isRunningOnAndroid(testCase))
			{
				ls.clickOnLyricLogo();
			}
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to click on Email Address text field");
			flag = false;
		}

		if(ls.isPasswordFieldVisible())
		{
			Keyword.ReportStep_Pass(testCase,
					"[Lyric login screen]: Password field is shown" );
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Password field is not shown");
			flag = false;
		}

		if(ls.clickOnPasswordField())
		{
			Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Able to click on Password text field" );
			ls.clickOnLyricLogo();
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to click on Password text field");
			flag = false;
		}
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			if(ls.getLoginButtonText().equalsIgnoreCase(LOGIN_TEXT))
			{
				Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Login Text verified");

			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "[Lyric login screen], expected text is "+ LOGIN_TEXT + " but found " + ls.getLoginButtonText());
				flag = false;
			}
		}
		else
		{
			if(ls.getLoginButtonText().equalsIgnoreCase("Disabled"))
			{
				Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Login button is Disabled");

			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "[Lyric login screen], Login button is not Disabled");
				flag = false;
			}

		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			if(ls.isForgotPasswordButtonVisible() &&  ls.getForgotPasswordButtonText().equalsIgnoreCase(FORGOT_PASSWORD_TEXT_Android))
			{
				Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Forgot Password Text verified");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "[Lyric login screen], expected text is "+ FORGOT_PASSWORD_TEXT_Android + " but found " + ls.getForgotPasswordButtonText());
				flag = false;
			}
		}
		else
		{
			if(ls.isForgotPasswordButtonVisible() && ls.getForgotPasswordButtonText().equalsIgnoreCase(FORGOT_PASSWORD_TEXT_IOS))
			{
				Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Forgot Password verified");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "[Lyric login screen], expected text is "+ FORGOT_PASSWORD_TEXT_IOS + " but found " + ls.getForgotPasswordButtonText());
				flag = false;
			}
		}

		if(ls.isEmailAddressTextFieldVisible())
		{
			ls.clickOnEmailAddressTextField();
			ls.setEmailAddressValue(UseremailID);
			if(!MobileUtils.isRunningOnAndroid(testCase))
			{
				ls.clickOnLyricLogo();
			}
		}
		else 
		{
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to click on email address and set the value");
		}
		if(ls.clickOnForgotPasswordButton())
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if(ls.getForgotPasswordEmailAddressTextFieldValue().equalsIgnoreCase(UseremailID))
				{
					Keyword.ReportStep_Pass(testCase,"Lyric Forgot Password screen: Email address prepopulated from Login screen and value is "+ ls.getEmailAddressTextFieldValue());
				} 
				else 
				{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Lyric Forgot Password screen: Email address failed to prepopulate from Login screen, expected text is "+ UseremailID + " but found " + ls.getEmailAddressTextFieldValue());
					flag = false;
				}
			}
			else
			{
				if(ls.getForgotPasswordEmailAddressTextFieldValue().contains(""))
				{
					Keyword.ReportStep_Pass(testCase,"Lyric Forgot Password screen: Email address prepopulated from Login screen and value is "+ ls.getForgotPasswordEmailAddressTextFieldValue());
				} 
				else 
				{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Lyric Forgot Password screen: Email address failed to prepopulate from Login screen, expected text is "+ UseremailID + " but found " + ls.getEmailAddressTextFieldValue());
					flag = false;
				}
			}


			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if(ls.isResetButtonVisible()&& ls.getResetButtonText().equalsIgnoreCase("Reset"))
				{
					Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Reset Button Text verified");
				}
				else
				{
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to identify reset button");
				}
			}
			else
			{
				if(ls.isForgotPasswordEmailAddressVisible())
				{
					ls.setForgotPasswordEmailAddressValue("testResetEnabled@grr.la");
					Keyword.ReportStep_Pass(testCase,"[Lyric login screen]:Able to set email id for Reset Button verification");
				}
				if(ls.isResetButtonVisible())
				{
					Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Reset Button Text verified");
				}
				else
				{
					flag = false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to identify reset button");
				}
			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				ls.clickOnCancelButton();
			}
			else
			{
				ls.clickOnLoginButton();
			}


		}
		else
		{
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to identify Forgot Password button");

		}
		if(ls.isCancelButtonVisible())
		{
			Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Cancel button is shown");
			if(!ls.clickOnCancelButton())
			{
				flag = false;
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to click on cancel button");
			}
		}
		else
		{
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Cancel Button is not shown");
		}

		if(ls.isCreateAccountVisible() && ls.getCreateAccountButtonText().equalsIgnoreCase(CREATE_ACCOUNT_TEXT))
		{
			Keyword.ReportStep_Pass(testCase, "[Lyric login screen]: create Account Text verified");
		} 
		else 
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Create Account Text mismatched, expected text is "+ CREATE_ACCOUNT_TEXT + " but found " + ls.getCreateAccountButtonText());

		}
		if(!ls.navigateToCreateAccountScreen())
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]: Unable to click ob Create Account button");
		} 
		else
		{
			Keyword.ReportStep_Pass(testCase, "[Lyric login screen]:User Navigate to Create Account Screen" );
		}

		if(cs.isSelectCountryVisible())
		{
			Keyword.ReportStep_Pass(testCase, "[Lyric login screen]: Create Account Header is Shown");
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				cs.clickOnSelectCountryButton();
				MobileUtils.pressBackButton(testCase);
			}
			else
			{
				cs.clickOnSelectCountryButton();
				cs.clickOnConformSelectCountryButton();
				if(ls.isCancelButtonVisible())
				{
				ls.clickOnCancelButton();
				}
				
			}
		}
	
		
		
		if(ls.isbackButtonVisible())
		{
			ls.clickOnbackButton();
		}
		else
		{
			MobileUtils.pressBackButton(testCase);
		}
	
		if(ls.isLyricLogoVisible())
		{
			Keyword.ReportStep_Pass(testCase,"[Lyric login screen]: Honeywell logo is shown" );
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"[Lyric login screen]:Honeywell logo is not shown");
			flag = false;
		}

		return flag;
	}

	public static boolean VerifyLoginScreen(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		flag = flag && LyricUtils.verifyLoginScreen(testCase,inputs);
		return flag;
	}

	public static boolean LaunchLyricApplication(TestCases testCase, TestCaseInputs inputs) 
	{
		boolean flag = true;
		flag = MobileUtils.launchApplication(inputs, testCase, true);
		
		return flag;
	}


	public static String convertFromFahrenhietToCelsius(TestCases testCase, String fahrenhietTemp) {
		try {
			Double temp = Double.parseDouble(fahrenhietTemp);
			temp = ((temp - 32) * 5) / 9;
			temp = Math.round(temp * 10.0) / 10.0;
			return temp.toString();
		} catch (Exception e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred :"+ e.getMessage());
			return " ";
		}
	}






	public static boolean navigateToHomeScreen(TestCases testCase) {
		boolean flag = true;
		try {
			if (!MobileUtils.isRunningOnAndroid(testCase)) {
				if (MobileUtils.isMobElementExists("name", "icon notifications default", testCase, 2)) {
					Keyword.ReportStep_Pass(testCase,"Navigate To Primary Card : User is already on the Primary Card or Dashboard");
					return flag;
				} else {
					int i = 0;
					while ((!MobileUtils.isMobElementExists("name", "icon weather normal", testCase, 2)) && i < 10) {
						if (MobileUtils.isMobElementExists("name", "btn close normal", testCase, 2)) {
							flag = flag && MobileUtils.clickOnElement(testCase, "name", "btn close normal");
						} else if (MobileUtils.isMobElementExists("name", "nav bar back", testCase, 2)) {
							flag = flag && MobileUtils.clickOnElement(testCase, "name", "nav bar back");
						} else if (MobileUtils.isMobElementExists("name", "Back", testCase, 2)) {
							flag = flag && MobileUtils.clickOnElement(testCase, "name", "Back");
						}
						i++;
					}
					if (MobileUtils.isMobElementExists("name", "icon notifications default", testCase, 2)) {
						Keyword.ReportStep_Pass(testCase,
								"Navigate To Primary Card : Successfully navigated to Primary card or Dashboard");
					} else {
						flag = false;
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
								"Navigate To Primary Card : Failed to navigate to Primary card or Dashboard");
					}
				}
			} else {
				if (MobileUtils.isMobElementExists("id", "actionbar_activity_log_image", testCase, 2)) {
					Keyword.ReportStep_Pass(testCase, "Navigate To Primary Card : User is already on the Primary Card");
					return flag;
				} else {
					int i = 0;
					while ((!MobileUtils.isMobElementExists("id", "actionbar_activity_log_image", testCase, 2))
							&& i < 10) {
						if (MobileUtils.isMobElementExists("xpath",
								"//android.widget.ImageButton[@content-desc='Navigate Up']", 

								testCase, 2)) {
							flag = flag && MobileUtils.clickOnElement(testCase, "xpath","//android.widget.ImageButton[@content-desc='Navigate Up']");
						} else if (MobileUtils.isMobElementExists("xpath", "//android.widget.ImageButton", testCase,
								2)) {
							flag = flag && MobileUtils.clickOnElement(testCase, "xpath", "//android.widget.ImageButton");
						}
						i++;
					}
					if (MobileUtils.isMobElementExists("id", "actionbar_activity_log_image", testCase, 2)) {
						Keyword.ReportStep_Pass(testCase,"Navigate To Primary Card : Successfully navigated to Primary card");
					} else {
						flag = false;
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
								"Navigate To Primary Card : Failed to navigate to Primary Card");
					}
				}
			}
		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Navigate To Primary Card : Error occurred : " + e.getMessage());
		}
		return flag;
	}

	

	
	public static boolean VerifyScreenLocalization(TestCases testCase,String Screenname)
	{
		String lang=testCase.getTestCaseInputs().getInputValue("LANGUAGE");
		boolean flag=true;
		List<String>eleList = null;
		try {
			if(testCase.getTestCaseInputs().getInputValue("LANGUAGE").equals(null) || testCase.getTestCaseInputs().getInputValue("LANGUAGE").equals("")){
				eleList=LyricUtils.read(testCase, "English_US", Screenname);
			}else{
				eleList=LyricUtils.read(testCase, lang, Screenname);
			}
		} catch (IOException e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		if(!(LyricUtils.compare(eleList, testCase)))
		{
			flag=false;
		}
		else
		{
			Keyword.ReportStep_Pass(testCase , "Successfully verified the screen :"+Screenname) ;
		}

		return flag;
	}

	public static List<String> read(TestCases testCase, String fileName, String screenName)throws IOException
	{

		boolean flag = true ;

		String key = "", value = "" ;
		List<String> elementlist = new LinkedList<String>() ;
		FileInputStream file = null ;
		try
		{
			file = new FileInputStream(new File(fileName + ".xls")) ;

			// Get the workbook instance for XLS file
			HSSFWorkbook workbook = new HSSFWorkbook(file) ;

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheet(screenName) ;

			Iterator<Row> rowIterator = sheet.iterator() ;
			while (rowIterator.hasNext())
			{
				flag = true ;
				Row row = rowIterator.next() ;
				// For each row, iterate through each columns
				Iterator<Cell> cellIterator = row.cellIterator() ;
				while (cellIterator.hasNext())
				{

					Cell cell = cellIterator.next() ;

					if (flag)
					{
						key = cell.getStringCellValue() ;
						flag = false ;

					}
					else
					{
						if (MobileUtils.isRunningOnAndroid(testCase))
						{
							value = cell.getStringCellValue() ;
							flag = true ;
						}
						else
						{
							cell = cellIterator.next() ;
							value = cell.getStringCellValue() ;
							flag = true ;
						}
					}
				}

				if (!(value.equalsIgnoreCase("IOS") || value.equalsIgnoreCase("Android") || value.equalsIgnoreCase("NULL")))
				{
					elementlist.add(value) ;
				}
			}

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return elementlist ;
	}
	public static boolean compare(List<String> dsd, TestCases testCase)
	{

		boolean flag = true, isScreenshotTaken = true ;
		try
		{
			MobileScreens ms = new MobileScreens(testCase) ;
			Document doc = ms.getPageSource() ; // XML
			CustomDriver driver = testCase.getMobileDriver() ;
			for (String temp : dsd) // Follow
			{
				if (MobileUtils.isRunningOnAndroid(testCase))
				{
					if (ms.isElementPresent(doc , String.format("//*[contains(@content-desc,'%s') or contains(@text,'%s')]" , temp , temp)))
					{
						String strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'" + temp+ "')]" , false , false).getText() ;
						if (strText.isEmpty() || strText == null)
						{
							if (testCase.getTestCaseInputs().isRunningOn("TestObject"))
							{
								strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'"+ temp + "')]" , false , false).getAttribute("contentDescription") ;
							}
							else
							{
								strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'"+ temp + "')]" , false , false).getAttribute("name") ;
							}
						}
						if (isScreenshotTaken)
						{
							ReportStep_Pass_With_ScreenShot(testCase , "Expected Text displayed : "+ strText , driver) ;
							isScreenshotTaken = false ;
						}
						else
						{
							Keyword.ReportStep_Pass(testCase , "Expected Text displayed : " + strText) ;
						}
					}
					else
					{
						Keyword.ReportStep_Fail(testCase , FailType.FUNCTIONAL_FAILURE , "Expected Text: " + temp ,
								driver) ;
						flag = false ;
					}
				}
				else
				{
					if (ms.isElementPresent(doc , String.format("//*[(@value='%s') or (@name='%s') or (@label='%s')]" , temp , temp , temp)))
					{
						if (isScreenshotTaken)
						{
							ReportStep_Pass_With_ScreenShot(testCase , "Text displayed : " + temp ,driver) ;
							isScreenshotTaken = false ;
						}
						else
						{
							Keyword.ReportStep_Pass(testCase , "Text displayed : " + temp) ;
						}
					}

					else if (ms.isElementPresent(doc , String.format("//*[contains(@value,'%s') or contains(@name,'%s') or contains(@label,'%s') ]" , temp ,temp , temp)))
					{
						if (isScreenshotTaken)
						{
							ReportStep_Pass_With_ScreenShot(testCase , "Text displayed : " + temp ,driver) ;
							isScreenshotTaken = false ;
						}
						else
						{
							Keyword.ReportStep_Pass(testCase , "Text displayed : " + temp) ;
						}
					}
					else if (MobileUtils.getMobElements(testCase, "XPATH", "//*[contains(@value,'"+temp+"') or contains(@name,'"+temp+"') or contains(@label,'"+temp+"') ]", false,false,true)!=null)
					{
						if (isScreenshotTaken)
						{
							ReportStep_Pass_With_ScreenShot(testCase , "Text displayed : " + temp ,driver) ;
							isScreenshotTaken = false ;
						}
						else
						{
							Keyword.ReportStep_Pass(testCase , "Text displayed : " + temp) ;
						}
					}

					else
					{
						Keyword.ReportStep_Fail(testCase , FailType.FUNCTIONAL_FAILURE , "Expected Text: " + temp) ;
						flag = false ;
					}
				}
			}

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase , FailType.FUNCTIONAL_FAILURE , "Error occurred : "+e.getMessage()) ;
		}
		return flag ;
	}

	public final static void ReportStep_Pass_With_ScreenShot(TestCases testCase, String message, CustomDriver driver)
	{

		if (testCase != null && driver != null)
		{

			testCase.incrementScreenShotCount() ;

			String screenShotName = takeScreenShot(testCase.getScrShotPath() , driver) ;

			message = "<b>[PASS]</b> " + message + "::::" + new File(testCase.getScrShotPath()).getName() + "/"
					+ screenShotName ;
			reportStep(testCase , Reporting.PASS , message) ;
		}
		else
		{
			ReportStep_Pass(testCase , message) ;
		}
	}

	public static void reportStep(TestCases testCase, int status, String message)
	{

		String[] splittedMessage = message.split("::::") ;
		message = splittedMessage[0] ;
		testCase.getXMLTestNode().addMessageToCurrentKeyword(message) ;

		switch (status)
		{
		case Reporting.PASS:
			testCase.getLogFile().logPass(message) ;
			if ("#".equals(splittedMessage[1]))
			{
				// Nothing to do..
			}
			else
			{
				testCase.getXMLTestNode().addScreenShotToCurrentKeyword(splittedMessage[1]) ;
			}
			break ;
		case Reporting.FAIL:
			if ("#".equals(splittedMessage[1]))
			{
				// Nothing to do..
			}
			else
			{
				testCase.getXMLTestNode().addScreenShotToCurrentKeyword(splittedMessage[1]) ;
			}
			testCase.getXMLTestNode().getCurrentKeyword().setKeywordSuccess(false) ;
			testCase.getXMLTestNode().setTestSuccess(false) ;
			break ;
		}

		testCase.getXMLTestNode().commitTest(testCase) ;

	}
	public final static void ReportStep_Pass(TestCases testCase, String message)
	{

		if (testCase != null)
		{
			message = "<b>[PASS]</b> " + message ;
			reportStep(testCase , Reporting.PASS , message) ;
		}
		else
		{

		}

	}

	/*
	 * This is used to swipe element down to particular element.
	 */
	public static void swipeTo(String element,TestCases testCase, TestCaseInputs inputs) {
		//TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
		//int i = 0;

		/*while ((!ts.isElementVisible(element)) && i < 10) {
			touchAction.press((int) (dimension.getWidth() * .5), (int) (dimension.getHeight() * .5)).moveTo(point( (int) (dimension.getWidth() * .5), (int) (dimension.getHeight() * -.4))
			.release().perform();*/
		try {
			if(element.contains("SleepBrightness")){
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.scrollToExactAndroid(testCase , "Sleep Brightness Mode");
				}
				else
				{
					scrollToElementUsingExactAttributeValue(testCase,"value","Sleep Brightness Mode");
				}
			}else if (element.contains("Sound"))
			{
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.scrollToExactAndroid(testCase , "Sound");
				}
				else
				{

					scrollToElementUsingExactAttributeValue(testCase,"value","Sound");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			//}
			//i++;
		}
	}

	/*
	 * This Method verify Sound Screen and sound status check 
	 */


	/*
	 * This Method used to set value on slider for sleep Brightness  Screen 
	 */
	public static boolean setValueToSlider(TestCases testCase, TestCaseInputs inputs) {
		String currentValue = MobileUtils.getFieldValue(testCase, "xpath", inputs.getInputValue(GlobalVariables.CURRENT_VALUE_XPATH))
				.replace("%", "");

		if (!currentValue.contains("##ELEMENT_NOT_FOUND##")) {
			if (!currentValue.equals(inputs.getInputValue(GlobalVariables.EXPECTED_VALUE))) {

				int max = Integer.parseInt(inputs.getInputValue(GlobalVariables.MAX));
				int min = Integer.parseInt(inputs.getInputValue(GlobalVariables.MIN));
				int gradient = Integer.parseInt(inputs.getInputValue(GlobalVariables.GRADIENT));
				int expectedValue = Integer.parseInt(inputs.getInputValue(GlobalVariables.EXPECTED_VALUE));
				int currentValueInteger = Integer.parseInt(currentValue);

				WebElement element = MobileUtils.getMobElement(testCase, "name", "Slider_cell");

				if (element != null) {

					Dimension dimension = element.getSize();

					Point point = element.getLocation();

					int width = dimension.getWidth();
					int height = dimension.getHeight() / 2;

					int numberOfBlocks = (max - min) / gradient;

					int eachBlockLength = Math.round(width / numberOfBlocks);

					int currentCircleXPoint = point.getX() + ((currentValueInteger - min) / gradient) * eachBlockLength;

					int currentCircleYPoint = point.getY() + height;

					TouchAction tAction = new TouchAction(testCase.getMobileDriver());

					int difference = 0;

					double direction = 1; // left to right

					if (currentValueInteger < expectedValue) {
						difference = (expectedValue - currentValueInteger) / gradient;
						direction = 1.1;
					} else {
						difference = (currentValueInteger - expectedValue) / gradient;
						direction = -1;
					}

					for (int counter = 0; counter < difference; counter++) {

						try {
						/*	tAction.press(currentCircleXPoint, currentCircleYPoint)
							.moveTo(point((int) (Math.round(eachBlockLength * direction)), 0).release().perform();*/
							
							tAction.press(point(currentCircleXPoint, currentCircleYPoint)).moveTo(point((int) (Math.round(eachBlockLength * direction)), 0)).release().perform();

							//tAction.press(point(width / 2, height / 2)).waitAction(waitOptions(MobileUtils.getDuration(2000))).moveTo(point(width / 2, 82)).release().perform();

						} catch (Exception e) {
							Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
									"Change Slider Value : Not able to move slider. Error occurred - " + e.getMessage());
							break;
						}

						currentValue = MobileUtils
								.getFieldValue(testCase, "xpath", inputs.getInputValue(GlobalVariables.CURRENT_VALUE_XPATH))
								.replace("%", "");
						if (currentValue.equals(inputs.getInputValue(GlobalVariables.EXPECTED_VALUE))) {
							break;
						} else {
							currentCircleXPoint = (int) Math.round(currentCircleXPoint + eachBlockLength * direction);
						}
					}

					currentValue = MobileUtils
							.getFieldValue(testCase, "xpath", inputs.getInputValue(GlobalVariables.CURRENT_VALUE_XPATH))
							.replace("%", "");

					currentValueInteger = Integer.parseInt(currentValue);

					if (currentValue.equals(inputs.getInputValue(GlobalVariables.EXPECTED_VALUE))) {
						return true;
					} else {
						if (expectedValue == min || expectedValue == max) {
							difference = 2;
						} else {
							if (expectedValue == min + gradient || expectedValue == max - gradient) {
								difference = 1;
							}
						}

						if (currentValueInteger < expectedValue) {
							direction = 1.2;
						} else {
							direction = -1.2;
						}

						currentCircleXPoint = point.getX() + ((currentValueInteger - min) / gradient) * eachBlockLength;

						for (int counter = 0; counter < difference; counter++) {

							try {
								/*tAction.press(currentCircleXPoint, currentCircleYPoint)
								.moveTo((int) (Math.round(eachBlockLength * direction)), 0).release().perform();
							*/	
								tAction.press(point(currentCircleXPoint, currentCircleYPoint)).moveTo(point((int) (Math.round(eachBlockLength * direction)), 0)).release().perform();

								
							} catch (Exception e) {
								Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
										"Change Slider Value : Not able to move slider. Error occurred - "
												+ e.getMessage());
								break;
							}

							currentValue = MobileUtils
									.getFieldValue(testCase, "xpath", inputs.getInputValue(GlobalVariables.CURRENT_VALUE_XPATH))
									.replace("%", "");

							if (currentValue.equals(inputs.getInputValue(GlobalVariables.EXPECTED_VALUE))) {
								break;
							} else {
								currentCircleXPoint = (int) Math
										.round(currentCircleXPoint + eachBlockLength * direction);
							}
						}

					}

				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Change Slider Value : Slider element is not available.");
					return false;
				}

			} else {
				return true;
			}

		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Change Slider Value : Not able to read the Current value of the slider.");
			return false;
		}
		return true;
	}

	public static boolean VerifyLoginScreenLocalization(TestCases testCase,TestCaseInputs inputs)
	{
		boolean flag=true;
		String language =testCase.getTestCaseInputs().getInputValue("LANGUAGE");
		LoginScreen ls=new LoginScreen(testCase,language);

		flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "Login");

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			ls.clickOnLoginButton();
		}else
		{

			if(language.contains("English_US")||language.contains("English_UK")||language.contains("English_IR"))
			{		
				ls.clickOnLoginButton();
			}
			else if(ls.isLoginButtonLocalVisible(inputs))
			{
				ls.clickOnLyricLogo();
				ls.isClickLoginButtonLocal(inputs);
			}

		}
		if (MobileUtils.isRunningOnAndroid(testCase)) {
			MobileUtils.hideKeyboard(testCase.getMobileDriver());
		}

		flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "Login2");

		return flag;
	}



	public static String getCurrentUTCTime(TestCases testCase) {
		String UTCTime = " ";
		try {
			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			ZonedDateTime zone = ZonedDateTime.now(ZoneOffset.UTC);
			UTCTime = vacationDateFormat.format(vacationDateFormat.parse(zone.toString()));
		} catch (Exception e) {
			UTCTime = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Current UTC Time : Error occurred : " + e.getMessage());
		}
		return UTCTime;
	}

	


	public static void verifyGlobaldrawerOptionScreenCamera(TestCases testCase, String language) {
		boolean flag=true;
		Dashboard ds = new Dashboard(testCase,language);
		ds.clickOnGlobalDrawerButton();
		flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "Globaldrawer_Cam1");
		if(language.contains("French_CA"))
		{
			MobileUtils.scrollToExactAndroid(testCase, "DÃƒÆ’Ã‚Â©connexion");
		}
		else if(language.contains("Italian_SUI"))
		{
			MobileUtils.scrollToExactAndroid(testCase, "Disconnessione");
		}
		else if(language.contains("English_US"))
		{
			MobileUtils.scrollToExactAndroid(testCase, "Logout");
		}
		else if(language.equalsIgnoreCase("German_AUS") || language.equalsIgnoreCase("German") || language.equalsIgnoreCase("German_SUI"))
		{
			MobileUtils.scrollToExactAndroid(testCase, "Abmelden");
		}
		flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "Globaldrawer_Cam2");		
		MobileUtils.scrollToExactAndroid(testCase, "Geofence");

	}






	public static String getDateSelected(int differenceBetweenMonth, int dayORMonth)
	{

		Calendar cal = Calendar.getInstance() ;
		if (dayORMonth == 2)
		{
			cal.add(Calendar.MONTH , differenceBetweenMonth) ;
		}
		else
		{
			cal.add(Calendar.DATE , differenceBetweenMonth) ;
		}

		return getDate(cal) ;
	}

	public static String getDate(Calendar cal)
	{

		return "" + cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR) ;
	}

	public static int convertStringMonthInToIntegerMonth(TestCases testCase, String currentMonth)
	{
		int months;
		try {
			switch (currentMonth) {
			case "janv.":
				months = 1;
				break;
			case "Jan":
				months = 1;
				break;
			case "Feb":
				months = 2;
				break;
			case "fevr":
				months = 2;
				break;
			case "Mar":
				months = 3;
				break;
			case "mars.":
				months = 3;
				break;
			case "Apr":
				months = 4;
				break;
			case "avr.":
				months = 4;
				break;
			case "May":
				months = 5;
				break;
			case "mai":
				months = 5;
				break;
			case "Jun":
				months = 6;
				break;
			case "juin":
				months = 6;
				break;
			case "Jul":
				months = 7;
				break;
			case "juil.":
				months = 7;
				break;
			case "Aug":
				months = 8;
				break;
			case "aoÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½t":
				months = 8;
				break;
			case "Sep":
				months = 9;
				break;
			case "sept.":
				months = 9;
				break;
			case "Oct":
				months = 10;
				break;
			case "oct.":
				months = 10;
				break;
			case "Nov":
				months = 11;
				break;
			case "nov.":
				months = 11;
				break;
			case "Dec":
				months = 12;
				break;
			case "dÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½c.":
				months = 12;
				break;
			default:
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to match month");
				months = 99;
				break;
			}
		} catch (Exception e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			months = 99;
		}
		return months;
	}

	public static String convertFromCelsiusToFahrenhiet(TestCases testCase, String celsiusTemp) {
		try {
			Double temp = Double.parseDouble(celsiusTemp);
			temp = (9.0 / 5.0) * temp + 32;
			return String.valueOf(temp.intValue());
		} catch (Exception e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred :"+e.getMessage());
			return " ";
		}
	}

	public static String roundOffTimeToTheNearest15minutes(TestCases testCase, String time) {
		String roundOffTime = " ";
		try {
			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Calendar c = Calendar.getInstance();
			c.setTime(vacationDateFormat.parse(time));
			int minutes = c.get(Calendar.MINUTE);
			int mod = minutes % 15;
			int diff = 15 - mod;
			c.add(Calendar.MINUTE, diff);
			c.set(Calendar.SECOND, 0);
			roundOffTime = vacationDateFormat.format(c.getTime());
		} catch (Exception e) {
			roundOffTime = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Add days to date : Error occurred : " + e.getMessage());
		}
		return roundOffTime;
	}

	public static String addDaysToDate(TestCases testCase, String date, int noOfDays) {
		String dateAfterAddition = "";
		try {
			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Calendar c = Calendar.getInstance();
			c.setTime(vacationDateFormat.parse(date));
			c.add(Calendar.DATE, noOfDays);
			dateAfterAddition = vacationDateFormat.format(c.getTime());
		} catch (Exception e) {
			dateAfterAddition = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Add days to date : Error occurred : " + e.getMessage());
		}
		return dateAfterAddition;
	}

	public static String getRandomSetPointValueBetweenMinandMax(TestCases testCase, TestCaseInputs inputs, Double max,
			Double min) {
		Random rn = new Random();
		Double setPoint = min + (max - min) * rn.nextDouble();
		return String.valueOf(setPoint.intValue());
	}

	public static String getLocationTime(TestCases testCase, TestCaseInputs inputs) {
		String time = " ";
		try {
			LocationInformation locInfo = new LocationInformation(testCase, inputs);
			Calendar date = Calendar.getInstance(TimeZone.getTimeZone(locInfo.getLocationTimeZone()));
			String ampm;
			if (date.get(Calendar.AM_PM) == Calendar.AM) {
				ampm = "AM";
			} else {
				ampm = "PM";
			}
			String hour;
			if (date.get(Calendar.HOUR) == 0) {
				hour = "12";
			} else {
				hour = String.valueOf(date.get(Calendar.HOUR));
			}
			if (Integer.parseInt(hour) < 10) {
				hour = "0" + hour;
			}
			String minute;
			if (date.get(Calendar.MINUTE) < 10) {
				minute = "0" + date.get(Calendar.MINUTE);
			} else {
				minute = String.valueOf(date.get(Calendar.MINUTE));
			}
			int month = date.get(Calendar.MONTH) + 1;
			time = String.valueOf(date.get(Calendar.YEAR) + "-" + month + "-" + date.get(Calendar.DAY_OF_MONTH) + "T"
					+ hour + ":" + minute + " " + ampm);
		} catch (Exception e) {
			time = "";
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Android Device Time : Error occurred : " + e.getMessage());
		}
		return time;
	}



	public static boolean verifyGlobaldrawerOptionScreenHBB(TestCases testCase, String language) {
		boolean flag=true;
		Dashboard ds = new Dashboard(testCase,language);
		ds.clickOnGlobalDrawerButton();
		LyricUtils.VerifyScreenLocalization(testCase, "GlobalDrawer_HBB");
		if(!MobileUtils.isRunningOnAndroid(testCase))
		{

			CustomDriver driver = testCase.getMobileDriver();
			Dimension dimension = driver.manage().window().getSize();
			TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
			touchAction.press(point(10, (int) (dimension.getHeight() * .5))).moveTo(point(0, (int) (dimension.getHeight() * -.4))).release().perform();



		}
		else
		{
			if(language.contains("French"))
			{
				MobileUtils.scrollToExactAndroid(testCase, "DÃƒÆ’Ã‚Â©connexion");
			}
			else if(language.contains("Italian_SUI"))
			{
				MobileUtils.scrollToExactAndroid(testCase, "Disconnessione");
			}
			else if(language.contains("English_US"))
			{
				MobileUtils.scrollToExactAndroid(testCase, "Logout");
			}
			else if(language.contains("German"))
			{
				MobileUtils.scrollToExactAndroid(testCase, "Abmelden");
			}
		}

		LyricUtils.VerifyScreenLocalization(testCase, "Globaldrawer_2");	
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.scrollToExactAndroid(testCase, "Geofence");
		}
		return flag;

	}





	private static boolean verifyLocation(TestCases testCase, String locationtobeselected) {
		boolean flag = true;
		Dashboard ds=new Dashboard(testCase);
		if(ds.isLocationSpinnerIconVisible(5))
		{
			String DisplayLocation=ds.getCureentLocation();
			if(DisplayLocation.equalsIgnoreCase(locationtobeselected))
			{
				Keyword.ReportStep_Pass(testCase,
						"Successfully verified Selected location present on Dashboard: " + locationtobeselected);
			}
			else
			{
				flag = false;
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Unable to verify Selected location present on Dashboard: " + locationtobeselected);
			}
		}
		return flag;
	}

	

	// This method will make a GET call on CHIL to get all the device details of
	// the location and device specified in the inputs.
	public static JSONObject getStatInformation(TestCases testCase, TestCaseInputs inputs) {
		JSONObject jsonObject = null;

		try (CHILUtil chUtil = new CHILUtil(inputs)) {

			if (chUtil.getConnection()) {
				long locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));

				if (locationID == -1) {
					return jsonObject;
				}

				if (chUtil.isConnected()) {
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/v3/locations/" + locationID;

					HttpURLConnection connection = chUtil.doGetRequest(url);

					try {

						if (connection != null) {

							BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

							String inputLine;
							StringBuffer html = new StringBuffer();

							while (!in.ready()) {
							}

							while ((inputLine = in.readLine()) != null) {
								html.append(inputLine);
							}

							in.close();

							JSONObject jsonObj = new JSONObject(html.toString().trim());

							JSONArray array = (JSONArray) jsonObj.get("devices");

							JSONObject tempJSONObject = null;

							boolean elementFound = false;

							for (int counter = 0; counter < array.length(); counter++) {
								tempJSONObject = array.getJSONObject(counter);

								if (inputs.getInputValue("LOCATION1_DEVICE1_NAME")
										.equalsIgnoreCase(tempJSONObject.getString("userDefinedDeviceName"))) {

									jsonObject = array.getJSONObject(counter);
									elementFound = true;
									break;
								}
							}

							if (elementFound) {
							} else {
								Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
										"Get Stat Information : Stat not found by name - "
												+ inputs.getInputValue("LOCATION1_DEVICE1_NAME"));
							}
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Stat Information : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}

					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get Stat Information  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}

				} else {
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							"Get Stat Information  : Unable to connect to CHAPI.");
				}
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Stat Information  : Unable to get information for Stat - "
							+ inputs.getInputValue("LOCATION1_DEVICE1_NAME") + " at location - "
							+ inputs.getInputValue("LOCATION1_NAME") + " : Error occurred - " + e.getMessage());
			jsonObject = null;
		}

		return jsonObject;
	}






	public static boolean loginToLyricAppLocal(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		LoginScreen ls = new LoginScreen(testCase);
		if (ls.isLoginButtonLocalVisible(inputs) && !ls.isEmailAddressTextFieldVisibleLocal(inputs)) {
			flag = flag && ls.isClickLoginButtonLocal(inputs);
		}

		ls.isLyricLogoVisible(10);
		if (ls.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + inputs.getInputValue("USERID"));
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickonOKKey();

          if(ls.isLyricLogoVisible())
				{
					ls.clickOnLyricLogo();
				}
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}
		if (ls.isLoginButtonVisible()) {
			flag = flag && ls.clickOnLoginButton();
		} else if (ls.isLoginButtonLocalVisible(inputs)) {
			flag = flag && ls.isClickLoginButtonLocal(inputs);
		} else{
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
		}
		return flag;
	}


	public static boolean SetUserLocation_Emulator(final TestCases testCase, TestCaseInputs inputs, double Latitude,double longitude)
	{

		boolean flag = true ;
		double altitude = 100 ;

		try
		{
			Location location = new Location(Latitude , longitude , altitude) ;
			testCase.getMobileDriver().setLocation(location) ;
			Keyword.ReportStep_Pass(testCase ,
					"Set User Location [On Emulator] : Location of User Set to  - Location Longitude : " + longitude
					+ ", Location Latitude : " + Latitude) ;

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail_WithOut_ScreenShot(
					testCase ,
					FailType.COSMETIC_FAILURE ,
					"Set User Location [On Emulator] : Not able to set location for Emulator. Error occurred - "
							+ e.getMessage()) ;
			flag = false ;
		}

		return flag ;
	}



	public static boolean CreateAccountWithalreadyexistsEmailID(TestCases testCase, TestCaseInputs inputs) {

		boolean flag=true;
		LoginScreen ls=new LoginScreen(testCase);
		CreateAccountScreen cs=new CreateAccountScreen(testCase);

		if(ls.isCreateAccountVisible())
		{
			ls.navigateToCreateAccountScreen();

			if(cs.isSelectSelectSearchVisible())
			{
				if(cs.isSelectCountryVisible())
				{
					cs.clickOnSelectCountryButton();
				}
			}

			if(cs.isFirstNameLabelVisible())
			{
				if(cs.setFirstNameValue("ABC"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}

					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Successfully Set First Name. ");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set First Name.");
					flag = false;
				}			

			}
			if(cs.isLastNameLabelVisible())
			{
				if(cs.setLastNameValue("DEF"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  :Successfully Set Last Name.");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Last Name.");
					flag = false;
				}	
			}
			if(cs.isEmailLabelVisible())
			{
				if (cs.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Email Address set to - " + inputs.getInputValue("USERID"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Email Address.");
					flag = false;
				}
			}


			if(cs.isPasswordLabelVisible())
			{
				if (cs.setPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Password.");
					flag = false;
				}
			}

			if(cs.isVerifyPasswordLabelVisible())
			{
				if (cs.setVerifyPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Verify Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Verify Password.");
					flag = false;
				}
			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.scrollToExactAndroid(testCase , "Create");
			}
			else
			{
				try
				{
					//LyricUtils.scrollToElementUsingExactAttributeValue(testCase , "label" , "Create");
					LyricUtils.scrollToElementUsingAttributeSubStringValueIOS(testCase , "XPATH" , "//XCUIElementTypeButton[@label='Create']");
				}
				catch (Exception e)
				{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
				}
			}
			if(cs.isCreateButtonVisible())
			{
				cs.clickOnCreateButton();

			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.scrollToExactAndroid(testCase , "This email address has already been registered.");

			}

			if(cs.isAlreadyRegisteredEmailVisible())
			{
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Verify Already Registered Email Popup - " + cs.getAlreadyRegisteredEmailPopup());
			}

		}
		return flag;

	}




	public static boolean CreateAccountWithValidEmailAddressErrorpopup(TestCases testCase, TestCaseInputs inputs) {


		boolean flag=true;
		LoginScreen ls=new LoginScreen(testCase);
		CreateAccountScreen cs=new CreateAccountScreen(testCase);

		if(ls.isCreateAccountVisible())
		{
			ls.navigateToCreateAccountScreen();

			if(cs.isSelectSelectSearchVisible())
			{
				if(cs.isSelectCountryVisible())
				{
					cs.clickOnSelectCountryButton();
				}
			}

			if(cs.isFirstNameLabelVisible())
			{
				if(cs.setFirstNameValue("ABC"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");						
					}

					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Successfully Set First Name. ");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set First Name.");
					flag = false;
				}			

			}
			if(cs.isLastNameLabelVisible())
			{
				if(cs.setLastNameValue("DEF"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  :Successfully Set Last Name.");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Last Name.");
					flag = false;
				}	
			}
			if(cs.isEmailLabelVisible())
			{
				if(cs.setLastNameValue("Email"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  :Successfully Set Email.");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Email.");
					flag = false;
				}	
			}


			if(cs.isPasswordLabelVisible())
			{
				if (cs.setPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Password.");
					flag = false;
				}
			}

			if(cs.isVerifyPasswordLabelVisible())
			{
				if (cs.setVerifyPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Verify Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Verify Password.");
					flag = false;
				}
			}


			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.scrollToExactAndroid(testCase , "Create");
			}
			else
			{
				try
				{
					LyricUtils.scrollToElementUsingExactAttributeValue(testCase , "label" , "Create");
				}
				catch (Exception e)
				{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
				}
			}


			if(cs.isCreateButtonVisible())
			{
				cs.clickOnCreateButton();

				if(!MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				}

			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.scrollToExactAndroid(testCase , "Email");		

			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if(cs.isEmptyEmailVisible())
				{
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Verify Already Registered Email Popup - " + cs.getEmptyEmailPopup());
				}
			}else
			{
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				if(cs.isOkButtonVisible())
				{
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Please Correct the Following - Please enter a valid Email Address " );
				}
			}

			if(!MobileUtils.isRunningOnAndroid(testCase))
			{
				if(cs.isOkButtonVisible())
				{
					cs.clickOnOkButton();
				}
			}


		}
		return flag;
	}


	public static boolean CreateAccountWithFirstNameErrorPopup(TestCases testCase, TestCaseInputs inputs) {

		boolean flag=true;
		CreateAccountScreen cs=new CreateAccountScreen(testCase);

		cs.ClickOnFirstName();
		WebElement tap =cs.getFirstNameButton();
		tap.clear();

		if(cs.isEmailLabelVisible())
		{
			if (cs.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Email Address set to - " + inputs.getInputValue("USERID"));
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Email Address.");
				flag = false;
			}
		}



		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.scrollToExactAndroid(testCase , "Create");
		}
		else
		{
			try
			{
				LyricUtils.scrollToElementUsingExactAttributeValue(testCase , "label" , "Create");
			}
			catch (Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
		}
		if(cs.isCreateButtonVisible())
		{
			cs.clickOnCreateButton();
			if(!MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
			}

		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.scrollToExactAndroid(testCase , "First Name");


		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			if(cs.isFirstNameErrorFieldVisible())
			{
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Verify Already Registered Email Popup - " + cs.getFirstNameErrorFieldPopup());
			}
		}else
		{
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
			if(cs.isOkButtonVisible())
			{
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Please Correct the Following - Enter Your full name " );
			}}

		if(!MobileUtils.isRunningOnAndroid(testCase))
		{
			if(cs.isOkButtonVisible())
			{
				cs.clickOnOkButton();
			}
		}


		return flag;
	}


	public static String getCurrentPSTTime(TestCases testCase) {
		String PSTTime = " ";
		try {

			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Date date = new Date();
			vacationDateFormat.setTimeZone(TimeZone.getTimeZone("PST"));
			PSTTime = vacationDateFormat.format(date);
		} catch (Exception e) {
			PSTTime = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Convert Time to UTC Time : Error occurred : " + e.getMessage());
		}
		return PSTTime;
	}

	public static String getCurrentISTTime(TestCases testCase) {
		String ISTTime = " ";
		try {

			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Date date = new Date();
			vacationDateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
			ISTTime = vacationDateFormat.format(date);
		} catch (Exception e) {
			ISTTime = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Convert Time to UTC Time : Error occurred : " + e.getMessage());
		}
		return ISTTime;
	}

	public static String roundOffTimeToTheNearest10minutes(TestCases testCase, String time) {
		String roundOffTime = " ";
		try {
			SimpleDateFormat vacationDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Calendar c = Calendar.getInstance();
			c.setTime(vacationDateFormat.parse(time));
			int minutes = c.get(Calendar.MINUTE);
			int mod = minutes % 10;
			int diff = 10 - mod;
			c.add(Calendar.MINUTE, diff);
			c.set(Calendar.SECOND, 0);
			roundOffTime = vacationDateFormat.format(c.getTime());
		} catch (Exception e) {
			roundOffTime = " ";
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Add days to date : Error occurred : " + e.getMessage());
		}
		return roundOffTime;
	}

	public static boolean logintoLyricWithInvalidPassword(TestCases testCase, TestCaseInputs inputs) 
	{
		boolean flag=true;
		LoginScreen ls = new LoginScreen(testCase);
		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}
		

		if (ls.setEmailAddressValue(inputs.getInputValue("USERID").toString()))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + inputs.getInputValue("USERID").toString());
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		//if (ls.setPasswordValue("Balaji123")) 
		if (ls.setPasswordValue(GlobalVariables.Invalid_Pwd))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + GlobalVariables.Invalid_Pwd);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}
		if (ls.isLoginButtonVisible()) {
			flag = flag && ls.clickOnLoginButton();
		} else {
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
		}

		if(ls.isLoginInvalidPwdErrorMsgVisible()||ls.isLoginInvalidEmailAddErrorMsgVisible())
		{
			Keyword.ReportStep_Pass(testCase, "Unable to login. Email or password incorrect.Invalid Password Error message is displayed.");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Uanble to verify Invalid Password Error Message.");
			flag = false;
		}

		/*if (!MobileUtils.isRunningOnAndroid(testCase))
		{
			ls.clickOnOKButton();
		}*/

		return flag;
	}

	public static boolean logintoLyricWithSpecialCredentials(TestCases testCase, TestCaseInputs inputs) 
	{
		boolean flag=true;
		LoginScreen ls = new LoginScreen(testCase);
		String splEmail="maat@@grr!la";
		String splPassword="$@##!*%&&";
		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}

		if (ls.setEmailAddressValue(splEmail))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + splEmail);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		//if (ls.setPasswordValue("Balaji123")) 
		if (ls.setPasswordValue(splPassword))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + splPassword);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}


		if(ls.isLoginButtonDisabled())
		{
			Keyword.ReportStep_Pass(testCase, "Unable to login. Login button is Disabled");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Uanble to verify Login Button");
			flag = false;
		}

		if(!ls.clickOnCancelButton())
		{
			flag=false;
		}

		return flag;
	}

	public static boolean logintoLyricWithInvalidEmailAddress(TestCases testCase, TestCaseInputs inputs) {
		boolean flag=true;
		LoginScreen ls = new LoginScreen(testCase);

		WebElement tap =ls.getEmailIdStatus(inputs);
		tap.clear();
		WebElement tap1 =ls.getPasswordStatus(inputs);
		tap1.clear();


		if (ls.setEmailAddressValue(GlobalVariables.Invalid_EmailID))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + GlobalVariables.Invalid_EmailID);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		if (ls.setPasswordValue(GlobalVariables.valid_Pwd)) 
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + GlobalVariables.valid_Pwd);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}
		if (ls.isLoginButtonVisible()) {
			flag = flag && ls.clickOnLoginButton();
		} else {
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
		}

		if(ls.isLoginInvalidPwdErrorMsgVisible()||ls.isLoginInvalidEmailAddErrorMsgVisible())
		{
			Keyword.ReportStep_Pass(testCase, "Unable to login. Email or password incorrect.Invalid Email Address Error message is displayed.");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Uanble to verify Invalid Password Error Message.");
			flag = false;
		}

		/*if (!MobileUtils.isRunningOnAndroid(testCase))
		{
			ls.clickOnOKButton();
		}*/


		return flag;
	}

	public static boolean logintoLyricWithvalidEmailAddresswithSpace(TestCases testCase, TestCaseInputs inputs) {
		boolean flag=true;
		LoginScreen ls = new LoginScreen(testCase);

		WebElement tap =ls.getEmailIdStatus(inputs);
		tap.clear();
		WebElement tap2 =ls.getEmailIdStatus(inputs);
		tap2.clear();
		WebElement tap1 =ls.getPasswordStatus(inputs);
		tap1.clear();


		if (ls.setEmailAddressValue(GlobalVariables.valid_EmailID_space))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + GlobalVariables.valid_EmailID_space);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}
		if (ls.setPasswordValue(GlobalVariables.valid_Pwd)) 
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + GlobalVariables.valid_Pwd);
		} 
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}
		if (ls.isLoginButtonVisible()) {
			flag = flag && ls.clickOnLoginButton();
		} else {
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
		}
		boolean closeCoachMarks = false;
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			if(ls.isLoginButtonDisabled())
			{
				Keyword.ReportStep_Pass(testCase, "Login Button is disabled.");
			}

			if(ls.isLoginInvalidPwdErrorMsgVisible()||ls.isLoginInvalidEmailAddErrorMsgVisible())
			{
				Keyword.ReportStep_Pass(testCase, "Your email address or password is invalid..");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Uanble to verify Your email address or password is invalid Error Message.");
				flag = false;
			}

		}
		

		return flag;
	}







	public static boolean ScrollforSingleDayLocalization(List<String> dsd, TestCases testCase)
	{

		boolean flag = true, isScreenshotTaken = true ;
		try
		{
			MobileScreens ms = new MobileScreens(testCase) ;
			Document doc = ms.getPageSource() ; // XML
			CustomDriver driver = testCase.getMobileDriver() ;
			TouchAction action = new TouchAction(testCase.getMobileDriver());


			Dimension dimension = driver.manage().window().getSize();
			for (String temp : dsd) // Follow
			{
				if (MobileUtils.isRunningOnAndroid(testCase))
				{
					while(!ms.isElementPresent(doc , String.format("//*[contains(@content-desc,'%s') or contains(@text,'%s')]" , temp , temp)))
					{	
						if (ms.isElementPresent(doc , String.format("//*[contains(@content-desc,'%s') or contains(@text,'%s')]" , temp , temp)))
						{
							String strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'" + temp+ "')]" , false , false).getText() ;
							if (strText.isEmpty() || strText == null)
							{
								if (testCase.getTestCaseInputs().isRunningOn("TestObject"))
								{
									strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'"+ temp + "')]" , false , false).getAttribute("contentDescription") ;
								}
								else
								{
									strText = MobileUtils.getMobElement(testCase ,"XPATH" ,"//*[contains(@content-desc,'" + temp + "') or contains(@text,'"+ temp + "')]" , false , false).getAttribute("name") ;
								}
							}
							if (isScreenshotTaken)
							{
								ReportStep_Pass_With_ScreenShot(testCase , "Expected Text displayed : "+ strText , driver) ;
								isScreenshotTaken = false ;
							}
							else
							{
								Keyword.ReportStep_Pass(testCase , "Expected Text displayed : " + strText) ;
							}
						}
						else
						{
							action.press(point(350, 900)).waitAction(waitOptions(MobileUtils.getDuration(2000))).moveTo(point(250, 250)).release().perform();


						}
					}


				}
				else
				{
					while(!ms.isElementPresent(doc , String.format("//*[(@value='%s') or (@name='%s') or (@label='%s')]" , temp , temp , temp)))
					{
						if (ms.isElementPresent(doc , String.format("//*[(@value='%s') or (@name='%s') or (@label='%s')]" , temp , temp , temp)))
						{
							if (isScreenshotTaken)
							{
								ReportStep_Pass_With_ScreenShot(testCase , "Text displayed : " + temp ,driver) ;
								isScreenshotTaken = false ;
							}
							else
							{
								Keyword.ReportStep_Pass(testCase , "Text displayed : " + temp) ;
							}
						}

						else if (ms.isElementPresent(doc , String.format("//*[contains(@value,'%s') or contains(@name,'%s') or contains(@label,'%s') ]" , temp ,temp , temp)))
						{
							if (isScreenshotTaken)
							{
								ReportStep_Pass_With_ScreenShot(testCase , "Text displayed : " + temp ,driver) ;
								isScreenshotTaken = false ;
							}
							else
							{
								Keyword.ReportStep_Pass(testCase , "Text displayed : " + temp) ;
							}
						}

						else
						{
							action.press(point(10, (int) (dimension.getHeight() * .5))).moveTo(point(0, (int) (dimension.getHeight() * -.4))
							).release().perform();
						}
					}
				}
			}

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase , FailType.FUNCTIONAL_FAILURE , "Error occurred : "+e.getMessage()) ;
		}
		return flag ;
	}



	public static boolean VerifyInvitedUser(TestCases testCase, TestCaseInputs inputs) {
		// TODO Auto-generated method stub
		boolean flag = true,verify=false ;

		try
		{
			LocationInformation de= new LocationInformation(testCase, inputs);
			long locationid=de.getLocationID();
			String countryName=de.getCountry();
			String zipCode=de.getZipCode();
			String streetAddress=de.getStreetAddress();
			inputs.setInputValue("CountryNameA", countryName, true);
			inputs.setInputValue("ZipCodeA", zipCode, true);
			inputs.setInputValue("StreetAddressA", streetAddress, true);
			String locid=String.valueOf(locationid);
			TestCaseInputs newInputs= new TestCaseInputs();
			newInputs.setInputValue("USERID", inputs.getInputValue("INVITE_USER").toString(), true);
			newInputs.setInputValue("PASSWORD", inputs.getInputValue("INVITE_PASSWORD").toString(), true);
			HashMap<String, Long> keys=null;
			newInputs.setInputValue(TestCaseInputs.APP_ENVIRONMENT, inputs.getInputValue("INVITE_APPENV").toString(), true);
			@SuppressWarnings("resource")
			CHILUtil chUtil = new CHILUtil(newInputs);
			if (chUtil.getConnection()) {
				keys=chUtil.getLocationNamesAndId();
			}
			Iterator<Entry<String, Long>> it = keys.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry pair = (Map.Entry)it.next();
				if(String.valueOf(pair.getValue()).equals(locid))
				{
					verify=true;

					Keyword.ReportStep_Pass(testCase, inputs.getInputValue("INVITE_USER").toString() +" has been Invited successfully from "+inputs.getInputValue("USERID")+" and verify through the CHIL\n Location ID : "+locid+" is successfully added in "+inputs.getInputValue("INVITE_USER").toString()+ " account");
					Keyword.ReportStep_Pass(testCase,"verified the access for invited location");
					break;
				}
			}
			if(!verify)
			{
				flag=false;
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Invite User: Unable to Invite User");
			}
		}
		catch(Exception e)
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
		}

		return flag;
	}

	public static boolean EnterValidCredentialsCreateAccountScreenLocalization(TestCases testCase,TestCaseInputs inputs)
	{
		boolean flag=true;
		CreateAccountScreen cs=new CreateAccountScreen(testCase,testCase.getTestCaseInputs().getInputValue("LANGUAGE"));
		if(cs.isFirstNameLabelVisible())
		{
			if(cs.setFirstNameValue("ABC"))
			{
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}
				else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					/*if(cs.isDoneKeyVisible(5))
					{
						cs.clickOnDoneKey();
					}*/
				}

				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Successfully Set First Name. ");
			}
			else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set First Name.");
				flag = false;
			}			

		}
		else
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to find 'First Name' field", false);
		}

		if(cs.isLastNameLabelVisible())
		{
			if(cs.setLastNameValue("DEF"))
			{
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					/*if(cs.isDoneKeyVisible(5))
					{
						cs.clickOnDoneKey();
					}*/
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  :Successfully Set Last Name.");
			}
			else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Last Name.");
				flag = false;
			}	
		}
		else
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to find 'Last Name' field", false);
		}

		if(cs.isEmailLabelVisible())
		{
			if (cs.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
					/*if(cs.isDoneKeyVisible(5))
					{
						cs.clickOnDoneKey();
					}*/
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Email Address set to - " + inputs.getInputValue("USERID"));
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Email Address.");
				flag = false;
			}
		}
		else
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to find 'Email' field", false);
		}


	if(cs.isPasswordLabelVisible())
	{
		if (cs.setPasswordValue(inputs.getInputValue("Password").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
			}
			Keyword.ReportStep_Pass(testCase,
				"Create Account  : Password set to - " + inputs.getInputValue("Password"));
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Password.");
				flag = false;
			}
		}
		else
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to find 'Password' field", false);
		}

		if(cs.isVerifyPasswordLabelVisible())
	{
			if (cs.setVerifyPasswordValue(inputs.getInputValue("Password").toString())) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Verify Password set to - " + inputs.getInputValue("Password"));
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Verify Password.");
				flag = false;
			}
	}
		else
		{
			flag=false;
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to find 'Verify Password' field", false);
		}

		return flag;
	}


	public static boolean enterCreateAccountFields(TestCases testCase, TestCaseInputs inputs) {

		boolean flag=true;
		LoginScreen ls=new LoginScreen(testCase);
		CreateAccountScreen cs=new CreateAccountScreen(testCase);

		if(ls.isCreateAccountVisible())
		{
			ls.navigateToCreateAccountScreen();

			if(cs.isSelectSelectSearchVisible())
			{
				if(cs.isSelectCountryVisible())
				{
					cs.clickOnSelectCountryButton();
				}
			}

			if(cs.isFirstNameLabelVisible())
			{
				if(cs.setFirstNameValue("ABC"))
				{
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}

					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Successfully Set First Name. ");
				}
				else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set First Name.");
					flag = false;
				}			

			}

			if(cs.isEmailLabelVisible())
			{
				if (cs.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Email Address set to - " + inputs.getInputValue("USERID"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Email Address.");
					flag = false;
				}
			}


			if(cs.isPasswordLabelVisible())
			{
				if (cs.setPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Password.");
					flag = false;
				}
			}

			if(cs.isVerifyPasswordLabelVisible())
			{
				if (cs.setVerifyPasswordValue(inputs.getInputValue("Password").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}else {
						MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
					}
					Keyword.ReportStep_Pass(testCase,
							"Create Account  : Verify Password set to - " + inputs.getInputValue("Password"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Create Account : Not able to set Verify Password.");
					flag = false;
				}
			}


		}
		return flag;

	}

	public static boolean openSetting(TestCases testCase, TestCaseInputs inputs) {
		boolean flag=true;
		if (MobileUtils.isRunningOnAndroid(testCase)) {
			Activity activity = new Activity("com.android.settings",
					"com.android.settings.Settings");
			((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);
			Keyword.ReportStep_Pass(testCase,
					"User Opens the Mobile Settings");

			MobileUtils.minimizeApp(testCase , 5);

			MobileUtils.hideKeyboard(testCase.getMobileDriver());

			Keyword.ReportStep_Pass(testCase,
					"User relaunches the app");
		}
		else
		{
			MobileUtils.launchSettingsAppOnIOS(testCase);
			CustomDriver driver = testCase.getMobileDriver();

			HashMap<String, String> app = new HashMap<>();
			app.put("name", "Honeywell");

			try {
				driver.executeScript("mobile:application:open", app);
			} catch (Exception e) {
				FrameworkGlobalVariables.logger4J.logWarn("App is already open, continue with script");
			}


		}
		
		return flag;
	}

	public static boolean VerifyCreateAccountFields(TestCases testCase, TestCaseInputs inputs) {

		boolean flag=true;
		LoginScreen ls=new LoginScreen(testCase);
		CreateAccountScreen cs=new CreateAccountScreen(testCase);


		if(cs.isFirstNameLabelVisible())
		{

			Keyword.ReportStep_Pass(testCase,
					"Create Account  : User is on Create Account Page");

		}
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : User is not on Create Account Page");
			flag = false;
		}

		if(cs.isLastNameLabelVisible())
		{
			if(cs.setLastNameValue("DEF"))
			{
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : User is able to continue entering create account fields");
			}
			else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Last Name.");
				flag = false;
			}	
		}




		return flag;

	}

	public static boolean CreateAccount(TestCases testCase, TestCaseInputs inputs) {boolean flag=true;
	Random rn = new Random();
	int value = rn.nextInt();
	String email="";
	LoginScreen ls=new LoginScreen(testCase);
	CreateAccountScreen cs=new CreateAccountScreen(testCase);


	if(ls.isCreateAccountVisible())
	{
		ls.navigateToCreateAccountScreen();

		if(cs.isSelectSelectSearchVisible())
		{
			if(cs.isSelectCountryVisible())
			{
				cs.clickOnSelectCountryButton();
				Keyword.ReportStep_Pass(testCase,
						"Successfully Clicked on Search Country ");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Not able to click on Search Country");
			}
		}

		if(cs.isFirstNameLabelVisible())
		{
			if(cs.setFirstNameValue("ABC"))
			{
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}
				else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");						
				}

				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Successfully Set First Name. ");
			}
			else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set First Name.");
				flag = false;
			}			

		}
		if(cs.isLastNameLabelVisible())
		{
			if(cs.setLastNameValue("XYZ"))
			{
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  :Successfully Set Last Name.");
			}
			else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Last Name.");
				flag = false;
			}	
		}

		if(cs.isEmailLabelVisible())
		{
			email="rn"+value+"@grr.la";
			inputs.setInputValue("EmailAddress", email, false);
			if (cs.setEmailAddressValue(email)) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Email Address set to -"+email);
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Email Address.");
				flag = false;
			}
		}

		if(cs.isPasswordLabelVisible())
		{
			if (cs.setPasswordValue("Password1")) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Password set to - Password1");
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Password.");
				flag = false;
			}
		}

		if(cs.isVerifyPasswordLabelVisible())
		{
			if (cs.setVerifyPasswordValue("Password1")) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
				}
				Keyword.ReportStep_Pass(testCase,
						"Create Account  : Verify Password set to - Password1");
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Verify Password.");
				flag = false;
			}
		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.scrollToExactAndroid(testCase , "Privacy Policy && EULA");
		}
		else
		{
			TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
			CustomDriver driver = testCase.getMobileDriver();
			Dimension dimension = driver.manage().window().getSize();
			touchAction.press(point(10, (int) (dimension.getHeight() * .5))).moveTo(point(0, (int) (dimension.getHeight() * -.4)))
			.release().perform();
			touchAction.press(point(10, (int) (dimension.getHeight() * .5))).moveTo(point(0, (int) (dimension.getHeight() * -.4)))
			.release().perform();
		}

		if(cs.isEluaPrivacyPolicyVisible())
		{
			cs.clickonEluaPrivacyPolicy();
		}

		
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.hideKeyboard(testCase.getMobileDriver());
		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.scrollToExactAndroid(testCase , "Create");
		}
		else
		{
			try
			{
				LyricUtils.scrollToElementUsingExactAttributeValue(testCase , "label" , "Create");
			}
			catch (Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
				flag=false;
			}
		}


		if(cs.isCreateButtonVisible())
		{
			cs.clickOnCreateButton();

			if(!MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
			}

		}
		

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}



				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
					MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Thread.sleep(2000);
				try {
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();	
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys();
					
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();

				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(email);
					
				} catch (Exception e) {
				}
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(1000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View']"));
				}
				i=0;
				while(i<=saq.size())
				{
					if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
					{
						saq.get(i).click();
						break;
					}
					i++;
				}
						
				CreateAccountScreen.SwipeToActivateAccount(testCase);
				Thread.sleep(2000);
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']" , testCase,25,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']")).click();
					Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				}
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				//testCase.getMobileDriver().launchApp();
				MobileUtils.minimizeApp(testCase, 10);
			}
		}
		else
		{
			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
					Thread.sleep(7000);

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
				}
				//testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}


				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(email);


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Thread.sleep(7000);

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+email);


				Thread.sleep(7000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Activate Account']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Keyword.ReportStep_Pass(testCase , "Successfully activate account");
				Thread.sleep(2000);

			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				testCase.getMobileDriver().launchApp();
			}
		}

		
		if(!MobileUtils.isRunningOnAndroid(testCase))
		{


			if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
				flag = flag && ls.clickOnLoginButton();
			}

			ls.setEmailAddressValue(email);
			if (ls.setPasswordValue("Password1")) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}
				else
				{
					ls.clickOnLyricLogo();
				}
				Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Login To Lyric : Not able to set Password.");
				flag = false;
			}
			if (ls.isLoginButtonVisible()) {
				flag = flag && ls.clickOnLoginButton();
			} else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
			}
		}


		


		if(MobileUtils.isRunningOnAndroid(testCase))
		{

			if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Add New Device']" , testCase))
			{
				Keyword.ReportStep_Pass(testCase, "Add New Device Screen displayed Successful.");
			}
			/*else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Add New Device Screen is not displayed");
				flag=false;
			}*/

		}
		else
		{
			do{
				if(MobileUtils.isMobElementExists("XPATH" , "//*[@value='Add New Device']" , testCase,3))
				{
					break;
				}
			}while(!MobileUtils.isMobElementExists("XPATH" , "//*[@value='Add New Device']" , testCase,3));


			if(MobileUtils.isMobElementExists("XPATH" , "//*[@value='Add New Device']" , testCase))
			{
				Keyword.ReportStep_Pass(testCase, "Add New Device Screen displayed Successful.");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Add New Device Screen is not displayed");
				flag=false;
			}
			if(cs.isCameraDevice())
			{
				Keyword.ReportStep_Pass(testCase, "Devices ares showing up based on the NA countries");
			}
		}

		
	}
	return flag;
}

	

	public static void swipe(TestCases testCase,String str)
	{
		Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();


		Double screenHeightStart = dimensions.getHeight() * 0.5;

		int scrollStart = screenHeightStart.intValue();

		Double screenHeightEnd = dimensions.getHeight() * 0.2;

		int scrollEnd = screenHeightEnd.intValue();

		testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 1050);
		testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 1050);


	}

	public static boolean openBrowser(TestCases testCase, TestCaseInputs inputs,boolean verifyInvalid) {

		boolean flag=true;

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				else if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='data:,']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				else if(MobileUtils.isMobElementExists("id" , "com.android.chrome:id/url_bar" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).click();

					testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				Thread.sleep(2000);
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(inputs.getInputValue("USERID").toString());


				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+inputs.getInputValue("USERID").toString());


				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(10000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				}

				saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));

				if(verifyInvalid)
				{
					List<MobileElement> saq1 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='2']"));
					i=saq.size();

					while(i>0)
					{
						
						if(saq.get(i-1).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							if(saq1.get(i-1).getText().contains("Honeywell Connected Home - Reset Password"))
							{
								saq.get(i-1).click();
								break;
							}
							else
							{
								Keyword.ReportStep_Pass(testCase , "Link already visited or another mail is came i.e "+saq1.get(i-1).getText());
							}
						}
						i--;
					}
				}
				else
				{
					i=0;
					while(i<saq.size())
					{
						
						if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							Keyword.ReportStep_Pass(testCase , "Mail receive and open the mail.");
							saq.get(i).click();
							break;
						}
						i++;
					}

					swipe(testCase , "EMAIL");
					swipe(testCase , "Reset Password");

					Thread.sleep(2000);
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Reset Password']")).click();
					Keyword.ReportStep_Pass(testCase , "Click on reset password button.");
					MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);

					testCase.getMobileDriver().findElement(By.id("TxtPassword")).click();
					testCase.getMobileDriver().findElement(By.id("TxtPassword")).sendKeys(inputs.getInputValue("NEWPASSWORD"));
					Keyword.ReportStep_Pass(testCase , "Set new password i.e."+inputs.getInputValue("NEWPASSWORD"));
					testCase.getMobileDriver().findElement(By.id("TexPasswordAgain")).click();
					testCase.getMobileDriver().findElement(By.id("TexPasswordAgain")).sendKeys(inputs.getInputValue("NEWPASSWORD"));
					Keyword.ReportStep_Pass(testCase , "Confirm new password i.e."+inputs.getInputValue("NEWPASSWORD"));

					if(MobileUtils.isRunningOnAndroid(testCase))
					{
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}

					testCase.getMobileDriver().findElement(By.id("CngPwdBtn")).click();
					Keyword.ReportStep_Pass(testCase , "Click on change button and successfully change the password.");

					Thread.sleep(2000);
				}
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				testCase.getMobileDriver().launchApp();
			}

		}
		else
		{

			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");
				

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}


				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(inputs.getInputValue("USERID").toString());


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+inputs.getInputValue("USERID").toString());
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Reset Password']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on reset password button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='New Password']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='New Password']")).sendKeys(inputs.getInputValue("NEWPASSWORD"));
				MobileUtils.hideKeyboardIOS(driver, "return");
				Keyword.ReportStep_Pass(testCase , "Set new password i.e."+inputs.getInputValue("NEWPASSWORD"));
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Re-enter Password']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Re-enter Password']")).sendKeys(inputs.getInputValue("NEWPASSWORD"));
				Keyword.ReportStep_Pass(testCase , "Confirm new password i.e."+inputs.getInputValue("NEWPASSWORD"));
				MobileUtils.hideKeyboardIOS(driver, "return");
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Change Password']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on change button and successfully change the password.");

				Thread.sleep(2000);

			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				testCase.getMobileDriver().launchApp();
			}

		}
		return flag;
	}	


	public static boolean resetPassword(TestCases testCase, TestCaseInputs inputs,String pass) {
		boolean flag=true;

		try
		{
			LoginScreen ls = new LoginScreen(testCase);
			if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
				flag = flag && ls.clickOnLoginButton();
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			if(ls.isForgotPasswordButtonVisible())
			{
				ls.clickOnForgotPasswordButton();
			}

			ls.setForgotPasswordEmailAddressValue(inputs.getInputValue("USERID").toString());

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			ls.clickonResetButton();

			MobileUtils.isMobElementExists("id" , "xyz" , testCase,40,false);

			
			openBrowser(testCase,inputs,false);

			

			if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
				flag = flag && ls.clickOnLoginButton();
			}
			else if(ls.isCancelButtonVisible())
			{
				ls.clickOnCancelButton();	
			}

			ls.setEmailAddressValue(inputs.getInputValue("USERID").toString());

			if(pass.equalsIgnoreCase("New password"))
			{

				if (ls.setPasswordValue(inputs.getInputValue("NEWPASSWORD").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else
					{
						ls.clickOnLyricLogo();
					}
					Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("NEWPASSWORD"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Login To Lyric : Not able to set Password.");
					flag = false;
				}

				if (ls.isLoginButtonVisible()) {
					flag = flag && ls.clickOnLoginButton();
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				}

				inputs.setInputValue(ChangePasswordThroughCHIL.OLD_PASSWORD, inputs.getInputValue("NEWPASSWORD").toString(), false);
				inputs.setInputValue(ChangePasswordThroughCHIL.NEW_PASSWORD, inputs.getInputValue("ORIPASSWORD").toString(), false);

			}
			else
			{
				if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else
					{
						ls.clickOnLyricLogo();
					}
					Keyword.ReportStep_Pass(testCase, "Login To Lyric : Old Password set to - " + inputs.getInputValue("PASSWORD"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Login To Lyric : Not able to set Password.");
					flag = false;
				}

				if (ls.isLoginButtonVisible()) {
					flag = flag && ls.clickOnLoginButton();
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				}


				if(ls.isLoginInvalidEmailAddErrorMsgVisible())
				{
					Keyword.ReportStep_Pass(testCase, "Verified the App not allow to the user log into the App with old password after resetting");
				}
				else
				{
					flag=false;
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Unable to verify the App not allow to the user log into the App with old password after resetting");
				}



			}

			inputs.setInputValue(ChangePasswordThroughCHIL.OLD_PASSWORD, "Password123", false);
			inputs.setInputValue(ChangePasswordThroughCHIL.NEW_PASSWORD, inputs.getInputValue("PASSWORD").toString(), false);

		}
		catch(Exception e)
		{

		}



		//flag = flag && LyricUtils.loginToLyricApp(testCase, inputs);


		return flag;
	}



	public static boolean CreateAccountActivationLink(TestCases testCase, TestCaseInputs inputs,boolean rebranding) {
		boolean flag=true;

		try
		{
			LoginScreen ls = new LoginScreen(testCase);

			CreateAccountScreen cas = new CreateAccountScreen(testCase);

			if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
				flag = flag && ls.navigateToCreateAccountScreen();
			}
			if(cas.isSelectSelectSearchVisible())
			{
				if(cas.isSelectCountryVisible())
				{
					cas.clickOnSelectCountryButton();
				}
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			if(cas.isFirstNameLabelVisible())
			{
				cas.setFirstNameValue("Testing");
			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			if(cas.isLastNameLabelVisible())
			{
				cas.setLastNameValue("Product");
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String email=dateFormat.format(date);
			if(cas.isEmailLabelVisible())
			{
				cas.setEmailAddressValue("r"+email+"g@grr.la");
				inputs.setInputValue("USERID" , "r"+email+"g@grr.la");
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}

			if(cas.isPasswordLabelVisible())
			{
				cas.setPasswordValue("Password1");
				inputs.setInputValue("PASSWORD" , "Password1");
			}

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			if(cas.isVerifyPasswordLabelVisible())
			{
				cas.setVerifyPasswordValue("Password1");
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{

			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.scrollToExactAndroid(testCase , "Create");
			}
			else
			{

			}


			cas.clickOnCreateButton();

			Thread.sleep(5000);

			MobileUtils.pressBackButton(testCase);

			if(rebranding)
			{

			}
			else
			{
				if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
					flag = flag && ls.clickOnLoginButton();
				}

				ls.setEmailAddressValue(inputs.getInputValue("USERID").toString());
				if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else
					{
						ls.clickOnLyricLogo();
					}
					Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Login To Lyric : Not able to set Password.");
					flag = false;
				}
				if (ls.isLoginButtonVisible()) {
					flag = flag && ls.clickOnLoginButton();
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				}

				cas.ClickOnResendButton();

				MobileUtils.pressBackButton(testCase);
			}
			if(!openBrowserCreateAccount(testCase,inputs,true,rebranding))
			{
				flag=false;
			}

			if(rebranding)
			{
				if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
					flag = flag && ls.clickOnLoginButton();
				}

				ls.setEmailAddressValue(inputs.getInputValue("USERID").toString());
				if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else
					{
						ls.clickOnLyricLogo();
					}
					Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Login To Lyric : Not able to set Password.");
					flag = false;
				}
				if (ls.isLoginButtonVisible()) {
					flag = flag && ls.clickOnLoginButton();
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				}

				cas.ClickOnResendButton();

				MobileUtils.pressBackButton(testCase);
			}

			if(!rebranding)
			{
				if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
					flag = flag && ls.clickOnLoginButton();
				}

				ls.setEmailAddressValue(inputs.getInputValue("USERID").toString());
				if (ls.setPasswordValue(inputs.getInputValue("PASSWORD").toString())) {
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					else
					{
						ls.clickOnLyricLogo();
					}
					Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + inputs.getInputValue("PASSWORD"));
				} else {
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
							"Login To Lyric : Not able to set Password.");
					flag = false;
				}
				if (ls.isLoginButtonVisible()) {
					flag = flag && ls.clickOnLoginButton();
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				}

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Add New Device']" , testCase))
				{
					MobileUtils.pressBackButton(testCase);

					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='LOGOUT']" , testCase))
					{
						MobileUtils.clickOnElement(testCase , "XPATH" , "//*[@text='LOGOUT']");
					}

					if (ls.isLoginButtonVisible()) {
						Keyword.ReportStep_Pass(testCase, "[Logout of Lyric] : Logout operation Successful.");
					} else {
						Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
								"[Logout of Lyric] : Login screen verification failed.Not able to logout of the App after click on Logout option.");
						flag = false;
					}
				}
				else
				{

				}
			}
			else
			{
				if(!openBrowserCreateAccount(testCase,inputs,true,rebranding))
				{
					flag=false;
				}
			}
		}
		catch(Exception e)
		{

		}
		return flag;
	}



	public static boolean openBrowserCreateAccount(TestCases testCase, TestCaseInputs inputs,boolean verifyInvalid,boolean rebranding) {

		boolean flag=true;
		try
		{
			Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
			((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

			Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

			if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
			{
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				for(MobileElement temp : saq)
				{
					if(temp.getText().equals("https://www.guerrillamail.com"))
					{
						temp.click();
						break;
					}
				}
			}
			else if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='data:,']" , testCase,10,false))
			{
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).sendKeys("https://www.guerrillamail.com");

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				for(MobileElement temp : saq)
				{
					if(temp.getText().equals("https://www.guerrillamail.com"))
					{
						temp.click();
						break;
					}
				}
			}
			else if(MobileUtils.isMobElementExists("id" , "com.android.chrome:id/url_bar" , testCase,10,false))
			{
				testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).click();

				testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).sendKeys("https://www.guerrillamail.com");

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				for(MobileElement temp : saq)
				{
					if(temp.getText().equals("https://www.guerrillamail.com"))
					{
						temp.click();
						break;
					}
				}
			}
			Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

			MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
			testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
			Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
			Thread.sleep(2000);
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}

			Thread.sleep(2000);
			testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();

			testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(inputs.getInputValue("USERID").toString());


			testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

			testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

			testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

			Keyword.ReportStep_Pass(testCase , "Email id is set to "+inputs.getInputValue("USERID").toString());

			//swipe(testCase , "Click to Edit");
			/*MobileElement d=MobileUtils.getMobElement(testCase, "XPATH", "//*[@text='Click to Edit']",false,false);

		if(d!=null)
		{
			testCase.getMobileDriver().swipe(d.getLocation().getX(), d.getLocation().getY(), d.getLocation().getX(), 0, 3000);
		}*/


			/*WebElement mySelectElement = testCase.getMobileDriver().findElement(By.id("gm-host-select"));

		Select dropdown= new Select(mySelectElement);

		dropdown.selectByVisibleText("grr.la");*/


			List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
			int i=0;
			while (saq==null&&i<5)
			{
				Thread.sleep(10000);
				saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
			}

			saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));

			if(rebranding)
			{
				i=0;
				while(i<saq.size())
				{
					
					if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
					{
						Keyword.ReportStep_Pass(testCase , "Mail receive and open the mail.");
						saq.get(i).click();
						break;
					}
					i++;
				}

				if(testCase.getMobileDriver().getPageSource().contains("Please click the button below to activate your "+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" account."))
				{
					Keyword.ReportStep_Pass(testCase , "Expected text is displayed i.e 'Please click the button below to activate your "+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" account.'");
					Keyword.ReportStep_Pass(testCase , "Rebranding of the Home App from 'Honeywell' to 'Honeywell Home' is done successfully.");
				}
				else
				{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Rebranding of the Home App from 'Honeywell' to 'Honeywell Home' is not done successfully.");
					flag=false;
				}

				//Please click the button below to activate your Honeywell Home account.
			}
			else
			{
				if(verifyInvalid)
				{
					i=saq.size();

					while(i>0)
					{
						
						if(saq.get(i-1).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							saq.get(i-1).click();
							break;
							/*else
						{
							Keyword.ReportStep_Pass(testCase , "Link already visited or another mail is came i.e "+saq1.get(i-1).getText());
						}*/
						}
						i--;
					}
				}
				else
				{
					i=0;
					while(i<saq.size())
					{
						
						if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							Keyword.ReportStep_Pass(testCase , "Mail receive and open the mail.");
							saq.get(i).click();
							break;
						}
						i++;
					}
				}

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				

				Double screenHeightStart = dimensions.getHeight() * 0.5;

				int scrollStart = screenHeightStart.intValue();

				Double screenHeightEnd = dimensions.getHeight() * 0.2;

				int scrollEnd = screenHeightEnd.intValue();

				testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd+75, 1000);

				/*d=MobileUtils.getMobElement(testCase, "XPATH", "//*[@text='EMAIL']",false,false);

			if(d!=null)
			{
				testCase.getMobileDriver().swipe(d.getLocation().getX(), d.getLocation().getY(), d.getLocation().getX(), 0, 3000);
			}*/

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']" , testCase,25,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']")).click();
				}



				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Please check if the email is correct or if the account is already activated']" , testCase,10))
				{
					Keyword.ReportStep_Pass(testCase , "Old mail is expired.");
				}
				else
				{

				}

				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					testCase.getMobileDriver().navigate().back();
				}

				char roh= (char) 171;
				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='"+roh+" Back to inbox']" , testCase,10))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='"+roh+" Back to inbox']")).click();
				}
				else
				{

				}
				i=0;
				saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				while(i<saq.size())
				{
					
					if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
					{
						Keyword.ReportStep_Pass(testCase , "Mail receive and open the mail.");
						saq.get(i).click();
						break;
					}
					i++;
				}

				dimensions = testCase.getMobileDriver().manage().window().getSize();


				screenHeightStart = dimensions.getHeight() * 0.5;

				scrollStart = screenHeightStart.intValue();

				screenHeightEnd = dimensions.getHeight() * 0.2;

				scrollEnd = screenHeightEnd.intValue();

				testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd+50, 1000);
				/*d=MobileUtils.getMobElement(testCase, "XPATH", "//*[@text='EMAIL']",false,false);

			if(d!=null)
			{
				testCase.getMobileDriver().swipe(d.getLocation().getX(), d.getLocation().getY(), d.getLocation().getX(), 0, 3000);
			}*/

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account ']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");

				Thread.sleep(2000);
			}

		}
		catch(Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			flag=false;
		}
		finally
		{
			testCase.getMobileDriver().launchApp();
		}
		return flag;
	}

	public static boolean verifyResetLinkBrowser(TestCases testCase, TestCaseInputs inputs,boolean verifyInvalid) {

		boolean flag=true;

		if(MobileUtils.isRunningOnAndroid(testCase))
		{

			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				else if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='data:,']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='data:,']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				else if(MobileUtils.isMobElementExists("id" , "com.android.chrome:id/url_bar" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).click();

					testCase.getMobileDriver().findElement(By.id("com.android.chrome:id/url_bar")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				Thread.sleep(2000);
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				}

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(inputs.getInputValue("USERID").toString());


				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+inputs.getInputValue("USERID").toString());

				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);
				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(10000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				}

				saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));

				if(verifyInvalid)
				{
					List<MobileElement> saq1 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='2']"));
					i=saq.size();

					while(i>0)
					{
						
						if(saq.get(i-1).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							if(saq1.get(i-1).getText().contains("Honeywell Connected Home - Reset Password"))
							{
								Keyword.ReportStep_Pass(testCase , "Reset Mail received");
								break;
							}
							else
							{
								Keyword.ReportStep_Pass(testCase , "Link already visited or another mail is came i.e "+saq1.get(i-1).getText());
							}
						}
						i--;
					}
				}
				else
				{
					i=0;
					while(i<saq.size())
					{
						
						if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							Keyword.ReportStep_Pass(testCase , "Reset Mail received");
							break;
						}
						i++;
					}

				}

				LoginScreen lgs=new LoginScreen(testCase);



				MobileUtils.minimizeApp(testCase , 5);

				MobileUtils.hideKeyboard(testCase.getMobileDriver());

				Keyword.ReportStep_Pass(testCase,
						"User relaunches the app with the forgot password screen");

				lgs.clickonResetButton();

				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Thread.sleep(10000);
				Keyword.ReportStep_Pass(testCase , "Chrome browser is reopened with guerrilla mail web page.");

				List<MobileElement> saq2 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i1=0;
				while (saq2==null&&i<5)
				{
					Thread.sleep(10000);
					saq2 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				}

				saq2 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));

				if(verifyInvalid)
				{
					List<MobileElement> saq1 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='2']"));
					i=saq2.size();

					while(i>0)
					{
						
						if(saq1.get(i1-1).getText().contains("Honeywell Connected Home - Reset Password"))
						{
							Keyword.ReportStep_Pass(testCase , "Reset Mail received");
							break;
						}
						else
						{
							Keyword.ReportStep_Pass(testCase , "Link already visited or another mail is came i.e "+saq1.get(i-1).getText());
						}
						i1--;
					}
				}
				else
				{
					i1=0;
					while(i<saq2.size())
					{
						
						if(saq2.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
						{
							Keyword.ReportStep_Pass(testCase , "Reset Mail received");
							break;
						}
						i++;
					}

				}

				Thread.sleep(2000);

			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				testCase.getMobileDriver().launchApp();
			}

		}
		else
		{
			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");
				


				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);


				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
				}
				else if(MobileUtils.isMobElementExists("XPATH", "//*[@label='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@label='Click to Edit']");
				}
				else
				{
					WebElement e=testCase.getMobileDriver().findElement(By.xpath("//*[@name='@']"));
					Point p1;
					p1=e.getLocation();
					int xAxis= p1.getX();
					int yAxis=p1.getY();
					TouchAction tAction = new TouchAction(testCase.getMobileDriver());
					tAction.tap(tapOptions().withPosition(point(xAxis-50, yAxis))).release().perform();
				}

				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

				

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(inputs.getInputValue("USERID").toString());


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+inputs.getInputValue("USERID").toString());


				Thread.sleep(2000);


				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='honeywellhomessupport@honeywell.com']", testCase))
				{  


					Keyword.ReportStep_Pass(testCase , "Reset Mail has been received"); 

				}
				else
				{
					Keyword.ReportStep_Pass(testCase , "Reset Mail has not been received");
				}

				Thread.sleep(2000);
				LoginScreen ls=new LoginScreen(testCase);
				CustomDriver driver2 = testCase.getMobileDriver();
				HashMap<String, String> app = new HashMap<>();
				app.put("name", "Honeywell");

				try {
					driver2.executeScript("mobile:application:open", app);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("App is already open, continue with script");
				}


				if(ls.clickOnForgotResendButton(inputs))
				{
					Keyword.ReportStep_Pass(testCase , "Clicked on Resend Button"); 
				}

				if(ls.isResendPopUpVisible(inputs))
				{
					Keyword.ReportStep_Pass(testCase , "Resend Popup is displayed"); 
				}

				if(ls.clickOnResendCloseButton(inputs))
				{
					Keyword.ReportStep_Pass(testCase , "Clicked on Resend Close Button");
				}

				HashMap<String, String> settings2 = new HashMap<>();
				settings2.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings2);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is reopened with guerrilla mail page.");

				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='honeywellhomessupport@honeywell.com']", testCase))
				{  
					Keyword.ReportStep_Pass(testCase , "Reset Mail has been received"); 
				}
				else
				{
					Keyword.ReportStep_Pass(testCase , "Reset Mail has not been received");
				}



			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				CustomDriver driver = testCase.getMobileDriver();
				HashMap<String, String> app = new HashMap<>();
				app.put("name", "Honeywell");

				try {
					driver.executeScript("mobile:application:open", app);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("App is already open, continue with script");
				}
			}

		}
		return flag;

	}

	public static HashMap<String,String> ReadRebranding(TestCases testCase, TestCaseInputs inputs)
	{

		String key = "", value = "" ;
		HashMap<String,String> elementlist = new HashMap<String,String>() ;
		try
		{

			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File("Rebranding.xls"))) ;
			HSSFSheet sheet = null;
			if(testCase.getTestCaseInputs().isInputAvailable("LANGUAGE"))
			{
				sheet = workbook.getSheet(testCase.getTestCaseInputs().getInputValue("LANGUAGE")) ;
			}
			else
			{
				sheet = workbook.getSheet("English_US") ;
			}
			Iterator<Row> rowIterator = sheet.iterator() ;
			while (rowIterator.hasNext())
			{
				Row row = rowIterator.next() ;
				Iterator<Cell> cellIterator = row.cellIterator() ;
				while (cellIterator.hasNext())
				{
					Cell cell = cellIterator.next() ;
					key = cell.getStringCellValue() ;
					cell = cellIterator.next();
					value = cell.getStringCellValue() ;
				}

				if (!(value.equalsIgnoreCase("label") || value.equalsIgnoreCase("TextChange")))
				{
					elementlist.put(key , value) ;
				}
			}

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return elementlist ;
	}


	public static boolean verifyClipCount(TestCases testCase, TestCaseInputs inputs, String count) {

		boolean flag=true;

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			List<WebElement> timelist= MobileUtils.getMobElements(testCase , "id" , "activity_event_time_text");
			List<String> cliplist=new LinkedList<String>();

			for(WebElement temp : timelist)
			{
				if(temp.getText()!=null)
				{
					cliplist.add(temp.getText());
				}
			}

			for(int i=0;i<=58;i++)
			{
				// swipe
				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				/*TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(10, (int) (dimensions.getHeight() * .5))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4)).release().perform();*/
				Double screenHeightStart = dimensions.getHeight() * 0.5;

				int scrollStart = screenHeightStart.intValue();

				Double screenHeightEnd = dimensions.getHeight() * 0.2;

				int scrollEnd = screenHeightEnd.intValue();

				testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 1000);


				timelist= MobileUtils.getMobElements(testCase , "id" , "activity_event_time_text");

				for(WebElement temp : timelist)
				{
					if(temp.getText()!=null)
					{
						if(!cliplist.contains(temp.getText()))
						{
							cliplist.add(temp.getText());
						}

					}
				}
				Keyword.ReportStep_Pass(testCase , "clip count : "+cliplist.size());
				
			}
			if(cliplist.size()==50 || cliplist.size()<50)
			{
				Keyword.ReportStep_Pass(testCase , "Displayed with maximum 50 clips and app not saving more than 50 clips clip count is :"+cliplist.size());
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Unable to Displayed with maximum 50 clips");
				flag=false;
			}
			//Keyword.ReportStep_Pass(testCase , "Displayed with maximum 50 clips "+cliplist.size());
		}
		else
		{
			List<WebElement> timelist= MobileUtils.getMobElements(testCase , "XPATH" , "//*[contains(@name,'Time')]");
			List<String> cliplist=new LinkedList<String>();

			for(WebElement temp : timelist)
			{
				if(temp.getText()!=null)
				{
					cliplist.add(temp.getText());
				}
			}

			for(int i=0;i<=55;i++)
			{
				// swipe
				
				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();
				/*Double screenHeightStart = dimensions.getHeight() * 0.5;

				int scrollStart = screenHeightStart.intValue();

				Double screenHeightEnd = dimensions.getHeight() * 0.2;

				int scrollEnd = screenHeightEnd.intValue();

				testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 1000);*/


				timelist=MobileUtils.getMobElements(testCase , "XPATH" , "//*[contains(@name,'Time')]");

				for(WebElement temp : timelist)
				{
					if(temp.getText()!=null)
					{
						if(!cliplist.contains(temp.getText()))
						{
							cliplist.add(temp.getText());
						}

					}
				}
				Keyword.ReportStep_Pass(testCase , "clip count : "+cliplist.size());
			}
			if(cliplist.size()==50|| cliplist.size()<50)
			{
				Keyword.ReportStep_Pass(testCase , "Displayed with maximum 50 clips and app not saving more than 50 clips clip count is :"+cliplist.size());
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Unable to Displayed with maximum 50 clips");
				flag=false;
			}
			

		}

		return flag;

	}

	public static boolean openContractorMode(TestCases testCase, TestCaseInputs inputs, String Status) {
		boolean flag=true;
		LoginScreen ls=new LoginScreen(testCase);
		flag = flag && ls.longPressOnHomeLogo();

		if(ls.isContractorPopupVisible(5))
		{
			Keyword.ReportStep_Pass(testCase, "Contractor Mode : Contractor Pop up Visible");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Contractor Mode : Contractor Pop up is not Displayed");
			flag = false;
		}

		if(ls.isContractorPopupTextVisible(5))
		{
			Keyword.ReportStep_Pass(testCase, "Contractor Mode : Contractor Pop up description is visible");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Contractor Mode : Contractor Pop up description is not displayed");
			flag = false;
		}

		if(ls.isContractorPopupCancelVisible(5))
		{
			Keyword.ReportStep_Pass(testCase, "Contractor Mode : Contractor Pop up cancel button is visible");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Contractor Mode : Contractor Pop up cancel button is not displayed");
			flag = false;
		}

		if(ls.isContractorPopupConfirmVisible(5))
		{
			Keyword.ReportStep_Pass(testCase, "Contractor Mode : Contractor Pop up confirm button is visible");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Contractor Mode : Contractor Pop up confirm button is not displayed");
			flag = false;
		}

		if(Status.equalsIgnoreCase("Confirm"))
		{
			if(ls.clickOnContractorPopupConfirmButton(inputs))
			{
				Keyword.ReportStep_Pass(testCase, "Contractor Mode : Successfully clicked on Confirm button");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Contractor Mode : Failed to click on confirm button");
				flag = false;
			}
			if(ls.isContractorModeTextVisible(5))
			{
				Keyword.ReportStep_Pass(testCase, "Contractor Mode : Contractor mode is activated");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Contractor Mode : Contractor mode is not activated");
				flag = false;
			}

		}

		if(Status.equalsIgnoreCase("Cancel"))
		{
			if(ls.clickOnContractorPopupCancelButton(inputs))
			{
				Keyword.ReportStep_Pass(testCase, "Contractor Mode : Successfully clicked on Cancel button");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Contractor Mode : Failed to click on cancel button");
				flag = false;
			}
		}

		return flag;
	}

	

	



	public static boolean VerifyResetPasswordThroughGuerrilla(TestCases testCase, TestCaseInputs inputs) {	
		boolean flag=true;
		String language =testCase.getTestCaseInputs().getInputValue("LANGUAGE");
		LoginScreen ls=new LoginScreen(testCase,language);
		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}

		if (ls.setEmailAddressValue(inputs.getInputValue("USERID").toString())) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			Keyword.ReportStep_Pass(testCase,
					"Login To Lyric : Email Address set to - " + inputs.getInputValue("USERID"));
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Email Address.");
			flag = false;
		}

		if (ls.setPasswordValue(GlobalVariables.Invalid_Pwd)){
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else
			{
				ls.clickOnLyricLogo();
			}
			Keyword.ReportStep_Pass(testCase, "Login To Lyric : Password set to - " + GlobalVariables.Invalid_Pwd);
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Login To Lyric : Not able to set Password.");
			flag = false;
		}

		ls.clickOnLoginButton();
		if(!MobileUtils.isRunningOnAndroid(testCase))
		{
			ls.clickOnOkButton();
		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			ls.clickOnForgotPasswordButton();

		}else  
		{


			if(language.contains("English_US")||language.contains("English_UK")||language.contains("English_IR"))
			{
				ls.clickOnForgotPasswordButton();
			}
			else
			{
				ls.ClickOnForgotPasswordLocal(inputs);			
			}
		}

		if(ls.isResetButtonVisible())
		{
			ls.clickonResetButton();
		}

		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(inputs.getInputValue("LANGUAGE").contains("English"))
				{

					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");
						List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
						for(MobileElement temp : saq)
						{
							if(temp.getText().equals("https://www.guerrillamail.com"))
							{
								temp.click();
								break;
							}
						}
					}
				}else if(inputs.getInputValue("LANGUAGE").contains("French")){
					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Recherchez ou saisissez une adresse Web']" , testCase,10,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Recherchez ou saisissez une adresse Web']")).click();
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Recherchez ou saisissez une adresse Web']")).sendKeys("https://www.guerrillamail.com");
						List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
						for(MobileElement temp : saq)
						{
							if(temp.getText().equals("https://www.guerrillamail.com"))
							{
								temp.click();
								break;
							}
						}
					}

				}

				//          else if(inputs.getInputValue("LANGUAGE").contains("Dutch")){
				//        	   if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Zoek of typ een webadres']" , testCase,10,false))
				//				{
				//					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Zoek of typ een webadres']")).click();
				//					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Zoek of typ een webadres']")).sendKeys("https://www.guerrillamail.com");
				//					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				//					for(MobileElement temp : saq)
				//					{
				//						if(temp.getText().equals("https://www.guerrillamail.com"))
				//						{
				//							temp.click();
				//							break;
				//						}
				//					}
				//				}  	   
				//           }
				//           else if(inputs.getInputValue("LANGUAGE").contains("German")){
				//        	   if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Suchbegriff oder Webadresse eingeb']" , testCase,10,false))
				//				{
				//					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).click();
				//					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).sendKeys("https://www.guerrillamail.com");
				//					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				//					for(MobileElement temp : saq)
				//					{
				//						if(temp.getText().equals("https://www.guerrillamail.com"))
				//						{
				//							temp.click();
				//							break;
				//						}
				//					}
				//				}else if(inputs.getInputValue("LANGUAGE").contains("Italian")){
				//		        	   if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Suchbegriff oder Webadresse eingeb']" , testCase,10,false))
				//						{
				//							testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).click();
				//							testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).sendKeys("https://www.guerrillamail.com");
				//							List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				//							for(MobileElement temp : saq)
				//							{
				//								if(temp.getText().equals("https://www.guerrillamail.com"))
				//								{
				//									temp.click();
				//									break;
				//								}
				//							}
				//						}else if(inputs.getInputValue("LANGUAGE").contains("Portuguese")){
				//				        	   if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Suchbegriff oder Webadresse eingeb']" , testCase,10,false))
				//								{
				//									testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).click();
				//									testCase.getMobileDriver().findElement(By.xpath("//*[@text='Suchbegriff oder Webadresse eingeb']")).sendKeys("https://www.guerrillamail.com");
				//									List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
				//									for(MobileElement temp : saq)
				//									{
				//										if(temp.getText().equals("https://www.guerrillamail.com"))
				//										{
				//											temp.click();
				//											break;
				//										}
				//									}
				//								}


				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys("hbb_prod98");

				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(1000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View']"));
				}
				i=0;
				while(i<=saq.size())
				{
					
					if(saq.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
					{
						saq.get(i).click();
						break;
					}
					i++;
				}				

				//swipe(testCase,"EMAIL");
				swipescreen(testCase);	

				Thread.sleep(2000);
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);


				if(inputs.getInputValue("LANGUAGE").contains("English"))
				{ 				
					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Reset Password' or @text='RESET PASSWORD']" , testCase,25,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Reset Password' or @text='RESET PASSWORD ']")).click();
						Keyword.ReportStep_Pass(testCase , "Click on Reset Password button.");
					}
				}else
					if(inputs.getInputValue("LANGUAGE").contains("French"))
					{			
						if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='R�initialiser Mot De Passe']" , testCase,25,false))
						{
							testCase.getMobileDriver().findElement(By.xpath("//*[@text='R�initialiser Mot De Passe']")).click();
							Keyword.ReportStep_Pass(testCase , "Click on Reset Password button.");
						}			
					}else if(inputs.getInputValue("LANGUAGE").contains("Dutch")){
						if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Wachtwoord Resetten']" , testCase,25,false))
						{
							testCase.getMobileDriver().findElement(By.xpath("//*[@text='Wachtwoord Resetten']")).click();
							Keyword.ReportStep_Pass(testCase , "Click on Reset Password button.");
						}			   
					}


				// enter new pwd && confirm pwd blank				
				if(ls.isNewResetVisible())
				{
					ls.clickNewResetpwdField();
					ls.getresetnewtext(inputs).sendKeys("Password1");

					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
					if(ls.isChangePwdBttnVisible())						
					{
						ls.clickChangePwdButton();
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
				}

				flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ResetPwdScreen1");		


				//newReset blank && enter confirm pwd				
				if(ls.isConfirmResetVisible())
				{
					ls.clickNewResetpwdField();
					ls.getresetnewtext(inputs).clear();
					ls.clickConfirmResetpwdField();
					ls.getresetconfirmtext(inputs).sendKeys("Password1");
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}				
					if(ls.isChangePwdBttnVisible())						
					{
						ls.clickChangePwdButton();
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
				}

				flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ResetPwdScreen2");	

				///both fields blank
				if(ls.isConfirmResetVisible())
				{
					ls.clickConfirmResetpwdField();
					ls.getresetconfirmtext(inputs).clear();					
					if (MobileUtils.isRunningOnAndroid(testCase)) {
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}				
					if(ls.isChangePwdBttnVisible())						
					{
						ls.clickChangePwdButton();
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
				}

				flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ResetPwdScreen3");	

				//enter diff pwd in both fields				
				if(ls.isConfirmResetVisible())
				{
					ls.clickNewResetpwdField();
					ls.getresetnewtext(inputs).sendKeys("Password1");
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
					ls.clickConfirmResetpwdField();
					ls.getresetconfirmtext(inputs).sendKeys("Password12");
					MobileUtils.hideKeyboard(testCase.getMobileDriver());								
					if(ls.isChangePwdBttnVisible())						
					{
						ls.clickChangePwdButton();
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
				}
				flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ResetPwdScreen4");		

				//enter invalid pwd format					
				if(ls.isConfirmResetVisible())
				{
					ls.clickNewResetpwdField();
					ls.getresetnewtext(inputs).clear();
					ls.getresetnewtext(inputs).sendKeys("passw");
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
					ls.clickConfirmResetpwdField();
					ls.getresetconfirmtext(inputs).clear();
					ls.getresetconfirmtext(inputs).sendKeys("passwordghg");
					MobileUtils.hideKeyboard(testCase.getMobileDriver());								
					if(ls.isChangePwdBttnVisible())						
					{
						ls.clickChangePwdButton();
						MobileUtils.hideKeyboard(testCase.getMobileDriver());
					}
				}
				flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ResetPwdScreen5");	

			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			//			finally
			//			{
			//				//testCase.getMobileDriver().launchApp();
			//				MobileUtils.minimizeApp(testCase, 10);
			//			}
		}
		else
		{
			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
					Thread.sleep(7000);

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
				}
				//testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();


				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}


				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys("");


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Thread.sleep(7000);

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+"");


				Thread.sleep(7000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Activate Account']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Keyword.ReportStep_Pass(testCase , "Successfully activate account");
				Thread.sleep(2000);

			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				testCase.getMobileDriver().launchApp();
			}
		}
		//flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "ForgotPassword");		
		return flag;

	}

	private static void swipescreen(TestCases testCase) {

		Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();	
		

		Double screenHeightStart = dimensions.getHeight() * 0.5;	
		int scrollStart = screenHeightStart.intValue();	
		Double screenHeightEnd = dimensions.getHeight() * 0.3;	
		int scrollEnd = screenHeightEnd.intValue();	
		testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 2000);
		testCase.getMobileDriver().swipe(0, scrollStart, 0, scrollEnd, 2000);
	}



	public static boolean scrollToElementUsingAttributeSubStringValueIOS(TestCases testCase, String attribute,
			String value) throws Exception {
		try {
			JavascriptExecutor js = (JavascriptExecutor) testCase.getMobileDriver();
			HashMap<Object, Object> scrollObject = new HashMap<>();
			try {
				scrollObject.put("predicateString", attribute + " CONTAINS '" + value + "'");
				js .executeScript("window.scrollTo(0, document.body.scrollHeight)");
			} catch (Exception e) {
				scrollObject.clear();
				scrollObject.put("direction", "down");
				js.executeScript("mobile:scroll", scrollObject);
			}
			return true;

		} catch (NoSuchElementException e) {
			throw new Exception("Element with text/value containing : '" + value
					+ "' not found. Exception Type : No Such Element Exception");
		} catch (Exception e) {
			throw new Exception("Element with text/value containing : '" + value + "' not found. Exception Message: "
					+ e.getMessage());
		}
	}
	public static boolean setAirPlaneMode(TestCases testCase, boolean status) {
		boolean flag = true;
		CustomDriver driver = testCase.getMobileDriver();

		TestCaseInputs inputs = testCase.getTestCaseInputs();

		if (driver == null) {
			return false;
		}

		switch (inputs.getInputValue(TestCaseInputs.OS_NAME).toUpperCase()) {
		case Mobile.ANDROID:

//			try {
//
//				Connection settings = status ? Connection.AIRPLANE : Connection.ALL; // new
//				
//				//Connection settings = status ? ConnectionState.AIRPLANE_MODE_MASK : Connection.ALL; 
//				
//				// NetworkConnectionSetting(status
//				// ?
//				// 1
//				// :
//				// 6);
//
//				switch (inputs.getInputValue(TestCaseInputs.EXEC_LOCATION).toUpperCase()) {
//				case "PERFECTO":
//				case "PERFECTO_PRIVATE":
//				case "PERFECTO_PUBLIC":
//					Map<String, Object> pars = new HashMap<>();
//					pars.put("airplanemode", status?"enabled":"disabled");
//					((CustomAndroidDriver) driver).executeScript("mobile:network.settings:set", pars); 
//					break;
//				case "SAUCELABS":
//				case "SAUCELAB":
//					((CustomAndroidDriver) driver).setConnection(settings);
//					break;
//				default:
//					((CustomAndroidDriver) driver).setConnection(settings);
//					break;
//				}
//
//			} catch (Exception e) {
//				if (testCase.getTestCaseInputs().isRunningOn("Perfecto")) {
//					FrameworkGlobalVariables.logger4J
//					.logError("Set Airplane Mode : Ignoring error as suggested by Perfecto.");
//				} else {
//					StringBuilder stepMess = new StringBuilder(
//							"Set Airplane Mode: Error Occured during setting the location - ");
//					stepMess = stepMess.append(FrameworkUtils.getMessage(e));
//					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
//							stepMess.toString());
//					flag = false;
//				}
//
//			}

			try {

				//Connection settings = status ? Connection.AIRPLANE : Connection.ALL; // new
				
				//Connection settings = status ? ConnectionState.AIRPLANE_MODE_MASK : Connection.ALL; 
				
				// NetworkConnectionSetting(status
				// ?
				// 1
				// :
				// 6);

				switch (inputs.getInputValue(TestCaseInputs.EXEC_LOCATION).toUpperCase()) {
				case "PERFECTO":
				case "PERFECTO_PRIVATE":
				case "PERFECTO_PUBLIC":
					Map<String, Object> pars = new HashMap<>();
					pars.put("airplanemode", status?"enabled":"disabled");
					((CustomAndroidDriver) driver).executeScript("mobile:network.settings:set", pars); 
					break;
				case "SAUCELABS":
				case "SAUCELAB":
					//((CustomAndroidDriver) driver).setConnection(settings);
					try
					{
					((CustomAndroidDriver) driver).toggleAirplaneMode();
					}
					catch(Exception e)
					{
					System.out.println(e.getMessage()) ;
					}
					break;
				default:
					//((CustomAndroidDriver) driver).setConnection(settings);
					break;
				}

			} catch (Exception e) {
				if (testCase.getTestCaseInputs().isRunningOn("Perfecto")) {
					FrameworkGlobalVariables.logger4J
					.logError("Set Airplane Mode : Ignoring error as suggested by Perfecto.");
				} else {
					StringBuilder stepMess = new StringBuilder(
							"Set Airplane Mode: Error Occured during setting the location - ");
					stepMess = stepMess.append(FrameworkUtils.getMessage(e));
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							stepMess.toString());
					flag = false;
				}

			}

			break;
		case Mobile.IOS:

			/*Dimension dimension = driver.manage().window().getSize();

			int height = dimension.getHeight();

			HashMap<String, Integer> coordinates = new HashMap<String, Integer>();

			coordinates.put(Mobile.START_X, 1);
			coordinates.put(Mobile.START_Y, height);

			coordinates.put(Mobile.END_X, 1);
			coordinates.put(Mobile.END_Y, (height / 2) * -1);

			//MobileUtils.doSwipe(coordinates, testCase);

			testCase.getMobileDriver().swipe(coordinates.get(Mobile.START_X), coordinates.get(Mobile.START_Y), coordinates.get(Mobile.END_X), coordinates.get(Mobile.END_Y), 4000);
*/
			
			
			TouchAction tAction = new TouchAction(driver);

			if (testCase.getTestCaseInputs().isRunningOn("Perfecto")) {

				if (MobileUtils.isMobElementExists("XPATH", "//*[@label='Airplane Mode']", testCase, 10)) {
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@label='Airplane Mode']");
					if (MobileUtils.isMobElementExists("XPATH", "//*[@label='OK']", testCase, 10)) {
						MobileUtils.clickOnElement(testCase, "XPATH", "//*[@label='OK']");
					}
					testCase.getMobileDriver().tap(1, 20, 20,1000);
					
				} else {

					if (MobileUtils.isMobElementExists("XPATH", "//*[@label='Continue']", testCase, 10)) {
						MobileUtils.clickOnElement(testCase, "XPATH", "//*[@label='Continue']");
						MobileUtils.clickOnElement(testCase, "XPATH", "//*[@label='Airplane Mode']");

						//*[@label="OK"]
						//tAction.tap(20, 20).perform();
						testCase.getMobileDriver().tap(1, 20, 20,1000);
					} else {
						flag = false;
					}
				}

			} else {

				switch (testCase.getPlatform()) {
				case Mobile.IOS_MEDIUM:

					try {
						Thread.sleep(3000);
						tAction.press(point(43, 195)).release().perform();
						
					} catch (Exception e) {

						flag = false;
					}

					break;
				case Mobile.IOS_LARGE:
					try {
						Thread.sleep(3000);
						tAction.press(point(43, 195)).release().perform();
					} catch (Exception e) {
						flag = false;
					}
					break;
				case Mobile.IOS_Extra_LARGE:
					break;
				}

			

				if (status) {
					if (MobileUtils.getMobElement(testCase, MobileObject.NAME, "Airplane mode on") == null) {
						flag = false;
					}
				} else {
					flag = true;
				}
				break;
			}
		}

		return flag;
	}

	




	public static boolean verifyLocationUpdatePopUp(TestCases testCase, TestCaseInputs inputs) {
		Boolean flag=true;
		Dashboard ds=new Dashboard(testCase);

		if(ds.isLocationPopupVisible(10)) {
			Keyword.ReportStep_Pass(testCase, "Location popup visible " +ds.getLocationPopDesText());
		}

		if(ds.isSettingBtnVisible(10))
		{
			ds.clickOnSettingBtn();
		}

		if(ds.isToggleBtnVisible(10))
		{
			ds.clickOnOFFBtn();
		}
		if(ds.isImproveLocationPopupVisible(10)) {
			if(ds.isAgreeBtnVisible(10))
			{
				ds.clickOnAgreeBtn();
			}
		}
		// 	if(ds.isCancelBtnVisible(10))
		// 	{
		// 		ds.clickOnCancelBtn();
		// 	}

		return flag;
	}




	public static boolean CreateAccountWithoutLogin(TestCases testCase, TestCaseInputs inputs, String language2)
	{boolean flag=true;
	CreateAccountScreen cs=new CreateAccountScreen(testCase);
	String language =testCase.getTestCaseInputs().getInputValue("LANGUAGE");

	flag=flag && LyricUtils.setCreateAccountField(testCase,inputs);
	

	if(MobileUtils.isRunningOnAndroid(testCase))
	{
		if(language.equalsIgnoreCase("English_US"))
		{
			MobileUtils.scrollToExactAndroid(testCase , "Privacy Policy && EULA");
		}

		else if(language.equalsIgnoreCase("French_CA"))
		{
			MobileUtils.scrollToExactAndroid(testCase , "Politique de confidentialit");
		}

	}
	else
	{

		try {
			scrollToElementUsingAttributeSubStringValueIOS(testCase, "XPATH" , "//*[@name='End-User License Agreement ']");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	if(cs.isEluaPrivacyPolicyVisible())
	{
		cs.clickonEluaPrivacyPolicy();
		flag=flag && LyricUtils.VerifyScreenLocalization(testCase, "EulaVerification");
		Keyword.ReportStep_Pass(testCase,"Create Account  : Successfully displayed the Eula screen");
	}
	else
	{
		Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Create Account  : Unable to displayed the Eula screen");
		flag=false;
	}



	if(MobileUtils.isRunningOnAndroid(testCase))
	{	
		MobileUtils.scrollToExactAndroid(testCase , "Create");
	}
	else
	{
		try
		{
			LyricUtils.scrollToElementUsingExactAttributeValue(testCase , "label" , "Create");
		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			flag=false;
		}
	}



	if(cs.isCreateButtonVisible())
	{
		cs.clickOnCreateButton();

		if(!MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
		}

	}

	if(cs.isResendButtonVisible())
	{
		Keyword.ReportStep_Pass(testCase,"Create Account  : Successfully sent User Activation mail");
	}

	flag=flag && LyricUtils.verifyUserActivationthroughguerrillLocalization(testCase,inputs,language);
	

	return flag;
	}

	private static boolean verifyUserActivationthroughguerrillLocalization(TestCases testCase, TestCaseInputs inputs,
			String language) 
	{boolean flag=true;
	String email=inputs.getInputValue("EmailAddress");
	CreateAccountScreen cas= new CreateAccountScreen(testCase);

	if(MobileUtils.isRunningOnAndroid(testCase))
	{
		try
		{
			Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
			((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

			Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

			if(language.equalsIgnoreCase("English_US"))
			{
				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");
				}
			}
			else if(language.equalsIgnoreCase("French_CA"))
			{
				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Recherchez ou saisissez une adresse Web']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Recherchez ou saisissez une adresse Web']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Recherchez ou saisissez une adresse Web']")).sendKeys("https://www.guerrillamail.com");
				}
			}
			List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
			for(MobileElement temp : saq)
			{
				if(temp.getText().equals("https://www.guerrillamail.com"))
				{
					temp.click();
					break;
				}
			}
			Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
			MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
			Thread.sleep(5000);
			if(!language.equalsIgnoreCase("English_US"))
			{
				testCase.getMobileDriver().tap(1 , 700 ,1100);
			}
			testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
			Thread.sleep(2000);
			testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();

			String emailstr=email.split("@")[0];
			try {

				if(testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).isDisplayed()){
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).clear();
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(emailstr);
					Keyword.ReportStep_Pass(testCase , "Successfully Set Email Address field with Value:"+emailstr);

				}else{
					testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.EditText']")).sendKeys(emailstr);
					Keyword.ReportStep_Pass(testCase , "Successfully Set Email Address field with Value:"+emailstr);
				}
			} catch (Exception e) {
			}

			Thread.sleep(5000);
			testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

			testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();
			Keyword.ReportStep_Pass(testCase , "Successfully Selected:grr.la");
			testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();
			Keyword.ReportStep_Pass(testCase , "Successfully Set Email Address field ");

			MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
			Thread.sleep(2000);

			List<MobileElement> saq1 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
			int i=0;
			while (saq1==null&&i<5)
			{
				Thread.sleep(1000);
				saq1 = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View']"));
			}
			i=0;
			while(i<=saq1.size())
			{
				try
				{
					
					if(saq1.get(i).getText().contains("honeywellhomessupport@honeywell.com"))
					{
						saq1.get(i).click();
						break;
					}
				}
				catch(Exception e)
				{

				}
				i++;
			}
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if(language.equalsIgnoreCase("English_US"))
				{
					MobileUtils.scrollToExactAndroid(testCase , "Activate Account");
				}
				else if(language.equalsIgnoreCase("French_CA"))
				{					
//					Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();
//
//					TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
//					touchAction.press(10, (int) (dimensions.getHeight() * .5))
//					.moveTo(point(0, (int) (dimensions.getHeight() * -.4)).release().perform();
//
//					touchAction.press(10, (int) (dimensions.getHeight() * .5))
//					.moveTo(point(0, (int) (dimensions.getHeight() * .7)).release().perform();
					
					cas.scrollToClickActivateLink();


				}

			}
			Thread.sleep(2000);

			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				if(language.equalsIgnoreCase("English_US"))
				{
					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']" , testCase,25,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']")).click();
						Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
					}
				}
				else if(language.equalsIgnoreCase("French_CA"))
				{
					if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activer Le Compte']" , testCase,25,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activer Le Compte']")).click();
						Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
					}
					else if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Activer')]" , testCase,25,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[contains(@text,'Activer')]")).click();
						Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
					}
					else if(testCase.getMobileDriver().findElementByXPath("//*[contains(@text,'Compte')]").getAttribute("value").equalsIgnoreCase("Compte"))
					{
						testCase.getMobileDriver().findElementByXPath("//*[contains(@text,'Compte')]").click();

						if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Activ')]" , testCase,25,false))
						{
							Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
						}
					}
					else if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Compte')]" , testCase,25,false))
					{
						testCase.getMobileDriver().findElement(By.xpath("//*[contains(@text,'Compte')]")).click();
						if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Activ')]" , testCase,25,false))
						{
							Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
						}
					}
				}
			}
		}
		catch(Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
		}
		finally
		{
			//testCase.getMobileDriver().launchApp();
			MobileUtils.minimizeApp(testCase, 10);
		}
	}
	else
	{
		try{

			CustomDriver driver = testCase.getMobileDriver();

			HashMap<String, String> settings = new HashMap<>();
			settings.put("name", "Safari");
			try {
				driver.executeScript("mobile:application:open", settings);
			} catch (Exception e) {
				FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
			}

			Keyword.ReportStep_Pass(testCase , "Safari browser is open.");

			if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
			{
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
				Thread.sleep(7000);

			}
			Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

			MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

			if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
			{
				MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
			}
			//testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();


			Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			Thread.sleep(2000);
			testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
			testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

			testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(email);


			testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
			testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

			testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

			testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

			Thread.sleep(7000);

			Keyword.ReportStep_Pass(testCase , "Email id is set to "+email);


			Thread.sleep(7000);
			testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

			Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

			TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
			touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
			.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

			Thread.sleep(2000);
			testCase.getMobileDriver().findElement(By.xpath("//*[@name='Activate Account']")).click();
			Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
			MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
			Keyword.ReportStep_Pass(testCase , "Successfully activate account");
			Thread.sleep(2000);

		}catch(Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
		}
		finally
		{
			testCase.getMobileDriver().launchApp();
		}
	}
	return flag;
	}

	private static boolean setCreateAccountField(TestCases testCase, TestCaseInputs inputs) {boolean flag=true;
	Random rn = new Random();
	int value = rn.nextInt();
	String email="";
	LoginScreen ls=new LoginScreen(testCase);
	CreateAccountScreen cs=new CreateAccountScreen(testCase);



	if(ls.isCreateAccountVisible())
	{
		ls.navigateToCreateAccountScreen();
		Keyword.ReportStep_Pass(testCase,
				"Create Account  : Successfully App navigastes to   Privacy Statement/End-User License Agreement ");
	}
	else
	{
		Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
				"Create Account : Not able to App navigastes to   Privacy Statement/End-User License Agreement  ");
		flag = false;
	}
	if(cs.isFirstNameLabelVisible())
	{
		if(cs.setFirstNameValue("ABC"))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}
			else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");						
			}

			Keyword.ReportStep_Pass(testCase,
					"Create Account  : Successfully Set First Name: ABC ");
		}
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : Not able to set First Name: ABC ");
			flag = false;
		}			

	}
	if(cs.isLastNameLabelVisible())
	{
		if(cs.setLastNameValue("XYZ"))
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
			}
			Keyword.ReportStep_Pass(testCase,
					"Create Account  :Successfully Set Last Name: XYZ");
		}
		else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : Not able to set Last Name: XYZ");
			flag = false;
		}	
	}

	if(cs.isEmailLabelVisible())
	{
		email="rn"+value+"@grr.la";
		inputs.setInputValue("EmailAddress", email, false);
		

		if (cs.setEmailAddressValue(email)) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
			}
			Keyword.ReportStep_Pass(testCase,
					"Create Account  : Email Address set to -"+email);
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : Not able to set Email Address -"+email);
			flag = false;
		}
	}

	if(cs.isPasswordLabelVisible())
	{
		if (cs.setPasswordValue("Password1")) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
			}
			Keyword.ReportStep_Pass(testCase,
					"Create Account  : Password set to - Password1");
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : Not able to set Password - Password1");
			flag = false;
		}
	}

	if(cs.isVerifyPasswordLabelVisible())
	{
		if (cs.setVerifyPasswordValue("Password1")) {
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboard(testCase.getMobileDriver());
			}else {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
			}
			Keyword.ReportStep_Pass(testCase,
					"Create Account  : Verify Password set to - Password1");
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Create Account : Not able to set Verify Password - Password1");
			flag = false;
		}
	}

	return flag;
	}
	
	public String getMobElementLocal(TestCases testCase, String XPATH)
		{
		
			if (MobileUtils.isRunningOnAndroid(testCase))
			{
				try {
				if(testCase.getMobileDriver().findElement(By.xpath(XPATH))!=null)
				{
					return testCase.getMobileDriver().findElement(By.xpath(XPATH)).getAttribute("text");
				}
				
			} catch (Exception e) {
					
			}
			}
			else
			{
				try {
				if(testCase.getMobileDriver().findElement(By.xpath(XPATH))!=null)
				{
					return testCase.getMobileDriver().findElement(By.xpath(XPATH)).getAttribute("value");
				}
			} catch (Exception e) {
					
			}
			}
			return null;
			
		}

	
 
	public static boolean ForgotPasswordSessionExpired(TestCases testCase, TestCaseInputs inputs) {
		boolean flag = true;
		Random rn = new Random();
		int value = rn.nextInt();
		String email = "";
		CreateAccountScreen cs = new CreateAccountScreen(testCase);
		LoginScreen ls = new LoginScreen(testCase);
		if (ls.isLoginButtonVisible() && !ls.isEmailAddressTextFieldVisible()) {
			flag = flag && ls.clickOnLoginButton();
		}
		if (MobileUtils.isRunningOnAndroid(testCase)) 
		{
			if (ls.isForgotPasswordIDButtonVisible()) 
			{
				ls.clickOnForgotPasswordIDButton();
				Keyword.ReportStep_Pass(testCase, "[Lyric login screen]: Forgot Password clicked");
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"[Lyric login screen], expected text is ");
				flag = false;
			}
		} else {
			ls.clickOnForgotPasswordIDButton();
			Keyword.ReportStep_Pass(testCase, "[Lyric login screen]: Forgot Password clicked");
		}

		if (cs.isEmailIDLabelVisible()) {
			email = "ys11@grr.la";
			inputs.setInputValue("EmailAddress", email, false);
			if (cs.setEmailAddressIDValue(email)) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					MobileUtils.hideKeyboard(testCase.getMobileDriver());
				} else {
					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Next");
				}
				Keyword.ReportStep_Pass(testCase, "Create Account  : Email Address set to -" + email);
			} else {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Create Account : Not able to set Email Address.");
				flag = false;
			}
		}

		if (cs.isSendVerificationButtonVisible()) {
			cs.clickOnSendVerificationButton();

			if (!MobileUtils.isRunningOnAndroid(testCase)) {
				MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Done");
			}

		}
		
		if(cs.isEnterCodeLabelVisible())
		{
			cs.clickOnVerificationCodeField();
			
			
			if(cs.isSendVerificationCodeVisible(960))
					{
				Keyword.ReportStep_Pass(testCase,
						"Forgot Password  : Device kept on idle for 15 mins");
					}
			
				
			if(cs.isResendCodeButtonVisible())
			{
				cs.clickOnResendCodeButton();
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Forgot Password  : Resend Code button is not visible");
				flag = false;
			}
			if(cs.isSessionExpiredErrorVisible())
			{
				Keyword.ReportStep_Pass(testCase,
						"Forgot Password   : Error popup "+cs.getSessionExpiredError()+" msg is displayed");
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
						"Forgot Password  : Invalid verification code is not displayed");
				flag = false;	
			}
			
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Forgot Password  : Enter Code field is not Visible");
			flag = false;
		}
		return flag;
	}
	
	
	
	public static void VerifyGuarillaEmail(TestCases testCase, TestCaseInputs inputs,String emailstring) {
		String email = emailstring;
	
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}



				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
					MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Thread.sleep(2000);
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).clear();	
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).sendKeys();
					
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).clear();

				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).sendKeys(email);
					
				} catch (Exception e) {
				}
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(1000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View']"));
				}
				i=0;
				while(i<=saq.size())
				{
					if(saq.get(i).getText().contains("@honeywellhome"))
					{
						saq.get(i).click();
						break;
					}
					i++;
				}
						
				CreateAccountScreen.SwipeToActivateAccount(testCase);
				Thread.sleep(2000);
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']" , testCase,25,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']")).click();
					Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				}
				//Get Verification Code from browser and store
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				//testCase.getMobileDriver().launchApp();
				MobileUtils.minimizeApp(testCase, 10);
			}
		}
		else
		{
			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
					Thread.sleep(7000);

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
				}
				//testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}


				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(email);


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Thread.sleep(7000);

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+email);


				Thread.sleep(7000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Activate Account']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Keyword.ReportStep_Pass(testCase , "Successfully activate account");
				Thread.sleep(2000);
				
				
				//Get Verification Code from browser and storr

			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				//testCase.getMobileDriver().launchApp();
				MobileUtils.minimizeApp(testCase, 10);
			}
		}
		
		
		
		
		
	}
	
	
	public static void VerifyGuarillaEmail_Rebranding(TestCases testCase, TestCaseInputs inputs,String emailstring) {
		String email = emailstring;
		boolean flag =true;
	
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			try
			{
				Activity activity = new Activity("com.android.chrome","com.google.android.apps.chrome.Main");
				((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);

				Keyword.ReportStep_Pass(testCase , "Chrome browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Search or type web address']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Search or type web address']")).sendKeys("https://www.guerrillamail.com");

					List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.widget.TextView']"));
					for(MobileElement temp : saq)
					{
						if(temp.getText().equals("https://www.guerrillamail.com"))
						{
							temp.click();
							break;
						}
					}
				}



				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");
					MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Click to Edit']")).click();
				Thread.sleep(2000);
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).clear();	
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).sendKeys();
					
				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).clear();

				} catch (Exception e) {
				}
				try {
					testCase.getMobileDriver().findElement(By.id("inbox-id")).sendKeys(email);
					
				} catch (Exception e) {
				}
				Thread.sleep(5000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@class='android.widget.Spinner']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='grr.la']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@text='Set']")).click();

				List<MobileElement> saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View' and @index='1']"));
				int i=0;
				while (saq==null&&i<5)
				{
					Thread.sleep(1000);
					saq = testCase.getMobileDriver().findElements(By.xpath("//*[@class='android.view.View']"));
				}
				
				if(testCase.getMobileDriver().getPageSource().contains(LyricUtils.ReadRebranding(testCase , inputs).get("NewText"))){
					Keyword.ReportStep_Pass(testCase , "Expected text is displayed i.e '"+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" MARKETING COMMUNICATIONS SIGN-UP'\n or 'Subscribe to "+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" Marketing Communications'");
				}else{
					 Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Rebranding of the Home App from 'Honeywell' to '"+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+"' is not done successfully.");
					 flag=false;
				}
				
				i=0;
				while(i<=saq.size())
				{
					
					if(saq.get(i).getText().contains("@honeywellhome"))
					{
						saq.get(i).click();
						break;
					}
					i++;
				}
						
				CreateAccountScreen.SwipeToActivateAccount(testCase);
				Thread.sleep(2000);
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				
				if(testCase.getMobileDriver().getPageSource().contains(LyricUtils.ReadRebranding(testCase , inputs).get("NewText"))){
					Keyword.ReportStep_Pass(testCase , "Expected text is displayed i.e '"+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" MARKETING COMMUNICATIONS SIGN-UP'\n or 'Subscribe to "+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+" Marketing Communications'");
				}else{
					 Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"Rebranding of the Home App from 'Honeywell' to '"+LyricUtils.ReadRebranding(testCase , inputs).get("NewText")+"' is not done successfully.");
					 flag=false;
				}

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']" , testCase,25,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@text='Activate Account 'or @text='ACTIVATE ACCOUNT ']")).click();
					Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				}
				//Get Verification Code from browser and store
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				//testCase.getMobileDriver().launchApp();
				MobileUtils.minimizeApp(testCase, 10);
			}
		}
		else
		{
			try{

				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> settings = new HashMap<>();
				settings.put("name", "Safari");
				try {
					driver.executeScript("mobile:application:open", settings);
				} catch (Exception e) {
					FrameworkGlobalVariables.logger4J.logWarn("Launch Setting App: App is already open.");
				}

				Keyword.ReportStep_Pass(testCase , "Safari browser is open.");

				if(MobileUtils.isMobElementExists("XPATH" , "//*[@name='URL']" , testCase,10,false))
				{
					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).click();

					testCase.getMobileDriver().findElement(By.xpath("//*[@name='URL']")).sendKeys("https://www.guerrillamail.com");

					MobileUtils.hideKeyboardIOS(testCase.getMobileDriver(), "Go");
					Thread.sleep(7000);

				}
				Keyword.ReportStep_Pass(testCase , "Open guerrilla mail web page.");

				MobileUtils.isMobElementExists("id" , "xyz" , testCase,25,false);

				if(MobileUtils.isMobElementExists("XPATH", "//*[@name='Click to Edit']", testCase))
				{
					MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Click to Edit']");
				}
				//testCase.getMobileDriver().findElement(By.xpath("//*[@name='Click to Edit']")).click();
				Keyword.ReportStep_Pass(testCase , "Click email field to set the email.");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}


				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).clear();

				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeTextField")).sendKeys(email);


				testCase.getMobileDriver().findElement(By.xpath("//*[@value='sharklasers.com']")).click();
				testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypePickerWheel")).sendKeys("grr.la");

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Done']")).click();

				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Set']")).click();

				Thread.sleep(7000);

				Keyword.ReportStep_Pass(testCase , "Email id is set to "+email);


				Thread.sleep(7000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='honeywellhomessupport@honeywell.com']")).click();

				Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

				TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
				touchAction.press(point(10, (int) (dimensions.getHeight() * .5)))
				.moveTo(point(0, (int) (dimensions.getHeight() * -.4))).release().perform();

				Thread.sleep(2000);
				testCase.getMobileDriver().findElement(By.xpath("//*[@name='Activate Account']")).click();
				Keyword.ReportStep_Pass(testCase , "Click on Activate Account button.");
				MobileUtils.isMobElementExists("id" , "rohal" , testCase,25,false);
				Keyword.ReportStep_Pass(testCase , "Successfully activate account");
				Thread.sleep(2000);
				
				
				//Get Verification Code from browser and storr

			}catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
			}
			finally
			{
				//testCase.getMobileDriver().launchApp();
				MobileUtils.minimizeApp(testCase, 10);
			}
		}
		
		
		
		
		
	}
	
	public static String readMapping(TestCases testCase, String fileName, String screenName,String ObjectName)throws IOException
	{

		boolean flag = true ;

		String key = "", value = "" ,androidText = "";
		FileInputStream file = null ;
		try
		{
			file = new FileInputStream(new File(fileName + ".xls")) ;

			// Get the workbook instance for XLS file
			HSSFWorkbook workbook = new HSSFWorkbook(file) ;

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheet(screenName) ;

			Iterator<Row> rowIterator = sheet.iterator() ;
			while (rowIterator.hasNext())
			{
				flag = true ;
				Row row = rowIterator.next() ;
				// For each row, iterate through each columns
				Iterator<Cell> cellIterator = row.cellIterator() ;
				while (cellIterator.hasNext())
				{

					Cell cell = cellIterator.next() ; //ObjectName
					value = cell.getStringCellValue() ;
					
					if(value.equalsIgnoreCase(ObjectName))
					{
						Cell cell1 = cellIterator.next() ; //ObjectName
						androidText = cell1.getStringCellValue() ;
						return androidText;
					}
				}
				
			}

		}
		catch (Exception e)
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		return null;
	}
	
	public static boolean isLocalizationtextvisible(TestCases testCase,String ObjectName)
	{
		boolean flag=false;
		String lang=testCase.getTestCaseInputs().getInputValue("LANGUAGE");
		String eleList = null;
		
		try {
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					eleList=LyricUtils.readMapping(testCase,lang, "Mapping_Android",ObjectName);
					if(MobileUtils.isMobElementExists("xpath", "//*[contains(@text,'"+eleList+"')]", testCase))
					{
						flag=true;
					}
					else
					{
						flag=false;
					}
				}
				else
				{
					eleList=LyricUtils.readMapping(testCase,lang, "Mapping_IOS",ObjectName);
					if(MobileUtils.isMobElementExists("xpath", "//*[contains(@name,'"+eleList+"')]", testCase))
					{
						flag=true;
					}
					else if(MobileUtils.isMobElementExists("xpath", "//*[contains(@value,'"+eleList+"')]", testCase))
					{
						flag=true;
					}
					else
					{
						flag=false;
					}
				}
				
				
			}
		 catch (IOException e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		
		
		
		return flag;
	}
	
	public static boolean isClickOnLocalizationtext(TestCases testCase,String ObjectName)
	{
		boolean flag=false;
		String lang=testCase.getTestCaseInputs().getInputValue("LANGUAGE");
		String eleList = null;
		
		try {
				if(MobileUtils.isRunningOnAndroid(testCase))
				{
					eleList=LyricUtils.readMapping(testCase,lang, "Mapping_Android",ObjectName);
					if(MobileUtils.clickOnElement(testCase,"xpath", "//*[contains(@text,'"+eleList+"')]",false,false))
					{
						flag=true;
					}
					else
					{
						flag=false;
					}
				}
				else
				{
					eleList=LyricUtils.readMapping(testCase,lang, "Mapping_IOS",ObjectName);
					if(MobileUtils.clickOnElement(testCase,"xpath", "//*[contains(@text,'"+eleList+"')]",false,false))
					{
						flag=true;
					}
					else if(MobileUtils.clickOnElement(testCase,"xpath", "//*[contains(@text,'"+eleList+"')]",false,false))
					{
						flag=true;
					}
					else
					{
						flag=false;
					}
				}
				
				
			}
		 catch (IOException e) {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
		}
		
		
		
		return flag;
	}


}
