class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    musics_index_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :admin, :avatar, :image_url])
  end

end
