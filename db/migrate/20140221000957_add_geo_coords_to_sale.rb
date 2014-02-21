class AddGeoCoordsToSale < ActiveRecord::Migration
  def change
    add_column :sale_posts, :latitude, :string
    add_column :sale_posts, :longitude, :string
  end
end
