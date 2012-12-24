#encoding: utf-8
# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :category, :content, :title, :user_id
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true

  CATEGORY = %w( 最新消息 促銷活動 )
  validates_presence_of :title, :category

  scope :news, where(category: "最新消息")
  scope :on_sale, where(category: "促銷活動")
  default_scope order('created_at desc')

  translates :title, :content
end
