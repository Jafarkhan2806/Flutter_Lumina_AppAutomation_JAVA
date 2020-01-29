package com.honeywell.CHIL;

import java.io.BufferedReader ;
import java.io.IOException ;
import java.io.InputStreamReader ;
import java.io.OutputStream ;
import java.net.HttpURLConnection ;
import java.net.MalformedURLException ;
import java.net.URL ;
import java.util.ArrayList ;
import java.util.HashMap ;
import java.util.Iterator ;
import java.util.List ;
import java.util.Set ;

import org.apache.http.HttpResponse ;
import org.apache.http.NameValuePair ;
import org.apache.http.client.entity.UrlEncodedFormEntity ;
import org.apache.http.client.methods.HttpPost ;
import org.apache.http.impl.client.CloseableHttpClient ;
import org.apache.http.impl.client.HttpClientBuilder ;
import org.apache.http.message.BasicNameValuePair ;
import org.json.JSONArray ;
import org.json.JSONObject ;
import com.honeywell.account.information.LocationInformation ;
import com.honeywell.commons.coreframework.SuiteConstants ;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
public class CHILUtil implements AutoCloseable {

	/**
	 * @param args
	 */

	private String chilURL;
	private boolean isConnected;
	private HttpURLConnection chilConnection;
	private String cookie;
	private HashMap<String, Long> locations;
	private int userID;
	private String verificationToken;
	private String bodyToken;
	private String sessionID;
	private TestCaseInputs inputs;

	public CHILUtil(TestCaseInputs inputs) throws Exception {
		String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
		environment = environment.replaceAll("\\s", "");
		if (environment.equalsIgnoreCase("Production")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_PRODUCTION");
		} else if (environment.equalsIgnoreCase("CHILInt(Azure)")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_INT");
		} else if (environment.equalsIgnoreCase("ChilDev(Dev2)")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DEV2");
		} else if (environment.equalsIgnoreCase("STAGE")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_STAGING");
		} else if (environment.equalsIgnoreCase("LoadTesting")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_LOAD_TESTING");
		} else if (environment.equalsIgnoreCase("ChilDas(QA)")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_QA");
		} else if (environment.equalsIgnoreCase("ChilDas(Test)")) {
			chilURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_TEST");
		}
		this.inputs = inputs;
		this.isConnected = false;
		locations = new HashMap<String, Long>();
	}

	public boolean isConnected() {
		return isConnected;
	}

	public HttpURLConnection getCHILConnection() {
		return chilConnection;
	}

	public String getVerificationToken() {
		return verificationToken;
	}

	public String getBodyToken() {
		return bodyToken;
	}

	public String getSessionID() {
		return sessionID;
	}

	public boolean getConnection() throws Exception {
		try {
			URL url = new URL(this.chilURL + "api/v2/Session");
			String input = "{\"username\": \"" + inputs.getInputValue("USERID") + "\",\"password\": \""
					+ inputs.getInputValue("PASSWORD") + "\"}";

			chilConnection = (HttpURLConnection) url.openConnection();

			chilConnection.setDoOutput(true);
			chilConnection.setRequestMethod("POST");
			chilConnection.setRequestProperty("content-type", "application/json");
			chilConnection.setRequestProperty("content-length", String.valueOf(input.length()));

			OutputStream os = chilConnection.getOutputStream();

			os.write(input.getBytes());
			os.flush();

			if (chilConnection.getResponseCode() == HttpURLConnection.HTTP_CREATED) {
				BufferedReader in = new BufferedReader(new InputStreamReader(chilConnection.getInputStream()));

				String inputLine;
				StringBuffer html = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					html.append(inputLine);
				}

				in.close();

				JSONObject jsonObj = new JSONObject(html.toString().trim());

				cookie = chilConnection.getHeaderField("Set-Cookie");

				bodyToken = jsonObj.get("bodytoken").toString();

				sessionID = jsonObj.get("sessionID").toString();

				verificationToken = chilConnection.getHeaderField("RequestVerificationToken");

				userID = jsonObj.getJSONObject("user").getInt("userID");
				JSONArray jsonUsers = (JSONArray) ((JSONObject) jsonObj.get("user")).get("locationRoleMapping");
				for (int i = 0; i < jsonUsers.length(); i++) {
					JSONObject tempJSON = (JSONObject) jsonUsers.get(i);
					locations.put(tempJSON.getString("locationName"), tempJSON.getLong("locationID"));
				}

				isConnected = true;
			} else {
				isConnected = false;
			}

		} catch (Exception e) {
			throw new Exception("Error occurred: " + e.getMessage());
		}
		return isConnected;
	}

	public boolean disconnect() {
		if (isConnected) {
			if (chilConnection != null) {
				try {
					chilConnection.disconnect();
					isConnected = false;
				} catch (Exception e) {
					isConnected = true;
				}

			} else {
				isConnected = false;
			}
		} else {
			isConnected = false;
		}

		return !isConnected;
	}

	public HttpURLConnection doPostRequest(String urlString, String headerData)
			throws MalformedURLException, IOException {

		HttpURLConnection postResponse = null;
		URL url = new URL(urlString);
		postResponse = (HttpURLConnection) url.openConnection();

		postResponse.setRequestMethod("POST");
		postResponse.setDoOutput(true);

		postResponse.setRequestProperty("sessionID", getSessionID());
		postResponse.setRequestProperty("RequestVerificationToken", getVerificationToken() + ":" + getBodyToken());
		postResponse.setRequestProperty("Cookie", cookie);

		postResponse.setRequestProperty("content-type", "application/json");

		if (!headerData.equals("")) {
			postResponse.setRequestProperty("content-length", String.valueOf(headerData.length()));
			OutputStream os = postResponse.getOutputStream();
			os.write(headerData.getBytes("UTF-8"));
			os.flush();
		}
		return postResponse;
	}

	public HttpURLConnection doGetRequest(String urlString) throws MalformedURLException, IOException {
		HttpURLConnection getResponse = null;
		URL url = new URL(urlString);

		getResponse = (HttpURLConnection) url.openConnection();

		getResponse.setRequestProperty("sessionID", getSessionID());
		getResponse.setRequestProperty("RequestVerificationToken", getVerificationToken() + ":" + getBodyToken());
		getResponse.setRequestProperty("Cookie", cookie);
		getResponse.setDoOutput(true);
		getResponse.setRequestMethod("GET");

		if (getResponse.getResponseCode() == HttpURLConnection.HTTP_CREATED
				|| getResponse.getResponseCode() == HttpURLConnection.HTTP_OK) {

			// BufferedReader in = new BufferedReader(new InputStreamReader(
			// getResponse.getInputStream()));
			//
			// String inputLine;
			// StringBuffer html = new StringBuffer();
			//
			// while ((inputLine = in.readLine()) != null) {
			// html.append(inputLine);
			// }
			//
			//

		} else {
			
			// return null;
		}

		return getResponse;
	}

	public HttpURLConnection doDeleteRequest(String urlString, boolean... addClientHeader)
			throws MalformedURLException, IOException {
		HttpURLConnection getResponse = null;
		URL url = new URL(urlString);

		getResponse = (HttpURLConnection) url.openConnection();

		getResponse.setRequestProperty("sessionID", getSessionID());
		getResponse.setRequestProperty("RequestVerificationToken", getVerificationToken() + ":" + getBodyToken());
		getResponse.setRequestProperty("Cookie", cookie);
		getResponse.setDoOutput(true);
		getResponse.setRequestMethod("DELETE");
		if (addClientHeader.length > 0) {
			if (addClientHeader[0]) {
				getResponse.setRequestProperty("Client", "MessageProcessor");
			}
		}
		return getResponse;
	}

	public HttpURLConnection doPutRequest(String urlString, String headerData)
			throws MalformedURLException, IOException {

		HttpURLConnection postResponse = null;
		URL url = new URL(urlString);
		postResponse = (HttpURLConnection) url.openConnection();

		postResponse.setRequestMethod("PUT");
		postResponse.setDoOutput(true);

		postResponse.setRequestProperty("sessionID", getSessionID());
		postResponse.setRequestProperty("RequestVerificationToken", getVerificationToken() + ":" + getBodyToken());
		postResponse.setRequestProperty("Cookie", cookie);

		postResponse.setRequestProperty("content-type", "application/json");

		// postResponse.connect();

		if (!headerData.equals("")) {
			postResponse.setRequestProperty("content-length", String.valueOf(headerData.length()));
			OutputStream os = postResponse.getOutputStream();
			os.write(headerData.getBytes("UTF-8"));
			os.flush();
		}

		if (postResponse.getResponseCode() == HttpURLConnection.HTTP_CREATED) {
		} else {
		}
		return postResponse;
	}

	@Override
	public void close() throws Exception {
		disconnect();

	}

	public Set<String> getLocationNames() {
		return locations.keySet();
	}
	public HashMap<String, Long> getLocationNamesAndId() {
		return locations;
	}

	public int getUserID() {
		return userID;
	}

	public long getLocationID(String locationName) {
		if (locations.containsKey(locationName)) {
			return locations.get(locationName);
		} else {
			return -1;
		}
	}

	public int clearAlarm(long locationID, String deviceID, TestCases testCase) throws Exception {
		int result = -1;
		try (CHILUtil chUtil = new CHILUtil(inputs)) {
			if (chUtil.getConnection()) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return -1;
				}
				if (chUtil.isConnected()) {
					String headerData = " ";
					String url = this.chilURL + "api/v3/locations/" + locationID + "/devices/" + deviceID
							+ "/partitions/1/dismiss";
					result = doPutRequest(url, headerData).getResponseCode();

				}
			}
		} catch (Exception e) {
			throw new Exception("(Clear Alarm) Error occurred : " + e.getMessage());
		}
		return result;

	}

	public int setBaseStationMode(long locationID, String deviceID, String modeToSet, TestCases testCase)
			throws Exception {
		int result = -1;
		try (CHILUtil chUtil = new CHILUtil(inputs)) {
			if (chUtil.getConnection()) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					throw new Exception("Invalid location ID found");
				}
				if (chUtil.isConnected()) {
					String url = " ";
					String headerData = " ";
					// api/v3/locations/{0}/devices/{1}/partitions/{2}/Disarm
					if (modeToSet.toUpperCase().contains("HOME")) {
						url = this.chilURL + "api/v3/locations/" + locationID + "/devices/" + deviceID
								+ "/partitions/1/Disarm";
						headerData = "{\"EnableSilentMode\":\"false\"," + "\"CorrelationId\":\"CorrId\""
								+ ",\"ChannelId\":\"ChannId\"" + "}";
					} else if (modeToSet.toUpperCase().contains("AWAY")) {
						url = this.chilURL + "api/v3/locations/" + locationID + "/devices/" + deviceID
								+ "/partitions/1/Arm";
						headerData = "{\"ArmType\":\"0\"," + "\"InstantArm\":\"true\"" + ",\"SilenceBeep\":\"false\""
								+ ",\"QuickArm\":\"false\"" + ",\"BypassSensors\": []}";
					} else if (modeToSet.toUpperCase().contains("NIGHT")) {
						url = this.chilURL + "api/v3/locations/" + locationID + "/devices/" + deviceID
								+ "/partitions/1/Arm";
						headerData = "{\"ArmType\":\"1\"," + "\"InstantArm\":\"true\"" + ",\"SilenceBeep\":\"false\""
								+ ",\"QuickArm\":\"false\"" + ",\"BypassSensors\": []}";

					} else if (modeToSet.toUpperCase().contains("OFF")) {
						url = this.chilURL + "api/v3/locations/" + locationID + "/devices/" + deviceID
								+ "/partitions/1/Disarm";
						headerData = "{\"EnableSilentMode\":\"true\""+"}";
					}
					result = doPutRequest(url, headerData).getResponseCode();
				}
			} else {
				throw new Exception("(Set Base Station Mode) Unable to connect to CHIL");
			}
		} catch (Exception e) {
			throw new Exception("(Set Base Station Mode) Unable to connect to CHIL");
		}
		return result;
	}

	public int putEntryExitTimer(long locationID, String deviceID, String entryExitTime) throws Exception {
		int result = -1;
		if (isConnected) {
			String url = "";
			String headerData = "";
			url = this.chilURL + "/api/v3/locations/" + locationID + "/devices/" + deviceID
					+ "/partition/1/EntryExitDelay";
			try {
				headerData = String.format("{\"entryDelayInSeconds\":%s,\"exitDelayInSeconds\":%s}", entryExitTime,
						entryExitTime);
				result = doPutRequest(url, headerData).getResponseCode();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			}

		}
		return result;
	}

	
	public int deleteLocation(long locationID) throws Exception {
		int result = -1;
		if (isConnected) {
			String url = " ";
			url = chilURL + "api/locations/" + locationID + "/users/" + userID;
			try {
				result = doDeleteRequest(url).getResponseCode();
			} catch (IOException e) {
				throw new Exception(e.getMessage());
			}

		}
		return result;
	}
	
	
	public static String getAPIGEEClientID(TestCaseInputs inputs) throws Exception {
		JSONObject enrollmentObj;
		String clientID = "";
		try {
			enrollmentObj = getEnrollmentJSON(inputs);
			clientID = enrollmentObj.getString("client_id");
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return clientID;
	}
	
	public static JSONObject getEnrollmentJSON(TestCaseInputs inputs) throws Exception {
		JSONObject enrollmentObj = new JSONObject();
		try {
			CloseableHttpClient httpClient = HttpClientBuilder.create().build();
			String url = "";
			if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equalsIgnoreCase("Production")) {
				url = "https://api.honeywell.com/oauth2/accesstoken";
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equalsIgnoreCase("Stage")) {
				url = "https://connectedhome-qa.apigee.net/oauth2/accesstoken";
			}
			HttpPost httpPost = new HttpPost(url);
			List<NameValuePair> parameters = new ArrayList<NameValuePair>();
			parameters.add(new BasicNameValuePair("grant_type", "client_credentials"));
			httpPost.setEntity(new UrlEncodedFormEntity(parameters));
			httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");
			httpPost.addHeader("authorization",
					"Basic Qk1wVnJyeGZha29BM0MxeEhoUm9qaWdzMGN5RzI1VnM6Z0xHWE9qMG9OQ05MZWZmQQ==");
			HttpResponse httpResponse = httpClient.execute(httpPost);
			if (httpResponse.getStatusLine().getStatusCode() == 200) {
				BufferedReader rd = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent()));

				StringBuffer result = new StringBuffer();
				String line = "";
				while ((line = rd.readLine()) != null) {
					result.append(line);
				}
				httpClient.close();
				enrollmentObj = new JSONObject(result.toString());
			} else {
				throw new Exception("Get Apigee Token : Unable to create session");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return enrollmentObj;
	}
	
	public static String getAPIGEEAccessToken(TestCaseInputs inputs) throws Exception {
		JSONObject enrollmentObj;
		String accessToken = "";
		try {
			enrollmentObj = getEnrollmentJSON(inputs);
			accessToken = enrollmentObj.getString("access_token");
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return accessToken;
	}
	
	public int disableVacation(long locationID, String deviceID) {
		int result = -1;
		try {
			if (isConnected) {
				String url = chilURL + String.format("api/v2/locations/%s/vacationHold", locationID);
				String headerData = String.format(
						"{\"thermostatVacationHoldSettings\":[{\"deviceID\":\"%s\"}],\"enabled\":false}", deviceID);
				try {
					result = doPutRequest(url, headerData).getResponseCode();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	public boolean isAllDevicesOnLine(){
		Set<String> locations = getLocationNames();
		Iterator<String> locationIter = locations.iterator();
		long locationID;
		boolean isAlive=true;
		while(locationIter.hasNext()){
			locationID = getLocationID(locationIter.next());
			if(locationID>-1){
				String url = chilURL + "api/V3/locations/" + locationID;
				HttpURLConnection connection = null;
				try {
					connection = doGetRequest(url);
				} catch (MalformedURLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
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

						JSONObject jsonObject = new JSONObject(html.toString().trim());
						
						if(jsonObject.has("devices")){
							JSONArray devicesArray = jsonObject.getJSONArray("devices");
							
							JSONObject devObject;
							
							for(int devIndex=0;devIndex<devicesArray.length();++devIndex){
								devObject = devicesArray.getJSONObject(devIndex);
																
								if(devObject.has("isAlive")){
									isAlive = isAlive && devObject.getBoolean("isAlive");
									
									if(devObject.has("deviceType")){
										
										if(devObject.getString("deviceType").equalsIgnoreCase("HoneyBadger")){
											// Dont check isProvisioned for HoneyBadger
										}else{
											if(devObject.has("isProvisioned")){
												isAlive = isAlive && devObject.getBoolean("isProvisioned");
											}
										}
									}
								}		
							}
						}
						
					} 
					
				} catch (IOException e) {
				}
			}else{
				break;
			}
		}
		
		return isAlive;
	}
	
	
	
	public int changePassword(TestCases testCase, TestCaseInputs inputs, long locationID, String oldPassword,String newPassword)
	{
		int result = -1;
		try
		{
			if (isConnected) 
			{
				LocationInformation loc = new LocationInformation(testCase, inputs);
				String url = chilURL + String.format("api/Users/%s/changepassword", loc.getUserID());
				String headerData = String.format(
						"{\"oldPassword\": \"%s\",\"password\": \"%s\",\"passwordAgain\": \"%s\"}", oldPassword,
						newPassword, newPassword);
				try 
				{
					result = doPostRequest(url, headerData).getResponseCode();
				} 
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}
		catch(Exception e)
		{
			
		}
		
		return result;
	}

}
