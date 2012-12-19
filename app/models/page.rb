class Page < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true

  translates :title, :content
end
