# == Schema Information
#
# Table name: jobs_posts
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
#  compensation      :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_email     :string(255)
#  contact_phone     :string(255)
#  contact_name      :string(255)
#

class JobsPost < ActiveRecord::Base
  # attr_accessible :title, :body
end
