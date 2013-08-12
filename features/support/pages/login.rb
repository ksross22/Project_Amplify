#!/usr/bin/ruby


require 'rubygems'
require 'watir-webdriver'

class LoginPage

	#Using libraries
  	include PageObject
  	include DataMagic

  	#Web elements used in the login feature
  	a(:login_button, :id => 'login_button')
  	text_field(:email, :id => 'email')
  	text_field(:password, :id => 'password')
  	checkbox(:remember, :id => 'rememberme')
  	a(:reset, :id => 'reset_password')
  	button(:login_submit, :id => 'login_action')
  	a(:all_tests, :class => 'bread-crumb-link')

  	#Login to page
  	def login_dropdown
  		login_button
  	end

  	def login_submit_button
  		login_submit
  	end

  	#populate data using DataMagic for login
  	def input_login_data(data = {})
		populate_page_with data_for(:login_page, data)
	end

	#insert email address into email field
	def insert_email(email_input)
		self.email = email_input
	end

	#insert a password into password field
	def insert_password(password_input)
		self.password = password_input
	end

	#check remember me for login
	def remember_me(choice)
		if choice == 'yes'
			check_remember
		elsif choice == 'no'
			uncheck_remember
		end
	end

	#choose to reset password
	def reset_password
		reset
	end

	#Succesfully logged in
	def login_success
		@browser.text.include? "Login Sucess"
		sleep 5
	end

	def redirect_success
		@browser.send_keys :escape
		fail unless all_tests?
		sleep 2
	end

end