class CreatePersonalsPosts < ActiveRecord::Migration
  def change
    create_table :personals_posts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.integer :location_id
      t.integer :subcategory_id, null: false
      t.string :title, null: false
      t.string :specific_location
      t.text :body
      t.string :region, null: false
      t.string :zip_code
      
      t.string :im_a, null: false
      t.string :looking_for, null: false
      
      t.timestamps
    end
    
    add_index :personals_posts, :user_id
    add_index :personals_posts, :subcategory_id
    add_index :personals_posts, :region
  end
end
