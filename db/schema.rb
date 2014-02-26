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

ActiveRecord::Schema.define(:version => 20140226191923) do

  create_table "housing_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.string   "title",             :null => false
    t.string   "specific_location", :null => false
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code",          :null => false
    t.integer  "rent",              :null => false
    t.string   "cats"
    t.string   "dogs"
    t.string   "lister_type",       :null => false
    t.string   "fees"
    t.integer  "beds",              :null => false
    t.integer  "sq_feet"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "bathrooms"
    t.string   "housing_type"
    t.string   "laundry"
    t.string   "parking"
    t.string   "wheelchair"
    t.string   "smoking"
    t.string   "furnished"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "ad_poster_name"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "category"
  end

  add_index "housing_posts", ["category"], :name => "index_housing_posts_on_category"
  add_index "housing_posts", ["region"], :name => "index_housing_posts_on_region"
  add_index "housing_posts", ["user_id"], :name => "index_housing_posts_on_user_id"

  create_table "pictures", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "image_id"
    t.string   "image_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "phone"
    t.string   "username"
    t.string   "broker"
    t.string   "fullname"
    t.string   "company"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "watches", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "housing_post_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "watches", ["housing_post_id"], :name => "index_watches_on_housing_post_id"
  add_index "watches", ["user_id", "housing_post_id"], :name => "index_watches_on_user_id_and_housing_post_id", :unique => true
  add_index "watches", ["user_id"], :name => "index_watches_on_user_id"

end
