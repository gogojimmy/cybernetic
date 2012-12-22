# == Schema Information
#
# Table name: films
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Film < ActiveRecord::Base
  attr_accessible :url, :user_id, :user
  validates_presence_of :url
  delegate :email, to: :user, prefix: true, allow_nil: true
  belongs_to :user

  def self.random_film
    all.sample.try(:url)
  end
end
