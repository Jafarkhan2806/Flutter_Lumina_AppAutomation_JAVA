@SpotlightiOSfeature @Platform
Feature: Spotlight feature iOS implementation to search induvisual solutions and navigates to repspective solution when user selects  
As a user I want to verify Respective solution displayed when iuser selects solution from spotlight option

#Requirement : with out login
@Spotlightwithoutlogin							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with out login
Given user launches the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should not be displayed with <Location> details
Examples: 
|Location|
|Home|

#Requirement : With location without solution
@Spotlightwithlocationwithoutsolution							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with location without solucation
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should not be displayed with <Location> details
Examples: 
|Location|
|Home|

#Requirement : with out location
@Spotlightwithoutlocation							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with out location
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should not be displayed with <Location> details
Examples: 
|Location|
|Home|

#Requirement : with location with solutions spotlight solution search
@Spotlightwithlocationwithsolutionsspotlightsolutionsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight ith location with solutions spotlight solution search
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Solution>
And user should be displayed with <Solution> details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera |
|Home| C1 camera |
|Home| C2 camera |
|Home| JasperNA |
|Home| HB |
|Home| Spruce |
|Home| WLD |
|Home2| EMEA |

#Requirement : with location with solutions spotlight location search US
@SpotlightwithlocationwithsolutionsspotlightlocationsearchUS							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with location with solutions spotlight location search US
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should be displayed with below <Solutions> details:
|Solutions details|
| Security |
| DAS Camera |
| C1 Camera |
| C2 Camera |
| JasperNA  |
| HB |
| Spruce | 
| WLD |
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera | 
|Home| C1 Camera |
|Home| C2 Camera |
|Home| JasperNA |
|Home| HB |
|Home| Spruce |
|Home| WLD |

#Requirement : with location with solutions spotlight location search UK
@SpotlightwithlocationwithsolutionsspotlightlocationsearchUK							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with location with solutions spotlight location search UK
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should be displayed with below <Solutions> details:
|Solutions details|
| Security |
| DAS Camera EMEA |
| C1 Camera EMEA |
| C2 Camera EMEA |
| JasperEMEA  |
| WLD EMEA|
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Location| Solution |
|HomeEMEA| Security |
|HomeEMEA| DAS Camera EMEA | 
|HomeEMEA| C1 Camera EMEA |
|HomeEMEA| C2 Camera EMEA |
|HomeEMEA| JasperEMEA |
|HomeEMEA| WLD EMEA |

#Requirement : With multi location with out solution, spotlight location search- one location UK and another location US
@SpotlightwWithmultilocationwithoutsolutionspotlightlocationsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight With multi location with out solution spotlight location search one location UK and another location US
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Location>
And user should not be displayed with <Location> details
Examples: 
|Location|
|Home|
|HomeEMEA |

#Requirement : with multi location with solution, spotlight location search US
@SpotlightWithmultilocationwithoutsolutionspotlightlocationsearchUS							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with multi location with solution, spotlight location search US
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the "Home"
And user should be displayed with below <Solutions> details:
|Solutions details|
| Security |
| DAS Camera |
| C1 Camera |
| C2 Camera |
| JasperNA  |
| HB |
| Spruce | 
| WLD |
And user should be displayed with "Honeywell" icon
And user should be displayed with "<Location>" Details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Solution |
| Security |
| DAS Camera |
| C1 Camera |
| C2 Camera |
| JasperNA  |
| HB |
| Spruce | 
| WLD |

#Requirement : with multi location with solution, spotlight location search UK
@SpotlightWithmultilocationwithoutsolutionspotlightlocationsearchUK							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with multi location with solution, spotlight location search UK
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
When user should be displayed with "HomeEMEA" Details
Then user should be displayed with below <Solutions EMEA> details:
|Solutions details EMEA|
| Security |
| DAS Camera EMEA |
| C1 Camera EMEA |
| C2 Camera EMEA |
| JasperEMEA  |
| WLD EMEA|
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Solution |
| Security |
| DAS Camera EMEA |
| C1 Camera EMEA |
| C2 Camera EMEA |
| JasperEMEA  |
| WLD EMEA|

#Requirement : with multi location with solution, spotlight solution search
@Spotlightwithmultilocationwithsolutionspotlightsolutionsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with multi location with solution, spotlight solution search
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Solution>
And user should be displayed with <Solutions> details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solutions>
Then user should be navigates to respecive <Solutions> Soluction card
Examples: 
|Location|Solutions |
|Home | Security |
|Home | DAS Camera |
|Home | C1 Camera |
|Home | C2 Camera |
|Home | JasperNA  |
|Home | HB |
|Home | Spruce | 
|Home | WLD |
|HomeEMEA | Security |
|HomeEMEA | DAS Camera EMEA |
|HomeEMEA | C1 Camera EMEA |
|HomeEMEA | C2 Camera EMEA |
|HomeEMEA | JasperEMEA  |
|HomeEMEA | WLD EMEA|

#Requirement : With multi location with same solution name, spotlight solution search (Location name to validate)
@SpotlightWithmultilocationwithsamesolutionnamespotlightsolutionsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight With multi location with same solution name, spotlight solution search (Location name to validate)
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Solution>
And user should be displayed with <Solution> details #should display two honeywell icon and with different location details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution>
Then user should be navigates to respecive <Solution> Soluction card
Examples: 
|Location|Solutions |
|Home | Security |
|Home | DAS Camera |
|Home | C1 Camera |
|Home |Home | C2 Camera |
|Home | Jasper |
|Home | HB |
|Home | Spruce | 
|Home | WLD |
|Home1 | Security |
|Home1 | DAS Camera |
|Home1 | C1 Camera |
|Home1 | C2 Camera |
|Home1 | Jasper  |
|Home1 | WLD |

#Requirement : With location with solution, after 12 hours spotlight location search (PIN validation)
@SpotlightWithlocationwithsolutionAfter12hoursspotlightlocationsearchPINvalidation							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight With location with solution, after 12 hours spotlight location search (PIN validation)
Given user launches and logs in to the Lyric application 
When user minimize the app #Wait for 12 hours 
Then user navigates to "Spotlight"
And user search for the <Location>
And user should be displayed with below <Solutions> details:
|Solutions details|
| Security |
| DAS Camera |
| C1 Camera |
| C2 Camera |
| JasperNA  |
| HB |
| Spruce | 
| WLD |
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution>
Then user should be navigates to "PIN Entry" screen
And user entered invalid PIN
And user entered valid PIN
And user should be navigates to respective <solution>
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera |
|Home| C1 Camera |
|Home| C2 Camera |
|Home| JasperNA  |
|Home| HB |
|Home| Spruce | 
|Home| WLD |
|Home|Home|

#Requirement : With location with solution, after 12 hours spotlight solution search (Finger print validation)
@SpotlightWithlocationwithsolutionafter12hoursspotlightsolutionsearchFingerprintvalidation							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight With location with solution, after 12 hours spotlight solution search (Finger print validation)
Given user launches and logs in to the Lyric application 
When user minimize the app #Wait for 12 hours 
Then user navigates to "Spotlight"
And user search for the <Location>
And user should be displayed with below <Solutions> details:
|Solutions details|
| Security |
| DAS Camera |
| C1 Camera |
| C2 Camera |
| JasperNA  |
| HB |
| Spruce | 
| WLD |
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution>
Then user should be navigates to "FingerPint"" screen
And user validate with wrong fingerprint
And user validate with valid fingerprint
And user should be navigates to respective <solution>
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera |
|Home| C1 Camera |
|Home| C2 Camera |
|Home| JasperNA  |
|Home| HB |
|Home| Spruce | 
|Home| WLD |

#Requirement : with location with solutions spotlight solution search Kill app
@Spotlightwithlocationwithsolutionsspotlightsolutionsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with location with solutions spotlight solution search Kill app
Given user launches and logs in to the Lyric application
When user kill the app
Then user navigates to "Spotlight"
And user search for the <Solution>
And user should be displayed with <Solution> details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> details
When user selects the <Solution> 
Then user should be navigates to respective <Solution> Solution card
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera |
|Home| C1 camera |
|Home| C2 camera |
|Home| JasperNA |
|Home| HB |
|Home| Spruce |
|Home| WLD |
|Home2| EMEA |


#Requirement : with location with solutions, logout spotlight solution search
@Spotlightwithlocationwithsolutionslogoutspotlightsolutionsearch							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight with location with solutions spotlight solution search Kill app
Given user launches and logs in to the Lyric application
When user logout the app
Then user navigates to "Spotlight"
And user search for the <Solution>
And user should not be displayed with <Solution> details
And user should not be displayed with "Honeywell" icon
And user should not be displayed with <Location> details
Examples: 
|Location| Solution |
|Home| Security |
|Home| DAS Camera |
|Home| C1 camera |
|Home| C2 camera |
|Home| JasperNA |
|Home| HB |
|Home| Spruce |
|Home| WLD |
|Home2| EMEA |

#Requirement : With multi location with same solution name, spotlight solution search (Location name to validate) and second location invited
@SpotlightWithmultilocationwithsamesolutionnamespotlightsolutionsearchuserInvited							@NotAutomatable
Scenario Outline: As a user wanted to verify spotlight With multi location with same solution name, spotlight solution search (Location name to validate)
Given user launches and logs in to the Lyric application
When user navigates to "Spotlight"
Then user search for the <Solution>
And user should be displayed with <Solution> details #should display two honeywell icon and with different location details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution>
Then user should be navigates to respecive <Solution> Soluction card
Examples: 
|Location|Solutions |
|Home | Security |
|Home | DAS Camera |
|Home | C1 Camera |
|Home |Home | C2 Camera |
|Home | Jasper |
|Home | HB |
|Home | Spruce | 
|Home | WLD |
|Home1 | Security |
|Home1 | DAS Camera |
|Home1 | C1 Camera |
|Home1 | C2 Camera |
|Home1 | Jasper  |
|Home1 | WLD |

@NavigationToSolutionCardWithCoachMarks
Scenario Outline: As a user wanted to verify if Coach marks is displayed when navigated from Spotlight
Given user launches and logs in to the Lyric application without closing the coach marks
When user navigates to "Spotlight"
Then user search for the <Solution>
And user should be displayed with <Solution> details #should display two honeywell icon and with different location details
And user should be displayed with "Honeywell" icon
And user should be displayed with <Location> Details
When user selects the <Solution>
Then user should be navigates to respecive <Solution> Soluction card
And solution card screen should be displayed with respective coach marks
Examples: 
|Location|Solutions |
|Home | Security |
|Home | DAS Camera |
|Home | C1 Camera |
|Home |Home | C2 Camera |
|Home | Jasper |
|Home | HB |
|Home | Spruce | 
|Home | WLD |
|Home1 | Security |
|Home1 | DAS Camera |
|Home1 | C1 Camera |
|Home1 | C2 Camera |
|Home1 | Jasper  |
|Home1 | WLD |
