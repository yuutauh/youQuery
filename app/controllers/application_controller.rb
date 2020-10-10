class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_update_path_for(resource)
      roots_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :profile, :avatar]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
  end

end
