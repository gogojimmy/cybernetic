# -*- encoding : utf-8 -*-

class LargeImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    asset_path("fallback/" + ["large_image", version_name, "default.gif"].compact.join('_'))
  end

  version :normal do
    process :fix_exif_rotation
    process :strip
    process :resize_to_limit => [700, 300]
    process :quality => 100
  end

  version :thumb do
    process :fix_exif_rotation
    process :strip
    process :resize_to_limit => [210, 90]
    process :quality => 100
  end

end

