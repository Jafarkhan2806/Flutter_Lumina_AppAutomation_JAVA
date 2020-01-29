package com.honeywell.screens;

import io.appium.java_client.MobileElement ;
import io.appium.java_client.TouchAction ;

import org.openqa.selenium.By ;
import org.openqa.selenium.WebElement ;

import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.CustomDriver ;
import com.honeywell.commons.mobile.MobileScreens ;
import com.honeywell.commons.mobile.MobileUtils ;
//----- Java client - dependencies -------
import static io.appium.java_client.touch.LongPressOptions.longPressOptions;
import static io.appium.java_client.touch.offset.ElementOption.element;
//----------------------------------------

import java.time.Duration;

public class LoginScreen extends MobileScreens{

		private static final String screenName = "LoginScreen";
		
		public LoginScreen(TestCases testCase) {
			super(testCase,screenName);
			//osPopUps = new OSPopUps(testCase);
		}
		
		public LoginScreen(TestCases testCase,String LANGUAGE) {
			super(testCase,screenName+"_"+LANGUAGE);
			//osPopUps = new OSPopUps(testCase);
		}
		
		public boolean clickOnLoginButton(){
			return MobileUtils.clickOnElement(objectDefinition, testCase, "LoginButton");
		}
		
		public boolean setEmailAddressValue(String value)
		{
			if(!MobileUtils.isRunningOnAndroid(testCase)){
				if(testCase.getMobileDriver().getPageSource().contains("XCUIElementTypeTextField")){
					return MobileUtils.setValueToElement(testCase, "XPATH", "//XCUIElementTypeTextField[1]", value, "Email set");
				}
			}else{
				if(testCase.getMobileDriver().getPageSource().contains("fragment_login_user_name")){
					
					if(MobileUtils.isMobElementExists("XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_user_name']", testCase)){
						testCase.getMobileDriver().findElementByXPath("//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_user_name']").sendKeys(value);	
				//return MobileUtils.setValueToElement(testCase, "XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_user_name']", value, "set email");
						return true;
					}
					}
			}
			return false;
			
		}
		
		public boolean setPasswordValue(String value)
		{
			if(!MobileUtils.isRunningOnAndroid(testCase)){
				if(testCase.getMobileDriver().getPageSource().contains("XCUIElementTypeSecureTextField")){
					return MobileUtils.setValueToElement(testCase, "XPATH", "//XCUIElementTypeSecureTextField[1]", value, "Password set");
				}
			}
			else{
				if(testCase.getMobileDriver().getPageSource().contains("fragment_login_password")){
					if(MobileUtils.isMobElementExists("XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_password']", testCase)){
						testCase.getMobileDriver().findElementByXPath("//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_password']").sendKeys(value);
						//return MobileUtils.setValueToElement(testCase, "XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/fragment_login_password']", value, "set email");
				return true;
					}
					}
			}
			return MobileUtils.setValueToElement(objectDefinition, testCase, "Password", value);
		}
		
		public boolean isLoginButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginButton",15);
		}
		
		public boolean isLoginButtonVisible(int time)
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginButton",time);
		}
		
		public boolean isEmailAddressTextFieldVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailAddress",3);
		}
		
		public boolean longPressOnSecretMenuImage()
		{
			boolean flag = true;
			WebElement element = null;
			CustomDriver driver = testCase.getMobileDriver();
			TouchAction action = new TouchAction(driver);
			
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				element = MobileUtils.getMobElement(objectDefinition, testCase, "HoneywellRosette");
				
				try {
					action.longPress(longPressOptions().withElement(element(element)).withDuration(Duration.ofMillis(8000))).release().perform();
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				//flag = flag && MobileUtils.longPress(testCase, element, 8000);
				
				
			} else {
				
				element = MobileUtils.getMobElement(objectDefinition, testCase, "SecretMenuImage");
				
				//action.press(element).waitAction(MobileUtils.getDuration(8000)).release().perform();
				try {
					action.longPress(longPressOptions().withElement(element(element)).withDuration(Duration.ofMillis(8000))).release().perform();
					
				} catch (Exception e) {
					// TODO: handle exception
				}
					
				
			}
			return flag;
		}

		public boolean isLyricLogoVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LyricLogo",3);
		}
		public boolean isLyricLogoVisible(int time)
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LyricLogo",time);
		}
		
		public boolean clickOnLyricLogo()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "LyricLogo");
		}
		
		public String getEmailAddressTextFieldValue()
		{
			if (MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.getMobElement(objectDefinition, testCase, "EmailAddress").getText(); 
			}
			else
			{
				return MobileUtils.getMobElement(objectDefinition, testCase, "EmailAddress").getAttribute("value");
			}
		}
		
		
		public String getForgotPasswordEmailAddressTextFieldValue()
		{
			MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "ForgotPwdEmailField",false,false);
			String getText="";
			if(sa!=null)
			{
				getText=sa.getText();
			}
			return getText;
		}
		
		public boolean isForgotPasswordEmailAddressVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ForgotPwdEmailField",3);
		}
		
		public boolean setForgotPasswordEmailAddressValue(String value)
		{
			return MobileUtils.setValueToElement(objectDefinition, testCase, "ForgotPwdEmailField", value);
		}
		
		public boolean isPasswordFieldVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "Password",3);
		}
		
		public boolean clickOnEmailAddressTextField()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "EmailAddress");
		}
		
		public boolean clickOnPasswordField()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "Password");
		}
		
		public String getLoginButtonText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "LoginButton").getText();
		}
		
		public boolean isForgotPasswordButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ForgotPassword",3);
		}
		
		public String getForgotPasswordButtonText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "ForgotPassword").getText();
		}
		
		public boolean clickOnForgotPasswordButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "ForgotPassword");
		}
		
		public boolean isResetButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ResetButton",3);
		}
		
		public boolean clickonResetButton()
		{
			return MobileUtils.clickOnElement(objectDefinition , testCase , "ResetButton");
		}
		
		public String getResetButtonText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "ResetButton").getText();
		}
		
		public boolean isCreateAccountVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "CreateAccount",60);
		}
		
		public boolean navigateToCreateAccountScreen()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "CreateAccount");
		}
		public String getCreateAccountButtonText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "CreateAccount").getText();
		}
		
		public boolean isCancelButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "CancelButton",3);
		}
		
		public boolean clickOnCancelButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "CancelButton");
		}
		
		public boolean isbackButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "backButton",3);
		}
		
		public boolean clickOnbackButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "backButton");
		}
		
		
		public boolean isEmailAddressTextFieldVisibleLocal(TestCaseInputs inputs)
		{
			
			
			if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Spanish")||inputs.getInputValue("LANGUAGE").contains("Hungarian")||inputs.getInputValue("LANGUAGE").contains("Slovakian"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeTextField[0]", testCase))
				{
					return MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeTextField[0]", testCase);

				}else if(MobileUtils.isMobElementExists("NAME","Login_Email", testCase)){
				return MobileUtils.isMobElementExists("NAME","Login_Email", testCase);

			}else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Correo electrónico')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Correo electrónico')]", testCase);
			}
			else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'E-mail')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'E-mail')]", testCase);

			}else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Courriel') or contains(@value,'Email')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Courriel') or contains(@value,'Email')]", testCase);

			}
			else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Posta electronica')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@text,'Posta electronica')]", testCase);

			}
			
			}
	   
			return false;

		}
		
		
		
		public boolean isForgotPasswordLocalVisible(TestCaseInputs inputs)
		{
			/* if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French"))
			 {*/
			 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Forgot Password')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Forgot Password')]",testCase);

			}
			 
			else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Mot de Passe')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Mot de Passe')]",testCase);

			}
			 //}
			
			/*else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI"))
			{
				return MobileUtils.isMobElementExists("NAME","Ver",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
				return MobileUtils.isMobElementExists("NAME","Esqueceu",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch_BE"))
			{
				return MobileUtils.isMobElementExists("NAME","Verge",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Spanish"))
			{
				return MobileUtils.isMobElementExists("NAME","Recue",testCase);

			}else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Hungarian"))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Elfelejtette')]",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Czech"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Zapomenu')]",testCase))
				{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Zapomenu')]",testCase);
				}				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Zapomenu')]",testCase))
				{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Zapomenu')]",testCase);
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'omenu')]",testCase))
				{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'omenu')]",testCase);
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'?')]",testCase))
				{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'?')]",testCase);
				}
			}
*/
			
			return false;
		}

		public boolean ClickOnForgotPasswordLocal(TestCaseInputs inputs) {
			

			
			 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Forgot Password')]", testCase))
			{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@value,'Forgot Password')]");

			}
			else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@value,'Oubl')]", testCase))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@value,'Oubl')]");

			}
			else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Oubl')]", testCase))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Oubl')]");

			}
			 //}
			/*else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_AUS"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Ver')]");

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian_SUI"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Diment')]");

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Esqueceu')]");

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch_BE"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Verge')]");

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Spanish"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Recue')]");

			}else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Hungarian"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Elfelejtette')]",true);

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Czech"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Zapomenu')]",testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Zapomenu')]",true);
				}
			}*/
			return false;
		
			// TODO Auto-generated method stub
			
		}
		
		
		
		public boolean clickOnLyricLogoButton()
		{
			return MobileUtils.clickOnElement(testCase, "name", "Login_LyricLogo");
		}
		
		
		public boolean isSelectCountryVisible(int time)
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "SelectCountry",time);
		}
		
		public boolean clickOnSelectCountryButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "SelectCountry");
		}

			
		public MobileElement getEmailIdStatus(TestCaseInputs inputs)
		{	
			return MobileUtils.getMobElement(objectDefinition , testCase , "EmailAddress",false,false);		
		}
		
		public MobileElement getPasswordStatus(TestCaseInputs inputs)
		{	
			return MobileUtils.getMobElement(objectDefinition , testCase , "Password",false,false);		
		}

		
		public boolean isLoginInvalidPwdErrorMsgVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginInvalidPwdErrorMsg");
		}

		public boolean isLoginInvalidEmailAddErrorMsgVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginInvalidEmailAddErrorMsg");
		}

		public boolean isLoginvalidEmailAddwithspaceErrorMsgVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LoginvalidEmailAddwithspaceErrorMsg");
		}
		
		public boolean isOKButtonVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "OKButton",20);
		}

		public boolean clickOnOKButton() 
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "OKButton");
			
		}
		public boolean isLoginButtonLocalVisible(TestCaseInputs inputs)
		{
			if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[1]", testCase))
			{
				return true;
			}
			
			
			if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_BE")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_SUI"))
			{
			if(MobileUtils.isMobElementExists("NAME","Connexion", testCase))
			{
			return MobileUtils.isMobElementExists("NAME","Connexion",testCase);
			}else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Connexion')]", testCase))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Connexion')]",testCase);

			}}else if(inputs.getInputValue("LANGUAGE").contains("German")||inputs.getInputValue("LANGUAGE").contains("German_SUI")||inputs.getInputValue("LANGUAGE").contains("German_AUS"))
			{
				return MobileUtils.isMobElementExists("NAME","Anmelden",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Italian")||inputs.getInputValue("LANGUAGE").contains("Italian_SUI"))
			{
				return MobileUtils.isMobElementExists("NAME","Accesso",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("PortuguesePL")||inputs.getInputValue("LANGUAGE").contains("PortugueseBR"))
			{
				return MobileUtils.isMobElementExists("NAME","Conectar",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Dutch")||inputs.getInputValue("LANGUAGE").contains("Dutch_BE"))
			{
				return MobileUtils.isMobElementExists("NAME","Aanmelden",testCase);

			}
			
			else if(inputs.getInputValue("LANGUAGE").contains("Spanish"))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'niciar')]",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Polish"))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Zaloguj')]",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Czech"))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'sit')]",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("English"))
			{
				return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Log In')]",testCase);

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Hungarian"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Bej')]", testCase))
				{
				return MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Bej')]",testCase);
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Bej')]", testCase))
				{
					return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Bej')]",testCase);
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Bej')]", testCase))
				{
					return MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Bej')]",testCase);
				}
			}
				else if(inputs.getInputValue("LANGUAGE").contains("Slovakian"))
				{
					if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Prihl')]", testCase))
					{
					return MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Prihl')]",testCase);
					}
					else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Prihl')]", testCase))
					{
						return MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Prihl')]",testCase);
					}
					else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Prihl')]", testCase))
					{
						return MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Prihl')]",testCase);
					}

				}

			
			return false;
		}


		public boolean isClickLoginButtonLocal(TestCaseInputs inputs)
		{
			boolean flag=true;
			
			if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeTextField[1]", testCase))
			{
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[1]", testCase))
				{
					flag= flag &&  MobileUtils.clickOnElement(testCase, "XPATH","//XCUIElementTypeButton[1]");
				}	
			}else{
		
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[2]", testCase))
				{
					flag= flag &&  MobileUtils.clickOnElement(testCase, "XPATH","//XCUIElementTypeButton[2]");
				}
			
			}
			
			if(!flag){
			if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_BE")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_SUI"))
			{
			if(MobileUtils.isMobElementExists("NAME","Connexion", testCase))
			{
				return MobileUtils.clickOnElement(testCase, "NAME","Connexion");
			}else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Connexion')]", testCase))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Connexion')]");

			}}
			
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_AUS"))
			{
				return MobileUtils.clickOnElement(testCase, "NAME","Anmelden");

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Italian")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian_SUI"))
			{
				return MobileUtils.clickOnElement(testCase, "NAME","Accesso");

			}
			
			else if(inputs.getInputValue("LANGUAGE").contains("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
				return MobileUtils.clickOnElement(testCase, "NAME","Conectar");

			}
			
			else if(inputs.getInputValue("LANGUAGE").contains("Dutch")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch_BE"))
			{
				return MobileUtils.clickOnElement(testCase, "NAME","Aanmelden");

			}
			
			else if(inputs.getInputValue("LANGUAGE").contains("Spanish"))
			{
				
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'niciar')]");

			}else if(inputs.getInputValue("LANGUAGE").contains("English"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'login') or contains(@name,'Log In')]",testCase))
				{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@label,'login') or contains(@name,'Log In')]");
				}
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Login')]",testCase))
				{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Login')]");
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Login')]",testCase))
				{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@label,'Login')]");
				}
			}
			
			else if(inputs.getInputValue("LANGUAGE").contains("Polish"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@label,'Zaloguj')]");

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Czech"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@label,'sit')]");

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Hungarian"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Bej')]", testCase))
				{
				return MobileUtils.clickOnElement(testCase,"XPATH","//XCUIElementTypeButton[contains(@name,'Bej')]");
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Bej')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase,"XPATH","//*[contains(@name,'Bej')]");
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Bej')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase,"XPATH","//*[contains(@label,'Bej')]");
				}

			}
			else if(inputs.getInputValue("LANGUAGE").contains("Slovakian"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//XCUIElementTypeButton[contains(@name,'Prihl')]", testCase))
				{
				return MobileUtils.clickOnElement(testCase,"XPATH","//XCUIElementTypeButton[contains(@name,'Prihl')]");
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Prihl')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase,"XPATH","//*[contains(@name,'Prihl')]");
				}
				else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@label,'Prihl')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase,"XPATH","//*[contains(@label,'Prihl')]");
				}
			}
			}
			return flag;
		}
		
		public boolean isNoInternetConnectionTextVisible(int time) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "NotNetConnectionText",time);
		}
		
		public boolean isNoInternetConnectionMsgVisible(int time) {
			if(!MobileUtils.isRunningOnAndroid(testCase)){
				if(!MobileUtils.isMobElementExists(objectDefinition, testCase, "NoInternetMessage",time)){
					if(MobileUtils.isMobElementExists("XPATH", "//*[contains(@value,'No internet connection') or contains(@value,'internet') or contains(@value,'Internet') or contains(@value,'Connection') or contains(@name,'internet') or contains(@name,'Internet') or contains(@name,'Connection')]", testCase)){
						return true;
					}else{						return false;					}
				}else{				return true;				}
			}else{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "NoInternetMessage",time);
			}
		}
		
		public boolean isRetryTextVisible(int time) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "RetryText",time);
		}
		
		public String getNoInternetConnectionMsg() {
			return MobileUtils.getFieldValue(objectDefinition , testCase , "NoInternetMessage");
		}
		
		public String getRetryText() {
			return MobileUtils.getFieldValue(objectDefinition , testCase , "RetryText");
		}
		
		public boolean isLoginButtonDisabled()
		{
	    	boolean status = true;
	    	status = status && MobileUtils.getMobElement(objectDefinition, testCase,"LoginButton")
				.getAttribute("enabled").equalsIgnoreCase("false");
			return status;
		}
		
		public boolean ClickOnLoginCancelLocal(TestCaseInputs inputs) {
			

			 if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_BE"))
			 {
				 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Annuler')]", testCase))
					{
						return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Annuler')]");

					}
				 
			 }
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_AUS"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Abbrechen')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Abbrechen')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian_SUI"))
			{
				 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Annulla')]", testCase))
					{
							return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Annulla')]");

					}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Esqueceu')]");

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch_BE"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Annuleren')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Annuleren')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Spanish"))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Recue')]");

			}
			return false;
		
			// TODO Auto-generated method stub
			
		}
		
		public boolean clickOnResendButton(TestCaseInputs inputs){
		    
		    if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_BE"))
			 {
				 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Renvoyer')]", testCase))
					{
						return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Renvoyer')]");

					}
				 
			 }
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_AUS"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Erneut Senden')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Erneut Senden')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian_SUI"))
			{
				 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Rinvia')]", testCase))
					{
							return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Rinvia')]");

					}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Reenviar')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Reenviar')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").contains("Dutch"))
			{
				if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Opnieuw Verzenden')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Opnieuw Verzenden')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").contains("Spanish"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Reenviar')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Reenviar')]");

				}

			}else if(inputs.getInputValue("LANGUAGE").contains("English"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Re')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'Re')]");

				}
				
			}
			return false;	
			
		}
		
		
public boolean clickOnResendOkButton(TestCaseInputs inputs){
		    
		    if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_CA")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("French_BE"))
			 {
			 if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

				}

				 
			 }
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_SUI")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("German_AUS"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Italian_SUI"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

				}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortuguesePL")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("PortugueseBR"))
			{
			   
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

				}
			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch")||inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Dutch_BE"))
			{if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

			}

			}
			 
			else if(inputs.getInputValue("LANGUAGE").equalsIgnoreCase("Spanish"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'ACEPTAR')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'ACEPTAR')]");

				}

			}else if(inputs.getInputValue("LANGUAGE").contains("English"))
			{
			    if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'OK')]", testCase))
				{
					return MobileUtils.clickOnElement(testCase, "XPATH","//*[contains(@name,'OK')]");

				}
				
			}
			return false;	
			
		}

public boolean isResendPopUpVisible(TestCaseInputs testCaseInputs) {
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ResendPopUp",10);
}

public boolean clickOnResendCloseButton(TestCaseInputs inputs) {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ResendCloseBtn");
}

public boolean clickOnForgotResendButton(TestCaseInputs inputs) {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ForgotResend");
}


public boolean longPressOnHomeLogo()
{
	boolean flag = true;
	WebElement element = MobileUtils.getMobElement(objectDefinition, testCase, "LyricLogo");
	CustomDriver driver = testCase.getMobileDriver();
	TouchAction action = new TouchAction(driver);
	if (MobileUtils.isRunningOnAndroid(testCase)) {
		flag = flag &&  MobileUtils.longPress(testCase, element, 8000);
	} 
	else 
	{
		//action.press(element).waitAction(MobileUtils.getDuration(8000)).release().perform();
		
		action.longPress(longPressOptions().withElement(element(element)).withDuration(Duration.ofMillis(8000))).release().perform();
		
	}
	return flag;
}

public boolean isContractorPopupVisible(int time) {
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContractorPopupHeader",time);
}

public boolean isContractorPopupTextVisible(int time) {
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContractorPopupTxt",time);
}

public boolean isContractorPopupCancelVisible(int time) {
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContractorPopupCancel",time);
}

public boolean isContractorPopupConfirmVisible(int time) {
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContractorPopupConfirm",time);
}

public boolean clickOnContractorPopupCancelButton(TestCaseInputs inputs) {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ContractorPopupCancel");
}

public boolean clickOnContractorPopupConfirmButton(TestCaseInputs inputs) {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ContractorPopupConfirm");
}

public boolean isContractorModeTextVisible(int time) {
	if(MobileUtils.isRunningOnAndroid(testCase))
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContractorModeText",time);
	}
	else
	{
		WebElement mob=testCase.getMobileDriver().findElement(By.xpath("//XCUIElementTypeImage[@name='Secret_Menu']//following-sibling::XCUIElementTypeOther"));
		if(mob!=null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
}

public boolean clickonResetButton(TestCaseInputs inputs)
{
	return MobileUtils.clickOnElement(objectDefinition , testCase , "ResetButton");
}
public boolean setEmailAddressValue(TestCaseInputs inputs,String value)
{
	String xpathValue="";
	try 
	{

		if(MobileUtils.isMobElementExists("XPATH","//*[(contains(@text,'Correo electrónico')) or contains(@name,'passwordTextField')]", testCase,3)){
			xpathValue="//*[(contains(@text,'Correo electrónico')) or contains(@name,'Login_Email')]";
		} else if(MobileUtils.isMobElementExists("XPATH","//*[(contains(@name,'passwordTextField') or contains(@text,'Email'))]", testCase,3)){
			xpathValue="//*[(contains(@name,'passwordTextField') or contains(@text,'Email'))]";
		} else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Login_Email') or contains(@text,'Courriel')]", testCase,3)){
			xpathValue="//*[contains(@text,'Courriel')]";
		} else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@name,'Login_Email') or contains(@text,'E-mail')]", testCase,3)){
			xpathValue="//*[contains(@text,'E-mail')]";
		} 
		else if(MobileUtils.isMobElementExists("XPATH","//*[contains(@content-desc,'E-Mail-Adresse:') or contains(@text,'E-Mail')]", testCase,3)){
			xpathValue="//*[contains(@text,'E-Mail')]";
		} 
		
		if(MobileUtils.isMobElementExists("XPATH","//*[(contains(@text,'Posta electronica')) or contains(@name,'passwordTextField')]", testCase,3)){
			xpathValue="//*[(contains(@text,'Posta electronica')) or contains(@name,'Login_Email')]";
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return MobileUtils.setValueToElement(testCase,"XPATH",xpathValue, value);
}
public boolean isNewResetVisible() {
    //return MobileUtils.isMobElementExists("ID", "TxtPassword", testCase);
    return MobileUtils.isMobElementExists(objectDefinition, testCase, "NewResetPwd");
}
public boolean clickNewResetpwdField() {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "NewResetPwd");
    //return MobileUtils.clickOnElement(objectDefinition, testCase, "NewResetPwd");
}
public MobileElement getresetnewtext(TestCaseInputs inputs)
{
	if(MobileUtils.isRunningOnAndroid(testCase))
	{
		return MobileUtils.getMobElement(objectDefinition, testCase, "NewResetPwd");
	}
	return null;	
}


public boolean isConfirmResetVisible() {
	//return MobileUtils.isMobElementExists("ID", "TxtPassword", testCase);
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ConfirmResetpwd");
}
public boolean clickConfirmResetpwdField() {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ConfirmResetpwd");
}
public MobileElement getresetconfirmtext(TestCaseInputs inputs)
{
	if(MobileUtils.isRunningOnAndroid(testCase))
	{
		return MobileUtils.getMobElement(objectDefinition, testCase, "ConfirmResetpwd");
	}
	return null;		
}


public boolean isChangePwdBttnVisible() {
	
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ChangePasswordBttn");
}
public boolean clickChangePwdButton() {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ChangePasswordBttn");
}

public boolean clickOnOkButton() {
	return MobileUtils.clickOnElement(objectDefinition, testCase, "OkBttn");				
}

public boolean clickonOKKey() {
	if(!MobileUtils.isRunningOnAndroid(testCase)){
		return MobileUtils.clickOnElement(testCase, "XPATH", "//XCUIElementTypeOther/XCUIElementTypeButton[3]");
	}
	return false;
}

public boolean isForgotPasswordIDButtonVisible()
{
	return MobileUtils.isMobElementExists(objectDefinition, testCase, "ForgotPasswordID",3);
}

public boolean clickOnForgotPasswordIDButton()
{
	return MobileUtils.clickOnElement(objectDefinition, testCase, "ForgotPasswordID");
}
		
}
