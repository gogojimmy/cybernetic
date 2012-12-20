class Faq < ActiveRecord::Base
  attr_accessible :answer, :question, :user, :user_id
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true
  validates_presence_of :answer, :question

end
