class Post < ApplicationRecord
  belongs_to :user
  has_many :post_favorites, dependent: :destroy
  has_one_attached :post_image
end
