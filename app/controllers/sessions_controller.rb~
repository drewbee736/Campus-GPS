class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_index_url
    else
      redirect_to sessions_new_url, alert:"Invalid user/password combination"
    end
  end

  def destroy
  	UserMailer.welcome_email(User.current_user).deliver
    session[:user_id] = nil
    redirect_to admin_index_url, notice:"Logged out"
  end
end
