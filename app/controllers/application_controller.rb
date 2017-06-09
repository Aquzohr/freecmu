class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end 

  def current_user
	  @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
	  #@current_ability = Ability.new(@current_user)
	  #puts @current_ability

	  @current_user
	end
  helper_method :current_user
end
