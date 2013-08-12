Given(/^I am at the Main page$/) do
  visit_page(RegistrationPage)
end

Given(/^I want to Sign up for the service$/) do
  on_page(RegistrationPage).sign_up_top
end

When(/^I am on the Registration page$/) do
  on_page(RegistrationPage).on_signup_page
end

When(/^I submit registration form with $/) do |table|
  data = table.hashes
  data.each do |row|
    on_page(RegistrationPage).input_registration_data(row)
  end
end

When(/^I submit registration form with random data$/) do
    on_page(RegistrationPage).input_registration_data()
end

When(/^I press sign up$/) do
  on_page(RegistrationPage).sign_up
end

Then(/^I am succesfully Registered for a free account$/) do
  on_page(RegistrationPage).registration_success
end

Then(/^I should see the following error message on the registration page "(.*?)"$/) do |error_message|
  on_page(RegistrationPage).verify_error_message(error_message)
end

Then(/^I should see the following error message on the registration page <error_message>$/) do
  on_page(RegistrationPage).verify_error_message(error_message)
end

When(/^I update the registration form using "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |email, password, name, company, number|
  on_page(RegistrationPage).add_email(email)
  on_page(RegistrationPage).add_password(password)
  on_page(RegistrationPage).add_name(name)
  on_page(RegistrationPage).add_company(company)
  on_page(RegistrationPage).add_number(number)
end


