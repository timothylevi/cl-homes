# == Schema Information
#
# Table name: housing_posts
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  contact_id        :integer          not null
#  location_id       :integer          not null
#  subcategory_id    :integer          not null
#  title             :string(255)      not null
#  specific_location :string(255)      not null
#  body              :text
#  region            :string(255)      not null
#  zip_code          :string(255)      not null
#  rent              :integer          not null
#  cats              :string(255)
#  dogs              :string(255)
#  lister_type       :string(255)      not null
#  fees              :string(255)
#  beds              :integer          not null
#  sq_feet           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class HousingPost < ActiveRecord::Base
  # attr_accessible :title, :body
end
