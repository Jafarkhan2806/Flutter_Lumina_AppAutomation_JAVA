package com.honeywell.keywords.lyric.common;

import io.appium.java_client.MobileElement ;
import io.appium.java_client.android.Activity ;
import io.appium.java_client.android.AndroidDriver ;

import java.util.ArrayList ;
import java.util.HashMap ;
import java.util.List ;

import org.openqa.selenium.By ;
import org.openqa.selenium.WebElement ;

import com.honeywell.commons.coreframework.AfterKeyword ;
import com.honeywell.commons.coreframework.BeforeKeyword ;
import com.honeywell.commons.coreframework.FrameworkGlobalVariables ;
import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.KeywordException ;
import com.honeywell.commons.coreframework.KeywordStep ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.CustomDriver ;
import com.honeywell.commons.mobile.MobileUtils ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.InputVariables ;

public class GoToLocationSettingsAndToggleLocationServiceInDevice extends Keyword {

	public TestCases testCase;
	public TestCaseInputs inputs;
	public ArrayList<String> exampleData;
	public boolean flag = true;
	WebElement elem = null;

	public GoToLocationSettingsAndToggleLocationServiceInDevice(TestCases testCase, TestCaseInputs inputs,
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

	@SuppressWarnings("unchecked")
	@Override
	@KeywordStep(gherkins = "^user goto location settings and turn \"(.+)\" location$")
	public boolean keywordSteps() throws KeywordException {
		try {
			if (inputs.isRunningOn("Perfecto")) {
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					if (MobileUtils.isMobElementExists("xpath", "//*[@text='SETTINGS']", testCase, 5)) {
						ReportStep_Pass(testCase, "SETTINGS button is shown");
						if (!MobileUtils.clickOnElement(testCase, "xpath", "//*[@text='SETTINGS']")) {
							flag = false;
						} else {
							elem = ((AndroidDriver<MobileElement>) testCase.getMobileDriver())
									.findElement(By.id("com.android.settings:id/switch_widget"));
							if (elem != null) {
								if (exampleData.get(0).equalsIgnoreCase("On")) {
									if (elem.getText().equalsIgnoreCase("Off")) {
										elem.click();
										ReportStep_Pass(testCase, "Location services is turned on");
										try {
											Thread.sleep(2000);
										} catch (InterruptedException e) {
											flag = false;
											Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
													"Error - " + e.getMessage());
											e.printStackTrace();
										}
										elem = ((AndroidDriver<MobileElement>) testCase.getMobileDriver())
												.findElement(By.xpath("//android.widget.Button[@text='AGREE']"));
										if (elem != null) {
											elem.click();
											ReportStep_Pass(testCase, "Clicked on AGREE button");
											inputs.setInputValue(InputVariables.MOBILE_LOCATION_OFF,"false");
											try {
												Thread.sleep(2000);
											} catch (InterruptedException e) {
												flag = false;
												Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
														"Error - " + e.getMessage());
												e.printStackTrace();
											}
										}
									} else {
										ReportStep_Pass(testCase, "Location services is already on");
									}
								} else if (exampleData.get(0).equalsIgnoreCase("Off")) {
									if (elem.getText().equalsIgnoreCase("On")) {
										elem.click();
										ReportStep_Pass(testCase, "Location services is turned off");
										inputs.setInputValue(InputVariables.MOBILE_LOCATION_OFF,"true");
									} else {
										ReportStep_Pass(testCase, "Location services is already off");
									}
								}
							} else {
								flag = false;
								ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
										"Failed to locate Location services switch");
							}
							/*
							 * elem = ((AndroidDriver<MobileElement>)
							 * testCase.getMobileDriver()).findElement(
							 * By.xpath(
							 * "//device/view/group[1]/group[1]/group[1]/group[1]/button[1]"
							 * )); if (elem != null) { elem.click(); } else {
							 * flag = false; ReportStep_Fail(testCase,
							 * FailType.FUNCTIONAL_FAILURE,
							 * "Failed to locate the Back button"); }
							 */
						}
					} else {
						flag = false;
						ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "SETTINGS button is not shown");
					}
				} else {
					
					if (MobileUtils.isMobElementExists("name", "Go To Settings", testCase, 5)) {
						ReportStep_Pass(testCase, "SETTINGS button is shown");
						if (!MobileUtils.clickOnElement(testCase, "name", "Go To Settings")) {
							flag = false;
						} 
					}
					if (MobileUtils.isMobElementExists("name", "Settings", testCase, 5)) {
						ReportStep_Pass(testCase, "SETTINGS button is shown");
						if (!MobileUtils.clickOnElement(testCase, "name", "Settings")) {
							flag = false;
						} 
					}
					
					if (MobileUtils.isMobElementExists("name", "Settings", testCase, 5)) {
						ReportStep_Pass(testCase, "SETTINGS button is shown");
						if (!MobileUtils.clickOnElement(testCase, "name", "Settings")) {
							flag = false;
						} else {
							List<WebElement> locServ = MobileUtils.getMobElements(testCase, "xpath",
									"//XCUIElementTypeSwitch[@name='Location Services']");
							WebElement toggleSwitch = null;
							for (WebElement locSer : locServ) {
								
								if (locSer.getAttribute("value").equalsIgnoreCase("0")
										|| locSer.getAttribute("value").equalsIgnoreCase("1")) {
									toggleSwitch = locSer;
									break;
								} else {
									toggleSwitch = null;
								}
							}
							if (toggleSwitch != null) {
								if (exampleData.get(0).equalsIgnoreCase("off")) {
									if (toggleSwitch.getAttribute("value").equalsIgnoreCase("1")) {
										toggleSwitch.click();
										if (MobileUtils.isMobElementExists("name", "Turn Off", testCase, 5)) {
											if (!MobileUtils.clickOnElement(testCase, "name", "Turn Off")) {
												flag = false;
											} else {
												ReportStep_Pass(testCase, "Turned off Location Services");
												inputs.setInputValue(InputVariables.MOBILE_LOCATION_OFF,"true");
											}
										}
									} else {
										ReportStep_Pass(testCase, "Location Services is already turned off");
									}
								} else {
									if (toggleSwitch.getAttribute("value").equalsIgnoreCase("0")) {
										toggleSwitch.click();
										ReportStep_Pass(testCase, "Turned on Location Services");
										inputs.setInputValue(InputVariables.MOBILE_LOCATION_OFF,"false");
									} else {
										ReportStep_Pass(testCase, "Location Services is already turned on");
									}
								}
							}
						}
					} else {
						flag = false;
						ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "SETTINGS button is not shown");
					}
					MobileUtils.closeSettingsAppOnIOS(testCase);
				}
			} else {
				if (MobileUtils.isMobElementExists("xpath", "//*[@text='Settings']", testCase, 5)) {
					if (!MobileUtils.clickOnElement(testCase, "xpath", "//*[@text='Settings']")) {
						flag = false;
					}
				}

				elem = ((AndroidDriver<MobileElement>) testCase.getMobileDriver())
						.findElement(By.id("com.android.settings:id/switch_widget"));
				if (elem != null) {
					if (elem.getText().equalsIgnoreCase("Off")) {
						elem.click();
						ReportStep_Pass(testCase, "Location services is turned on");
						inputs.setInputValue(InputVariables.MOBILE_LOCATION_OFF,"false");
					} else {
						elem.click();
						elem.click();
						ReportStep_Pass(testCase, "Location services is already on");
					}
				}
				
				elem = ((AndroidDriver<MobileElement>) testCase.getMobileDriver())
						.findElement(By.name("Navigate up"));
				if (elem != null) {
						elem.click();
					}

			}

		} catch (Exception e) {
			flag = false;
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Error occurred : " + e.getMessage());
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Override
	@AfterKeyword
	public boolean postCondition() throws KeywordException {
		if (MobileUtils.isRunningOnAndroid(testCase)) {
			Activity activity = new Activity("com.honeywell.android.lyric",
					"com.honeywell.granite.graniteui.presentation.activity.dashboard.DashBoardActivity");
			((AndroidDriver<MobileElement>) testCase.getMobileDriver()).startActivity(activity);
		} else {
			if (testCase.getTestCaseInputs().isRunningOn("Perfecto")) {
				
				
				CustomDriver driver = testCase.getMobileDriver();

				HashMap<String, String> app = new HashMap<>();
				
				
				app.put("name", "Honeywell");

				try {
					driver.executeScript("mobile:application:open", app);
				} catch (Exception e) {
					try
					{
						app.put("name", "Lyric4");
						driver.executeScript("mobile:application:open", app);
					}
					catch(Exception e1)
					{
					}

					FrameworkGlobalVariables.logger4J.logWarn("App is already open, continue with script");
				}
			}
		}
		return true;
	}
}
