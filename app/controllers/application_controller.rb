class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    greet_user(resource)
    resource.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name])
  end

  def default_url_options
    { lang: (I18n.locale unless I18n.locale == I18n.default_locale) }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def greet_user(user)
    flash.notice = "Hello, #{user.name} #{user.last_name}!" unless user.name.empty? && user.last_name.empty?
  end
end
