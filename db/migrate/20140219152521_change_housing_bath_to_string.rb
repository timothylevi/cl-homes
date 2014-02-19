class ChangeHousingBathToString < ActiveRecord::Migration
  def change
    change_column :housing_posts, :bathrooms, :string
  end
end
