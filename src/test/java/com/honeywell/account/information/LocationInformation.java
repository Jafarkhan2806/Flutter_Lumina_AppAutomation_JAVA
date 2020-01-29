package com.honeywell.account.information;

import org.json.JSONArray ;
import org.json.JSONException ;
import org.json.JSONObject ;

import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.LyricUtils ;

public class LocationInformation {
	private JSONObject locationInformation;
	private TestCaseInputs inputs;
	private TestCases testCase;

	public LocationInformation(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		this.inputs = inputs;
		locationInformation = LyricUtils.getLocationInformation(this.testCase, this.inputs);
	}

	public void printLocationJSON() {
//		if (locationInformation != null) {
//			
//		} else {
//			
//		}
	}

	public long getLocationID() throws Exception {
		if (locationInformation != null) {
			return locationInformation.getLong("locationID");
		} else {
			return -1;
		}
	}
	
	public String getIANATimeZone() throws Exception {
		if (locationInformation != null) {
			return locationInformation.getString("ianaTimeZone");
		} else {
			return null;
		}
	}
	
	public String getTimeZone() throws Exception {
		if (locationInformation != null) {
			return locationInformation.getString("timeZone");
		} else {
			return null;
		}
	}

	public long getUserID() throws Exception {
		if (locationInformation != null) {
			JSONArray users;
			long id = -1;
			users = locationInformation.getJSONArray("users");
			JSONObject tempObj = null;
			for (int i = 0; i < users.length(); i++) {
				tempObj = users.optJSONObject(i);
				if (tempObj.getString("username").equalsIgnoreCase(inputs.getInputValue("USERID"))) {
					id = tempObj.getLong("userID");
				}
			}
			return id;
		} else {
			return -1;
		}
	}
	
	public String getUserFirstName(){
		String firstName = null;
		if (locationInformation != null) {
			JSONArray users;

			try {
				users = locationInformation.getJSONArray("users");
				JSONObject tempObj = null;
				for (int i = 0; i < users.length(); i++) {
					tempObj = users.optJSONObject(i);
					if (tempObj.getString("username").equalsIgnoreCase(inputs.getInputValue("USERID"))) {
						firstName = tempObj.getString("firstname");
					}
				}
			} catch (Exception e) {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
			return firstName;
		} else {
			return firstName;
		}
	}
	
	public String getDASDeviceID() {
		String deviceID="";
		if (locationInformation != null) {
			try {
				JSONArray devices = locationInformation.getJSONArray("devices");
				for(int i=0;i<devices.length();i++)
				{
					if(devices.optJSONObject(i).getString("deviceType").equals("HONDAS"))
					{
						deviceID = devices.optJSONObject(i).getString("deviceID");
						break;
					}
				}
			} catch (Exception e) {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Device Schedule Type : Not Connected to CHAPI. Returning \"\" value");
		}

		return deviceID;
	}
	
	public int getNumberOfDeviceInLocation()
	{
		int numberOfDevices=-1;
		if (locationInformation != null) {
			try {
				JSONArray devices = locationInformation.getJSONArray("devices");
				numberOfDevices = devices.length();
			}
			catch(JSONException e)
			{
				numberOfDevices=0;
			}
			catch (Exception e) {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Device Schedule Type : Not Connected to CHAPI. Returning \"\" value");
		}
		return numberOfDevices;
	}
	
	public int getDeviceCountOfLocation() {
		int deviceCount = 0;
		if (locationInformation != null) {
			try {
				deviceCount = locationInformation.getJSONArray("devices").length();
			} catch (Exception e) {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Device Schedule Type : Not Connected to CHAPI. Returning \"\" value");
		}

		return deviceCount;
	}
	
	public String getLocationTimeZone() throws Exception {
		String timeZone = "";
		try {
			if (locationInformation != null) {
				try {
					timeZone = locationInformation.getString("country") + "/" + locationInformation.getString("timeZoneId");
				} catch (JSONException e) {
					timeZone = locationInformation.getString("country") + "/Eastern";
				}
				catch (Exception e) {
					throw new Exception(e.getMessage());
				}

			} else {
				throw new Exception("Location Information is null");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		
		return timeZone;
	}
	
	public long getGeofenceID() {
		if (locationInformation != null) {
			JSONArray geofences;
			long id = -1;
			try {
				geofences = locationInformation.getJSONArray("geoFences");
				id = geofences.getJSONObject(0).getLong("geoFenceID");
			} catch (Exception e) {
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Error occurred : " + e.getMessage());
			}
			return id;
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Device Schedule Type : Not Connected to CHAPI. Returning \"\" value");
			return -1;
		}
	}
	
	public String getCountry()
	{
		if(locationInformation!=null)
		{
			return locationInformation.getString("country");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Location Information : Location Information is null");
			return "";
		}
	}
	
	
	public String getStreetAddress()
	{
		if(locationInformation!=null)
		{
			return locationInformation.getString("streetAddress");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Location Information : Location Information is null");
			return "";
		}
	}
	
	public String getStateName()
	{
		if(locationInformation!=null)
		{
			return locationInformation.getString("state");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Location Information : Location Information is null");
			return "";
		}
	}
	
	public String getZipCode()
	{
		if(locationInformation!=null)
		{
			try
			{
				return String.valueOf(locationInformation.getString("zipcode"));
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
				
				return "";
			}
			
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Location Information : Location Information is null");
			return "";
		}
	}
	
	public String getCityName()
	{
		if(locationInformation!=null)
		{
			return locationInformation.getString("city");
		}
		else
		{
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Location Information : Location Information is null");
			return "";
		}
	}
	
	public String getGeofenceDetails()
	{
		String geoDetails="";
		String latitude="";
		String longitude="";
		String radius="";

		if (locationInformation != null)
		{
			try
			{
			JSONArray geofences = locationInformation.getJSONArray("geoFences");							
			latitude = String.valueOf(geofences.getJSONObject(0).getDouble("latitude"));
			longitude = String.valueOf(geofences.getJSONObject(0).getDouble("longitude"));
			radius = String.valueOf(geofences.getJSONObject(0).getDouble("radius"));
			geoDetails = latitude + "_" +  longitude + "_" + radius;
			}
			catch(Exception e)
			{
				geoDetails = "";
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Get Geofence Details : Error occurred : " + e.getMessage());
			}

		}
		else
		{
			geoDetails = "";
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,"ThermoStat Information : Not Connected to CHAPI. Returning \"\" value");
		}

		return geoDetails;
	}
	
	public double getLatitude() {
		double latitude = -1;
		if (locationInformation != null) {
			try {
				JSONArray geofenceArray = locationInformation.getJSONArray("geoFences");
				JSONObject tempObj;
				for (int i = 0; i < geofenceArray.length(); i++) {
					tempObj = geofenceArray.optJSONObject(i);
					latitude = tempObj.getDouble("latitude");
				}
			} catch (Exception e) {
				latitude = -1;
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Error occurred : " + e.getMessage());
				return latitude;
			}
		} else {
			latitude = -1;
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Location Information is empty");
			return latitude;
		}
		return latitude;
	}

	public double getLongitude() {
		double longitude = -1;
		if (locationInformation != null) {
			try {
				JSONArray geofenceArray = locationInformation.getJSONArray("geoFences");
				JSONObject tempObj;
				for (int i = 0; i < geofenceArray.length(); i++) {
					tempObj = geofenceArray.optJSONObject(i);
					longitude = tempObj.getDouble("longitude");
				}
			} catch (Exception e) {
				longitude = -1;
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Error occurred : " + e.getMessage());
				return longitude;
			}
		} else {
			longitude = -1;
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Location Information is empty");
			return longitude;
		}
		return longitude;
	}
	

}
