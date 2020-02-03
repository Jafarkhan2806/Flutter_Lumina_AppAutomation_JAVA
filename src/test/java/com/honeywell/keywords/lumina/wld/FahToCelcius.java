package com.honeywell.keywords.lumina.wld;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.honeywell.commons.coreframework.AfterKeyword;
import com.honeywell.commons.coreframework.BeforeKeyword;
import com.honeywell.commons.coreframework.Keyword;
import com.honeywell.commons.coreframework.KeywordStep;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.coreframework.TestCases;
import com.honeywell.commons.report.FailType;
import com.resideo.lumina.utils.LuminaUtils;


public class FahToCelcius extends Keyword  {

	private TestCaseInputs inputs;
	private TestCases testCase;
	private Temperature temp = Temperature.getInstance();

	public boolean flag = true;



	public FahToCelcius(TestCases testCase, TestCaseInputs inputs) {
		this.inputs = inputs;
		this.testCase = testCase;

	}

	@Override
	@BeforeKeyword
	public boolean preCondition() {
		return flag;
	}
	@Override
	@KeywordStep(gherkins = "^user should see temperature in Celcius$")
	public boolean keywordSteps() {
		System.out.println("FahToCel");
		LuminaUtils lumina = new LuminaUtils(inputs, testCase);
		System.out.println("Grabbed Temp: "+temp.getTemperatureVal());
		System.out.println("Converted Temp: "+temp.getC());
		
		if(temp.getTemperatureVal() == temp.getC()) {
			Keyword.ReportStep_Pass(testCase,
					"Successfully converted Fahrenheit to Celcius");
			flag = true;
		}else {
			Keyword.ReportStep_Fail_WithOut_ScreenShot(testCase, FailType.FUNCTIONAL_FAILURE , 
					"Conversion Fail");
			flag = false;
		}
		
		return flag;
	}
	@Override
	@AfterKeyword
	public boolean postCondition() {
		return flag;
	}

}
