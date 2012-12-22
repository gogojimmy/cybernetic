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

require 'test_helper'

class SliderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
