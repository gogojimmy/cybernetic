# -*- encoding : utf-8 -*-
class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id

      t.timestamps
    end
    add_index :sliders, :user_id
  end
end
