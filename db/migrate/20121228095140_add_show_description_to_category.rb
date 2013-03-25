# -*- encoding : utf-8 -*-
class AddShowDescriptionToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :show_description, :string
  end
end
