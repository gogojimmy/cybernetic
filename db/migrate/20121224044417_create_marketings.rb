# -*- encoding : utf-8 -*-
class CreateMarketings < ActiveRecord::Migration
  def change
    create_table :marketings do |t|
      t.string :email, unique: true

      t.timestamps
    end
    add_index :marketings, :email
  end
end
