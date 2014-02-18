# == Schema Information
#
# Table name: personals_posts
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  location_id       :integer
#  subcategory_id    :integer          not null
#  title             :string(255)      not null
#  specific_location :string(255)
#  body              :text
#  region            :string(255)      not null
#  zip_code          :string(255)
#  im_a              :string(255)      not null
#  looking_for       :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_email     :string(255)
#  contact_phone     :string(255)
#  contact_name      :string(255)
#

class PersonalsPost < ActiveRecord::Base
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, 
                  :contact_name, :contact_phone, :subcategory_id, :im_a, :looking_for
                  
  validates :title, :body, :poster, :subcategory_id, :region, :im_a, :looking_for, presence: true
  validates :region, inclusion: {in: User::REGIONS}
  
  SUB_IDS = Category.find_by_name("personals").subcategories.map { |sub| sub.id }
  TYPES = ["man", "woman", "TG/TS/TV", "man and woman", "group of men", "group of women"]
  
  
  validates :subcategory_id, inclusion: {in: SUB_IDS}
  validates :im_a, :looking_for, inclusion: {in: TYPES}
  
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :personals_posts
  )
  
  belongs_to :subcategory
  
  def category
    subcategory.category
  end
end
