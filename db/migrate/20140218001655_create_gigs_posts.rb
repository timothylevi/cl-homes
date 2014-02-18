class CreateGigsPosts < ActiveRecord::Migration
  def change
    create_table :gigs_posts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.integer :location_id
      t.integer :subcategory_id, null: false
      t.string :title, null: false
      t.string :specific_location
      t.text :body
      t.string :region, null: false
      t.string :zip_code
      
      t.string :pay
      t.string :pay_detials
      
      t.timestamps
    end
    
    add_index :gigs_posts, :user_id
    add_index :gigs_posts, :region
    add_index :gigs_posts, :subcategory_id
  end
end
