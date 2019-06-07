class Music < ApplicationRecord
  validates :title, uniqueness: true
  
  has_many :music_histories
end
