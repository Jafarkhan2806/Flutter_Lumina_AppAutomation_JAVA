package com.honeywell.devicepoolfilter;

import java.io.BufferedReader ;
import java.io.IOException ;
import java.io.InputStreamReader ;
import java.io.OutputStream ;
import java.net.HttpURLConnection ;
import java.net.URL ;
import java.util.HashMap ;
import java.util.Iterator ;
import java.util.Set ;

import org.json.JSONArray ;
import org.json.JSONObject ;

import com.honeywell.commons.coreframework.SuiteConstants ;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes ;
import com.honeywell.commons.coreframework.TestCaseInputs ;


public class ChapiUtil implements AutoCloseable {

	/**
	 * @param args
	 */

	private String chapiURL;
	private boolean isConnected;
	private HttpURLConnection chapiConnection;
	private String cookie;
	private HashMap<String, Long> locations;
	private String verificationToken;
	private String bodyToken;
	private String sessionID;
	
	public String getChapuUrl(){
		return chapiURL;
	}

	public ChapiUtil(TestCaseInputs inputs) {
		try {
			if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Production")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_PRODUCTION");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Jasper_QA")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHAPI_URL_JASPER_QA");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Dogfooding")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHAPI_URL_DOGFOODING");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("CHIL Stage (Azure)")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_STAGING");
			}
			else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equalsIgnoreCase("Stage")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_STAGING");
				
		} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		this.isConnected = false;
		locations = new HashMap<String, Long>();

	}
	
	public boolean isAllDevicesOnLine(){
		Set<String> locations = getLocationNames();
		Iterator<String> locationIter = locations.iterator();
		long locationID;
		boolean isAlive=true;
		while(locationIter.hasNext()){
			locationID = getLocationID(locationIter.next());
			if(locationID>-1){
				String url = chapiURL + "api/V3/locations/" + locationID;
				HttpURLConnection connection = doGetRequest(url);
				
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
	
	public Set<String> getLocationNames() {
		return locations.keySet();
	}

	public long getLocationID(String locationName) 
	{
		if (locations.containsKey(locationName)) {
			return locations.get(locationName);
		} else {
			return -1;
		}
	}

	public boolean isConnected() {
		return isConnected;
	}

	public HttpURLConnection getChapiConnection() {
		return chapiConnection;
	}

	public HttpURLConnection doPostRequest(String urlString, String headerData) {

		HttpURLConnection postResponse = null;
		try {
			URL url = new URL(urlString);
			postResponse = (HttpURLConnection) url.openConnection();

			postResponse.setRequestMethod("POST");
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

			// if (postResponse.getResponseCode() ==
			// HttpURLConnection.HTTP_CREATED|| postResponse.getResponseCode()
			// == HttpURLConnection.HTTP_OK) {
			//
			// } else {
			// }

		} catch (IOException e) {
			e.printStackTrace();
		}

		return postResponse;
	}

	public HttpURLConnection doGetRequest(String urlString) {
		HttpURLConnection getResponse = null;
		try {
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

		} catch (IOException e) {
			e.printStackTrace();
		}

		return getResponse;
	}

	public HttpURLConnection doDeleteRequest(String urlString) {
		HttpURLConnection getResponse = null;
		try {
			URL url = new URL(urlString);

			getResponse = (HttpURLConnection) url.openConnection();

			getResponse.setRequestProperty("sessionID", getSessionID());
			getResponse.setRequestProperty("RequestVerificationToken", getVerificationToken() + ":" + getBodyToken());
			getResponse.setRequestProperty("Cookie", cookie);
			getResponse.setDoOutput(true);
			getResponse.setRequestMethod("DELETE");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return getResponse;
	}

	public HttpURLConnection doPutRequest(String urlString, String headerData) {

		HttpURLConnection postResponse = null;
		try {
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

			if (postResponse.getResponseCode() != HttpURLConnection.HTTP_OK) {
				postResponse.getResponseCode();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return postResponse;
	}

	public boolean getConnection(String userName, String password) {
		try {
			URL url = new URL(chapiURL + "api/V2/Session");

			// CookieManager.setDefault(new CookieManager())

			String input = "{\"username\": \"" + userName + "\",\"password\": \"" + password + "\"}";

			chapiConnection = (HttpURLConnection) url.openConnection();

			chapiConnection.setDoOutput(true);
			chapiConnection.setRequestMethod("POST");
			chapiConnection.setRequestProperty("content-type", "application/json");
			chapiConnection.setRequestProperty("content-length", String.valueOf(input.length()));

			OutputStream os = chapiConnection.getOutputStream();

			os.write(input.getBytes());
			os.flush();

			if (chapiConnection.getResponseCode() == HttpURLConnection.HTTP_CREATED) {
				BufferedReader in = new BufferedReader(new InputStreamReader(chapiConnection.getInputStream()));

				String inputLine;
				StringBuffer html = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					html.append(inputLine);
				}

				in.close();

				JSONObject jsonObj = new JSONObject(html.toString().trim());

				//cookie = chapiConnection.getHeaderField("Set-Cookie");
				cookie = "___CHAPI_SESSION_ID___="+jsonObj.get("sessionID");

				bodyToken = jsonObj.get("bodytoken").toString();

				sessionID = jsonObj.get("sessionID").toString();

				verificationToken = chapiConnection.getHeaderField("RequestVerificationToken");

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
			isConnected = false;
		}

		return isConnected;
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

	public boolean disconnect() {
		if (isConnected) {
			if (chapiConnection != null) {
				try {
					chapiConnection.disconnect();
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
	
	@Override
	public void close() throws Exception {
		disconnect();

	}
	
}
