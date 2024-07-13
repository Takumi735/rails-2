class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end


  def default_url(*args)
    ActionController::Base.helpers.asset_path("default_avatar.png")
  end
end
