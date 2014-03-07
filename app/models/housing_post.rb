class HousingPost < ActiveRecord::Base
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, :lister_type,
                  :contact_name, :contact_phone, :bathrooms, :beds, :sq_feet, :smoking, :category,
                  :housing_type, :laundry, :parking, :furnished, :lister_type, :cats, :dogs,
                  :fees, :rent, :wheelchair, :street, :city, :state, :ad_poster_name, :user_id

  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :housing_posts
  )

  has_many :pictures, as: :image
  has_many :watches
  has_many :watchers, through: :watches, source: :user

  CATEGORIES = ["rent", "share", "sublet", "buy"]
  LISTER_TYPES = ["broker", "owner"]
  HOUSING_TYPES = ["apartment", "condo", "cottage/cabin", "duplex", "house", "flat", "townhouse", "loft", "land"]
  LAUNDRY = ["-", "w/d in unit", "laundry in bldg", "laundry on site", "w/d hookups"]
  PARKING = ["-", "carport", "attached garage", "detached garage", "off-street parking", "street parking", "valet parking"]
  REGIONS = ["manhattan", "brooklyn", "bronx", "queens", "staten island", "long island", "new jersey", "fairfield co CT", "westchester"]



  # removed validations for address parameters to seed db. make sure to put back
  # also, take lat and lng out of attr accessable

  validates :title, :body, :poster, :region, :specific_location, :street, :city, :state,
            :housing_type, :contact_phone, :contact_email, :contact_name, :beds, :fees,
            :rent, :ad_poster_name, :lister_type, presence: true

  validates :region, inclusion: {in: REGIONS}
  validates :housing_type, inclusion: {in: HOUSING_TYPES}
  validates :laundry, inclusion: {in: LAUNDRY}
  validates :parking, inclusion: {in: PARKING}
  validates :lister_type, inclusion: {in: LISTER_TYPES}
  validates :rent, numericality: true
  validates :sq_feet, numericality: {allow_nil: true}
  validates :category, inclusion: {in: CATEGORIES}
  # after_save :set_geo_coords

  include PgSearch
  pg_search_scope :search_by_search_string, against: [:title, :body, :specific_location]


  def self.search_by_filters(options)
    return HousingPost.order('created_at desc').all if options.values.all? { |v| v == ""}

    search_string = options["search_string"]

    sql_conditions = []
    sql_args = {}

    filter_options = {
      "min_price" => ">=",
      "max_price" => "<="}

    filter_options.each do |option, comparator|
      unless options[option].empty?
        sql_conditions << "rent #{comparator} #{option.to_sym}"
        sql_args[option.to_sym] = options[option]
        options.delete(option)
      end
    end

    options.each do |k, v|
      next if v == "" || k == "search_string"
      sql_conditions << "#{k} = :#{k}"
      sql_args[k.to_sym] = v
    end

    sql_string = sql_conditions.join(" AND ")

    posts_from_search = search_string != "" ? search_by_search_string(search_string) : nil
    posts_from_sql = sql_string != "" ? HousingPost.where(sql_string, sql_args) : nil

    results = posts_from_search && posts_from_sql ? posts_from_search & posts_from_sql :
                                                    posts_from_search || posts_from_sql

    results.sort { |post1, post2| post2.created_at <=> post1.created_at }
  end

  def set_geo_coords
    Geocoder.set_coords(self)
    self.latitude && self.longitude ? true : false
  end

  def apply_pictures(pictures)
    pictures.each do |pic_data|
      self.pictures.build(photo: pic_data)
    end
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

  def post_date_time
    post_date + " at " + post_time
  end

  def url
    Rails.application.routes.url_helpers.housing_post_path(self)
  end

  def medium_pics
    pic_urls = []
    pictures.each do |pic|
      pic_urls << pic.photo.url(:medium)
    end
    pic_urls
  end

  def watched?(user)
    User.find(user.id).is_watching?(self) ? 'true' : 'false'
  end

  def self.welcome_search(options)
    return HousingPost.order('created_at desc').all unless options

    all_posts = []

    options.each do |k, v|
      all_posts << HousingPost.where(k.to_sym => v)
    end

    results = all_posts.shift

    all_posts.each do |group|
      results = results & group
    end

    results.sort { |post1, post2| post2.created_at <=> post1.created_at }
  end
end
