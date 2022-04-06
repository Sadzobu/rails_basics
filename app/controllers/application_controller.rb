class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    greet_user(current_user)
    current_user.is_a?(Admin) ? admin_tests_path : stored_location_for(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name])
  end

  private

  def greet_user(user)
    flash.notice = "Hello, #{user.name} #{user.last_name}!" unless user.name.empty? && user.last_name.empty?
  end
end
