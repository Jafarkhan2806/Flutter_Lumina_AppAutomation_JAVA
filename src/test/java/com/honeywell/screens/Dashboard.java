package com.honeywell.screens;

import io.appium.java_client.MobileElement ;

import java.util.List ;

import org.openqa.selenium.By ;
import org.openqa.selenium.Dimension ;
import org.openqa.selenium.WebElement ;

import com.honeywell.commons.coreframework.Keyword ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.mobile.MobileScreens ;
import com.honeywell.commons.mobile.MobileUtils ;
import com.honeywell.commons.report.FailType ;
import com.honeywell.lyric.utils.InputVariables ;

public class Dashboard extends MobileScreens {

	private static final String screenName = "Dashboard";

	public Dashboard(TestCases testCase) {
		super(testCase, screenName);
	}
	public Dashboard(TestCases testCase,String LANGUAGE) {
		super(testCase,screenName+"_"+LANGUAGE);
		//osPopUps = new OSPopUps(testCase);
	}

	public boolean isWeatherIconVisible() {
		if (MobileUtils.isRunningOnAndroid(testCase))
		{
			return MobileUtils.isMobElementExists(objectDefinition, testCase, "WeatherIcon", 3, false);
		} 
		else
		{
			return MobileUtils.isMobElementExists("XPATH", "//*[contains(@name,'"+InputVariables.degree+"')]", testCase);
		}
	}

	public boolean isWeatherIconVisible(int timeOut) 
	{
		boolean flag=false;
		if (MobileUtils.isRunningOnAndroid(testCase))
		{
			MobileUtils.isMobElementExists(objectDefinition, testCase, "WeatherIcon", timeOut, false);
			flag=true;
		}else
		{
			 if(MobileUtils.isMobElementExists("XPATH", "//*[contains(@name,'"+InputVariables.degreeIOS+"')]", testCase)){
			
				 flag=true;
				 
			 }else if(MobileUtils.isMobElementExists("XPATH", "//*[contains(@name,'"+InputVariables.degreeIOS+"')]", testCase)) 
			{
				flag=true;
			}
		}
		return flag;
	}

	public boolean isSplashScreenVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "SplashScreen", timeOut, false);
	}
	
	public boolean isProgressBarVisible(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "ProgressBar",timeOut,false);
	}
	

	

	public boolean isAddDeviceIconBelowExistingDASDeviceVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "AddNewDeviceIconBelowExistingDevice",
				timeOut, false);
	}

	

	public boolean clickOnGlobalDrawerButton() {
		if(MobileUtils.isMobElementExists(objectDefinition, testCase, "GlobalDrawerButton", false)){
			return MobileUtils.clickOnElement(objectDefinition, testCase, "GlobalDrawerButton");
		}else{
			if(MobileUtils.isMobElementExists("XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/dbMainLayout']", testCase)){
				return MobileUtils.clickOnElement(testCase, "XPATH", "//*[@resource-id='android:id/button1']");
					}
		}
			return true;
		//return MobileUtils.clickOnElement(objectDefinition, testCase, "GlobalDrawerButton");
	}

	public boolean areDevicesVisibleOnDashboard(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "DashboardIconText", timeOut);
	}

	public boolean areDevicesVisibleOnDashboard() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "DashboardIconText", 3);
	}

	public boolean isDevicePresentOnDashboard(String deviceName) {
		boolean flag = true;
		if (this.areDevicesVisibleOnDashboard(10)) {
			List<WebElement> dashboardIconText = MobileUtils.getMobElements(objectDefinition, testCase,
					"DashboardIconText");
			boolean f = false;
			for (WebElement e : dashboardIconText) {
				String displayedText = "";
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					displayedText = e.getText();
				} else {
					try {
						displayedText = e.getAttribute("value");
					} catch (Exception e1) {
					}
				}
				if (displayedText.equalsIgnoreCase(deviceName)) {
					f = true;
					break;
				}
			}
			flag = f;
		} else {
			flag = false;
		}
		return flag;
	}

	public boolean isGlobalDrawerButtonVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GlobalDrawerButton", 3);
	}

	public boolean isGlobalDrawerButtonVisible(int timeOut) {
		
		if(MobileUtils.isMobElementExists(objectDefinition, testCase, "GlobalDrawerButton", timeOut)){
			return true;
		}else{
			if(MobileUtils.isMobElementExists("XPATH", "//*[@resource-id='com.honeywell.android.lyric:id/dbMainLayout']", testCase)){
				return true;
					}
		}
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GlobalDrawerButton", timeOut);
	}
	
	
	public String getZwaveDeviceStatus(String expectedDevice) {
		if (this.areDevicesVisibleOnDashboard(10)) {
			List<WebElement> dashboardIconText = MobileUtils.getMobElements(objectDefinition, testCase,
					"DashboardIconText");
			List<WebElement> dashboardIconStatus = MobileUtils.getMobElements(objectDefinition, testCase,
					"DashboardIconStatus");
			for (int i = 0; i <= dashboardIconText.size(); i++) {
				String displayedText = "";
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					displayedText = dashboardIconText.get(i).getText();
				} else {
					try {
						displayedText = dashboardIconText.get(i).getAttribute("value");
					} catch (Exception e1) {
					}
				}
				if (displayedText.toUpperCase().contains(expectedDevice)) {
					if (dashboardIconStatus.get(i).getText().toUpperCase().contains("ON")) {
						return "ON";
					} else {
						return "OFF";
					}
				}
			}
		} else {
		}
		return null;
	}

	public List<WebElement> getDashboardDeviceNameElements()
	{
		return MobileUtils.getMobElements(objectDefinition, testCase, "DashboardIconText");
	}
	
	public boolean clickOnWeatherIcon()
	{
		boolean flag=false;
		if (MobileUtils.isRunningOnAndroid(testCase))
		{
			 MobileUtils.clickOnElement(objectDefinition, testCase, "WeatherIcon");
			 flag=true;
		}
		else
		{
		if(MobileUtils.isMobElementExists("XPATH", "//*[contains(@name,'"+InputVariables.degreeIOS+"')]", testCase))
		{
			 MobileUtils.clickOnElement(testCase, "XPATH", "//*[contains(@name,'"+InputVariables.degreeIOS+"')]");
			 flag=true;
		}
		else if(MobileUtils.isMobElementExists("XPATH", "//*[contains(@name,'\u00B0')]", testCase))
		{
			 MobileUtils.clickOnElement(testCase, "XPATH", "//*[contains(@name,'\u00B0')]");
			 flag=true;
		}
		
	}
	return flag;
	
	}
	
	public boolean ClickOnDevicePresentOnDashboard(String deviceName) {
		boolean flag = true;
		if (this.areDevicesVisibleOnDashboard(15)) {
			List<WebElement> dashboardIconText = MobileUtils.getMobElements(objectDefinition, testCase,"DashboardIconText");
			boolean f = false;
			for (WebElement e : dashboardIconText) {
				String displayedText = "";
				if (MobileUtils.isRunningOnAndroid(testCase)) {
					displayedText = e.getText();
				} else {
					try {
						displayedText = e.getAttribute("value");
					} catch (Exception e1) {
					}
				}
				if (displayedText.equalsIgnoreCase(deviceName)) {
					e.click();
					f = true;
					break;
				}
			}
			flag = f;
			if(flag)
			{
				Keyword.ReportStep_Pass(testCase, "Successfully click on "+deviceName);	
			}
			else
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Dashboard : Failed to click on dashboard device"+deviceName, false);
			}
		} else {
			Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Dashboard Icons not found");
			flag = false;
		}
		return flag;
	}
	
	

	public boolean isBackButtonVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "BackButton", 3);
	}

	public boolean clickOnBackButton(int timeOut) {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "BackButton");
	}
	
	public boolean clickOnDevice()
	{
		return MobileUtils.clickOnElement(objectDefinition, testCase, "DashboardIconText");
	}
	
	public boolean isToolBarTextVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "ToolbarSubtitle", timeOut, false);
	}
	
	public String getToolBarText() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "ToolbarSubtitle",false,false);
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue=sa.getText();
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	
	public boolean isLocationIconSpinnedVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LocationSpinner", timeOut, false);
	}
	
	public boolean clickOnLocationIconSpinned()
	{
		return MobileUtils.clickOnElement(objectDefinition, testCase, "LocationSpinner");
	}
	
	public WebElement getLocationIconSpinnerElement()
	{
		return MobileUtils.getMobElement(objectDefinition, testCase, "LocationSpinner");
	}
	
	
	
	//
	public String getLocationIconSpinnerText() {
		WebElement sa=getLocationIconSpinnerElement();
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue=MobileUtils.getMobElement(objectDefinition, testCase, "LocationName").getText();
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	
	public boolean isLocationNameIOSVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LocationNameIOS", timeOut, false);
	}
	
	public String getLocationNameIOS() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "LocationNameIOS",false,false);
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue="";
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	
	public boolean ClickOnLocationName(String locationToBeSelected)
	{
		return MobileUtils.clickOnElement(testCase, "XPATH", "//*[(contains(@value,'"+locationToBeSelected+"') or (contains(@label,'"+locationToBeSelected+"')))]");
	}
	
	public List<WebElement> getLocationDropDownElement()
	{
		return MobileUtils.getMobElements(objectDefinition, testCase, "LocationDropDown");
	}
	
	public boolean isAddNewDeviceText(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "AddNewDeviceText", timeOut, false);
	}
	public boolean isLocationSpinnerIconVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LocationSpinnerIcon", timeOut, false);
		
	}
	public boolean clickOnLocationSpinner() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "LocationSpinner");
	}
	
	public boolean isLocationSpinnerVisible()
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "LocationSpinner");
	}
	
	public List<WebElement> getLocationNameElements()
	{
		 List<WebElement> element = MobileUtils.getMobElements(objectDefinition, testCase, "LocationDropDown");
		 return element;
	}
	public String getCureentLocation()
	{
		String CurrentLocation = "";
		if (MobileUtils.isRunningOnAndroid(testCase))
		{
			CurrentLocation = MobileUtils.getMobElement(objectDefinition, testCase, "LocationName").getAttribute("text");
		}
		else
		{
			CurrentLocation = MobileUtils.getMobElement(objectDefinition, testCase, "LocationName").getAttribute("value");
		}
		return CurrentLocation;
		
	}
	public List<WebElement> getDeviceList()
	{
		 List<WebElement> element = MobileUtils.getMobElements(objectDefinition, testCase, "DashboardIconText");
		 return element;
	}
	
	public boolean changeLocationForStat(String locName){
		boolean flag=true;
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			if(MobileUtils.getMobElement(objectDefinition, testCase, "LocationName").getText().equalsIgnoreCase(locName))
			{
				Keyword.ReportStep_Pass(testCase, "Dashboard: Current location is already set to "+ locName);
				flag=true;
			}
			else
			{
				Keyword.ReportStep_Pass(testCase, "Dashboard: Current location is not "+ locName);
				flag= flag && clickOnLocationSpinner();
				if(MobileUtils.getMobElement(objectDefinition, testCase, "LocationSpinnerOption").getText().equalsIgnoreCase(locName))
				{
					MobileUtils.getMobElement(testCase, "XPATH", "//*[@text='"+locName+"']").click();
					Keyword.ReportStep_Pass(testCase, "Dashboard: location is set to "+ locName);
					flag=flag && true;
				}
				else{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Dashboard : Expected location name not found", false);
					flag=flag && false;
				}
			}
		}
		else{
			if(MobileUtils.getMobElement(objectDefinition, testCase, "LocationName").getAttribute("value").equalsIgnoreCase(locName))
			{
				Keyword.ReportStep_Pass(testCase, "Dashboard: Current location is already set to "+ locName);
				flag=flag && true;
			}
			else
			{	
				Keyword.ReportStep_Pass(testCase, "Dashboard Screen: Current location is not "+ locName);
				clickOnLocationSpinner();
				if(MobileUtils.getMobElement(objectDefinition, testCase, "LocationSpinnerOption").getAttribute("value").equalsIgnoreCase(locName))
				{
					MobileUtils.getMobElement(testCase, "XPATH", "//*[@value='"+locName+"']").click();
					Keyword.ReportStep_Pass(testCase, "Dashboard: location is set to "+ locName);
					flag=flag && true;
				}
				else{
					Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, "Dashboard Screen: Expected location name not found", false);
					flag=flag && false;
				}
			}
		}
		
		return flag;
		
	}
	
	public boolean clickOnDismiss() {

		return MobileUtils.clickOnElement(testCase,"ID","alert_dismiss_btn");
	}

	public boolean isDismissVisible(int timeout, WebElement e)
	{
		boolean flag=true;
		if(MobileUtils.isRunningOnAndroid(testCase))
		{	
		if(MobileUtils.isMobElementExists("ID","alert_dismiss_btn", testCase,timeout)){
			testCase.getMobileDriver().findElementById("alert_dismiss_btn").click();
			if(MobileUtils.isMobElementExists("ID","alert_dismiss_btn", testCase,timeout)){
				testCase.getMobileDriver().findElementById("alert_dismiss_btn").click();
			}
			//e.click();
			flag= true;

		}else{
			flag=false;
		}
		}
		else
		{
			if(MobileUtils.isMobElementExists("name","Dismiss", testCase,timeout)){
				testCase.getMobileDriver().findElementByName("Dismiss").click();
				flag= true;

			}else if(MobileUtils.isMobElementExists("name","Verwerfen", testCase,timeout))
			{
			testCase.getMobileDriver().findElementByName("Verwerfen").click();
			flag= true;
			}else if(MobileUtils.isMobElementExists("name","Descartar", testCase,timeout))
			{
			testCase.getMobileDriver().findElementByName("Descartar").click();
			flag= true;
			}
				
				
		    if(MobileUtils.isMobElementExists("name","Dismiss", testCase,timeout))
			{
				testCase.getMobileDriver().findElementByName("Dismiss").click();
				flag= true;	
			}
		    else if(MobileUtils.isMobElementExists("name","Verwerfen", testCase,timeout))
			{
			testCase.getMobileDriver().findElementByName("Verwerfen").click();
			flag= true;
			}
				
			else{
				flag=false;
			}
			
		}
		return flag;

	}
	
	public boolean isDashboardDeviceSecondaryTextVisible()
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "DashboardIconStatus");
	}
	
	public String getDashboardDeviceSecondaryText()
	{
		String TEXT = "";
		if (MobileUtils.isRunningOnAndroid(testCase))
		{
			TEXT = MobileUtils.getMobElement(objectDefinition, testCase, "DashboardIconStatus").getAttribute("text");
		}
		else
		{
			TEXT = MobileUtils.getMobElement(objectDefinition, testCase, "DashboardIconStatus").getAttribute("value");
		}
		return TEXT;
		
	}
	
	public boolean isAddNewDeviceHeaderDisplayed(int lookFor) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "AddNewDeviceHeader", lookFor);
	}
	
	
	
	public boolean isGlobalDrawerAddNewVisible(int timeOut) {
		if(MobileUtils.isMobElementExists(objectDefinition, testCase, "GlobalDrawerButton", timeOut) ||
				MobileUtils.isMobElementExists(objectDefinition, testCase, "AddNewDeviceHeader", timeOut))
		{
			return true;
		}
		
		else{
			return false;
		}
	}
	
	
	public boolean isLocationPopupVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'Turn on location')]",testCase);
	}
	public boolean isImproveLocationPopupVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'Improve location accuracy')]",testCase);
	}
	public boolean isSettingBtnVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'SETTINGS')]",testCase);
	}
	public boolean isCancelBtnVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'CANCEL')]",testCase);
	}
	public boolean clickOnSettingBtn() {
		
			return MobileUtils.clickOnElement(objectDefinition, testCase, "SETTINGS");
		}
	public boolean clickOnCancelBtn() {
		
		return MobileUtils.clickOnElement(objectDefinition, testCase, "CANCEL");
	}
	public boolean isToggleBtnVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'OFF')]",testCase);
	}
	public boolean clickOnOFFBtn() {
		
		return MobileUtils.clickOnElement(objectDefinition, testCase, "OFF");
	}
	public boolean isAgreeBtnVisible(int timeOut)
	{
		return  MobileUtils.isMobElementExists("XPATH", "//*[contains(@text,'Agree')]",testCase);
	}
	public boolean clickOnAgreeBtn() {
		
		return MobileUtils.clickOnElement(objectDefinition, testCase, "Agree");
	}
	public String getLocationPopDesText() {
		MobileElement sa=MobileUtils.getMobElement( testCase , "XPATH", "//*[contains(@text,'Turn on location')]",false,false);
		String locationpopupValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				locationpopupValue=sa.getText();
			} else {
				locationpopupValue=sa.getAttribute("value");
			}
		}
		return locationpopupValue;
	}
	
	public boolean isGeofencingLabelVisible(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofenceTitle",timeOut,false);
	}
	
	
	public String getGeofencingLabelText() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "GeofenceTitle",false,false);
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue=sa.getText();
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	public boolean isGeofencingIconVisible(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofenceIcon",timeOut,false);
	}
	public boolean isGeofencingCurrentStatus(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "CurrentStatus",timeOut,false);
	}
	
	public String getCurrentStatusText() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "CurrentStatus",false,false);
		String status="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				status=sa.getText();
			} else {
				status=sa.getAttribute("value");
			}
		}
		return status;
	}
	public boolean isGeofencingCurrentSetting(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "CurrentSetting",timeOut,false);
	}
	
	
	
	public boolean isGeofenceOptionVisible() {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofenceOption");
	}
	
	public boolean isGeofencingLabelTextVisible(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofencingDetail",timeOut,false);
	}
	
	public String getGeofencingDetail() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "GeofencingDetail",false,false);
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue=sa.getText();
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	
	public boolean isUsingSettingTextVisible(int timeOut)
	{
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofencingUsingSettingDetail",timeOut,false);
	}
	
	public String getGeofencingUsingSettingDetail() {
		MobileElement sa=MobileUtils.getMobElement(objectDefinition , testCase , "GeofencingUsingSettingDetail",false,false);
		String weatherValue="";
		if(sa!=null)
		{
			if (MobileUtils.isRunningOnAndroid(testCase)) {
				weatherValue=sa.getText();
			} else {
				weatherValue=sa.getAttribute("value");
			}
		}
		return weatherValue;
	}
	
	public boolean isGeofenceIconVisible(int timeOut)
	{
		boolean flag=true;
		
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			flag=MobileUtils.isMobElementExists(objectDefinition, testCase, "GeofenceIcon",timeOut,false);
		}
		else
		{
			if(testCase.getMobileDriver().findElement(By.xpath("//*[@name='icon_geofence_status']"))!=null)
			 {
				 
			 }
			 else
			 {
				 
			 }
		}
		 
		
		return flag;
	}
	
	public boolean clickOnGeofenceIcon() {
		boolean flag=true;
		if(MobileUtils.isRunningOnAndroid(testCase))
		{
			flag=MobileUtils.clickOnElement(objectDefinition, testCase, "GeofenceIcon");
		}
		else
		{
			try
			{
				WebElement clipPlay = testCase.getMobileDriver().findElement(By.name("icon_geofence_unavailable"));
				//clipPlay.click();
				Dimension dimension = clipPlay.getSize();
				org.openqa.selenium.Point point = clipPlay.getLocation();
				int width = dimension.getWidth()/2;
				int height = dimension.getHeight()/2;
				
				int X= point.getX()+width;
				int Y= point.getY()+height;
				testCase.getMobileDriver().tap(2 , X ,Y );
				//testCase.getMobileDriver().tap(1 , X ,Y );
				//clipPlay.click();
				
			}
			catch(Exception e)
			{
				Keyword.ReportStep_Fail(testCase, FailType.FUNCTIONAL_FAILURE, e.getMessage());
				flag=false;
			}
		}
	
	 return flag;
	}
	
	public boolean isSecurityLocVisible(int timeOut) {
		return MobileUtils.isMobElementExists(objectDefinition, testCase, "SecurityOption", timeOut);
	}

	public boolean clickOnSecurityLoc() {
		return MobileUtils.clickOnElement(objectDefinition, testCase, "SecurityOption");
	}











}
