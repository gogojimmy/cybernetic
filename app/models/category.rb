# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  c_image    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#

class Category < ActiveRecord::Base
  attr_accessible :c_image, :title, :user, :user_id, :parent_id, :large_image, :show_description
  mount_uploader :c_image, CImageUploader
  mount_uploader :large_image, LargeImageUploader

  validates_presence_of :title
  belongs_to :user
  has_many :products
  before_destroy :set_products_category

  translates :title

  has_ancestry

  def set_products_category
    products.each do |product|
      product.set_category_to_uncategory
    end
  end
end
