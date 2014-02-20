class Picture < ActiveRecord::Base
  attr_accessible :photo

  has_attached_file :photo, styles: {
    big: "600x600>",
    medium: "300x300>",
    thumb: "100x100>"
  }
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :image, polymorphic: true
end
