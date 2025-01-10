class ApplicationController < ActionController::Base
  # stops CSRF token verification for JSON requests
  protect_from_forgery unless: -> { request.format.json? }, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Also permit the user_name and user_role parameters for sign up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name user_role])
    # Also permit the user_name parameter for account update
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name])
  end
end
