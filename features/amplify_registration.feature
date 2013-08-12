Feature: Registration 
  As an interested recruiter
  I want to register for an interview street account
  So I can use the platform to potentially hire candidates

Background: 
  Given I am at the Main page

Scenario Outline: register contact with invalid details
	And I want to Sign up for the service
	When I update the registration form using "<email>", "<password>", "<name>", "<company>", "<phone>"
    Then I should see the following error message on the registration page "<error_message>"
     
    Scenarios:   
    |  email               	 |  password |  name  |  company 	|		phone 		| error_message        				|	 
    |                      	 |  asdqwe   |  Kim  	| 	Test	|	123-456-7890   	| Email Address is required   		|
    | ksross22+1@gmail.com   |           |  Kim  	|   Test    | 	123-456-7890   	| Password is required 				|
    | ksross22+1@gmail.com   |  asdqwe   |    		|   Test    | 	123-456-7890   	| First name is required     		|
    | ksross22+1@gmail.com   |  asdqwe   |  Kim  	| 			| 	123-456-7890   	| Company is required    			|
    | ksross22+1@gmail.com   |  asdqwe   |  Kim  	|   Test    |    				| Phone Number is required    		|
    | ksross22@gmail.com   	 |  asdqwe   |  Kim  	|   Test    | 	123-456-7890   	| This email is already registered 	|


Scenario: Register Contact with valid details thats
  And I want to Sign up for the service
  When I am on the Registration page
  When I submit registration form with random data
  And I press sign up
  Then I am succesfully Registered for a free account