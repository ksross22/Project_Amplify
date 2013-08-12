#

Given(/^I update yml file$/) do
	on_page(SettingsPage).test_test
end

Then(/^I click settings$/) do
  on_page(SettingsPage).go_to_settings
end

Then(/^I am on settings page$/) do
  on_page(SettingsPage).on_settings_page
end

When(/^I update contact info form with:$/) do |table|
	data = table.hashes
  	data.each do |row|
    	on_page(SettingsPage).modify_settings_data(row)
  	end
end

When(/^I set my country to "(.*?)"$/) do |country|
  on_page(SettingsPage).update_country(country)
end

When(/^I set my timezone to "(.*?)"$/) do |zone|
  on_page(SettingsPage).update_country(zone)
end

When(/^I press save$/) do
  	on_page(SettingsPage).save_basic_settings
end

Then(/^I should see the contact info populated with:$/) do |table|
	on_page(SettingsPage).verify_updated_data table.hashes.first
end

Then(/^I upload my company logo$/) do
  	on_page(SettingsPage).upload_image
end

When(/^I go to report preferences$/) do
  	on_page(SettingsPage).go_to_report_preference
end

Then(/^I turn on Show scores for every question$/) do
  	on_page(SettingsPage).choose_excel_scores('yes')
end

Then(/^I turn on detailed coding question anylsis$/) do
 	on_page(SettingsPage).choose_excel_analysis('yes')
end

Then(/^I turn on show canidate feedback for excel$/) do
	on_page(SettingsPage).choose_excel_feedback('yes')
end

Then(/^I save Report Settings$/) do
  	on_page(SettingsPage).save_report_settings
end

Then(/^I turn off Show scores for every question$/) do
  	on_page(SettingsPage).choose_excel_scores('no')
end

Then(/^I turn off detailed coding question anylsis$/) do
  	on_page(SettingsPage).choose_excel_analysis('no')
end

Then(/^I turn off show canidate feedback for excel$/) do
  	on_page(SettingsPage).choose_excel_feedback('no')
end

Then(/^I turn on show all attemps of questions$/) do
  	on_page(SettingsPage).choose_pdf_attempts('yes')
end

Then(/^I turn on show candidate feedback for pdf$/) do
  	on_page(SettingsPage).choose_pdf_output('yes')
end

Then(/^I turn on show output for coding questions$/) do
  	on_page(SettingsPage).choose_pdf_feedback('yes')
end

Then(/^I turn off show all attemps of questions$/) do
  	on_page(SettingsPage).choose_pdf_attempts('no')
end

Then(/^I turn off show candidate feedback for pdf$/) do
  	on_page(SettingsPage).choose_pdf_output('no')
end

Then(/^I turn off show output for coding questions$/) do
  	on_page(SettingsPage).choose_pdf_feedback('no')
end

Then(/^I see that Email Notifcations is turned on$/) do
  	on_page(SettingsPage).email_notification_status('on')
end

Then(/^I see that Email Notifcations is turned off$/) do
  	on_page(SettingsPage).email_notification_status('off')
end

When(/^I go to Email Notifcation Settings$/) do
	on_page(SettingsPage).go_to_email_notification
end

When(/^I turn on email notifications$/) do
	on_page(SettingsPage).email_setting('on')
end

Then(/^I save email notification settings$/) do
	on_page(SettingsPage).save_notification_settings
end

When(/^I turn off email notifications$/) do
	on_page(SettingsPage).email_setting('on')
end

When(/^I go to Change Password Settings$/) do
  on_page(SettingsPage).go_to_password
end

When(/^I change my password$/) do
  on_page(SettingsPage).input_password_data()
end

Then(/^I save password changes$/) do
  on_page(SettingsPage).password_submit
end