class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?
  before_action :set_locale

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  

  def set_locale
    I18n.locale = locale
  end
    
  private
  def locale
      @locale ||= params[:locale] ||= I18n.default_locale
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger]="Please log in."
      redirect_to login_url
    end
  end
  
end
