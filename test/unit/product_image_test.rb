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

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
