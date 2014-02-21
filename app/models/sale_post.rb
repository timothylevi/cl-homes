# == Schema Information

# t.integer  "user_id",           :null => false
# t.integer  "subcategory_id",    :null => false
# t.string   "title",             :null => false
# t.string   "specific_location"
# t.text     "body"
# t.string   "region",            :null => false
# t.string   "zip_code"
# t.integer  "price"
# t.datetime "created_at",        :null => false
# t.datetime "updated_at",        :null => false
# t.string   "contact_email"
# t.string   "contact_phone"
# t.string   "contact_name"
# t.string   "street"
# t.string   "city"
# t.string   "state"
# t.string   "cross_street"

class SalePost < ActiveRecord::Base
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, :state,
                  :contact_name, :contact_phone, :subcategory_id, :price, :street, :city, :cross_street
    
    
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :sale_posts
  )
  belongs_to :subcategory
  has_many :pictures, as: :image

                
  validates :title, :body, :poster, :subcategory_id, :region, :price, presence: true
  validate :has_proper_sub_id
  before_save :set_geo_coords
  
  
  def set_geo_coords
    Geocoder.set_coords(self)
  end
  
  def has_proper_sub_id
    ids = Category.find_by_name('sale').subcategories.map { |sub| sub.id }
    errors.add(:subcategory, "must choose category") unless ids.include?(self.subcategory_id)
  end
  
  def category
    Category.find_by_name('sale')
  end
end
