class AddHousingAddPoster < ActiveRecord::Migration
  def change
    add_column :housing_posts, :ad_poster_name, :string
  end
end
