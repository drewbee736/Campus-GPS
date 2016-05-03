class UserMailer < ActionMailer::Base
  default from: "brandeiscampusgps@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'https://www.campusgps.com'
  	mail(to: @user.email, subject: 'Welcome to Campus GPS')
  end

  def directions_email(user, str)
  	@user = user
  	@str = str
		print "!!!!!!!!!!!!!!!!!!!!! ", @user.email
  	mail(to: @user.email, subject: 'Your directions')
  end
end
