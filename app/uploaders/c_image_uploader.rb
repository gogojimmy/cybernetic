# -*- encoding : utf-8 -*-

class CImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    asset_path("fallback/" + [version_name, "default.gif"].compact.join('_'))
  end

  version :thumb do
    process :fix_exif_rotation
    process :strip
    process :resize_to_limit => [30, 30]
    process :quality => 100
  end

  version :normal do
    process :fix_exif_rotation
    process :strip
    process :resize_to_limit => [80, 80]
    process :quality => 100
  end

  version :large do
    process :fix_exif_rotation
    process :strip
    process :resize_to_limit => [300, 300]
    process :quality => 100
  end

end
