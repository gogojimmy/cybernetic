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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
