class UserMailer < ActionMailer::Base
  default from: "campusgps@gmail.com"
  
  def welcome_email(user)
  	@user = user
  	@url = 'https://www.campusgps.com'
  	mail(to: @user.email, subject: 'Welcome to Campus GPS')
  end
end
