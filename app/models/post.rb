class Post < ApplicationRecord
  validates :post_image, presence: true, if: -> { content != "" }
  validates :content, presence: true, if: -> { !post_image.attached? }
  validates :content, length: {maximum: 100}

  belongs_to :user
  has_many :post_favorites, dependent: :destroy
  has_one_attached :post_image

  def validate_post_image
    return unless post_image.attached?
    if post_image.blob.byte_size > 10000.kilobyte
      post_image.purge
      errors.add(:post_image, I18n.t('errors.messages.file_too_large'))
    elsif !image?
      post_image.purge
      errors.add(:post_image, I18n.t('errors.messages.file_type_not_image'))
      return
    end
  end

  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?(post_image.blob.content_type)
  end
end
