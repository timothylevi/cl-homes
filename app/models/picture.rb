class Picture < ActiveRecord::Base
  attr_accessible :photo

  has_attached_file :photo, styles: {
    big: "400x400>",
    medium: "200x200>",
    thumb: "50x50>"
  }
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :image, polymorphic: true
end
