package com.honeywell.screens;

import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;

import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.MobileScreens ;
import com.honeywell.commons.mobile.MobileUtils ;

import io.appium.java_client.MobileElement ;
import io.appium.java_client.TouchAction;

public class CreateAccountScreen extends MobileScreens{

		private static final String screenName = "CreateAccount";
		
		public CreateAccountScreen(TestCases testCase) {
			super(testCase,screenName);
			//osPopUps = new OSPopUps(testCase);
		}
		
		public CreateAccountScreen(TestCases testCase,String LANGUAGE) {
			super(testCase,screenName+"_"+LANGUAGE);
			//osPopUps = new OSPopUps(testCase);
		}
		
		public boolean isCreateAccountVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "CreateAccount_button",3);
		}
		
		public boolean navigateToCreateAccountScreen()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "CreateAccount_button");
		}
		
		public String getCreateAccountButtonText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "CreateAccount_button").getText();
		}
		
		public boolean isSelectCountryVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "SelectCountry",3);
		}
		
		public boolean isSelectSelectSearchVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "SelectSearch",3);
		}
		
		public boolean clickOnSelectCountryButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "SelectCountry");
		}
		
		public boolean clickOnConformSelectCountryButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "confirmCountry");
		}
		
		public boolean clickOnBackButton()
		{
			return MobileUtils.pressBackButton(testCase, "Create Account : Navigates back to Login Screen");
		}
		public boolean clickOnBackButtonIOS()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "NavigateBack");
		}
		public boolean clickOnBackIOStologin()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "backtologin");
		}
		
		
		public boolean clickOnOkButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "OK");
		}
		
		public boolean isOkButtonVisible() {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "OK",3);
		}
		
		public boolean isCancelButtonVisible() {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "Cancel",3);
		}

		public boolean clickOnCancelButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "Cancel");
		}
		
		
		public boolean isFirstNameLabelVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "FirstName",3);
		}
		
		public boolean clickOnFirstNameLabel()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "FirstName");
		}
		
		public boolean isLastNameLabelVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LastName",3);
		}
		
		public boolean isEmailLabelVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "Email",3);
		}
		
		public boolean setEmailAddressValue(String value)
		{
			return MobileUtils.setValueToElement(objectDefinition, testCase, "Email", value);
		}
		public boolean isPasswordLabelVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "Password",3);
		}
		
		public boolean isVerifyPasswordLabelVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "VerifyPassword",3);
		}

		public boolean setPasswordValue(String string) {
			
			return MobileUtils.setValueToElement(objectDefinition, testCase, "Password", string);
		}
		
		public boolean setFirstNameValue(String string) {
			
			return MobileUtils.setValueToElement(objectDefinition, testCase, "FirstName", string);
		}
		
		public boolean setLastNameValue(String string) {
			
			return MobileUtils.setValueToElement(objectDefinition, testCase, "LastName", string);
		}

		public boolean setVerifyPasswordValue(String string) {
			
			return MobileUtils.setValueToElement(objectDefinition, testCase, "VerifyPassword", string);
		}

		public boolean isCreateButtonVisible() {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "CreateButton",3);
		}

		public boolean clickOnCreateButton() {
			return MobileUtils.clickOnElement(objectDefinition, testCase, "CreateButton");
			
		}

		public boolean isAlreadyRegisteredEmailVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "AlreadyRegisteredEmail",3);
		}

		public String getAlreadyRegisteredEmailPopup() {
			

			String AlreadyRegisteredEmailPopup = null;			
				if( MobileUtils.isMobElementExists(objectDefinition, testCase, "AlreadyRegisteredEmail", 10, false))
				{
					MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "AlreadyRegisteredEmail",false,false);	
					
					if(sa!=null)
					{	
						if (MobileUtils.isRunningOnAndroid(testCase))
						{
							AlreadyRegisteredEmailPopup = sa.getText();
							
					} else
					{
						AlreadyRegisteredEmailPopup = sa.getAttribute("value");
					}
					
				}
					
			}
			return AlreadyRegisteredEmailPopup;
		
		}
		
		public boolean isEmptyEmailVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailErrorField",3);
		}
		
		public String getEmptyEmailPopup() {
			

			String AlreadyRegisteredEmailPopup = null;			
				if( MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailErrorField", 10, false))
				{
					MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "EmailErrorField",false,false);	
					
					if(sa!=null)
					{	
						if (MobileUtils.isRunningOnAndroid(testCase))
						{
							AlreadyRegisteredEmailPopup = sa.getText();
							
					} else
					{
						AlreadyRegisteredEmailPopup = sa.getAttribute("value");
					}
					
				}
					
			}
			return AlreadyRegisteredEmailPopup;
		
		}
		

		public boolean isFirstNameErrorFieldVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "FirstNameErrorField",3);
		}

		public String getFirstNameErrorFieldPopup() 
		{
			String AlreadyRegisteredEmailPopup = null;			
		if( MobileUtils.isMobElementExists(objectDefinition, testCase, "FirstNameErrorField", 10, false))
		{
			MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "FirstNameErrorField",false,false);	
			
			if(sa!=null)
			{	
				if (MobileUtils.isRunningOnAndroid(testCase))
				{
					AlreadyRegisteredEmailPopup = sa.getText();
					
			} else
			{
				AlreadyRegisteredEmailPopup = sa.getAttribute("value");
			}
			
			}
			
		}
		return AlreadyRegisteredEmailPopup;

		}
		
		public boolean ClickOnFirstName()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "FirstName");
		}
		
		public boolean setFirstNameEdit(String update)
		{
			return MobileUtils.setValueToElement(objectDefinition, testCase, "ThermoStatNameEdit", update);	
	
		}
		public MobileElement getFirstNameButton()
		{	
			return MobileUtils.getMobElement(objectDefinition , testCase , "FirstName",false,false);		
		}

		public boolean clickonEluaPrivacyPolicy() {
			
			return MobileUtils.clickOnElement(objectDefinition, testCase, "EndUserLicenceAgreement");
		}
		
		public boolean isEluaPrivacyPolicyVisible() {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "EndUserLicenceAgreement",3);
		}
	
		
        public boolean clickGDPRToggle() {
			
			return MobileUtils.clickOnElement(objectDefinition, testCase, "GdprToggle");
		}
		
		
           public String getGDPRToggleStatus() {
			

			String GdprStatus = null;			
				if( MobileUtils.isMobElementExists(objectDefinition, testCase, "GdprToggle", 10, false))
				{
					MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "GdprToggle",false,false);	
					
					if(sa!=null)
					{	
						if (MobileUtils.isRunningOnAndroid(testCase))
						{
							GdprStatus = sa.getText();
							
					} else
					{
						GdprStatus = sa.getAttribute("value");
					}
					
				}
					
			}
				
				
			return GdprStatus;
		
		}
           
           
        public void clearTextField(String fieldName)
   		{
        	
   			 	MobileUtils.getMobElement(objectDefinition, testCase, fieldName).clear();
   		} 
        
        public boolean clickOnCloseButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "ClosePopup");
		}
		
		public boolean isCloseButtonVisible(int time) {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ClosePopup",time);
		}
		
		
		public boolean clickdeleteButtonVisible(int time) {

		if(MobileUtils.isMobElementExists("name", "delete", testCase));
		{
			return MobileUtils.clickOnElement(testCase, "name", "delete");
		}
		}
		
		public boolean isLastNameErrorFieldVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "LastNameErrorField",3);
		}
		
		public String getLastNameErrorFieldPopup() 
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "LastNameErrorField").getText();
		}
		
		
		
		public boolean isPasswordErrorFieldVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "PasswordErrorField",3);
		}
		
		public String getPasswordErrorFieldPopup() 
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "PasswordErrorField").getText();
		}
		
		


public boolean ClickOnLastName()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "LastName");
		}	
public MobileElement getLastName()
{	
	return MobileUtils.getMobElement(objectDefinition , testCase , "LastName",false,false);		
}


	public boolean ClickOnPassword()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "Password");
		}		
	
		public MobileElement getPassword()
		{	
			return MobileUtils.getMobElement(objectDefinition , testCase , "Password",false,false);		
		}
		
		
		public boolean ClickOnVerifyPassword()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "VerifyPassword");
		}		
	
		public MobileElement getVerifyPassword()
		{	
			return MobileUtils.getMobElement(objectDefinition , testCase , "VerifyPassword",false,false);		
		}  


	public boolean isAllfieldEmptyErrorPopupvisible(TestCases testCase) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "AllFieldEmptyErrorIOS",5,false);
		}
		
		public boolean isErrorPopupHeadingvisible(TestCases testCase) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ErrorPopupHeading",5,false);
		}
		
		public String getAllfieldEmptyErrorPopupText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "AllFieldEmptyErrorIOS",false,false).getAttribute("value");
		}
		
		public boolean isEmailPasswordEmptyErrorvisible(TestCases testCase) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailPasswordEmptyErrorIOS",5,false);
		}
		
		public String getEmailPasswordEmptyErrorPopupText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "EmailPasswordEmptyErrorIOS").getAttribute("value");
		}
		
		public boolean isPasswordErrorvisible(TestCases testCase) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "PasswordEmptyErrorIOS",5,false);
		}
		
		public String getPasswordErrorPopupText()
		{
			return MobileUtils.getMobElement(objectDefinition, testCase, "PasswordEmptyErrorIOS",false,false).getAttribute("value");
		}
		
		
		public boolean isPasswordMissmatchvisible(TestCases testCase) {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "VerifyPasswordErrorField",5,false);
		}
		
		public String getPasswordMissmatchPopupText()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.getMobElement(objectDefinition, testCase, "VerifyPasswordErrorField",false,false).getText();
			}
			else
			{
				return MobileUtils.getMobElement(objectDefinition, testCase, "VerifyPasswordErrorField",false,false).getAttribute("value");
			}
		}
		
		public boolean isResendButtonVisible()
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "ResendBtn",3);
		}
		
		public boolean ClickOnResendButton()
		{
			return MobileUtils.clickOnElement(objectDefinition , testCase , "ResendBtn");
		}
		
		public boolean isCameraDevice()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@text='Smart Home Security']", testCase);
			}
			else
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@value='Smart Home Security']", testCase);
			}
		}
		
		public boolean ClickOnCameraDevice()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
			 return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@text='Smart Home Security']");
			}
			else
			{
				 return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@value='Smart Home Security']");
			}
		}		
		
		
		public boolean isNextVisible()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
			    return MobileUtils.isMobElementExists("XPATH", "//*[@text='Get Started']", testCase);
			}
			else
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@value='Next']", testCase);
			}
		}
		
		public boolean ClickOnNext()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
			  return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@id='Get Started']");
			}
			else
			{
			  return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@value='Next']");
			}
		}	
		
		public boolean isHomeLocVisible()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@text='Home']", testCase);
			}
			else
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@name='Home']", testCase);
			}
		}
		
		public boolean ClickOnHomeLoc()
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@text='Home']");
			}
			else
			{
				return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@name='Home']");
			}
		}

		public boolean iszipcodeText() {
			
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@id='custom_generic_edit']", testCase);
			}
			else
			{
				return MobileUtils.isMobElementExists("XPATH", "//*[@name='Home']", testCase);
			}
		}
		
		public boolean setZipcode(String value)
		{
			if(MobileUtils.isRunningOnAndroid(testCase))
			{
			  return MobileUtils.setValueToElement(testCase, "XPATH", "//*[@id='custom_generic_edit']", value, "");
			}
			else
			{
			  return MobileUtils.setValueToElement(testCase, "XPATH", "//*[@id='custom_generic_edit']", value, "");
			}
		}
		
		
		public boolean clickOnAcceptButton()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "AcceptBtn");
		}
		
		public boolean isAcceptButtonVisible(int time) {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "AcceptBtn",time);
		}
		
		public boolean clickOnAcceptButtonText()
		{
			return MobileUtils.clickOnElement(objectDefinition, testCase, "AcceptButtonText");
		}
		
		public boolean isAcceptButtonTextVisible(int time) {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "AcceptButtonText",time);
		}

		public boolean isMarketinglabelVisible() {
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "Marketinglabel");
			
		}
		
		public boolean clickonMarketinglabel() {
			return MobileUtils.clickOnElement(objectDefinition, testCase, "Marketinglabel");
			
		}
		
		
		public void scrollToClickActivateLink() {
			
			org.openqa.selenium.Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

			TouchAction touchAction = new TouchAction(testCase.getMobileDriver());
			
		/*	try {
				//[0,48][768,1184]
			
				touchAction.press(10, (int) (dimensions.getHeight() * .9))
				.moveTo(10, (int) (dimensions.getHeight() * -.4)).release().perform();
				//[2,48][644,50]
			} catch (Exception e) {
				
			}*/
			try {
				JavascriptExecutor js = (JavascriptExecutor) testCase.getMobileDriver();
				try {
					js .executeScript("window.scrollTo(0, document.body.scrollHeight)");
				} catch (Exception e) {
					
				}
				try {
					
					js.executeScript("window.scrollBy(10,"+(int) (dimensions.getHeight() * .10)+")");
				} catch (Exception e) {
				}
				
			} catch (Exception e) {
			}
			/*try {
				if(testCase.getMobileDriver().getPageSource().contains("")){
					
				}
			} catch (Exception e) {
			}
			try {
			
				touchAction.press(10, 0)
				.moveTo(10, (int) (dimensions.getHeight() * .3)).release().perform();
			} catch (Exception e) {
			}*/
			
		}
		
		public static void SwipeToActivateAccount(TestCases testCase) {
			Dimension dimensions = testCase.getMobileDriver().manage().window().getSize();

			try {
				while(true){
					testCase.getMobileDriver().swipe( (int) (dimensions.getWidth() * .5), (int) (dimensions.getHeight() * .5), (int) (dimensions.getWidth() * .5), (int) (dimensions.getHeight() * .3));
					
					try {
						
						if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Please click the button']" , testCase,3))
						{
							break;
						}
						if(MobileUtils.isMobElementExists("XPATH" , "//*[contains(@text,'Activate Account')]" , testCase,3))
						{
							break;
						}
						
					} catch (Exception e) {
						testCase.getMobileDriver().swipe( (int) (dimensions.getWidth() * .5), (int) (dimensions.getHeight() * .5), (int) (dimensions.getWidth() * .5), (int) (dimensions.getHeight() * .3));
					}
				}
				
			} catch (Exception e) {
			
			}
			
		}

	 public boolean isSendVerificationCodeVisible(int time) {
			
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "SendVerificationCo",time);
		}
		
		public boolean clickOnSendVerificationCode() {
			return MobileUtils.clickOnElement(objectDefinition, testCase, "SendVerificationCo");
			
		}
		
		
		 public boolean isDoneKeyVisible(int time) {
				
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "DoneKey",time);
			}
			
			public boolean clickOnDoneKey() {
				return MobileUtils.clickOnElement(objectDefinition, testCase, "DoneKey");
				
			}
			
			public boolean isFirstNameIDLabelVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "FirstNameID",3);
			}
			
			public boolean clickOnFirstNameIDLabel()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "FirstNameID");
			}
			
			public boolean isLastNameIDLabelVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "LastNameID",3);
			}
			
			public boolean clickOnLastNameIDLabel()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "LastNameID");
			}
			
			public boolean isEmailIDLabelVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "EmailID",3);
			}
			
			public boolean setEmailAddressIDValue(String value)
			{
				return MobileUtils.setValueToElement(objectDefinition, testCase, "EmailID", value);
			}
			
			public boolean setFirstNameIDValue(String string) {
				
				return MobileUtils.setValueToElement(objectDefinition, testCase, "FirstNameID", string);
			}
			
			public boolean setLastNameIDValue(String string) {
				
				return MobileUtils.setValueToElement(objectDefinition, testCase, "LastNameID", string);
			}
			
			public boolean isSendVerificationButtonVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "SendVerificationCode",3);
			}
			
			public boolean clickOnSendVerificationButton()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "SendVerificationCode");
			}
			
			public boolean isEnterCodeLabelVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "EnterCode",5);
			}
			
			public boolean clickOnVerificationCodeField()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "VerificationCode");
			}
			
            public boolean setVerificationCodeValue(String string) {
				
				return MobileUtils.setValueToElement(objectDefinition, testCase, "VerificationCode", string);
			}
            
            public boolean isContinueButtonVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "ContinueButton",5);
			}
            
            public boolean clickOnContinueButton()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "ContinueButton");
			}
            
            
            public boolean isVerificationErrorVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "VerificationError",5);
			}
			
            public String getVerificationError() {
    			

    			String AlreadyRegisteredEmailPopup = null;			
    				if( MobileUtils.isMobElementExists(objectDefinition, testCase, "VerificationError", 10, false))
    				{
    					MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "VerificationError",false,false);	
    					
    					if(sa!=null)
    					{	
    						if (MobileUtils.isRunningOnAndroid(testCase))
    						{
    							AlreadyRegisteredEmailPopup = sa.getText();
    							
    					} else
    					{
    						AlreadyRegisteredEmailPopup = sa.getAttribute("value");
    					}
    					
    				}
    					
    			}
    			return AlreadyRegisteredEmailPopup;
    		
    		}
            
            public boolean isResendCodeButtonVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "ResendCodeButton",5);
			}
            
            public boolean clickOnResendCodeButton()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "ResendCodeButton");
			}
            
            public boolean isSessionExpiredErrorVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "SessionExpiredError",5);
			}
			
            public String getSessionExpiredError() {
    			

    			String AlreadyRegisteredEmailPopup = null;			
    				if( MobileUtils.isMobElementExists(objectDefinition, testCase, "SessionExpiredError", 10, false))
    				{
    					MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "SessionExpiredError",false,false);	
    					
    					if(sa!=null)
    					{	
    						if (MobileUtils.isRunningOnAndroid(testCase))
    						{
    							AlreadyRegisteredEmailPopup = sa.getText();
    							
    					} else
    					{
    						AlreadyRegisteredEmailPopup = sa.getAttribute("value");
    					}
    					
    				}
    					
    			}
    			return AlreadyRegisteredEmailPopup;
    		
    		}
            public boolean clickOnOKButton()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "OkButton");
			}
            
            public boolean isOKButtonVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "OkButton",5);
			}
            
            public boolean clickOnCrossButton()
			{
				return MobileUtils.clickOnElement(objectDefinition, testCase, "CrossButton");
			}
            
            public boolean isCrossButtonVisible()
			{
				return MobileUtils.isMobElementExists(objectDefinition, testCase, "CrossButton",5);
			}
            
		
	}

