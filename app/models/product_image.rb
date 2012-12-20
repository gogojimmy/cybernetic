class ProductImage < ActiveRecord::Base
  attr_accessible :p_image, :product, :product_id
  belongs_to :product
  mount_uploader :p_image, PImageUploader
end
