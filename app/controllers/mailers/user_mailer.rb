class UserMailer < ActionMailer::Base
	default :from => "brandeiscampusgps@gmail.com"
	
	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
