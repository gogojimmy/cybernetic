class AddLargeImageToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :large_image, :string
  end
end
