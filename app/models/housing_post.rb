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
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, :lister_type,
                  :contact_name, :contact_phone, :bathrooms, :beds, :sq_feet, :smoking, :category,
                  :housing_type, :laundry, :parking, :furnished, :lister_type, :cats, :dogs,
                  :fees, :rent, :wheelchair, :street, :city, :state, :ad_poster_name, :user_id,
                  :latitude, :longitude
                  
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :housing_posts
  )

  has_many :pictures, as: :image
  
  CATEGORIES = ["rent", "share", "sublet", "buy"]
  LISTER_TYPES = ["broker", "owner"]
  HOUSING_TYPES = ["apartment", "condo", "cottage/cabin", "duplex", "house", "flat", "townhouse", "loft", "land"]
  LAUNDRY = ["-", "w/d in unit", "laundry in bldg", "laundry on site", "w/d hookups"]
  PARKING = ["-", "carport", "attached garage", "detached garage", "off-street parking", "street parking", "valet parking"]
  REGIONS = ["manhattan", "brooklyn", "bronx", "queens", "staten island", "long island", "new jersey", "fairfield co CT", "westchester"]
  
                  
                  
  # removed validations for address parameters to seed db. make sure to put back
  # also, take lat and lng out of attr accessable
                  
  validates :title, :body, :poster, :region, :specific_location,
            :housing_type, :contact_phone, :contact_email, :contact_name, :beds, :fees,
            :rent, :ad_poster_name, :lister_type, presence: true
            
  validates :region, inclusion: {in: REGIONS}
  validates :housing_type, inclusion: {in: HOUSING_TYPES}
  validates :laundry, inclusion: {in: LAUNDRY}
  validates :parking, inclusion: {in: PARKING}
  validates :lister_type, inclusion: {in: LISTER_TYPES}
  validates :rent, :sq_feet, numericality: true
  validates :category, inclusion: {in: CATEGORIES}
  # before_save :set_geo_coords
  
  
  def set_geo_coords
    Geocoder.set_coords(self)
  end
  
  
  def apply_options(options)
    self.dogs = options.include?("dogs") ? "dogs" : nil
    self.cats = options.include?("cats") ? "cats" : nil
    self.wheelchair = options.include?("wheelchair") ? "wheelchair" : nil
    self.smoking = options.include?("smoking") ? "smoking" : nil
    self.furnished = options.include?("furnished") ? "furnished" : nil
  end
  
  def post_date
    time = self.created_at
    time.month.to_s + "/" +
    time.day.to_s + "/" +
    time.year.to_s
  end
  
  def post_time
    time = self.created_at
    
    hour = time.hour > 12 ? time.hour - 12 : time.hour
    hour = 12 if hour == 0
    min = time.min > 9 ? time.min : "0" + time.min.to_s
    mrdn = time.hour > 11 ? "PM" : "AM"
    
    
    hour.to_s + ":" + min.to_s + " " + mrdn
  end
end
