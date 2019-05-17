class Music < ApplicationRecord
  has_many :music_histories
  # その音楽を聴いたユーザー一覧
  has_many :listen_music_users, through: :music_histories, source: :user
end
