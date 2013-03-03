class AddEnLargeImageToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :en_large_image, :string
  end
end
