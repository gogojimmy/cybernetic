# -*- encoding : utf-8 -*-
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
  attr_accessible :c_image, :title, :user, :user_id, :parent_id, :large_image,
                  :show_description, :en_large_image, :locales
  mount_uploader :c_image, CImageUploader
  mount_uploader :large_image, LargeImageUploader
  mount_uploader :en_large_image, EnLargeImageUploader
  serialize :locales, Array

  validates_presence_of :title
  belongs_to :user
  has_many :products
  before_destroy :set_products_category

  translates :title
  LOCALES = { "en" => '英文', "zh_tw" => "中文" }

  has_ancestry
  acts_as_list scope: [:ancestry]

  def set_products_category
    products.each do |product|
      product.set_category_to_uncategory
    end
  end

  def self.include_locale(locale)
    select {|m| m.locales.include?(locale)}
  end

end
