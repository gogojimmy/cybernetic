# -*- encoding : utf-8 -*-
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :category

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
