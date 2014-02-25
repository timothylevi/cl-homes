class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.integer :user_id, null: false
      t.integer :housing_post_id, null: false
      t.timestamps
    end
    add_index :watches, :user_id
    add_index :watches, :housing_post_id
    add_index :watches, [:user_id, :housing_post_id], unique: true
  end
end
