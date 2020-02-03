package com.resideo.lumina.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.honeywell.commons.coreframework.Email;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;

@SuppressWarnings("deprecation")
public class GuerrillaMailUtils {

	// For requests
	private static HttpClient httpclient = new DefaultHttpClient();
	private static HttpResponse httpResponse;
	private static HttpPost httpPost;
	private static String stringResponse;
	private static JSONObject jSonObject;

	// API Address
	private final static String apiAddr = "http://api.guerrillamail.com/ajax.php?f=%s";

	// GuerrillaMail final
	public static final String EN = "en";
	public static final String FR = "fr";
	public static final String NL = "nl";
	public static final String RU = "ru";
	public static final String TR = "tr";
	public static final String UK = "uk";
	public static final String AR = "ar";
	public static final String KO = "ko";
	public static final String JP = "jp";
	public static final String ZH = "zh";
	public static final String ZH_HANT = "zh-hant";
	public static final String DE = "de";
	public static final String ES = "es";
	public static final String IT = "it";
	public static final String PT = "pt";

	// GuerrillaMail attributes
	private ArrayList<Email> emails = new ArrayList<Email>();
	private static String lang = "en";
	private String emailAddress;
	private static String sidToken;
	@SuppressWarnings("unused")
	private long timestamp;
	@SuppressWarnings("unused")
	private String alias;
	private int seqOldestEMail = 0;

	/**
	 * Constructor.
	 */
	public GuerrillaMailUtils() throws Exception {
	}

	/**
	 * Constructor.
	 * 
	 * @param lang
	 *            the language code. GuerrillaMail contains final Strings for
	 *            this.
	 */
	public GuerrillaMailUtils(String lang) throws Exception {
		GuerrillaMailUtils.lang = lang;
	}

	public static String FetchMailLink(final TestCases testCase, final String subject, final String emailAddress,
			int positionOfMail, String environment) {
		String extractedLink = "";
		String mailID = null;
		String notificationMailFrom = "";
		if (environment.equalsIgnoreCase("Dogfooding")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("Production")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("Jasper QA")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("CHILStage(Azure)")) {
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		} else if (environment.equalsIgnoreCase("CHIL DAS(Test)")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if(environment.equalsIgnoreCase("Chil Das(QA)")||environment.equalsIgnoreCase("ChilDas(QA)")){
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		}else{
			System.out.println("Environment not handled");
		}
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(entity);

			httpResponse = httpclient.execute(httpPost);
			System.out.println(httpResponse.getEntity());
			stringResponse = EntityUtils.toString(httpResponse.getEntity());
			jSonObject = new JSONObject(stringResponse);
			sidToken = jSonObject.get("sid_token").toString();
			formparams.add(new BasicNameValuePair("sid_token", sidToken));

			if ("".equals(jSonObject.getString("alias_error"))) {
				for (int i = 0; i < 18; i++) {
					Keyword.ReportStep_Pass(testCase, "Waiting for email - 10 sec");
					// Sleep is included to give a delay to find mail in inbox
					Thread.sleep(10000);
					httpPost = new HttpPost(String.format(apiAddr, "check_email"));
					entity = new UrlEncodedFormEntity(formparams, "UTF-8");
					httpPost.setEntity(entity);
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());

					jSonObject = new JSONObject(stringResponse);
					JSONArray jarray = jSonObject.getJSONArray("list");

					if (jarray.length() != 0 && jarray.length() >= positionOfMail) {
						jSonObject = new JSONObject(jarray.get(positionOfMail).toString());
						if ((notificationMailFrom.equals(jSonObject.getString("mail_from")))
								&& (subject.equals(jSonObject.getString("mail_subject")))) {
							mailID = jSonObject.getString("mail_id");
							break;
						} else {
							mailID = null;
						}
					} else {
						System.out.println("waited 1");
						mailID = null;
					}

				}
			} else {
				mailID = null;
			}
		} catch (Exception e) {
			// Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE,"Exception:
			// "+e.getMessage());
			mailID = null;
		}
		if (mailID != null) {
			Keyword.ReportStep_Pass(testCase, "Thread Execution: Inbox has received mail with Subject : " + subject);
			try {
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				String mail_ID = mailID;
				httpPost.setEntity(entity);
				httpPost = new HttpPost(String.format(apiAddr, "fetch_email"));
				formparams = new ArrayList<NameValuePair>();
				formparams.add(new BasicNameValuePair("sid_token", sidToken));
				formparams.add(new BasicNameValuePair("email_id", String.valueOf(mail_ID)));
				entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				httpPost.setEntity(entity);
				try {
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());
					jSonObject = new JSONObject(stringResponse);
					extractedLink = jSonObject.getString("mail_body");

				} catch (IOException e) {
					e.printStackTrace();
				}

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Thread Execution: Unable to find the mail related to " + subject + " for the user : "
							+ emailAddress + " even after waiting for 3 minutes");
			return null;
		}
		int useractivationLinkstart, useractivationLinkEnd = 0;
		if (environment.equalsIgnoreCase("Dogfooding")) {
			useractivationLinkstart = extractedLink.indexOf("https://resetpasswordqasandbox");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Production")) {
			useractivationLinkstart = extractedLink.indexOf("https://chilpasswordreset.alarmnet.com");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Jasper QA")) {
			useractivationLinkstart = extractedLink.indexOf("http://jasperpasswordresetqa");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("CHIL Stage (Azure)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetqastage");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("CHIL DAS(Test)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetdastest");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else {
			extractedLink = null;
		}
		extractedLink = extractedLink.substring(0, useractivationLinkEnd);
		return extractedLink;
	};

	public static String FetchMailContent(final TestCases testCase, final String subject, final String emailAddress,
			int positionOfMail, String environment) {
		String extractedLink = "";
		String mailID = null;
		String notificationMailFrom = "";
		if (environment.equalsIgnoreCase("Dogfooding")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("Production")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("Jasper QA")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("CHILStage(Azure)")) {
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		} else if (environment.equalsIgnoreCase("CHIL DAS(Test)")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if(environment.equalsIgnoreCase("Chil Das(QA)")||environment.equalsIgnoreCase("ChilDas(QA)")){
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		} else if(environment.equalsIgnoreCase("CHILInt(Azure)")){
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		}
		
		
		else{
			System.out.println("Environment not handled");
		}
		System.out.println(notificationMailFrom);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(entity);

			httpResponse = httpclient.execute(httpPost);
			stringResponse = EntityUtils.toString(httpResponse.getEntity());
			jSonObject = new JSONObject(stringResponse);
			sidToken = jSonObject.get("sid_token").toString();
			formparams.add(new BasicNameValuePair("sid_token", sidToken));

			if ("".equals(jSonObject.getString("alias_error"))) {
				for (int i = 0; i < 4; i++) {
					Keyword.ReportStep_Pass(testCase, "Waiting for email - 10 sec");
					// Sleep is included to give a delay to find mail in inbox
					Thread.sleep(10000);
					httpPost = new HttpPost(String.format(apiAddr, "check_email"));
					entity = new UrlEncodedFormEntity(formparams, "UTF-8");
					httpPost.setEntity(entity);
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());

					jSonObject = new JSONObject(stringResponse);
					JSONArray jarray = jSonObject.getJSONArray("list");

					if (jarray.length() != 0 && jarray.length() >= positionOfMail) {
						jSonObject = new JSONObject(jarray.get(positionOfMail).toString());
						if ((notificationMailFrom.equals(jSonObject.getString("mail_from")))
								&& (subject.equals(jSonObject.getString("mail_subject")))) {
							mailID = jSonObject.getString("mail_id");
							break;
						} else {
							mailID = null;
						}
					} else {
						System.out.println("waited 1");
						mailID = null;
					}

				}
			} else {
				mailID = null;
			}
		} catch (Exception e) {
			// Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE,"Exception:
			// "+e.getMessage());
			mailID = null;
		}
		if (mailID != null) {
			Keyword.ReportStep_Pass(testCase, "Thread Execution: Inbox has received mail with Subject : " + subject);
			try {
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				String mail_ID = mailID;
				httpPost.setEntity(entity);
				httpPost = new HttpPost(String.format(apiAddr, "fetch_email"));
				formparams = new ArrayList<NameValuePair>();
				formparams.add(new BasicNameValuePair("sid_token", sidToken));
				formparams.add(new BasicNameValuePair("email_id", String.valueOf(mail_ID)));
				entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				httpPost.setEntity(entity);
				try {
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());
					jSonObject = new JSONObject(stringResponse);
					extractedLink = jSonObject.getString("mail_body");

				} catch (IOException e) {
					e.printStackTrace();
				}

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Thread Execution: Unable to find the mail related to " + subject + " for the user : "
							+ emailAddress + " even after waiting for 3 minutes");
			return null;
		}
		return extractedLink;
	};

	public static boolean emailExists(TestCaseInputs inputs, TestCases testCase, final String subject,
			final String emailAddress) {

		boolean flag = true;
		String notificationMailFrom = "";
		String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
		if (environment.equalsIgnoreCase("Dogfooding")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("Production")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("Jasper QA")) {
			notificationMailFrom = "";
		} else if (environment.equalsIgnoreCase("CHIL Stage (Azure)")) {
			notificationMailFrom = "lyricstage@honeywell.com";
		} else if (environment.equalsIgnoreCase("Chil Das(Test)")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("Chil Das(QA)")||environment.equalsIgnoreCase("ChilDas(QA)")) {
			notificationMailFrom = "honeywellhomessupport@honeywell.com";
		}
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(entity);

			httpResponse = httpclient.execute(httpPost);
			stringResponse = EntityUtils.toString(httpResponse.getEntity());
			jSonObject = new JSONObject(stringResponse);
			sidToken = jSonObject.get("sid_token").toString();
			formparams.add(new BasicNameValuePair("sid_token", sidToken));

			if ("".equals(jSonObject.getString("alias_error"))) {
				for (int i = 0; i < 5; i++) {
					// Sleep is included to give a delay to find mail in inbox
					Thread.sleep(10000);
					httpPost = new HttpPost(String.format(apiAddr, "check_email"));
					entity = new UrlEncodedFormEntity(formparams, "UTF-8");
					httpPost.setEntity(entity);
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());

					jSonObject = new JSONObject(stringResponse);
					JSONArray jarray = jSonObject.getJSONArray("list");

					if (jarray.length() != 0) {
						jSonObject = new JSONObject(jarray.get(0).toString());
						if ((notificationMailFrom.equals(jSonObject.getString("mail_from")))
								&& (subject.equals(jSonObject.getString("mail_subject")))) {
							flag = true;
							break;
						} else {
							flag = false;
						}
					} else {
						System.out.println("waited 1");
						flag = false;
					}

				}
			} else {
				flag = false;
			}
		} catch (Exception e) {
			// Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE,"Exception:
			// "+e.getMessage());
			flag = false;
		}
		if(!flag){
		 Keyword.ReportStep_Fail(testCase,FailType.FUNCTIONAL_FAILURE,"confirm mail from user and environment");
		}
		return flag;
	};

	/**
	 * Check if an email with the subject exist
	 * 
	 * @param subject
	 *            the subject of mail
	 * @param emailAddress
	 *            the user email address
	 * @return true or false
	 */
	public static boolean isEmailFound(TestCaseInputs inputs, TestCases testCase, String subject) {
		boolean flag = true;
		String notificationMailFrom = "";
		String emailAddress = inputs.getInputValue(TestCaseInputs.USER_ID);
		String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
		if (environment.equalsIgnoreCase("Production")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("CHIL Stage (Azure)")) {
			notificationMailFrom = "lyricstage@honeywell.com";
		} else if (environment.equalsIgnoreCase("Chil Das(Test)")) {
			notificationMailFrom = "lyric@honeywell.com";
		} else if (environment.equalsIgnoreCase("Chil Das(QA)")) {
			notificationMailFrom = "lyric@honeywell.com";
		}
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(entity);

			httpResponse = httpclient.execute(httpPost);
			stringResponse = EntityUtils.toString(httpResponse.getEntity());
			jSonObject = new JSONObject(stringResponse);
			sidToken = jSonObject.get("sid_token").toString();
			formparams.add(new BasicNameValuePair("sid_token", sidToken));

			if ("".equals(jSonObject.getString("alias_error"))) {
				httpPost = new HttpPost(String.format(apiAddr, "check_email"));
				entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				httpPost.setEntity(entity);
				httpResponse = httpclient.execute(httpPost);
				stringResponse = EntityUtils.toString(httpResponse.getEntity());

				jSonObject = new JSONObject(stringResponse);
				JSONArray jarray = jSonObject.getJSONArray("list");

				if (jarray.length() != 0) {
					jSonObject = new JSONObject(jarray.get(0).toString());
					if ((notificationMailFrom.equals(jSonObject.getString("mail_from")))
							&& (subject.equals(jSonObject.getString("mail_subject")))) {
						flag = true;
					} else {
						flag = false;
					}
				} else {
					System.out.println("Email not found. Returning false");
					flag = false;
				}
			} else {
				flag = false;
			}
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	};

	/**
	 * Fetch the content of an email and extract the link
	 * 
	 * @param emailAddress
	 *            the user email address
	 * @return String format url link
	 */

	public static String getLink(TestCaseInputs inputs, TestCases testCase, String subject, String emailAddress,
			String environment) {
		String extractedLink = "";
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		if (emailExists(inputs, testCase, subject, emailAddress)) {
			Keyword.ReportStep_Pass(testCase, "Thread Execution: Inbox has received mail with Subject : " + subject);
			try {
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				String mailID = jSonObject.getString("mail_id");
				httpPost.setEntity(entity);
				httpPost = new HttpPost(String.format(apiAddr, "fetch_email"));
				formparams = new ArrayList<NameValuePair>();
				formparams.add(new BasicNameValuePair("sid_token", sidToken));
				formparams.add(new BasicNameValuePair("email_id", String.valueOf(mailID)));
				entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				httpPost.setEntity(entity);
				try {
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());
					jSonObject = new JSONObject(stringResponse);
					extractedLink = jSonObject.getString("mail_body");
				} catch (IOException e) {
					e.printStackTrace();
				}

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE,
					"Thread Execution: Unable to find the mail related to " + subject + " for the user : "
							+ emailAddress + " even after waiting");
			return null;
		}
		int useractivationLinkstart, useractivationLinkEnd = 0;
		if (environment.equalsIgnoreCase("Dogfooding")) {
			useractivationLinkstart = extractedLink.indexOf("https://resetpassword");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");

		} else if (environment.equalsIgnoreCase("Production")) {
			useractivationLinkstart = extractedLink.indexOf("https://chilpasswordreset.alarmnet.com");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Jasper QA")) {
			useractivationLinkstart = extractedLink.indexOf("http://jasperpasswordresetqa");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("CHIL Stage (Azure)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetqastage");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Chil Das(QA)")||environment.equalsIgnoreCase("ChilDas(QA)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetdasqa");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Chil Das(Test)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetdastest");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		}

		else {
			extractedLink = null;
		}
		extractedLink = extractedLink.substring(0, useractivationLinkEnd);
		return extractedLink;

	}

	public static String getLink(TestCaseInputs inputs, TestCases testCase, String subject) throws Exception {
		String extractedLink = "";
		String emailAddress = inputs.getInputValue(TestCaseInputs.USER_ID);
		String environment = inputs.getInputValue(TestCaseInputs.APP_ENVIRONMENT);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		formparams.add(new BasicNameValuePair("email_user", emailAddress));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("seq", "0"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("lang", lang));
		if (isEmailFound(inputs, testCase, subject)) {
			try {
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				String mailID = jSonObject.getString("mail_id");
				httpPost.setEntity(entity);
				httpPost = new HttpPost(String.format(apiAddr, "fetch_email"));
				formparams = new ArrayList<NameValuePair>();
				formparams.add(new BasicNameValuePair("sid_token", sidToken));
				formparams.add(new BasicNameValuePair("email_id", String.valueOf(mailID)));
				entity = new UrlEncodedFormEntity(formparams, "UTF-8");
				httpPost.setEntity(entity);
				try {
					httpResponse = httpclient.execute(httpPost);
					stringResponse = EntityUtils.toString(httpResponse.getEntity());
					jSonObject = new JSONObject(stringResponse);
					extractedLink = jSonObject.getString("mail_body");
				} catch (IOException e) {
					throw new Exception(e.getMessage());
				}
			} catch (UnsupportedEncodingException e) {
				throw new Exception(e.getMessage());
			}
		} else {
			
			return extractedLink;
		}
		int useractivationLinkstart, useractivationLinkEnd = 0;
		if (environment.equalsIgnoreCase("Production")) {
			useractivationLinkstart = extractedLink.indexOf("https://chilpasswordreset.alarmnet.com");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("CHIL Stage (Azure)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetqastage");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Chil Das(QA)")||environment.equalsIgnoreCase("ChilDas(QA)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetdasqa");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		} else if (environment.equalsIgnoreCase("Chil Das(Test)")) {
			useractivationLinkstart = extractedLink.indexOf("https://passwordresetdastest");
			extractedLink = extractedLink.substring(useractivationLinkstart);
			useractivationLinkEnd = extractedLink.indexOf("\"");
		}

		else {
			extractedLink = "";
		}
		extractedLink = extractedLink.substring(0, useractivationLinkEnd);
		return extractedLink;
	}

	/**
	 * The function is used to initialize a session and set the client with an
	 * email address. If the account is expired you will get another address.
	 * 
	 * @throws Exception
	 */
	private void _getEmailAddress() throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "get_email_address"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("lang", lang));

		if (sidToken != null) {
			formparams.add(new BasicNameValuePair("sid_token", sidToken));
		}

		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		jSonObject = new JSONObject(stringResponse);

		if (jSonObject.has("email_addr")) {
			saveData(jSonObject);
		} else {
			throw new Exception("Email not found: " + stringResponse);
		}
	}

	/**
	 * Set the email address to a different email address.
	 */
	private void _setEmailUser(String emailUser) throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "set_email_user"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("email_user", emailUser));
		formparams.add(new BasicNameValuePair("lang", lang));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		jSonObject = new JSONObject(stringResponse);

		if (jSonObject.has("email_addr")) {
			saveData(jSonObject);
		} else {
			throw new Exception("Email not found: " + stringResponse);
		}
	}

	/**
	 * Check for new email on the server.
	 * 
	 * @return list of new messages
	 */
	@SuppressWarnings("unlikely-arg-type")
	private ArrayList<Email> _checkEmail() throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "check_email"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("seq", String.valueOf(seqOldestEMail)));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		jSonObject = new JSONObject(stringResponse);

		if (jSonObject.has("list")) {
			JSONArray jSonArray = jSonObject.getJSONArray("list");

			for (int i = 0; i < jSonArray.length(); i++) {
				if (!emails.contains(jSonArray.getJSONObject(i))) {
					emails.add(new Email(jSonArray.getJSONObject(i)));
				}
			}

			seqOldestEMail = emails.get(emails.size() - 1).getId();
		} else {
			throw new Exception("_checkEmail doesn't find list of emails: " + stringResponse);
		}

		return emails;
	}

	/**
	 * Get email list.
	 * 
	 * @return list of new messages
	 */
	@SuppressWarnings("unlikely-arg-type")
	private ArrayList<Email> _getEmailList() throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "get_email_list"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("lang", "en"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("offset", String.valueOf(seqOldestEMail)));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		jSonObject = new JSONObject(stringResponse);

		if (jSonObject.has("list")) {
			JSONArray jSonArray = jSonObject.getJSONArray("list");

			for (int i = 0; i < jSonArray.length(); i++) {
				if (!emails.contains(jSonArray.getJSONObject(i))) {
					emails.add(new Email(jSonArray.getJSONObject(i)));
				}
			}

			// seqOldestEMail = emails.get(emails.size()-1).getMailId();
		} else {
			throw new Exception("_getEmailList doesn't find list of emails: " + stringResponse);
		}

		return emails;

	}

	/**
	 * Get the contents of an email.
	 * 
	 * @param emailId
	 *            the id of the email you want to fetch.
	 * @return the email.
	 */
	private Email _fetchEmail(int emailId) throws Exception {
		Email email = null;
		if (emailExists(emailId)) {
			email = emails.get(emailPosition(emailId));

			httpPost = new HttpPost(String.format(apiAddr, "fetch_email"));
			List<NameValuePair> formparams = new ArrayList<NameValuePair>();
			formparams.add(new BasicNameValuePair("sid_token", sidToken));
			formparams.add(new BasicNameValuePair("email_id", String.valueOf(emailId)));
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(entity);
			httpResponse = httpclient.execute(httpPost);
			stringResponse = EntityUtils.toString(httpResponse.getEntity());

			jSonObject = new JSONObject(stringResponse);

			if (jSonObject.has("mail_id")) {
				email.setBody(jSonObject.getString("mail_body"));
			} else {
				throw new Exception("_fetchEmail doesn't find email content: " + stringResponse);
			}
		}

		return email;
	}

	/**
	 * Forget the current email address.
	 * 
	 * @return true if successful, false otherwise.
	 * @throws Exception
	 */
	private void _forgetMe() throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "forget_me"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("lang", "en"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));
		formparams.add(new BasicNameValuePair("email_addr", emailAddress));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		if (!Boolean.valueOf(stringResponse)) {
			throw new Exception("forgetMe isn't successfull.");
		} else {
			emailAddress = null;
			emails = new ArrayList<Email>();
			seqOldestEMail = -1;
			sidToken = null;
			timestamp = -1;
		}
	}

	/**
	 * Delete all the email with the parameter id.
	 * 
	 * @param emailIds
	 *            the ArrayList with all the emailId that you want to delete.
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	private void _delEmail(ArrayList<Integer> emailIds) throws ClientProtocolException, IOException {
		Iterator<Integer> iterator = emailIds.iterator();
		httpPost = new HttpPost(String.format(apiAddr, "del_email"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("lang", "en"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));

		// Adding all the email ids in the form
		while (iterator.hasNext()) {
			formparams.add(new BasicNameValuePair("email_ids[]", Integer.toString(iterator.next())));
		}

		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		// System.out.println("RESPONSE: "+stringResponse);
	}

	/**
	 * Extend the email address time by 1 hour. A maximum of 2 hours can be
	 * extended.
	 * 
	 * @throws Exception
	 */
	private void _extend() throws Exception {
		httpPost = new HttpPost(String.format(apiAddr, "extend"));
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("lang", "en"));
		formparams.add(new BasicNameValuePair("sid_token", sidToken));

		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httpPost.setEntity(entity);
		httpResponse = httpclient.execute(httpPost);
		stringResponse = EntityUtils.toString(httpResponse.getEntity());

		jSonObject = new JSONObject(stringResponse);

		if (jSonObject.has("expired")) {

			if (jSonObject.getBoolean("expired")) {
				throw new Exception("The email has expired.");
			}

			timestamp = jSonObject.getLong("email_timestamp");
			sidToken = jSonObject.getString("sid_token");
			int affected = jSonObject.getInt("affected");

			if (affected == 0) {
				throw new Exception("The extension is not successful.");
			}

		} else {
			throw new Exception("_extend doesn't find response content: " + stringResponse);
		}
	}

	/**
	 * Save data of the email address from the request.
	 * 
	 * @param jSonObject
	 *            jsonObject
	 * @throws JSONException
	 */
	private void saveData(JSONObject jSonObject) throws JSONException {
		emailAddress = jSonObject.getString("email_addr");
		sidToken = jSonObject.getString("sid_token");
		timestamp = jSonObject.getLong("email_timestamp");
		alias = jSonObject.getString("alias");
	}

	/**
	 * Check if an email is in the emails store.
	 * 
	 * @param emailId
	 *            the id of the email
	 * @return true or false
	 */
	private boolean emailExists(int emailId) {
		for (int i = 0; i < emails.size(); i++) {
			Email emailTemp = emails.get(i);
			if (emailTemp.getId() == emailId) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Return the position where the email is in the emails store.
	 * 
	 * @param emailId
	 *            the id of the email
	 * @return the position in the ArrayList<EMail>
	 * @throws Exception
	 */
	private int emailPosition(int emailId) throws Exception {
		for (int i = 0; i < emails.size(); i++) {
			Email emailTemp = emails.get(i);
			if (emailTemp.getId() == emailId) {
				return i;
			}
		}
		throw new Exception("The email store doesn't contain the email.");
	}

	/**
	 * Check for new email on the server.
	 * 
	 * @return list of new messages
	 */
	public ArrayList<Email> checkEmail() throws Exception {
		return _checkEmail();
	}

	/**
	 * Get the contents of an email.
	 * 
	 * @param emailId
	 *            the id of the email you want to fetch.
	 * @return the email.
	 * @throws Exception
	 */
	public Email fetchEmail(int emailId) throws Exception {
		return _fetchEmail(emailId);
	}

	/**
	 * Forget the current email address.
	 * 
	 * @throws Exception
	 */
	public void forgetMe() throws Exception {
		if (emailAddress != null) {
			_forgetMe();
		}
	}

	/**
	 * Delete all the email with the parameter id.
	 * 
	 * @param emailIds
	 *            the ArrayList with all the emailId that you want to delete.
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public void delEmail(ArrayList<Integer> emailIds) throws ClientProtocolException, IOException {
		_delEmail(emailIds);
	}

	/**
	 * Extend the email address time by 1 hour. A maximum of 2 hours can be
	 * extended.
	 * 
	 * @throws Exception
	 */
	public void extend() throws Exception {
		if (emailAddress != null) {
			_extend();
		} else {
			throw new Exception("Email address is null.");
		}
	}

	/* GET METHODS */
	/**
	 * Get email address. If the account is expired you will get another
	 * address.
	 * 
	 * @return the email address.
	 * @throws Exception
	 */
	public String getEmailAddress() throws Exception {
		if (emailAddress == null) {
			_getEmailAddress();
		}
		return this.emailAddress;
	}

	/**
	 * Get the email list.
	 * 
	 * @return list of new messages
	 */
	public ArrayList<Email> getEmailList() throws Exception {
		return this._getEmailList();
	}
	/* SET METHODS */

	/**
	 * Set the email user part of the address.
	 * 
	 * @param emailUser
	 *            the email user part of the address.
	 */
	public void setEmailUser(String emailUser) throws Exception {
		_setEmailUser(emailUser);
	}
}
