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
  attr_accessible :category, :content, :title, :user_id, :locales
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true

  CATEGORY = %w( 最新消息 促銷活動 )
  LOCALES = { "en" => '英文', "zh_tw" => "中文" }

  validates_presence_of :title, :category

  serialize :locales, Array

  scope :news, where(category: "最新消息")
  scope :on_sale, where(category: "促銷活動")
  default_scope order('created_at desc')

  translates :title, :content

  def self.include_locale(locale)
    select {|m| m.locales.include?(locale)}
  end
end
