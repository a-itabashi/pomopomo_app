class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def new
    @user = User.new
    super
  end

  protected
  
  def update_resource(resource, params)
    params["password"] = current_user.encrypted_password unless params["password"]
    resource.update(params)
  end
end