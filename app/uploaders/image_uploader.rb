class ImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    if Rails.env.test?
      "uploads_#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
   
end
