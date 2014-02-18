class AddDetailsToHousing < ActiveRecord::Migration
  def change
    add_column :housing_posts, :bathrooms, :integer
    add_column :housing_posts, :housing_type, :string
    add_column :housing_posts, :laundry, :string
    add_column :housing_posts, :parking, :string
    add_column :housing_posts, :wheelchair, :string
    add_column :housing_posts, :smoking, :string
    add_column :housing_posts, :furnished, :string
  end
end
