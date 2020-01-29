package com.honeywell.commons.deviceCloudProviders;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.Platform;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.FluentWait;

import com.google.common.base.Function;
import com.honeywell.commons.coreframework.FrameworkGlobalVariables;
import com.honeywell.commons.coreframework.FrameworkUtils;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.mobile.Mobile;
import com.honeywell.commons.mobile.MobileDesiredCapabilities;
import com.honeywell.commons.pcloudy.PCloudyConstants;
import com.honeywell.commons.report.FailType;
import com.ssts.pcloudy.ConnectError;
import com.ssts.pcloudy.Connector;
import com.ssts.pcloudy.appium.PCloudyAppiumSession;
import com.ssts.pcloudy.dto.appium.booking.BookingDtoDevice;
import com.ssts.pcloudy.dto.device.MobileDevice;
import com.ssts.pcloudy.dto.file.PDriveFileDTO;

public class PCloudyExecutionDesiredCapability extends MobileDesiredCapabilities {

	private TestCases testCase;
	private TestCaseInputs inputs;
	private String deviceID;

	public final class PCloudyDeviceInformation {

		private String authToken;
		private BookingDtoDevice bookingDtoDevice;
		private PCloudyAppiumSession pCloudySession;

		public PCloudyAppiumSession getpCloudySession() {
			return pCloudySession;
		}

		public void setpCloudySession(PCloudyAppiumSession pCloudySession) {
			this.pCloudySession = pCloudySession;
		}

		public void setAuthToken(String authToken) {
			this.authToken = authToken;
		}

		public void setBookingDtoDevice(BookingDtoDevice bookingDtoDevice) {
			this.bookingDtoDevice = bookingDtoDevice;
		}

		public String getAuthToken() {
			return authToken;
		}

		public BookingDtoDevice getBookingDtoDevice() {
			return bookingDtoDevice;
		}
	}

	public PCloudyExecutionDesiredCapability(TestCases testCase, TestCaseInputs inputs) {
		super(testCase, inputs);
		this.testCase = testCase;
		this.inputs = inputs;
	}

	@Override
	public final boolean beforeDesiredCapabilityInstantiation() {

		PCloudyDeviceInformation deviceInformation = new PCloudyDeviceInformation();

		Connector pCloudyCONNECTOR = new Connector();

		PCloudyAppiumSession pCloudySession = null;

		DeviceCloudProviderCredentails credentials = null;

		StringBuilder message = new StringBuilder("PCloudy Before Desired Capability : ");

		boolean flag = true;
		try {

			switch (inputs.getInputValue(TestCaseInputs.EXEC_LOCATION).toUpperCase()) {
			case PCloudyConstants.PCLOUDY_PUBLIC:

				if (FrameworkGlobalVariables.dcProviderCredentials.containsKey(PCloudyConstants.PCLOUDY_PUBLIC)) {
					credentials = FrameworkGlobalVariables.dcProviderCredentials.get(PCloudyConstants.PCLOUDY_PUBLIC);
				} else {

					message = message.append("Public Cloud Credentials not provided. Credentials Available - ");
					message = message.append(FrameworkGlobalVariables.dcProviderCredentials);
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
							message.toString());
					message = null;
					return false;
				}

				pCloudyCONNECTOR.setApiEndpoint(PCloudyConstants.PUBLIC_URL);
				break;
			case "PCLOUDY":
			case "PCLOUDY_PRIVATE":
			default:

				HashMap<String, String> mobInfo = testCase.getMobileInformation(inputs.getCurrentTargetName());

				if (mobInfo == null) {
					message = message.append("Device not acquired.");
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FALSE_POSITIVE, message.toString());
					message = null;
					return false;
				} else {

					inputs.setInputValue(TestCaseInputs.DEVICE_NAME, mobInfo.get("DEVICE_NAME"));
					inputs.setInputValue("OS_NAME", mobInfo.get("OS_NAME"));
					inputs.setInputValue("OS_VERSION", mobInfo.get("OS_VERSION"));
				}

				if (FrameworkGlobalVariables.dcProviderCredentials.containsKey(PCloudyConstants.PCLOUDY)) {
					credentials = FrameworkGlobalVariables.dcProviderCredentials.get(PCloudyConstants.PCLOUDY);
				} else {

					if (FrameworkGlobalVariables.dcProviderCredentials.containsKey(PCloudyConstants.PCLOUDY_PRIVATE)) {
						credentials = FrameworkGlobalVariables.dcProviderCredentials
								.get(PCloudyConstants.PCLOUDY_PRIVATE);
					} else {
						message = message.append("Private Cloud Credentials not provided. Credentials Available - ");
						message = message.append(FrameworkGlobalVariables.dcProviderCredentials);
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								message.toString());
						message = null;
						return false;
					}
				}

				pCloudyCONNECTOR.setApiEndpoint(
						SuiteConstants.getConstantValue(SuiteConstantTypes.PCLOUDY, "PRIVATE_API_END_POINT"));
				break;
			}

			String expectedDeviceName = String.format("%s%s%s", inputs.getInputValue(TestCaseInputs.DEVICE_NAME),
					inputs.getInputValue(TestCaseInputs.OS_NAME), inputs.getInputValue(TestCaseInputs.OS_VERSION))
					.replaceAll("\\s+", FrameworkGlobalVariables.BLANK);

			if (credentials != null) {
				

				String authToken = pCloudyCONNECTOR.authenticateUser(credentials.getUserName(),
						credentials.getPassword());

				int pCloudyTimeOut = Integer
						.valueOf(SuiteConstants.getConstantValue(SuiteConstantTypes.PCLOUDY, "DeviceTimeOut"));

				MobileDevice[] devices =  pCloudyCONNECTOR.getDevices(authToken,pCloudyTimeOut,inputs.getInputValue(TestCaseInputs.OS_NAME), false);

				List<MobileDevice> selectedDevices = new ArrayList<MobileDevice>();

				FluentWait<MobileDevice[]> fWait = new FluentWait<MobileDevice[]>(devices);
				fWait.pollingEvery(Duration.ofSeconds(2));
				fWait.withTimeout(Duration.ofMinutes(2));


				BookingDtoDevice[] bookedDevicesIDs = {};
				
				
				String appPath = FrameworkGlobalVariables.BLANK;

				switch (inputs.getInputValue(TestCaseInputs.OS_NAME).toUpperCase()) {
				case Mobile.ANDROID:
					appPath = FrameworkGlobalVariables.APP_VERSION_TO_INSTALL.get("PCLOUDY_APK");
					break;
				case Mobile.IOS:
					appPath = FrameworkGlobalVariables.APP_VERSION_TO_INSTALL.get("PCLOUDY_IPA");
					break;
				}

				File fileToBeUploaded;

				fileToBeUploaded = new File(appPath);

				PDriveFileDTO alreadyUploadedApp = pCloudyCONNECTOR.getAvailableAppIfUploaded(authToken,
						fileToBeUploaded.getName());

				if (alreadyUploadedApp == null) {

					switch (inputs.getInputValue(TestCaseInputs.OS_NAME).toUpperCase()) {
					case Mobile.ANDROID:
						appPath = FrameworkGlobalVariables.APP_VERSION_TO_INSTALL.get("LOCAL_APK");
						break;
					case Mobile.IOS:
						appPath = FrameworkGlobalVariables.APP_VERSION_TO_INSTALL.get("LOCAL_IPA");
						break;
					}

					fileToBeUploaded = new File(appPath);

					if (fileToBeUploaded.exists()) {
						PDriveFileDTO uploadedApp = pCloudyCONNECTOR.uploadApp(authToken, fileToBeUploaded, true);
						alreadyUploadedApp = new PDriveFileDTO();
						alreadyUploadedApp.file = uploadedApp.file;
					} else {
						inputs.setInputValue("API_END_POINT", FrameworkGlobalVariables.BLANK);

						message = message.append("File doesn't exists - ");
						message = message.append(appPath);

						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								message.toString());
						message = null;
						flag = false;
						return flag;
					}
				}
				
				try {
					boolean isEventReceived = fWait.until(new Function<MobileDevice[], Boolean>() {
						public Boolean apply(MobileDevice[] devices) {
							try {
								devices = pCloudyCONNECTOR.getDevices(authToken, pCloudyTimeOut,
										inputs.getInputValue(TestCaseInputs.OS_NAME), false);
								for (MobileDevice device : devices) {
									String fullName = device.full_name.replaceAll("_+", FrameworkGlobalVariables.BLANK);
									if (expectedDeviceName.equalsIgnoreCase(fullName)) {
										if (!device.available) {
											try {
												devices = pCloudyCONNECTOR.getDevices(authToken, pCloudyTimeOut,
														inputs.getInputValue(TestCaseInputs.OS_NAME), false);
											} catch (ConnectError e) {

											} catch (IOException e) {
											}
											return false;
										} else {
											selectedDevices.add(device);
											break;
										}
									}
								}
								if (selectedDevices.size() == 0) {
									return false;
								} else {
									return true;
								}
							} catch (ConnectError e) {
								return false;
							} catch (IOException e) {
								return false;
							}
						}
					});
					flag = isEventReceived;
				} catch (TimeoutException e) {
					message = message.append("PCloudy device is not available despite waiting for 2 minutes");
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							message.toString());
					message = null;
					return false;
				} catch (Exception e) {
					message = message.append("Error occurred : ");
					message = message.append(FrameworkUtils.getMessage(e));
					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
							message.toString());
					message = null;
					return false;
				}

				if (selectedDevices.size() > 0) {

					bookedDevicesIDs = pCloudyCONNECTOR.AppiumApis().bookDevicesForAppium(authToken, selectedDevices,
							pCloudyTimeOut, testCase.getTestCaseName());

					

					if (flag && bookedDevicesIDs.length > 0) {
						deviceID = bookedDevicesIDs[0].capabilities.deviceName;
						pCloudyCONNECTOR.AppiumApis().initAppiumHubForApp(authToken, alreadyUploadedApp);

						URL appiumEndPoint = pCloudyCONNECTOR.AppiumApis().getAppiumEndpoint(authToken);

						inputs.setInputValue("API_END_POINT", appiumEndPoint.toString());

						deviceInformation.setBookingDtoDevice(bookedDevicesIDs[0]);

						deviceInformation.setAuthToken(authToken);

						pCloudySession = new PCloudyAppiumSession(pCloudyCONNECTOR, authToken, bookedDevicesIDs[0]);

						deviceInformation.setpCloudySession(pCloudySession);

					} else {
						inputs.setInputValue("API_END_POINT", FrameworkGlobalVariables.BLANK);
						message = message.append("Not able to book Device - ");
						message = message.append(inputs.getInputValue(TestCaseInputs.DEVICE_NAME));
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								message.toString());
						message = null;
						flag = false;
					}

				} else {
					inputs.setInputValue("API_END_POINT", FrameworkGlobalVariables.BLANK);
					message = message.append("Device not available - ");
					message = message.append(inputs.getInputValue(TestCaseInputs.DEVICE_NAME));

					Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
							message.toString());
					message = null;
					flag = false;
				}

			} else {
				return false;
			}

		} catch (Exception e) {
			inputs.setInputValue("API_END_POINT", FrameworkGlobalVariables.BLANK);
			message = message.append("Error occurred - ");
			message = message.append(FrameworkUtils.getMessage(e));
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION, message.toString());
			message = null;
			flag = false;
		} finally {
			testCase.setpCloudySession(pCloudySession);
		}

		return flag;
	}

	@Override
	public final boolean afterDesiredCapabilityInstantiation() {
		return true;
	}

	@Override
	public final void setSpecificDesiredCapabilities() throws Exception {
		DesiredCapabilities capabilities = getDesiredCapabilities();
		capabilities.setCapability("deviceName", deviceID);
		capabilities.setCapability("browserName", deviceID);
		capabilities.setPlatform(Platform.ANY);
		capabilities.setVersion(null);
	}

}
