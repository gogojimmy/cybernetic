class Film < ActiveRecord::Base
  attr_accessible :url, :user_id, :user
  validates_presence_of :url
  delegate :email, to: :user, prefix: true, allow_nil: true
  belongs_to :user

  def self.random_film
    all.sample.url
  end
end
