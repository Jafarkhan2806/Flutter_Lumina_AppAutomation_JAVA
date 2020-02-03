package com.resideo.screens;

import io.appium.java_client.TouchAction;
import static io.appium.java_client.touch.LongPressOptions.longPressOptions;
import static io.appium.java_client.touch.offset.ElementOption.element;

import java.time.Duration;

import org.openqa.selenium.WebElement;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.CustomDriver;
import com.honeywell.commons.mobile.MobileScreens;
import com.honeywell.commons.mobile.MobileUtils;
import com.honeywell.commons.report.FailType;

public class LoginScreen extends MobileScreens {

	private static final String screenName = "LoginScreen";

	public LoginScreen(TestCases testCase) {
		super(testCase, screenName);
		// osPopUps = new OSPopUps(testCase);
	}

	public boolean clickOnLoginButton() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "LoginButton");
	}

	public boolean setEmailAddressValue(String value) {
		return MobileUtils.setValueToElement(objectDefinition, testCase, "EmailAddress", value);
	}

	public boolean setPasswordValue(String value) {
		return MobileUtils.setValueToElement(objectDefinition, testCase, "Password", value);
	}

	public boolean isLoginButtonVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginButton");
	}

	public boolean isEmailAddressTextFieldVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailAddress");
	}

	public boolean clickOnEmailAddressTextField() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "EmailAddress");
	}

	public void clearTextInsideEmailAddressTextField() {
		MobileUtils.getMobElement(objectDefinition, testCase, "EmailAddress").clear();
	}

	public boolean isPasswordTextFieldVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "Password");
	}

	public boolean clickOnPasswordTextField() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "Password");
	}

	public void clearTextInsidePasswordTextField() {
		MobileUtils.getMobElement(objectDefinition, testCase, "Password").clear();
	}

	public boolean longPressOnSecretMenuImage() {
		boolean flag = true;
		WebElement element = null;
		CustomDriver driver = testCase.getMobileDriver();
		@SuppressWarnings("rawtypes")
		TouchAction action = new TouchAction(driver);
		if (testCase.getPlatform().toUpperCase().contains("ANDROID")) {
			element = MobileUtils.getMobElement(objectDefinition, testCase, "HoneywellRosette");
			// flag = flag & MobileUtils.longPress(testCase, element, 8000);
			action.longPress(longPressOptions().withElement(element(element)).withDuration(Duration.ofMillis(8000)))
					.release().perform();
		} else {
			element = MobileUtils.getMobElement(objectDefinition, testCase, "SecretMenuImage");
			// element = MobileUtils.getMobElement(objectDefinition, testCase,
			// "SecretMenuImage");
			// flag = flag & MobileUtils.longPress(testCase, element, 8000);
			try {
				// action.press(Pelement).waitAction(MobileUtils.getDuration(8000)).release().perform();
				action.longPress(longPressOptions().withElement(element(element)).withDuration(Duration.ofMillis(8000)))
						.release().perform();
				if (!MobileUtils.isMobElementExists("XPATH", "//XCUIElementTypeStaticText[@name='CHIL Url:']", testCase,
						1)) {
					Keyword.ReportStep_Pass(testCase, "Successfully navigated to Secret menu");
					;
				}
			} catch (Exception e) {
				flag = false;
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Unable to open the Secret menu");
			}
		}
		return flag;
	}

	public boolean isLyricLogoVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LyricLogo", 3);
	}

	public boolean isSkipButtonVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "SkipIntroButton", 3);
	}

	public boolean clickOnSkipIntroButton() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "SkipIntroButton");
	}

	public boolean clickOnLyricLogo() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "LyricLogo");
	}

	public boolean isLoginPasswordTextFieldDisplayed() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "PasswordTextField");
	}

	public boolean isLoginForgotPasswordLinkDisplayed() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "ForgotPasswordLink");
	}

	public boolean isLoginButtonDisplayed() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginButton");
	}

	public boolean isLoginEmailAddressTextFieldVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailAddressTextField");
	}

	public boolean isLoginHoneywellHomeLogoVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "HoneywellHomeLogo", 3);
	}

	public boolean isLoginCancelButtonDisplayed() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "CancelButton");
	}

	public boolean clickOnCancelButton() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "CancelButton");
	}

	public boolean ClickOnHoneywellHomeLogo() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "HoneywellHomeLogo");
	}

	public boolean enterEmailIdInLoginScreen(TestCaseInputs inputs, String email) {
		return MobileUtils.setValueToElement(objectDefinition, testCase, "EmailAddressTextField", email);
	}

	public boolean enterPasswordInLoginScreen(TestCaseInputs inputs, String password) {
		return MobileUtils.setValueToElement(objectDefinition, testCase, "PasswordTextField", password);
	}

	public boolean isLoginInvalidEmailAndPasswordValidationDisplayed() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "InvalidEmailAndPasswordValidation");
	}
}
