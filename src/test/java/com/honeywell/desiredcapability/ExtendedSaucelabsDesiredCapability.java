package com.honeywell.desiredcapability;

import org.openqa.selenium.remote.DesiredCapabilities ;

import com.honeywell.commons.coreframework.TestCaseInputs ;
import com.honeywell.commons.coreframework.TestCases ;
import com.honeywell.commons.deviceCloudProviders.SauceLabsMobileExecutionDesiredCapability ;
import com.honeywell.commons.mobile.Mobile ;

public class ExtendedSaucelabsDesiredCapability extends SauceLabsMobileExecutionDesiredCapability {

	private TestCaseInputs inputs;
	
	public ExtendedSaucelabsDesiredCapability(TestCases testCase, TestCaseInputs inputs) {

		super(testCase, inputs);
		this.inputs = inputs;
	}

	@Override
	public void additionalDesiredCapabilities() {

		DesiredCapabilities desiredCapabilities = getDesiredCapabilities();
		
		desiredCapabilities.setCapability("unicodeKeyboard", true);
		 desiredCapabilities.setCapability("resetKeyboard", true);
		
		if (inputs.getInputValue(TestCaseInputs.OS_NAME).equalsIgnoreCase(Mobile.IOS)) {
			desiredCapabilities.setCapability("startIWDP", true);
		}

		if(inputs.isInputAvailable("LANGUAGE"))
		{
			switch (inputs.getInputValue("LANGUAGE").toUpperCase())
			{
				case "ENGLISH_US":
					desiredCapabilities.setCapability("language", "en");
					desiredCapabilities.setCapability("locale","en_US");
					break ;
					
				case "ENGLISH_UK":
					desiredCapabilities.setCapability("language", "en");
					desiredCapabilities.setCapability("locale","en_GB");
					break ;
					
				case "ENGLISH_IR":
					desiredCapabilities.setCapability("language", "en");
					desiredCapabilities.setCapability("locale","en_IE");
					break ;
					
					
				case "FRENCH":
					desiredCapabilities.setCapability("language", "fr");
					desiredCapabilities.setCapability("locale","fr_FR");
					break ;
					
				case "FRENCH_BE":
					desiredCapabilities.setCapability("language", "fr");
					desiredCapabilities.setCapability("locale","fr_BE");
					break ;
					
				case "FRENCH_SUI":
					desiredCapabilities.setCapability("language", "fr");
					desiredCapabilities.setCapability("locale","fr_CH");
					break ;
					
				case "DUTCH":
					desiredCapabilities.setCapability("language", "nl");
					desiredCapabilities.setCapability("locale","nl_NL");
					break ;
				case "DUTCH_SUI":
					desiredCapabilities.setCapability("language", "nl");
					desiredCapabilities.setCapability("locale","nl_CH");
					break ;
				case "DUTCH_BE":
					desiredCapabilities.setCapability("language", "nl");
					desiredCapabilities.setCapability("locale","nl_BE");
					break ;					
					
				case "FRENCH_CA":
					desiredCapabilities.setCapability("language", "fr");
					desiredCapabilities.setCapability("locale","fr_CA");
					break ;
					
				case "BULGARIAN":
					desiredCapabilities.setCapability("language", "bg");
					desiredCapabilities.setCapability("locale","bg_BG");
					break ;	
					
				case "SLOVENIAN":
					desiredCapabilities.setCapability("language", "sl");
					desiredCapabilities.setCapability("locale","sl_SI");
					break ;	

				case "CROATIAN":
					desiredCapabilities.setCapability("language", "hr");
					desiredCapabilities.setCapability("locale","hr_HR");
					break ;	
					
				case "GERMAN":
					desiredCapabilities.setCapability("language", "de");
					desiredCapabilities.setCapability("locale","de_DE");
					break ;
					
				case "GERMAN_SUI":
					desiredCapabilities.setCapability("language", "de");
					desiredCapabilities.setCapability("locale","de_CH");
					break ;
					
				case "GERMAN_AUS":
					desiredCapabilities.setCapability("language", "de");
					desiredCapabilities.setCapability("locale","de_AT");
					break ;
					
				case "ITALIAN":
					desiredCapabilities.setCapability("language", "it");
					desiredCapabilities.setCapability("locale","it_IT");
					break ;
					
				case "ITALIAN_SUI":
					desiredCapabilities.setCapability("language", "it");
					desiredCapabilities.setCapability("locale","it_CH");
					break ;
					
				case "PORTUGUESEBR":
					desiredCapabilities.setCapability("language", "pt");
					desiredCapabilities.setCapability("locale","pt_BR");
					break ;
					
				case "PORTUGUESEPL":
					desiredCapabilities.setCapability("language", "pt");
					desiredCapabilities.setCapability("locale","pt_PT");
					break ;
					
				case "SPANISH":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_ES");
					break ;
				case "SPANISH_US":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_US");
					break ;
				
				case "SPANISH_MEXICO":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_MX");
					break ;
					
				case "SPANISH_COSTARICA":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_CR");
					break ;
					
				case "SPANISH_COLOMBIA":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_CO");
					break ;
					
				case "SPANISH_PANAMA":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_PA");
					break ;
					
				case "SPANISH_PERU":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_PE");
					break ;
					
				case "SPANISH_CHILE":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_CL");
					break ;
					
				case "SPANISH_ARGENTINA":
					desiredCapabilities.setCapability("language", "es");
					desiredCapabilities.setCapability("locale","es_AR");
					break ;
					
				case "ROMANIAN":
					desiredCapabilities.setCapability("language", "ro");
					desiredCapabilities.setCapability("locale","ro_RO");
					break ;
					
				case "LATVIA":
					desiredCapabilities.setCapability("language", "lv");
					desiredCapabilities.setCapability("locale","lv_LV");
					break ;
					
				case "LITHUANIA":
					desiredCapabilities.setCapability("language", "lt");
					desiredCapabilities.setCapability("locale","lt_LT");
					break ;
				
				case "ESTONIA":
					desiredCapabilities.setCapability("language", "et");
					desiredCapabilities.setCapability("locale","et_ET");
					break ;	
					
				case "POLISH":
					desiredCapabilities.setCapability("language", "pl");
					desiredCapabilities.setCapability("locale","pl_PL");
					break ;	
					
				case "SLOVAKIAN":
					desiredCapabilities.setCapability("language", "sk");
					desiredCapabilities.setCapability("locale","sk_SK");
					break ;	
					
				case "CZECH":
					desiredCapabilities.setCapability("language", "cs");
					desiredCapabilities.setCapability("locale","cs_CZ");
					break ;	
				
				case "HUNGARIAN":
					desiredCapabilities.setCapability("language", "hu");
					desiredCapabilities.setCapability("locale","hu_HU");
					break ;	
					
					
					
				default:
					desiredCapabilities.setCapability("language", "en");
					desiredCapabilities.setCapability("locale","en_US");
					break ;
			}
		}
	}
}
