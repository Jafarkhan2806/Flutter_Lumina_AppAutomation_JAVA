package com.honeywell.devicepoolfilter;

import java.io.BufferedReader ;
import java.io.IOException ;
import java.io.InputStreamReader ;
import java.io.OutputStream ;
import java.net.HttpURLConnection ;
import java.net.URL ;
import java.util.HashMap ;
import java.util.Set ;

import org.json.JSONArray ;
import org.json.JSONObject ;

import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.SuiteConstants ;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes ;
import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.report.FailType ;

public class CameraChapiUtil implements AutoCloseable {
	private String chapiURL;
	private boolean isConnected;
	private HttpURLConnection chapiConnection;
	private String cookie;
	private HashMap<String, Long> locations;
	private String verificationToken;
	private String bodyToken;
	private String sessionID;
	private TestCaseInputs inputs;

	public CameraChapiUtil(TestCaseInputs inputs) {
		try {
			if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Production")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_PRODUCTION");
			}else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("WORKSHOP")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CAMERA_CHAPI_URL_CHILWORKSHOPINT");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("STAGE")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_STAGING");
			}else if(inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("CHIL INT")){
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_INT");
			}else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("CHIL Stage (Azure)")) {
				this.chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_STAGING");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.inputs = inputs;
		this.isConnected = false;
		locations = new HashMap<String, Long>();
	}

	public boolean isConnected() {
		return isConnected;
	}

	public HttpURLConnection getChapiConnection() {
		return chapiConnection;
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

	public boolean getConnection() {
		try {
			URL url = new URL(this.chapiURL + "api/v2/session");
			String input = "{\"username\": \"" + inputs.getInputValue("USERID") + "\",\"password\": \""
					+ inputs.getInputValue("PASSWORD") + "\"}";

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
				cookie="___CHAPI_SESSION_ID___="+jsonObj.get("sessionID").toString();

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

			if (!headerData.equals("")) {
				postResponse.setRequestProperty("content-length", String.valueOf(headerData.length()));
				OutputStream os = postResponse.getOutputStream();
				os.write(headerData.getBytes("UTF-8"));
				os.flush();
			}

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

			if (postResponse.getResponseCode() == HttpURLConnection.HTTP_CREATED) {
			} else {
			}

		} catch (IOException e) {
			e.printStackTrace();
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

	public long getLocationID(String locationName) {
		if (locations.containsKey(locationName)) {
			return locations.get(locationName);
		} else {
			return -1;
		}
	}
	public static String getCHILURL(TestCases testCase, TestCaseInputs inputs) {
		String chapiURL = " ";
		try {
			if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Production")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_PRODUCTION");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Jasper_QA")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHAPI_URL_JASPER_QA");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Dogfooding")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHAPI_URL_DOGFOODING");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).equals("Staging")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHAPI_URL_STAGING");
			}  else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("WORKSHOP")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CAMERA_CHAPI_URL_CHILWORKSHOPINT");
			} else if (inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("STAGE")) {
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CHIL_URL_STAGING");
			}else if(inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT).toUpperCase().contains("CHIL INT")){
				chapiURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC,
						"CAMERA_CHAPI_URL_CHILINT");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chapiURL;
	}

	public JSONObject getDeviceByID(long locationID,String deviceID,TestCases testCase) {
		/* returns - "model": "C2","manufacturer": "Edimax Technology Co.Ltd.", "serial": "00000000", "maxResolution": "1280x768",
		  "firmwareVer": "Unknown",  "deviceClass": "Camera",  "deviceType": "C1",  "deviceID": "df02847e-241f-4574-b9f9-987d6153bd35",
		  "userDefinedDeviceName": "test camera1",  "isAlive": false, "isUpgrading": false,  "isProvisioned": true, 
		   "macID": "00:00:00:00:00:00" */
		JSONObject jsonObject = null;
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return jsonObject;
				}
				if (chUtil.isConnected()) {
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"";
					HttpURLConnection connection = chUtil.doGetRequest(url);
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
							jsonObject = new JSONObject(html.toString().trim());
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Device by ID : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}
					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get Device by ID  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}
				}
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get Device by ID  : Unable to connect to CHAPI.");
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Device by ID  : Unable to get location. Error occurred - " + e.getMessage());
			jsonObject = null;
		}
		return jsonObject;
	}
	public String getDeviceName(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getDeviceByID(locationID, deviceID,testCase);
		String value=result.getString("userDefinedDeviceName");
		return value;
	}
	public JSONObject getClipCount(long locationID,String deviceID,TestCases testCase) {
		JSONObject jsonObject = null;
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return jsonObject;
				}
				if (chUtil.isConnected()) {
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/Cameras/"+deviceID+"/Clips";
					HttpURLConnection connection = chUtil.doGetRequest(url);
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
							jsonObject = new JSONObject(html.toString().trim());
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get clips count : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}
					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get clips count  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}
				}
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get Camera Configuration Information  : Unable to connect to CHAPI.");
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Camera Configuration Information  : Unable to get location. Error occurred - " + e.getMessage());
			jsonObject = null;
		}
		return jsonObject;
	}
	public JSONObject getCameraConfig(long locationID,String deviceID,TestCases testCase) {
		JSONObject jsonObject = null;
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return jsonObject;
				}
				if (chUtil.isConnected()) {
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					HttpURLConnection connection = chUtil.doGetRequest(url);
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
							jsonObject = new JSONObject(html.toString().trim());
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Camera Configuration : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}
					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get Camera Configuration Information  : Error occurred - " + e.getMessage());
						jsonObject = null;
					}
				}
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get Camera Configuration Information  : Unable to connect to CHAPI.");
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Camera Configuration Information  : Unable to get location. Error occurred - " + e.getMessage());
			jsonObject = null;
		}
		return jsonObject;
	}

	public String getLEDstatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("ledStatus");
		return value;
	}
	public String getMicroPhoneStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("micStatus");
		return value;
	}
	public String getAudioDetectionStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("audioDetection");
		return value;
	}
	public int getAudioSensitivityStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		int value =result.getInt("audioSensitivity");
		return value;
	}
	public String getMotionDetectionStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value =result.getString("motionDetection");
		return value;
	}
	public int getMotionSensitivityStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		JSONArray value =result.getJSONArray("motionArea");
		JSONObject result1=new JSONObject(value.get(0).toString().trim());
		return result1.getInt("sensitivity");
	}
	public String getNightModeStatus(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value =result.getString("nightMode");
		return value;
	}
	
	/*public String getCameraStatusofManageAlerts(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("micStatus");
		return value;
	}
	
	public String getSoundEventofManageAlerts(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("micStatus");
		return value;
	}
	
	public String getMotionEventofManageAlerts(long locationID, String deviceID, TestCases testCase) {
		JSONObject result= getCameraConfig(locationID, deviceID,testCase);
		String value=result.getString("micStatus");
		return value;
	}*/
	
	
	public int postLEDstatus(long locationID, String deviceID,String switchStatus, TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					JSONObject json= getCameraConfig(locationID, deviceID,testCase);
					json.put("ledStatus",switchStatus);
					json.remove("deviceId");
					headerData=json.toString();
					try {
						result = doPostRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;

	}
	public int postCameraName(long locationID, String deviceID,String nameToBeUpdated, TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/hub";
					JSONObject json= new JSONObject();
					json.put("UserDefinedName",nameToBeUpdated);
					json.put("deviceClass","null");
					headerData=json.toString();
					try {
						result = doPutRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;

	}
	public int postSensitivityValue(long locationID, String deviceID,String value, TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					JSONObject json= getCameraConfig(locationID, deviceID,testCase);
					json.put("AudioSensitivity",value);
					json.remove("deviceId");
					headerData=json.toString();
					try {
						result = doPostRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;

	}

	public int postCameraModeValue(long locationID, String deviceID,String value, TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					JSONObject json= getCameraConfig(locationID, deviceID,testCase);
					json.put("geoFence",value);
					json.remove("deviceId");
					headerData=json.toString();
					try {
						result = doPostRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;
	}

	public int postGeofenceValue(long locationID, String deviceID,String value, TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/v2/locations/" + locationID;
					//JSONObject json= getCameraConfig(locationID, deviceID,testCase);
					//json.put("geoFenceEnabled",value);
					//json.remove("deviceId");
					//json.toString();
					if(value.equalsIgnoreCase("true")){
						headerData="{\"geoFenceEnabled\":\""+value+"\"}";
					//	"{\"country\": \"US\",\"geoFenceEnabled\": true,\"originCoordinates\": {\"latitude\": %s,\"longitude\": %s},\"radius\": 500}",
						
						headerData="{\"country\":\"US\",\"geoFenceEnabled\":"+value+",\"originCoordinates\":{\"latitude\":12.9249592,\"longitude\":77.68712},\"radius\":500}";
					}else {
						headerData="{\"geoFenceEnabled\":"+value+"}";
					}
					try {
						result = doPutRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;

	}
	public int postSoundDetectionStatus(long locationID, String deviceID,String switchStatus, TestCases testCase) {
		int result = -1;
		JSONObject json= getCameraConfig(locationID, deviceID,testCase);
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {

			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));

				if (locationID == -1) {
					return -1;
				}

				if (chUtil.isConnected()) {
					try {
						String headerData = " ";
						String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config/";
						json.put("audioDetection",switchStatus);
						json.remove("deviceId");
						headerData=json.toString();
						try {
							result = doPostRequest(url, headerData).getResponseCode();
						} catch (IOException e) {
							e.printStackTrace();
						}

					} catch (Exception e) {

					}
				}
			}
		}catch(Exception e){

		}
		return result;
	}
	public int postMicrophoneStatus(long locationID, String deviceID,String switchStatus, TestCases testCase) {
		int result = -1;
		try {
			JSONObject json= getCameraConfig(locationID, deviceID,testCase);
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					json.put("micStatus",switchStatus);
					json.remove("deviceId");
					headerData=json.toString();

					try {
						result = doPostRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}

		}catch(Exception e){

		}
		return result;
	}	
	public int postMotionDetectionStatus(long locationID, String deviceID,String switchStatus, TestCases testCase) {
		int result = -1;
		try {
			JSONObject json= getCameraConfig(locationID, deviceID,testCase);
			if (isConnected) {
				try {
					String headerData = " ";
					String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config";
					json.put("motionDetection",switchStatus);
					json.remove("deviceId");
					headerData=json.toString();
					try {
						result = doPostRequest(url, headerData).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}

		}catch(Exception e){

		}
		return result;
	}	
	public int postCameraMode(long locationID, String deviceID,String switchMode, TestCases testCase) {
		int result = -1;
		JSONObject json= getCameraConfig(locationID, deviceID,testCase);
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return -1;
				}
				if (chUtil.isConnected()) {
					try {
						String headerData = " ";
						String url = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/config/";
						json.put("privacyMode",switchMode);
						json.remove("deviceId");
						headerData=json.toString();
						try {
							result = doPostRequest(url, headerData).getResponseCode();
						} catch (IOException e) {
							e.printStackTrace();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public JSONArray getDevicesOnLocation(long locationID,TestCases testCase) {
		JSONArray jsonArray = null;
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				locationID = chUtil.getLocationID(inputs.getInputValue("LOCATION1_NAME"));
				if (locationID == -1) {
					return jsonArray;
				}
				if (chUtil.isConnected()) {
					String chapiURL = getCHILURL(testCase, inputs);
					String url = chapiURL + "api/locations/" + locationID+"/devices/";
					HttpURLConnection connection = chUtil.doGetRequest(url);
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
							jsonArray = new JSONArray(html.toString().trim());
						} else {
							Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
									"Get Devices : Location not found by name - "
											+ inputs.getInputValue("LOCATION1_NAME"));
						}
					} catch (IOException e) {
						Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FRAMEWORK_CONFIGURATION,
								"Get Devices Information  : Error occurred - " + e.getMessage());
						jsonArray = null;
					}
				}
			} else {
				Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
						"Get Camera Configuration Information  : Unable to connect to CHAPI.");
			}
		} catch (Exception e) {

			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE,
					"Get Camera Configuration Information  : Unable to get location. Error occurred - " + e.getMessage());
			jsonArray = null;
		}
		return jsonArray;
	}
	public int deleteCamera(long locationID, String deviceID,TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String urlString = chapiURL + "api/locations/" + locationID+"/devices/"+deviceID+"/hub";
					try {
						result = doDeleteRequest(urlString).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;
	}
	public int deleteLocation(long locationID, long userID,TestCases testCase) {
		int result = -1;
		try {
			if (isConnected) {
				try {
					String urlString = chapiURL + "api/locations/" + locationID+"/users/"+userID;
					try {
						result = doDeleteRequest(urlString).getResponseCode();
					} catch (IOException e) {
						e.printStackTrace();
					}

				} catch (Exception e) {

				}
			}
		} catch (Exception e) {

		}
		return result;

	}
	public int createLocation(long userID,TestCases testCase) {
		int result = -1;
		JSONObject json= new JSONObject();
		try (ChapiUtil chUtil = new ChapiUtil(inputs)) {
			if (chUtil.getConnection(inputs.getInputValue("USERID"),inputs.getInputValue("PASSWORD"))) {
				if (chUtil.isConnected()) {
					try {
						String headerData = " ";
						String url = chapiURL + "api/locations/";
						json.put("name","TestAutomationLocation");
						inputs.setInputValue("LOCATION1_NAME", "TestAutomationLocation");
						json.put("streetAddress","TestAutomationStreet");
						json.put("city","Melville");
						json.put("state","NY");
						json.put("country","USA");
						json.put("zipcode","11747");
						json.put("timezone","Eastern");
						headerData=json.toString();
						try {
							result = doPostRequest(url, headerData).getResponseCode();
							if(result==409){
								result=200;
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public int setUserHomeOrAway(long locationID, long geofenceID, long userID, boolean setUserHome) {
		int result = -1;
		try {
			if (isConnected) {
				String url = " ";
				String headerData = " ";

				url = chapiURL + "api/locations/" + locationID + "/GeoFence/" + geofenceID + "/GangMember/" + userID
						+ "/GeoFenceEvent";
				if (setUserHome) {
					headerData = "{\"type\":\"UserArrived\"}";
				} else {
					headerData = "{\"type\":\"UserDeparted\"}";
				}
				try {
					result = doPostRequest(url, headerData).getResponseCode();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		} catch (Exception e) {

		}
		return result;
	}
	
	public int setGeolocation(Long locationid, Double latitude, Double longitude, int Radius) {
		int response = -1;
		if (isConnected) {
			String url = chapiURL + "api/locations/" + locationid;
			String headerData = String.format("{\"GeoFenceEnabled\":\"true\",\"radius\":" + Radius + ","
					+ "\"OriginCoordinates\":{ \"Latitude\":" + latitude + "," + "\"longitude\":" + longitude + "}}");
			try {
				response = doPutRequest(url, headerData).getResponseCode();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return response;
	}

}
