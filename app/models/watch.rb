class Watch < ActiveRecord::Base
  attr_accessible :housing_post_id, :user_id
  
  validates :user_id, :housing_post_id, presence: true
  
  belongs_to :user
  belongs_to :housing_post
end
