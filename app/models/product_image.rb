# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  p_image    :string(255)
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductImage < ActiveRecord::Base
  attr_accessible :p_image, :product, :product_id
  belongs_to :product
  mount_uploader :p_image, PImageUploader
end
