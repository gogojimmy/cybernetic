# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: films
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
