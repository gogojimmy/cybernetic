class AddPositionToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :position, :string
    add_column :sliders, :target, :string
  end
end
