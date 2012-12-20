class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :url
      t.integer :user_id

      t.timestamps
    end
    add_index :films, :user_id
  end
end
