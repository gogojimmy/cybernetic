# -*- encoding : utf-8 -*-
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130325130551) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "c_image"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "ancestry"
    t.string   "large_image"
    t.string   "show_description"
    t.string   "en_large_image"
    t.integer  "position"
    t.text     "locales"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"
  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], :name => "index_category_translations_on_locale"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "download_translations", :force => true do |t|
    t.integer  "download_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "download_translations", ["download_id"], :name => "index_download_translations_on_download_id"
  add_index "download_translations", ["locale"], :name => "index_download_translations_on_locale"

  create_table "downloads", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "file"
  end

  create_table "faq_translations", :force => true do |t|
    t.integer  "faq_id"
    t.string   "locale"
    t.text     "answer"
    t.text     "question"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "faq_translations", ["faq_id"], :name => "index_faq_translations_on_faq_id"
  add_index "faq_translations", ["locale"], :name => "index_faq_translations_on_locale"

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "films", :force => true do |t|
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "films", ["user_id"], :name => "index_films_on_user_id"

  create_table "marketings", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "marketings", ["email"], :name => "index_marketings_on_email"

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_translations", ["locale"], :name => "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.integer  "user_id"
    t.string   "title",      :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["title"], :name => "index_pages_on_title"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_translations", ["locale"], :name => "index_post_translations_on_locale"
  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "locales"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "product_images", :force => true do |t|
    t.string   "p_image"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_images", ["product_id"], :name => "index_product_images_on_product_id"

  create_table "product_translations", :force => true do |t|
    t.integer  "product_id"
    t.string   "locale"
    t.text     "description"
    t.text     "feature"
    t.text     "knowledge"
    t.string   "name"
    t.text     "spec"
    t.text     "test_report"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "show_description"
  end

  add_index "product_translations", ["locale"], :name => "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], :name => "index_product_translations_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "test_report"
    t.text     "knowledge"
    t.text     "feature"
    t.text     "spec"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "show_description"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "redactor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "slider_translations", :force => true do |t|
    t.integer  "slider_id"
    t.string   "locale"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "slider_translations", ["locale"], :name => "index_slider_translations_on_locale"
  add_index "slider_translations", ["slider_id"], :name => "index_slider_translations_on_slider_id"

  create_table "sliders", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "block"
    t.string   "target"
    t.string   "position"
    t.text     "locales"
  end

  add_index "sliders", ["user_id"], :name => "index_sliders_on_user_id"

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "url"
    t.string   "email"
    t.string   "store_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "approved",               :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
