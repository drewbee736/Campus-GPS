class UserMailer < ActionMailer::Base
  default from: "campusgps@gmail.com"
  
  def welcome_email(user)
  	@user = user
  	@url = 'https://www.campusgps.com'
  	mail(to: @user.email, subject: 'Welcome to Campus GPS')
  end
  
  def directions_email(user, results)
  	@user = user
  	@results = results
  	mail(to: @user.email, subject: 'Your directions')
  end
end
