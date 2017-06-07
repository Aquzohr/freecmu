class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  def set_locale
  	I18n.locale = params[:locale]
  end

  	def current_user
	  @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
	end
    
	helper_method :current_user

end
