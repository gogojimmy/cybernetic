class Product < ActiveRecord::Base
  attr_accessible :description, :feature, :knowledge, :name, :spec, :test, :user, :category, :product_images_attributes, :category_id
  has_many :product_images
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :product_images, :reject_if => :all_blank, :allow_destroy => true
  delegate :email, to: :user, prefix: true, allow_nil: true

  validates_presence_of :name, :category

  def feature_image(version=nil)
    self.product_images.first.try(:p_image_url, version)
  end
end
