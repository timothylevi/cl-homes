# == Schema Information
#
# Table name: gigs_posts
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
#  pay               :string(255)
#  pay_detials       :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_email     :string(255)
#  contact_phone     :string(255)
#  contact_name      :string(255)
#

require 'spec_helper'

describe GigsPost do
  pending "add some examples to (or delete) #{__FILE__}"
end
