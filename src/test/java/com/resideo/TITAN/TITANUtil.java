package com.resideo.TITAN;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;

import com.honeywell.commons.coreframework.SuiteConstants;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.coreframework.SuiteConstants.SuiteConstantTypes;


public class TITANUtil implements AutoCloseable {
	
	private String titanURL;
	private static TestCases testCase;
	private static TestCaseInputs inputs;
	private boolean isConnected;
	private HashMap<String, Long> locations;
	private HttpURLConnection chilConnection;
	private static final String clientId = "77d7ca5b-6f97-4e77-9d26-b014874202b5";//clientId
	private static final String callBackUrl = "https://localhost:4200/home";//The url defined in WSO2
	private static final String authorizeUrl = "https://lyricprod.b2clogin.com/lyricprod.onmicrosoft.com/oauth2/v2.0/authorize?p=B2C_1A_SignIn_Mob_hh";
	private static final String Scope = "https://lyricprod.onmicrosoft.com/honeywellhomesapib2c/user_impersonation";


	
	public TITANUtil(TestCaseInputs inputs) throws Exception {
		String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
		environment = environment.replaceAll("\\s", "");
		if (environment.equalsIgnoreCase("Production")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_PRODUCTION");
		} else if (environment.equalsIgnoreCase("CHILInt(Azure)")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_INT");
		} else if (environment.equalsIgnoreCase("ChilDev(Dev2)")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DEV2");
		} else if (environment.equalsIgnoreCase("CHILStage(Azure)")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_URL_STAGING");
		} else if (environment.equalsIgnoreCase("LoadTesting")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_LOAD_TESTING");
		} else if (environment.equalsIgnoreCase("ChilDas(QA)")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_QA");
		} else if (environment.equalsIgnoreCase("ChilDas(Test)")) {
			titanURL = SuiteConstants.getConstantValue(SuiteConstantTypes.PROJECT_SPECIFIC, "CHIL_DAS_TEST");
		}
		this.inputs = inputs;
		this.isConnected = false;
		locations = new HashMap<String, Long>();
		new HashMap<String, String>();
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

	@Override
	public void close() throws Exception {
		disconnect();

	}
	
	public static String getAuthGrantType(){
	    String url =  authorizeUrl + "&client_id=" + clientId + "&nonce=defaultNonce&redirect_uri=" + callBackUrl +
	    		"&scope=" + Scope + ">  openid offline_access&response_type=Code&prompt=login" ;
	    System.out.println(url);
	    return url;
	}
	
	public static void useBearerToken(String token) throws InterruptedException {
	    BufferedReader reader = null;
	    try {
	    	System.out.println(token);
	        URL url = new URL("https://consumer.prod.titans.cloud/api/me");
	        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
	        connection.setRequestProperty("Content-Type", "application/json");
	        connection.setRequestProperty("Authorization", "Bearer " + token);
	        connection.setDoOutput(true);
	        connection.setRequestMethod("GET");
	        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        String line = null;
	        StringWriter out = new StringWriter(connection.getContentLength() > 0 ? connection.getContentLength() : 2048);
	        while ((line = reader.readLine()) != null) {
	            out.append(line);
	        }
	        String response = out.toString();
	        System.out.println(response);
	    } catch (Exception e) {

	    }
	}
}