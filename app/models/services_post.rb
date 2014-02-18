# == Schema Information
#
# Table name: services_posts
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  contact_id        :integer          not null
#  location_id       :integer
#  subcategory_id    :integer          not null
#  title             :string(255)      not null
#  specific_location :string(255)
#  body              :text
#  region            :string(255)      not null
#  zip_code          :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ServicesPost < ActiveRecord::Base
  # attr_accessible :title, :body
end