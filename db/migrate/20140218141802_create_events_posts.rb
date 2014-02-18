class CreateEventsPosts < ActiveRecord::Migration
  def change
    create_table :events_posts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.integer :location_id
      t.integer :subcategory_id, null: false
      t.string :title, null: false
      t.string :specific_location
      t.text :body
      t.string :region, null: false
      t.string :zip_code
      
      t.datetime :start
      t.datetime :end
      
      
      t.timestamps
    end
  end
end
