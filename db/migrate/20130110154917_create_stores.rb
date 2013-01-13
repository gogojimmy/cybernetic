class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :url
      t.string :email
      t.string :store_type

      t.timestamps
    end
  end
end
