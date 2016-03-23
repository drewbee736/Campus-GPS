class ApplicationController < ActionController::Base
  before_filter :authorize
	around_filter :set_current_user
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_current_user
  	User.current_user = User.find_by_id(session[:user_id])
  	yield
  ensure
  	User.current_user = nil
  end
  
  protected
  
  	def authorize
  		unless User.find_by_id(session[:user_id])
  			redirect_to root_url, notice: "Please log in"
  		end
  	end
end
