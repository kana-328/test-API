class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  storage :file

  # アップロード可能な拡張子のリスト
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
