class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i(google twitter)
  has_one_attached :avatar

  has_many :studies, dependent: :destroy
  has_many :music_histories

  has_many :posts
  has_many :post_favorites, dependent: :destroy

  # current_userの再生履歴一覧
  # has_many :current_user_musics, through: :music_histories, source: :music

  def self.create_unique_string
    SecureRandom.uuid
  end

  protected

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(name: auth.info.name,
                         email: User.dumy_email(auth),
                         provider: auth.provider,
                         uid: auth.uid,
                         password: Devise.friendly_token[0, 20],
                         image_url: auth.info.image,
                         token:    auth.credentials.token,
                         meta:     auth.to_yaml
                         )
    end
    user
  end

  private

  def self.dumy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
