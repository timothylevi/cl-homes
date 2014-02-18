# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: true
  
  has_many :subcategories
  
  def posts
    eval("#{name.capitalize}Post").all
  end
end
