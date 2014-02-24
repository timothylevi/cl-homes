class RemoveRegionFromUsersAndAddSomeThings < ActiveRecord::Migration
  def change
    remove_column :users, :region
    add_column :users, :phone, :string
    add_column :users, :username, :string
  end
end
