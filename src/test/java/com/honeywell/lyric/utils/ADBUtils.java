package com.honeywell.lyric.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.ArrayUtils;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.ui.FluentWait;

import com.google.common.base.Function;
import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;

public class ADBUtils {

	public static boolean isDevicePresentInADBDevices(String... deviceUDID)
			throws Exception {
		boolean isPresent = false;
		String[] devices = ADBUtils.getAllADBDevices();
		if (deviceUDID.length > 0) {
			for (int i = 0; i < devices.length; i++) {
				if (devices[i].equals(deviceUDID[0])) {
					isPresent = true;
					break;
				}
			}
		} else {
			if (devices.length > 0) {
				isPresent = true;
			}
		}
		return isPresent;
	}

	public static String executeADBCommand(String cmd) throws Exception {
		String output = " ";
		try {
			String[] tempArr = cmd.split(" ");
			String[] cmdArray;
			List<String> cmdList = new ArrayList<String>();
			cmdList.add(SuiteConstants.getConstantValue(
					SuiteConstantTypes.PROJECT_SPECIFIC, "LOCAL_ADB_PATH"));
			for (int i = 1; i < tempArr.length; i++) {
				cmdList.add(tempArr[i]);
			}
			cmdArray = cmdList.toArray(new String[cmdList.size()]);
			int n = tempArr.length - 1;
			String[] commandArr = new String[n];
			System.arraycopy(tempArr, 1, commandArr, 0, n);
			Runtime run = Runtime.getRuntime();
			Process pr = null;

			pr = run.exec(cmdArray);
			BufferedReader buf = new BufferedReader(new InputStreamReader(
					pr.getInputStream()));
			String temp;
			while ((temp = buf.readLine()) != null) {
				output += temp;
				output += "\n";
			}
		} catch (IOException e) {
			throw new Exception("IO Exception caused by " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("Error occurred: " + e.getMessage());
		}
		return output;
	}

	public static String[] getAllADBDevices() throws Exception {
		String[] devices;
		String adbDevices = ADBUtils.executeADBCommand("adb devices");
		adbDevices = adbDevices.replace("List of devices attached", "");
		devices = adbDevices.split("\n");
		for (int i = 0; i < devices.length; i++) {
			devices[i] = devices[i].trim();
			if (devices[i].equals("device")) {
				devices = ArrayUtils.remove(devices, i);
				continue;
			}
			if (devices[i].contains("device")) {
				devices[i] = devices[i].replace("device", "");
				devices[i] = devices[i].trim();
			}
		}
		return devices;
	}
	
	public static boolean rebootDASDevice(String dasDeviceADBID) throws Exception {
		boolean flag = true;
		boolean isDASDeviceConnected = false;
		FluentWait<Boolean> fWait = new FluentWait<Boolean>(isDASDeviceConnected);
		fWait.pollingEvery(Duration.ofSeconds(3));
		fWait.withTimeout(Duration.ofMinutes(1));

		try {
			Boolean isEventReceived = fWait.until(new Function<Boolean, Boolean>() {
				public Boolean apply(Boolean connected) {
					try {
						if (isDevicePresentInADBDevices(dasDeviceADBID)) {
							return true;
						} else {
							return false;
						}
					} catch (Exception e) {
						return false;
					}
				}
			});
			isDASDeviceConnected = isEventReceived;
		} catch (TimeoutException e) {
			flag = false;
			throw new Exception("DAS device '" + dasDeviceADBID
					+ "' is not connected. DAS device could not be found in ADB devices command. Wait Time 1 minute");
		} catch (Exception e) {
			flag = false;
			throw new Exception("Error occurred" + e.getMessage());
		}

		if (isDASDeviceConnected) {
			String output = ADBUtils.executeADBCommand("adb -s " + dasDeviceADBID + " reboot");
			if (!output.trim().equals("")) {
				flag = false;
				throw new Exception("Could not reboot device. Output : " + output);
			}
		} else {
			throw new Exception("DAS device '" + dasDeviceADBID
					+ "' is not connected. DAS device could not be found in ADB devices command");
		}
		return flag;
	}

	public static void clearLogcatLogs(String... deviceUDID) throws Exception {
		String cmd = "";
		if (deviceUDID.length > 0) {
			boolean isDASDeviceConnected = false;
			FluentWait<Boolean> fWait = new FluentWait<Boolean>(
					isDASDeviceConnected);
			fWait.pollingEvery(Duration.ofSeconds(3));
			fWait.withTimeout(Duration.ofMinutes(1));

			try {
				Boolean isEventReceived = fWait
						.until(new Function<Boolean, Boolean>() {
							public Boolean apply(Boolean connected) {
								try {
									if (isDevicePresentInADBDevices(deviceUDID[0])) {
										System.out
												.println("Device is available in adb devices list");
										return true;
									} else {
										System.out
												.println("Waiting for device to be available in adb devices list");
										return false;
									}
								} catch (Exception e) {
									return false;
								}
							}
						});
				isDASDeviceConnected = isEventReceived;
			} catch (TimeoutException e) {
				throw new Exception(
						"DAS device '"
								+ deviceUDID[0]
								+ "' is not connected. DAS device could not be found in ADB devices command. Wait Time 1 minute");
			} catch (Exception e) {
				throw new Exception("Error occurred" + e.getMessage());
			}
			if (isDASDeviceConnected) {
				cmd = "adb -s " + deviceUDID[0] + " logcat -c";
			} else {
				throw new Exception(
						"DAS device '"
								+ deviceUDID[0]
								+ "' is not connected. DAS device could not be found in ADB devices command");
			}
		} else {
			cmd = "adb logcat -c";
		}
		executeADBCommand(cmd);
	}

	public static String getLogCatLogs(String... deviceUDID) throws Exception {
		String cmd = "";
		if (deviceUDID.length > 0) {
			cmd = "adb -s " + deviceUDID[0] + " logcat";
		} else {
			cmd = "adb logcat";
		}
		String output = " ";
		try {
			String[] tempArr = cmd.split(" ");
			String[] cmdArray;
			List<String> cmdList = new ArrayList<String>();
			cmdList.add(SuiteConstants.getConstantValue(
					SuiteConstantTypes.PROJECT_SPECIFIC, "LOCAL_ADB_PATH"));
			for (int i = 1; i < tempArr.length; i++) {
				cmdList.add(tempArr[i]);
			}
			cmdArray = cmdList.toArray(new String[cmdList.size()]);
			int n = tempArr.length - 1;
			String[] commandArr = new String[n];
			System.arraycopy(tempArr, 1, commandArr, 0, n);
			Runtime run = Runtime.getRuntime();
			Process pr = null;

			// pr = run.exec(new
			// String[]{"/usr/local/Cellar/android-sdk/24.4.1_1/bin/adb"},commandArr);
			pr = run.exec(cmdArray);
			BufferedReader buf = new BufferedReader(new InputStreamReader(
					pr.getInputStream()));
			// pr.destroy();
			String temp;
			long startTime = System.currentTimeMillis();
			while ((temp = buf.readLine()) != null) {
				output += temp;
				output += "\n";
				if ((System.currentTimeMillis() - startTime) > 10000) {
					break;
				}
			}
		} catch (IOException e) {
			throw new Exception("IO Exception caused by " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("Error occurred: " + e.getMessage());
		}
		return output;
	}
	
	public static void deleteDASDeviceCFAFiles(String... deviceUDID) throws Exception {
		String cmd = "";
		if (deviceUDID.length > 0) {
			cmd = "adb -s " + deviceUDID[0] + " shell rm -rf /data/misc/bluetooth/*.cfa";
		} else {
			cmd = "adb shell rm -rf /data/misc/bluetooth/*.cfa";
		}
		executeADBCommand(cmd);
	}

	public static void pullADBFile(String filePathOnADBShell,
			String filePathToStoreFile, String... deviceUDID) throws Exception {
		String cmd;
		if (deviceUDID.length > 0) {
			cmd = "adb -s " + deviceUDID[0] + " pull " + filePathOnADBShell
					+ " " + filePathToStoreFile;
		} else {
			cmd = "adb pull " + filePathOnADBShell + " " + filePathToStoreFile;
		}
		executeADBCommand(cmd);
	}

	public static ArrayList<String> getAllFileNamesInADirectory(
			String directoryPath, String... deviceUDID) throws Exception {
		String cmd;
		if (deviceUDID.length > 0) {
			cmd = "adb -s " + deviceUDID[0] + " shell ls -R " + directoryPath;
		} else {
			cmd = "adb shell ls -R " + directoryPath;
		}
		String output = executeADBCommand(cmd);
		String[] files = output.split("\\s+");
		List<String> fileList = new ArrayList<String>(Arrays.asList(files));
		fileList.removeAll(Arrays.asList("", null));
		Pattern pattern = Pattern
				.compile("\\[[0-9]*[0-9]*;[0-9]*[0-9][m](.*)(.*?)\\[{1}[0-9]*[0-9]*[m]");
		ArrayList<String> fileNames = new ArrayList<String>();
		for (String a : fileList) {
			Matcher matcher = pattern.matcher(a);
			if (matcher.find()) {
				fileNames.add(matcher.group(1));
			}
		}
		return fileNames;
	}
	
	public static String getAndroidMobileDeviceTimeZone(String... deviceUDID) throws Exception {
		String cmd = "";
		if (deviceUDID.length > 0) {
			cmd = "adb -s " + deviceUDID[0] + " shell getprop persist.sys.timezone";
		} else {
			cmd = "adb shell getprop persist.sys.timezone";
		}
		return executeADBCommand(cmd);
	}
}
