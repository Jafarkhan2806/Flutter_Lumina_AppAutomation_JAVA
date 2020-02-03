
package com.resideo.TITAN;

import java.util.ArrayList;

import org.openqa.selenium.By;  
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import com.honeywell.commons.bddinterface.DataTable;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordException;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;  
  
public class AuthLoginWeb extends Keyword {

	private TestCases testCase;
	private static TestCaseInputs inputs;
	public DataTable dataTable;
	public boolean flag = true;
	public String[][] eventsList;
	public ArrayList<String> screen;

	

	public AuthLoginWeb(TestCases testCase, TestCaseInputs inputs) {
		this.testCase = testCase;
		this.inputs = inputs;
	}
	public String getAuthToken(String url , String Username ,String Password) {  
      
           // System Property for Chrome Driver   
        System.setProperty("webdriver.chrome.driver","/Users/Resideo/Downloads/chromedriver");  
          
             // Instantiate a ChromeDriver class.     
        WebDriver driver=new ChromeDriver();  
          
           // Launch Website  
        driver.navigate().to(url); 
        try {
			Thread.sleep(5000);
		
        driver.findElement(By.id("signInName")).sendKeys(Username); 
        driver.findElement(By.id("password")).sendKeys(Password);
        driver.findElement(By.id("next")).click();
        Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String str = driver.getCurrentUrl();
        String ReplaceString = "https://localhost:4200/home?code=";
        String authToken = str.replace(ReplaceString, "");
        driver.close();
        return authToken;
    }
	@Override
	public boolean keywordSteps() throws KeywordException {
		// TODO Auto-generated method stub
		return false;
	} 
  
}  