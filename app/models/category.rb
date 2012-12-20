class Category < ActiveRecord::Base
  attr_accessible :c_image, :title, :user, :user_id, :parent_id
  mount_uploader :c_image, CImageUploader
  validates_presence_of :title
  belongs_to :user
  has_many :products

  has_ancestry
end
