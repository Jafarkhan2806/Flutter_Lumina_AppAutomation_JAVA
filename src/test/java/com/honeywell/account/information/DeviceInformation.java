package com.honeywell.account.information;

import org.json.JSONException ;
import org.json.JSONObject ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.lyric.utils.LyricUtils ;

public class DeviceInformation {

	private JSONObject deviceInformation;
	private TestCases testCase;
	private String locationName;
	private String statName;

	// private TestCaseInputs inputs;

	public DeviceInformation(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		// this.inputs=inputs;
		deviceInformation = LyricUtils.getDeviceInformation(testCase, inputs);
	}

	public void printStatJSON() throws Exception {
		if (deviceInformation != null) {
			
		} else {
			throw new Exception("Device Information not found");
		}
	}

	public Boolean isOnline() throws Exception {
		if (deviceInformation != null) {
			return (Boolean) deviceInformation.getJSONObject("deviceDetails").getJSONArray("onboardDevices")
					.getJSONObject(0).get("isAlive");
		} else {
			throw new Exception("Device Information not found");
		}
	}
	
	public boolean isFanModeOptionAvailable(TestCases testCase) {

		boolean isFanMode=true;
		try
		{
			if (deviceInformation != null)
			{
				
				if(deviceInformation.has("fan"))
				{
					
				}
				else
				{
					isFanMode=false;
				}
			}
		}
		catch(Exception e)
		{
			
		}
		
		return isFanMode;
	}

	public String getDeviceID() throws Exception {
		if (deviceInformation != null) {
			return deviceInformation.getString("deviceID");
		} else {
			throw new Exception("Device Information not found");
		}
	}

	

	
	
	public String getDeviceMacID() throws Exception {
		try {
			if (deviceInformation != null) {
				return deviceInformation.getString("macID");
			} else {
				throw new Exception("Thermostat Information not found");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
	
	public int getDREventID() throws Exception {
		int eventID = -1;
		try {
			if (deviceInformation != null) {
				try {
					JSONObject dr = deviceInformation.getJSONObject("drEvent");
					eventID = dr.getInt("eventID");
				} catch (JSONException e) {
					eventID = -1;
				}
			} else {
				throw new Exception("Thermostat Information not found");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return eventID;
	}
	

	
}
