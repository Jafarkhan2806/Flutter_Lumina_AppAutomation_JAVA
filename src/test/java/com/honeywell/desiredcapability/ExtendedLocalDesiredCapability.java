package com.honeywell.desiredcapability;

import org.openqa.selenium.remote.DesiredCapabilities;

import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.deviceCloudProviders.LocalExecutionDesiredCapability;
import com.honeywell.commons.mobile.Mobile;

public class ExtendedLocalDesiredCapability extends LocalExecutionDesiredCapability {

	private TestCaseInputs inputs;
	DesiredCapabilities desiredCapabilities;
	public ExtendedLocalDesiredCapability(TestCases testCase, TestCaseInputs inputs) {
		super(testCase, inputs);
		this.inputs = inputs;
		
	}

	@Override
	public void additionalDesiredCapabilities() {
		try {
			desiredCapabilities = getDesiredCapabilities();
			desiredCapabilities.setCapability("noReset", true);
			 desiredCapabilities.setCapability("browserName", "");
			 desiredCapabilities.setCapability("autoAcceptAlerts", "false");
			 
			 desiredCapabilities.setCapability("unicodeKeyboard", true);
			 desiredCapabilities.setCapability("resetKeyboard", true);
			 
			if (inputs.getInputValue(TestCaseInputs.OS_NAME).equalsIgnoreCase(Mobile.IOS)) {
				if (inputs.isRealDevice()) {
					//desiredCapabilities.setCapability("showIOSLog", true);
					desiredCapabilities.setCapability("realDeviceLogger",
							SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "IOS_DEVICE_CONSOLE_PATH"));
				}
			}
			}
			catch (Exception e) {
			}
	}
}
