class AddCategoryToHousingPost < ActiveRecord::Migration
  def change
    add_column :housing_posts, :category, :string
    add_index :housing_posts, :category
  end
end
