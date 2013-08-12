require 'rubygems'
require 'watir-webdriver'
require 'yaml' 


class SettingsPage

	#Using libraries
  	include PageObject
  	include DataMagic

  	#Main Elements
  	a(:navigation, :class => 'dropdown-toggle')
  	a(:settings_link, :id => 'link_settings')

  	#basic settings elements
  	a(:basic_settings, :id =>'settings')
  	text_field(:email_field, :class => 'span5', :index => 0)
  	text_field(:name_field, :class => 'span5', :index => 1)
  	text_field(:company_field, :class => 'span5', :index => 2)
  	text_field(:contact_field, :class => 'span5', :index => 3)
  	text_field(:send_as_field, :class => 'span5', :index => 4)
  	text_field(:country_value, :class => 'select2-input', :index => 0)
  	a(:country_field, :class => 'select2-choice', :index => 0)
  	text_field(:timezone_field, :class => 'select2-input', :index => 1)
  	a(:timezone_field, :class => 'select2-choice', :index => 1)
  	a(:save_basic, :class => 'btn btn-success basic-submit')
  	a(:upload_logo, :class => 'btn uploadLogo')
  	file_field(:filefield, :name => 'logo_file')
  	a(:upload, :class => 'btn btn-primary upload-logo')
  	
  	#report preference elements
  	a(:report_pref, :href => '#settings/report')

  	span(:switch_action_on, :class => 'switch-left')
  	span(:switch_action_off, :class => 'switch-right')

  	div(:switch_status_on, :class => 'switch-on')
  	div(:switch_status_off, :class => 'switch-off')

  	a(:save_report, :class => 'btn btn-success report-submit')
  	
  	#email notification elements
  	a(:email_notification, :href => '#settings/email')
  	radio_button(:no_email, :name => 'notification', :value => '0')
  	radio_button(:yes_email, :name => 'notification', :value => '2')
  	a(:save_email, :class => 'btn btn-success email-submit')

  	#change password elements
	a(:change_password, :href => '#settings/password')
  	text_field(:old_password, :name => 'oldPassword')
  	text_field(:new_password, :name => 'newPassword')
  	text_field(:confirm_password, :name => 'confirmNewPassword')
  	a(:save_password, :class => 'btn btn-success password-submit')

  	################################
  	#########BASIC SETTINGS#########
  	################################

  	#Go to settings
  	def go_to_settings
  		navigation_element.click
  		settings_link
  	end

  	#verify the data entered matches data displayed
  	def verify_updated_data(data)
  		self.email_field.should == data['email']
  		self.name_field.should == data['name']
  		self.company_field.should == data['company']
  		self.contact_field.should == data['phone']
  		self.send_as_field.should == data['send_invite_as']
  	end

  	#modify the data in settings
  	def modify_settings_data(data)
  		update_name data['name']
  		update_company data['company']
  		update_number data['phone']
  		update_send_as data['send_invite_as']
  	end

  	#save basic settings
  	def save_basic_settings
  		save_basic
  		while @browser.text.include? "Saving"
  			sleep 1
  		end
  	end

  	#Verify on settings page
  	def on_settings_page
  		fail unless basic_settings?
  		basic_settings
  		while !email_field?
  			sleep 1
  		end
  	end

  	#update the name field in settings
  	def update_name(name)
  		self.name_field = name
  	end

  	#update the company field in settings
  	def update_company(company)
  		self.company_field = company
  	end

  	#update the contact field in settings
  	def update_number(phone)
  		self.contact_field = phone
  	end

  	#update the send invite as field in settings
  	def update_send_as(send_invite_as)
  		self.send_as_field = send_invite_as
  	end

  	#update the country field in settings
  	def update_country(country)
  		self.country_value = country
  		@browser.send_keys :return
  	end

  	#update the timezone field in settings
  	def update_timezone(zone)
  		self.timezone_value = zone
  		@browser.send_keys :return
  	end

  	#upload image for company logo
  	def upload_image
  		DataMagic.load('default.yml')
      	file_path = DataMagic.yml["upload_files"]
  		upload_logo
  		sleep 5
  		filefield_element.set(Dir.pwd + file_path["logo_file"])
  		upload
  		while @browser.text.include? "Loading"
  			sleep 1
  		end
  		sleep 2
  	end

  	##################################
  	########REPORT SETTINGS###########
  	##################################

  	def go_to_report_preference
  		report_pref
  		sleep 5
 		fail unless @browser.text.include? "Excel"
 		
  	end

  	#turn on/off show scores for every question (excel)
  	def choose_excel_scores(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 0).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 0).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 0).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 0).click
  			end
  		end
  	end

  	#turn on/off show detailed coding question analysis (excel)
  	def choose_excel_analysis(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 1).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 1).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 1).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 1).click
  			end
  		end
  	end
  	#turn on/of show candidate feedback (excel)
  	def choose_excel_feedback(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 2).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 2).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 2).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 2).click
  			end
  		end
  	end

  	#turn on/off show all attempts of questions (pdf)
  	def choose_pdf_attempts(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 3).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 3).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 3).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 3).click
  			end
  		end
  	end

  	#turn on/off show candidate feedback (pdf)
  	def choose_pdf_output(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 4).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 4).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 4).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 4).click
  			end
  		end
  	end

  	#turn on/off show output for coding questions (pdf)
  	def choose_pdf_feedback(option)
  		if option == 'yes'
  			if @browser.div(:class => 'switch has-switch', :index => 5).div(:class => 'switch-off').exists?
  				@browser.span(:class => 'switch-left', :index => 5).click
  			end
  		elsif option == 'no'
  			if @browser.div(:class => 'switch has-switch', :index => 5).div(:class => 'switch-on').exists?
  				@browser.span(:class => 'switch-right', :index => 5).click
  			end
  		end
  	end

  	def save_report_settings
  		i=0
  		save_report
  		while @browser.text.include? "Saving"
  			sleep 1
  		end
  		if @browser.text.include? "Saved"
  			sleep 1
  		else
  			while @browser.text.include? "Failed! Try Again"
  				save_report
  				while @browser.text.include? "Saving"
  					sleep 1
  					i+=1
  				end
  				if i == 60
  					$stdout.print "Saving Report Preferences Failed, Please check internet settings"
  					fail
  				end
  			end
  		end
  	end

  	####################################
  	#########Email Notification#########
  	####################################

  	def go_to_email_notification
  		email_notification
  		while @browser.text.include? "Loading"
  			sleep 1
  		end
 		fail unless @browser.text.include? "Email"
  	end

  	#depending on the feature, the email notification setting will be turned on or off
  	def email_setting(option)
  		if option == 'on'
  			select_yes_email
  		elsif option == 'of'
  			select_no_email
  		end
  	end

  	#returns selected email setting for verification
  	def email_notification_status(option)
  		if option == 'on'
  			yes_email_selected?
  		elsif option == 'off'
  			no_email_selected?
  		end
  	end

  	#saves email settings
  	def save_notification_settings
  		save_email
  		while @browser.text.include? "Saving"
  			sleep 1
  		end
  	end

  	####################################
  	##########Change Password###########
  	####################################

  	def go_to_password
  		change_password
  		while @browser.text.include? "Loading"
  			sleep 1
  		end
  		fail unless @browser.text.include? "Old Password"
  	end

  	#inputs and updates yml file for randomly generated password for login
  	def input_password_data(data = {})
		p_data = populate_page_with data_for(:password_page, data)
		self.confirm_password = p_data['new_password']
		$stdout.print p_data['new_password']
		
		DataMagic.load('default.yml')
		file_path = DataMagic.yml["yaml_file"]

		d = YAML::load_file(Dir.pwd + file_path["file_name"]) #Load
		d['password_page']['old_password'] = p_data['new_password'] #Modify
    d['login_page']['password'] = p_data['new_password'] #Modify
		File.write(Dir.pwd + file_path["file_name"], d.to_yaml) #Store
	end

	#save new password
	def password_submit
		save_password
		while @browser.text.include? "Saving"
			sleep 1
		end
	end
 end