class CreateImages < ActiveRecord::Migration
  def change
    drop_table :images
  end
end
