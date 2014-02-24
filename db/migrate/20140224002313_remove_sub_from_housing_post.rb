class RemoveSubFromHousingPost < ActiveRecord::Migration
  def change
    remove_column :housing_posts, :subcategory_id
  end
end
