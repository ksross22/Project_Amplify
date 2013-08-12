#!/usr/bin/ruby


require 'rubygems'
require 'watir-webdriver'

class RegistrationPage

	#Using libraries
  	include PageObject
  	include DataMagic

  	#Web-elements found on Main page and Sign up page
	li(:sign_up_main, :class => 'button-green rcorners_right', :index => 1)
	a(:sign_up_free, :class => 'button-green btn_large rcorners', :index => 0)
	li(:home, :class => 'nav_active')
	text_field(:email, :id => 'inputEmail')
	text_field(:password, :id => 'inputPassword')
	text_field(:name, :id => 'inputFirstName')
	text_field(:number, :id => 'inputNumber')
	text_field(:company, :id => 'inputCompany')
	button(:sign_up_submit, :name => 'signup_button')
	div(:error_img, :class => 'tb_img_error')
	div(:error, :class => 'fltlft validation')

	#Starting URL
	page_url("http://www.interviewstreet.com/")

	#checks if user is on home page
	def on_home_page
		fail unless home_element.include? "Home"
	end

	#Clicks sign up button on top right screen
	def sign_up_top
		sign_up_free
	end

	#Clicks sign up button on bottom of screen
	def sign_up_bottom
		sign_up_main
	end

	#Checks to make sure on registration page
	def on_signup_page
		fail unless email?
	end

	#Populates Registration using DataMagic for randomized data
	def input_registration_data(data = {})
		populate_page_with data_for(:registration_page, data)
	end

	#Populates email field
	def add_email(email_address)
		self.email = email_address
		#$stdout.print "Email addres: #{email_address}"
	end

	#Populates password field 
	def add_password(pass)
		self.password = pass
		#$stdout.print "Password: #{pass}"
	end

	#Populates Full Name field 
	def add_name(fullname)
		self.name = fullname
		#$stdout.print "Full Name: #{fullname}"
	end

	#Populates company field 
	def add_company(company_name)
		self.company = company_name
		#$stdout.print "Company Name: #{company_name}"
	end

	#Populates Phone Number field 
	def add_number(phone_number)
		self.number = phone_number
		#$stdout.print "Phone Number: #{phone_number}"
	end

	#Clicks sign up button to submit registration data
	def sign_up
		sign_up_submit_element.click
	end

	#Verify error messages on Registration Page
	def verify_error_message(error_message)
		@browser.text.include? error_message
	end

	#Validates Registration Success
	def registration_success
		while @browser.text.include? "Validating"
			sleep 1
		end
		fail unless @browser.text.include? "To get started"
	end

end