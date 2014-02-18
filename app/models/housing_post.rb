# == Schema Information
#
# t.integer  "user_id",           :null => false
# t.integer  "subcategory_id",    :null => false
# t.string   "title",             :null => false
# t.string   "specific_location", :null => false
# t.text     "body"
# t.string   "region",            :null => false
# t.string   "zip_code",          :null => false
# t.integer  "rent",              :null => false
# t.string   "cats"
# t.string   "dogs"
# t.string   "lister_type",       :null => false
# t.string   "fees"
# t.integer  "beds",              :null => false
# t.integer  "sq_feet"
# t.datetime "created_at",        :null => false
# t.datetime "updated_at",        :null => false
# t.string   "contact_email"
# t.string   "contact_phone"
# t.string   "contact_name"
# t.integer  "bathrooms"
# t.string   "housing_type"
# t.string   "laundry"
# t.string   "parking"
# t.string   "wheelchair"
# t.string   "smoking"
# t.string   "furnished"
# t.string   "street"
# t.string   "cross_street"
# t.string   "city"
# t.string   "state"

class HousingPost < ActiveRecord::Base
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, 
                  :contact_name, :contact_phone, :subcategory_id, :bathrooms, :smoking,
                  :housing_type, :laundry, :parking, :furnished, :lister_type, :cats, :dogs,
                  :fees, :rent, :wheelchair, :street, :cross_street, :city, :state, :ad_poster_name
                  
  validates :title, :body, :poster, :subcategory_id, :region, :zip_code, :specific_location,
            :housing_type, :contact_phone, :contact_email, :contact_name, :bedrooms, :fees,
            :rent, :street, :cross_street, :city, :state, :ad_poster_name, presence: true
            
  SUB_IDS = category.subcategories.map { |sub| sub.id }
  HOUSING_TYPES = ["apartment", "condo", "cottage/cabin", "duplex", "house", "flat", "townhouse", "loft", "land"]
  YES_NO = ["yes", "no"]
  LAUNDRY = ["w/d in unit", "laundry in bldg", "laundry on site", "w/d hookups"]
  PARKING = ["carport", "attached garage", "detached garage", "off-street parking", "street parking", "valet parking"]
            
  validates :region, inclusion: {in: User::REGIONS}
  validates :subcategory_id, inclusion: {in: SUB_IDS}
  validates :housing_type, inclusion: {in: HOUSING_TYPES}
  validates :laundry, inclusion: {in: LAUNDRY}
  validates :parking, inclusion: {in: PARKING}
  validates :cats, :dogs, :smoking, :wheelchair, :furnished, inclusion: {in: YES_NO}
  
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :housing_posts
  )
  
  
  belongs_to :subcategory
  
  def category
    subcategory.category
  end
end
