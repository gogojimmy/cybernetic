# -*- encoding : utf-8 -*-
class AddFileToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :file, :string
  end
end
