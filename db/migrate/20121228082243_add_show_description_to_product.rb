# -*- encoding : utf-8 -*-
class AddShowDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :show_description, :string
  end
end
