class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :locale)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :locale)}
  end

  def set_locale
    # I18n.locale = user_signed_in? ? (current_user.locale.nil? ? :en : current_user.locale.to_sym) : :en
    I18n.locale = user_signed_in? ? current_user.locale.to_sym : :en
  end
end
