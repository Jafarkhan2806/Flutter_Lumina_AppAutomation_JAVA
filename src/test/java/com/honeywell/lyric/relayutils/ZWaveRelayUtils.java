package com.honeywell.lyric.relayutils;

import java.util.concurrent.TimeUnit;

import com.honeywell.commons.coreframework.TestCaseInputs;

public class ZWaveRelayUtils {

	public static void enrollZwaveSwitch1() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(10);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriver.closePort();
	}

	public static void pressButtonOnSwitch1() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriver.closePort();
	}

	public static boolean isSwitch1ON() throws Exception {
		SerialDriver.initialize();
		if (SerialDriver.getstatus(ZWaveConstants.ZWaveSwitch1OutputStatusPort).equalsIgnoreCase("OFF")) {
			SerialDriver.closePort();
			return true;
		} else {
			SerialDriver.closePort();
			return false;
		}

	}

	public static void enrollZwaveDimmer1() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		TimeUnit.SECONDS.sleep(10);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		SerialDriver.closePort();
	}

	public static void pressButtonOnDimmer1() throws Exception {
		SerialDriver.initialize();
		SerialDriver.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriver.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriver.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		SerialDriver.closePort();
	}

	public static String getDimmerIntensityRange() throws Exception {
		String dimmerIntensityRange = "";

		try {
			int i = 0;
			SerialDriver.initialize();
			while (i < 5) {
				dimmerIntensityRange = SerialDriver
						.getDimmerIntensityPercentageRange(ZWaveConstants.ZWaveDimmer1OutputPercentagePort);
				if (!dimmerIntensityRange.equals("Invalid")) {
					break;
				}
				i++;
			}
			SerialDriver.closePort();
		} catch (Exception e) {
			SerialDriver.closePort();
			throw new Exception(e.getMessage());
		}
		return dimmerIntensityRange;
	}

	public static String powerOffZwaveSwitch(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("SwitchState").equals("SwitchPowerOff")){
			SerialDriver.initialize();
			SerialDriver.setrelay(ZWaveConstants.ZWaveSwitch1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriver.closePort();
		}
		inputs.setInputValueWithoutTarget("SwitchState", "SwitchPowerOff");
		return "SwitchPowerOff";
	}
	public static String powerOnZwaveSwitch(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("SwitchState").equals("SwitchPowerOn")){
			SerialDriver.initialize();
			SerialDriver.resetrelay(ZWaveConstants.ZWaveSwitch1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriver.closePort();
		}
		inputs.setInputValueWithoutTarget("SwitchState", "SwitchPowerOn");
		return "SwitchPowerOn";
	}

	public static String powerOffZwaveDimmer(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("DimmerState").equals("DimmerPowerOff")){
			SerialDriver.initialize();
			SerialDriver.setrelay(ZWaveConstants.ZWaveDimmer1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriver.closePort();
		}
		inputs.setInputValueWithoutTarget("DimmerState", "DimmerPowerOff");
		return "DimmerPowerOff";
	}
	public static String powerOnZwaveDimmer(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("DimmerState").equals("DimmerPowerOn")){
			SerialDriver.initialize();
			SerialDriver.resetrelay(ZWaveConstants.ZWaveDimmer1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriver.closePort();
		}
		inputs.setInputValueWithoutTarget("DimmerState", "DimmerPowerOn");
		return "DimmerPowerOn";
	}
}
