# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)      not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :user
  belongs_to :user
  delegate :email, to: :user, prefix: true, allow_nil: true

  translates :title, :content
end
