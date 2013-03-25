# -*- encoding : utf-8 -*-
class RenamePositionColumnForSlider < ActiveRecord::Migration
  def change
    rename_column :sliders, :position, :block
    add_column :sliders, :position, :string
  end
end
