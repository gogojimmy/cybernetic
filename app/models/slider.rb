# -*- encoding : utf-8 -*-
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
  attr_accessible :description, :image, :title, :user, :user_id, :block, :target, :locales
  mount_uploader :image, ImageUploader
  validates_presence_of :image, :block, :target
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true
  serialize :locales, Array

  acts_as_list

  translates :description, :title

  BLOCK = %w(首頁橫幅廣告 首頁左下區塊 首頁中下區塊)
  LOCALES = { "en" => '英文', "zh_tw" => "中文" }

  def self.include_locale(locale)
    select {|m| m.locales.include?(locale)}
  end

  def render_image(version)
    if self.block == "首頁橫幅廣告"
      self.image_url("slider_#{version}".to_sym)
    else
      self.image_url("block_#{version}".to_sym)
    end
  end

end
