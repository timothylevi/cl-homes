# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subcategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
  
  belongs_to :category
end
