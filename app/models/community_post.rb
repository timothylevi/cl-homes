# == Schema Information
#
# Table name: community_posts
#
#  id                :integer          not null, primary key
#  title             :string(255)      not null
#  contact_id        :integer          not null
#  specific_location :string(255)
#  zip_code          :string(255)
#  body              :text             not null
#  user_id           :integer          not null
#  location_id       :integer
#  subcategory_id    :integer          not null
#  region            :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CommunityPost < ActiveRecord::Base
  # attr_accessible :title, :body
end
