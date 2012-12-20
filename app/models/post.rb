#encoding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :category, :content, :title, :user_id
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true

  CATEGORY = %w( 最新消息 促銷活動 )
  validates_presence_of :title, :category

  scope :news, where(category: "最新消息")
  scope :on_sale, where(category: "促銷活動")
  default_scope order('created_at desc')
end
