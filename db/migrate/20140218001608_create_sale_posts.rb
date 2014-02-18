class CreateSalePosts < ActiveRecord::Migration
  def change
    create_table :sale_posts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.integer :location_id
      t.integer :subcategory_id, null: false
      t.string :title, null: false
      t.string :specific_location
      t.text :body
      t.string :region, null: false
      t.string :zip_code
      
      t.integer :price
      
      t.timestamps
    end
    
    add_index :sale_posts, :user_id
    add_index :sale_posts, :region
    add_index :sale_posts, :subcategory_id
    
  end
end
