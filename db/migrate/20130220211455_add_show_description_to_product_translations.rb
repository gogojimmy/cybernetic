class AddShowDescriptionToProductTranslations < ActiveRecord::Migration
  def change
    add_column :product_translations, :show_description, :string
  end
end
