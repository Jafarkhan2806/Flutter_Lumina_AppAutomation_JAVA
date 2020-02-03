@GenralAddNewDevice @Platform 
Feature: Add New Device scenarios when user selects respective countries 
	As a user I want to verify Respective solution displayed on add device screen

#Requirement : Account with out location
@GeneralListOfSolutionsInAddNewDevicesScreenForSupportedCountries @Automatable
@--xrayid:ATER-69152 
Scenario Outline: As a user i want to verify list of solutions displayed in Add Devices screen for supported countries
	Given user launches and logs in to the Lyric application 
	When user navigates to "Add New Device Dashboard" screen from the "Dashboard" screen 
	Then user selects "Change Country" from "Add New Device Dashboard" screen 
	And user should be displayed with the "Please confirm your country" screen 
	#When user selects <Country> from "Please confirm your country" screen
	When user inputs <Country> in "Search Text Field" in the "Please confirm your country" screen 
	And user should be displayed with the "Add New Device" screen 
	And <DAS> device should be displayed in Add New Device screen 
	And <HB> device should be displayed in Add New Device screen 
	And <D6> device should be displayed in Add New Device screen 
	And <T5> device should be displayed in Add New Device screen 
	And <T6 PRO> device should be displayed in Add New Device screen 
	And <WLD> device should be displayed in Add New Device screen 
	And <C1> device should be displayed in Add New Device screen 
	And <C2> device should be displayed in Add New Device screen 
	And <T6> device should be displayed in Add New Device screen 
	And <T6R> device should be displayed in Add New Device screen 
	And user should be displayed with the label "Showing devices for" along with <Country> name 
	
	Examples: 
		| Country							| DAS		| HB			| D6			| T5			| T6 PRO			| WLD		| C1			| C2			| T6			| T6R		|
		| Argentina							| NO DAS		| NO HB		| NO D6		| NO T5		| NO T6 PRO		| NO WLD		| YES C1		| YES C2		| NO T6		| NO T6R		|
		| Australia							| NO DAS		| NO HB		| NO D6		| NO T5		| NO T6 PRO		| YES WLD	| YES C1		| YES C2		| YES T6		| YES T6R	|
		| Austria							| NO DAS		| NO HB		| NO D6		| NO T5		| NO T6 PRO		| YES WLD	| YES C1		| YES C2		| YES T6		| YES T6R	|
		| Belgium                     		| NO DAS 	| NO HB		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Brazil                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| British Virgin Islands       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| NO C1 		| NO C2 		| YES T6 	| YES T6R 	| 
		| Bulgaria                     		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Canada                       		| YES DAS 	| YES HB 	| YES D6 	| YES T5 	| YES T6 PRO 	| YES WLD 	| YES C1 	| YES C2 	| NO T6		| NO T6R 	| 
		| Chile                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| China                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Colombia                     		| NO DAS 	| YES HB 	| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Costa Rica                   		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Czech Republic               		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6		| YES T6R 	| 
		| Denmark                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Dominican Republic           		| NO DAS 	| YES HB 	| YES D6 	| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Egypt                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R		| 
		| Estonia                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Finland                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| France                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Germany                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Greece                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Hungary                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| India                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Ireland                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Italy                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Japan                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Kenya                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Korea, Republic of           		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Latvia                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Lithuania                    		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Malaysia                     		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Mexico                       		| NO DAS 	| YES HB 	| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Minor Outlying Islands, U.S. 		| NO DAS 	| YES HB 	| NO D6 		| YES T5 	| YES T6 PRO 	| NO WLD 	| NO C1 		| NO C2 		| NO T6 		| NO T6R 	| 
		| Morocco                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2	 	| NO T6 		| NO T6R 	| 
		| Netherlands                  		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| New Zealand                  		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Norway                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Panama                       		| NO DAS 	| YES HB 	| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Peru                         		| NO DAS 	| YES HB 	| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Poland                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Portugal                     		| YES DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Puerto Rico                  		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| NO C1 		| NO C2 		| YES T6 	| YES T6R 	| 
		| Romania                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Saudi Arabia                 		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R		| 
		| Singapore                    		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Slovakia                    		| NO DAS		| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| South Africa                 		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| South Korea                  		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Spain                        		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Sweden                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Switzerland                  		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| Tunisia                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Turkey                       		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| U.S.Outlying Islands         		| NO DAS 	| NO HB 		| NO D6 		| YES T5 	| YES T6 PRO 	| NO WLD 	| NO C1 		| NO C2 		| NO T6 		| NO T6R 	| 
		| U.S.Virgin Islands           		| YES DAS 	| NO HB 		| NO D6 		| YES T5 	| YES T6 PRO 	| NO WLD 	| NO C1 		| NO C2 		| NO T6 		| NO T6R 	| 
		| Ukraine                      		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| United Arab Emirates         		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| NO WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| United Kingdom               		| NO DAS 	| NO HB 		| NO D6 		| NO T5 		| NO T6 PRO 		| YES WLD 	| YES C1 	| YES C2 	| YES T6 	| YES T6R 	| 
		| United States                		| YES DAS 	| YES HB 	| YES D6 	| YES T5 	| YES T6 PRO 	| YES WLD 	| YES C1 	| YES C2 	| NO T6 		| NO T6R 	| 
		| Virgin Islands, British      		| NO DAS 	| YES HB 	| NO D6 		| YES T5 	| YES T6 PRO 	| NO WLD 	| NO C1 		| NO C2 		| YES T6 	| YES T6R 	|