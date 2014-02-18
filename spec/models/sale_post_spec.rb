# == Schema Information
#
# Table name: sale_posts
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
#  price             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe SalePost do
  pending "add some examples to (or delete) #{__FILE__}"
end
