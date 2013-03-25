# -*- encoding : utf-8 -*-
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :content, default: ""

      t.timestamps
    end
    add_index :pages, :title
    add_index :pages, :user_id
  end
end
