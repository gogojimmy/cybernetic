class Slider < ActiveRecord::Base
  attr_accessible :description, :image, :title, :user, :user_id
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true
end
