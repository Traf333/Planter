# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130527125737) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genus", :force => true do |t|
    t.string   "name"
    t.string   "lat_name"
    t.string   "description"
    t.integer  "plant_category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "synonyms"
    t.string   "lat_synonyms"
  end

  add_index "genus", ["plant_category_id"], :name => "index_genus_on_plant_category_id"

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "owner_id"
  end

  create_table "member_address_types", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "member_addresses", :force => true do |t|
    t.string   "address"
    t.string   "note"
    t.string   "contacts"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "description"
    t.integer  "member_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "member_address_type_id"
  end

  add_index "member_addresses", ["member_id"], :name => "index_member_addresses_on_member_id"

  create_table "member_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "member_categories_members", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "member_category_id"
  end

  create_table "member_prices", :force => true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "member_prices_plant_prices", :id => false, :force => true do |t|
    t.integer "member_price_id"
    t.integer "plant_price_id"
  end

  create_table "member_tariffs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.string   "name"
    t.boolean  "is_moderated",     :default => false
    t.string   "site"
    t.string   "phone"
    t.string   "email"
    t.string   "description"
    t.integer  "image_id"
    t.string   "contacts"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "member_tariff_id"
  end

  add_index "members", ["country_id"], :name => "index_members_on_country_id"
  add_index "members", ["image_id"], :name => "index_members_on_image_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "members_regions", :id => false, :force => true do |t|
    t.integer "region_id"
    t.integer "member_id"
  end

  create_table "plant_categories", :force => true do |t|
    t.string   "name"
    t.string   "lat_name"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "parent_category_id"
  end

  add_index "plant_categories", ["parent_category_id"], :name => "index_plant_categories_on_plant_category_id"

  create_table "plant_features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plant_prices", :force => true do |t|
    t.string   "packing"
    t.string   "size"
    t.string   "count"
    t.float    "price"
    t.string   "note"
    t.integer  "member_id"
    t.integer  "plant_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plants", :force => true do |t|
    t.string   "name"
    t.string   "lat_name"
    t.string   "description"
    t.string   "width"
    t.string   "height"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "plant_id"
    t.string   "crown"
    t.string   "flowers"
    t.string   "leaves"
    t.integer  "genu_id"
    t.integer  "plant_category_id"
    t.string   "synonyms"
    t.string   "lat_synonyms"
    t.boolean  "enabled",           :default => true
    t.string   "application"
    t.text     "description_short"
  end

  add_index "plants", ["plant_id"], :name => "index_plants_on_plant_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["country_id"], :name => "index_regions_on_country_id"

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "title",       :null => false
    t.text     "description", :null => false
    t.text     "the_role",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "surname"
    t.string   "phone"
    t.string   "address"
    t.string   "site"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "skype"
    t.string   "icq"
    t.integer  "role_id",                :default => 2
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
