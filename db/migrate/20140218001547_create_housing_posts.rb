class CreateHousingPosts < ActiveRecord::Migration
  def change
    create_table :housing_posts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.integer :location_id, null: false
      t.integer :subcategory_id, null: false
      t.string :title, null: false
      t.string :specific_location, null: false
      t.text :body
      t.string :region, null: false
      t.string :zip_code, null: false
      
      t.integer :rent, null: false
      t.string :cats
      t.string :dogs
      t.string :lister_type, null: false
      t.string :fees
      t.integer :beds, null: false
      t.integer :sq_feet

      t.timestamps
    end
    
    add_index :housing_posts, :user_id
    add_index :housing_posts, :region
    add_index :housing_posts, :subcategory_id
  end
end
