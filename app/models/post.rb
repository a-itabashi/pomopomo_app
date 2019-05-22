class Post < ApplicationRecord
  validates :post_image, presence: true, if: -> { content.blank? }
  validates :content, presence: true, if: -> { post_image.blank? }
  validates :content, length: {maximum: 100}

  belongs_to :user
  has_many :post_favorites, dependent: :destroy
  
  mount_uploader :post_image, ImageUploader  
end
