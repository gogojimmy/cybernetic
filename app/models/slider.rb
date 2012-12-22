# == Schema Information
#
# Table name: sliders
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image       :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Slider < ActiveRecord::Base
  attr_accessible :description, :image, :title, :user, :user_id
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true
end
