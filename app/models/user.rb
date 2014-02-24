# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  region          :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :phone
  attr_reader :password
  
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, length: {minimum: 8, allow_nil: true}
  before_validation :ensure_session_token
  
  has_many :housing_posts
  
  
  def ensure_session_token
    unless self.session_token
      self.session_token = self.class.generate_random_token
    end
  end
    
  def self.generate_random_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_random_token
    self.save!
    return self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(email, password)
    user = find_by_email(email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
