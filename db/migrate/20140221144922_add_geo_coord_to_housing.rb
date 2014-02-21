class AddGeoCoordToHousing < ActiveRecord::Migration
  def change
    add_column :housing_posts, :latitude, :string
    add_column :housing_posts, :longitude, :string
    remove_column :housing_posts, :cross_street
  end
end
