class ImageUploader < CarrierWave::Uploader::Base  
  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :middle do
    process resize_to_fill: [188, 188]
  end

  # アップロード可能な拡張子のリスト
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
end
