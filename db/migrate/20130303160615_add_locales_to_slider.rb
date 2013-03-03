class AddLocalesToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :locales, :text
  end
end
