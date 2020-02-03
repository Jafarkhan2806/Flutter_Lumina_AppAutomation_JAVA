package com.resideo.lumina.relayutils;

import java.util.concurrent.TimeUnit;

import com.honeywell.commons.coreframework.TestCaseInputs;

public class ZWaveRelayUtils {

	public static void enrollZwaveSwitch1() throws Exception {
		SerialDriverCore.initialize();
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(10);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriverCore.closePort();
	}

	public static void pressButtonOnSwitch1() throws Exception {
		SerialDriverCore.initialize();
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriverCore.closePort();
	}

	public static boolean isSwitch1ON() throws Exception {
		SerialDriverCore.initialize();
		if (SerialDriverCore.getstatus(ZWaveConstants.ZWaveSwitch1OutputStatusPort).equalsIgnoreCase("OFF")) {
			SerialDriverCore.closePort();
			return true;
		} else {
			SerialDriverCore.closePort();
			return false;
		}

	}

	public static void enrollZwaveDimmer1() throws Exception {
		SerialDriverCore.initialize();
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		TimeUnit.SECONDS.sleep(10);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		SerialDriverCore.closePort();
	}

	public static void pressButtonOnDimmer1() throws Exception {
		SerialDriverCore.initialize();
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriverCore.setrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		TimeUnit.SECONDS.sleep(1);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort2);
		SerialDriverCore.resetrelay(ZWaveConstants.ZWaveDimmer1RelayPort1);
		SerialDriverCore.closePort();
	}

	public static String getDimmerIntensityRange() throws Exception {
		String dimmerIntensityRange = "";

		try {
			int i = 0;
			SerialDriverCore.initialize();
			while (i < 5) {
				dimmerIntensityRange = SerialDriverCore
						.getDimmerIntensityPercentageRange(ZWaveConstants.ZWaveDimmer1OutputPercentagePort);
				if (!dimmerIntensityRange.equals("Invalid")) {
					break;
				}
				i++;
			}
			SerialDriverCore.closePort();
		} catch (Exception e) {
			SerialDriverCore.closePort();
			throw new Exception(e.getMessage());
		}
		return dimmerIntensityRange;
	}

	public static String powerOffZwaveSwitch(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("SwitchState").equals("SwitchPowerOff")){
			SerialDriverCore.initialize();
			SerialDriverCore.setrelay(ZWaveConstants.ZWaveSwitch1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriverCore.closePort();
		}
		inputs.setInputValueWithoutTarget("SwitchState", "SwitchPowerOff");
		return "SwitchPowerOff";
	}
	public static String powerOnZwaveSwitch(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("SwitchState").equals("SwitchPowerOn")){
			SerialDriverCore.initialize();
			SerialDriverCore.resetrelay(ZWaveConstants.ZWaveSwitch1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriverCore.closePort();
		}
		inputs.setInputValueWithoutTarget("SwitchState", "SwitchPowerOn");
		return "SwitchPowerOn";
	}

	public static String powerOffZwaveDimmer(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("DimmerState").equals("DimmerPowerOff")){
			SerialDriverCore.initialize();
			SerialDriverCore.setrelay(ZWaveConstants.ZWaveDimmer1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriverCore.closePort();
		}
		inputs.setInputValueWithoutTarget("DimmerState", "DimmerPowerOff");
		return "DimmerPowerOff";
	}
	public static String powerOnZwaveDimmer(TestCaseInputs inputs) throws Exception {
		if(!inputs.getInputValue("DimmerState").equals("DimmerPowerOn")){
			SerialDriverCore.initialize();
			SerialDriverCore.resetrelay(ZWaveConstants.ZWaveDimmer1PowerPort);
			TimeUnit.SECONDS.sleep(10);
			SerialDriverCore.closePort();
		}
		inputs.setInputValueWithoutTarget("DimmerState", "DimmerPowerOn");
		return "DimmerPowerOn";
	}
}
