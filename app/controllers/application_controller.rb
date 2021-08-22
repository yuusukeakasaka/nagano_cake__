class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
      admin_items_path(resource)
  end

  before_action :authenticate_admin!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
