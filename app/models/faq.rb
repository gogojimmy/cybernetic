# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :string(255)
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faq < ActiveRecord::Base
  attr_accessible :answer, :question, :user, :user_id
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true
  validates_presence_of :answer, :question

  translates :answer, :question
end
