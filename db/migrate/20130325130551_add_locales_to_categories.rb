# -*- encoding : utf-8 -*-
class AddLocalesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :locales, :text
  end
end
