# -*- encoding : utf-8 -*-
class CreateDownloads < ActiveRecord::Migration
  def up
    create_table :downloads do |t|
      t.timestamps
    end
    Download.create_translation_table! name: :string, description: :text
  end

  def down
    drop_table :downloads
    Download.drop_translation_table!
  end
end
