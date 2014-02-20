class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :photo
      t.references :image, polymorphic: true
      t.timestamps
    end
  end
end
