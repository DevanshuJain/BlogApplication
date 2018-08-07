class ApplicationController < ActionController::Base
 	before_action :authenticate_user!, except: :index
 	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :mobile_no, :avatar, user_address_attributes: [:address, :city, :pin_no]])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :mobile_no, :avatar, user_address_attributes: [:address, :city, :pin_no]])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:address,:avatar])
  end
end
