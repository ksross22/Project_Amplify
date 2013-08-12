Feature: Settings 
  As an a registered recruiter
  I want to view and modify my settings for my interview street account
  So I can use the platform with proper settings

Background: 
  Given I am at the Main page
  And I click the Login button
  When I enter valid login crudentials
  And I press Login
  And I am succesfully logged into my account
  And I am redirected to the dashboard
  Then I click settings
  And I am on settings page


Scenario: Update and verify contact info changes
	When I update contact info form with:
    |  name      |  company       |   phone         | send_invite_as  |  
    |  Kimberly  |  New Company   |   987-654-3210  | THE hiring team |
	And I set my country to "United States"
  And I set my timezone to "New_York"
  And I press save
  Then I should see the contact info populated with:
    |   email            |  name      |  company       |   phone         | send_invite_as  |  
    | ksross22@gmail.com |  Kimberly  |  New Company   |   987-654-3210  | THE hiring team |     

Scenario: Upload a Company logo
  Then I upload my company logo

Scenario: Turn on all Excel report preferences
  When I go to report preferences
  Then I turn on Show scores for every question
  And I turn on detailed coding question anylsis
  And I turn on show canidate feedback for excel
  And I save Report Settings

Scenario: Turn off all Excel report preferences
  When I go to report preferences
  Then I turn off Show scores for every question
  And I turn off detailed coding question anylsis
  And I turn off show canidate feedback for excel
  And I save Report Settings

Scenario: Turn on all PDF report preferences
  When I go to report preferences
  Then I turn on show all attemps of questions
  Then I turn on show candidate feedback for pdf
  Then I turn on show output for coding questions
  And I save Report Settings

Scenario: Turn off all PDF report preferences
  When I go to report preferences
  Then I turn off show all attemps of questions
  Then I turn off show candidate feedback for pdf
  Then I turn off show output for coding questions
  And I save Report Settings

Scenario: Turn on Email Notifications
  When I go to Email Notifcation Settings
  And I turn on email notifications
  Then I save email notification settings
  And I see that Email Notifcations is turned on

Scenario: Turn off Email Notifications
  When I go to Email Notifcation Settings
  And I turn off email notifications
  Then I save email notification settings
  And I see that Email Notifcations is turned off

Scenario: Change Password
  When I go to Change Password Settings
  And I change my password
  Then I save password changes
