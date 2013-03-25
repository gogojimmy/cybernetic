# -*- encoding : utf-8 -*-
require 'test_helper'

class WidgetCellTest < Cell::TestCase
  test "post_sidebar" do
    invoke :post_sidebar
    assert_select "p"
  end
  

end
