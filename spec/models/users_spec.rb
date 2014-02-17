require 'spec_helper'

describe User do
  describe "initialize" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should ensure_length_of(:password).is_at_least(8) }
  end
  
  describe "find_by_credentials" do
    user = User.create(email: "user@user.com", password: "password")
    
    it "will return nil if user does not exist" do
      expect(User.find_by_credentials("otheruser@user.com", "otherpassword")).to eq(nil)
    end
    
    it "will return nil if credentials are wrong" do
      expect(User.find_by_credentials("user@user.com", "word")).to eq(nil)
      expect(User.find_by_credentials("r@user.com", "password")).to eq(nil)
    end
    
    it "returns correct user if credentials are correct" do
      expect(User.find_by_credentials("user@user.com", "password")).to eq(user)
    end
  end
  
end