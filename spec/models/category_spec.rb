# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Category do
  it { should have_many(:subcategories) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
