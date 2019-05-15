class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

  protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # ログイン時に新規登録画面に飛んだら、musics/indexに飛ぶ
  # def new
  #   redirect_to musics_index_path if user_signed_in?
  #   super
  # end
end