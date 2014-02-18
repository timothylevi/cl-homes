class CreateCommunityPosts < ActiveRecord::Migration
  def change
    create_table :community_posts do |t|
      t.string :title, null: false
      t.integer :contact_id, null: false
      t.string :specific_location
      t.string :zip_code
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :location_id
      t.integer :subcategory_id, null: false
      t.string :region, null: false
      
      t.timestamps
    end
    
    add_index :community_posts, :subcategory_id
    add_index :community_posts, :user_id
    add_index :community_posts, :region
    add_index :community_posts, :location_id
    add_index :community_posts, :contact_id
  end
end
