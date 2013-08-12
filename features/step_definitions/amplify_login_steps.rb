Given(/^I click the Login button$/) do
  	on_page(LoginPage).login_dropdown
end

When(/^I enter the login using "(.*?)", "(.*?)"$/) do |email, password|
  	on_page(LoginPage).insert_email(email)
  	on_page(LoginPage).insert_password(password)
end

When(/^I press Login$/) do
  	on_page(LoginPage).login_submit_button
end

Then(/^I should see the following error message on the login dropdown "(.*?)"$/) do |error_message|
 	on_page(RegistrationPage).verify_error_message(error_message)
end

When(/^I enter valid login crudentials$/) do
    on_page(LoginPage).input_login_data()
end

When(/^I choose remember me$/) do
	on_page(LoginPage).remember_me("yes")
end

When(/^I do not choose remember me$/) do
	on_page(LoginPage).remember_me("no")
end

Then(/^I am succesfully logged into my account$/) do
	on_page(LoginPage).login_success
end

And(/^I am redirected to the dashboard$/) do
	on_page(LoginPage).redirect_success
end
