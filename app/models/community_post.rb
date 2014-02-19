# == Schema Information
#
# Table name: community_postsrequire "../../db/schema"

#
#  id                :integer          not null, primary key
#  title             :string(255)      not null
#  specific_location :string(255)
#  zip_code          :string(255)
#  body              :text             not null
#  user_id           :integer          not null
#  location_id       :integer
#  subcategory_id    :integer          not null
#  region            :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_email     :string(255)
#  contact_phone     :string(255)
#  contact_name      :string(255)
#

class CommunityPost < ActiveRecord::Base
  attr_accessible :title, :body, :specific_location, :zip_code, :region, :contact_email, 
                  :contact_name, :contact_phone, :subcategory_id
                      
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :community_posts
  )

  belongs_to :subcategory
  
                
  validates :title, :body, :poster, :subcategory_id, :region, presence: true
  validates :region, inclusion: {in: User::REGIONS}
  validate :has_proper_sub_id
  
  
  def has_proper_sub_id
    ids = Category.find_by_name('community').subcategories.map { |sub| sub.id }
    errors.add(:subcategory, "must choose category") unless ids.include?(self.subcategory_id)
  end
  
  def category
    Category.find_by_name('community')
  end
end
