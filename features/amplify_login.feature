Feature: Login 
 	As an registered recruiter
 	I want to Login to my interview street account
 	So I can use the platform to potentially hire candidates

Background: 
 	Given I am at the Main page
 	And I click the Login button

Scenario Outline: Login with invalid crudentials
	When I enter the login using "<email>", "<password>"
	And I do not choose remember me
	And I press Login
    Then I should see the following error message on the login dropdown "<error_message>"
     
    Scenarios:   
    |  email               	 |  password |  error_message        							|	 
    |                      	 |  	     |  Please enter your registered e-mail address.   	|
    | 						 |  asdqwe   |  Please enter your registered e-mail address. 	|
    | ksross22+1@gmail.com   |  asdqwe   |  Login Failed. Please check username/password.   |
    | ksross22@gmail.com 	 |  	     |  Please enter a password.					    |

Scenario: Login with valid crudentials
  When I enter valid login crudentials
  And I choose remember me
  And I press Login
  Then I am succesfully logged into my account
  And I am redirected to the dashboard