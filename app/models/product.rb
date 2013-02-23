# encoding: utf-8
# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  test        :text
#  knowledge   :text
#  feature     :text
#  spec        :text
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :description, :feature, :knowledge, :name, :spec, :test_report, :user, :category, :product_images_attributes, :category_id, :show_description
  has_many :product_images
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :product_images, :reject_if => :all_blank, :allow_destroy => true
  delegate :email, to: :user, prefix: true, allow_nil: true

  validates_presence_of :name, :category
  validate :at_least_one_image

  def at_least_one_image
    errors.add(:product_images, "至少要有一張產品圖片") if product_images.length == 0
  end

  translates :description, :feature, :knowledge, :name, :spec, :test_report, :show_description

  def feature_image(version=nil)
    self.product_images.first.try(:p_image_url, version)
  end

  def self.search(params)
    if params[:search]
      where("name like ? or show_description like ?", "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page])
    else
      self.paginate(page: params[:page])
    end
  end
end
