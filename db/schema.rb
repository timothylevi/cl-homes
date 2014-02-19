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

ActiveRecord::Schema.define(:version => 20140219152521) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "community_posts", :force => true do |t|
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.string   "zip_code"
    t.text     "body",              :null => false
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "region",            :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "community_posts", ["region"], :name => "index_community_posts_on_region"
  add_index "community_posts", ["subcategory_id"], :name => "index_community_posts_on_subcategory_id"
  add_index "community_posts", ["user_id"], :name => "index_community_posts_on_user_id"

  create_table "events_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  create_table "gigs_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.string   "pay"
    t.string   "pay_detials"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "gigs_posts", ["region"], :name => "index_gigs_posts_on_region"
  add_index "gigs_posts", ["subcategory_id"], :name => "index_gigs_posts_on_subcategory_id"
  add_index "gigs_posts", ["user_id"], :name => "index_gigs_posts_on_user_id"

  create_table "housing_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
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
    t.string   "cross_street"
    t.string   "ad_poster_name"
  end

  add_index "housing_posts", ["region"], :name => "index_housing_posts_on_region"
  add_index "housing_posts", ["subcategory_id"], :name => "index_housing_posts_on_subcategory_id"
  add_index "housing_posts", ["user_id"], :name => "index_housing_posts_on_user_id"

  create_table "jobs_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.string   "compensation"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "jobs_posts", ["region"], :name => "index_jobs_posts_on_region"
  add_index "jobs_posts", ["subcategory_id"], :name => "index_jobs_posts_on_subcategory_id"
  add_index "jobs_posts", ["user_id"], :name => "index_jobs_posts_on_user_id"

  create_table "personals_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.string   "im_a",              :null => false
    t.string   "looking_for",       :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "personals_posts", ["region"], :name => "index_personals_posts_on_region"
  add_index "personals_posts", ["subcategory_id"], :name => "index_personals_posts_on_subcategory_id"
  add_index "personals_posts", ["user_id"], :name => "index_personals_posts_on_user_id"

  create_table "sale_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.integer  "price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "sale_posts", ["region"], :name => "index_sale_posts_on_region"
  add_index "sale_posts", ["subcategory_id"], :name => "index_sale_posts_on_subcategory_id"
  add_index "sale_posts", ["user_id"], :name => "index_sale_posts_on_user_id"

  create_table "services_posts", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "subcategory_id",    :null => false
    t.string   "title",             :null => false
    t.string   "specific_location"
    t.text     "body"
    t.string   "region",            :null => false
    t.string   "zip_code"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "cross_street"
  end

  add_index "services_posts", ["region"], :name => "index_services_posts_on_region"
  add_index "services_posts", ["subcategory_id"], :name => "index_services_posts_on_subcategory_id"
  add_index "services_posts", ["user_id"], :name => "index_services_posts_on_user_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "category_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "subcategories", ["category_id"], :name => "index_subcategories_on_category_id"
  add_index "subcategories", ["name"], :name => "index_subcategories_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "region"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
