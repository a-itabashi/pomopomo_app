class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  # ログイン時に新規登録画面に飛んだら、musics/indexに飛ぶ
  # def new
  #   redirect_to musics_index_path if user_signed_in?
  #   super
  # end
end