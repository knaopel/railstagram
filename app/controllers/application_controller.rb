class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def layout_by_resource
    return 'authentication' if devise_controller? && action_name != 'edit'

    'application'
  end

  protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username, :full_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :username, :full_name])
  end
end
