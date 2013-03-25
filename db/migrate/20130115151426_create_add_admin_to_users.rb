# -*- encoding : utf-8 -*-
class CreateAddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, default: false, null: false
  end
end
