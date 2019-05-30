class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def new
    @user = User.new
    super
  end

  protected
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end 