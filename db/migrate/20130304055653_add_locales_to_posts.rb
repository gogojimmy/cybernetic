class AddLocalesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :locales, :text
  end
end
