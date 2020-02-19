@LyricLoginToApplication
Feature: Login To Lyric Application, As a user I want to login to the lyric application

@LoginToApplication
Scenario: As a user I want to login to the lyric application
When user launches and logs in to the Lumina application

@VerifySplashScreen
Scenario: As a user I want to verify splash screen of lumina 
When user launch the application
Then user should be displayed with the "SPLASH" screen