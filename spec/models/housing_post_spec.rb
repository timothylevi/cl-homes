require 'spec_helper'

describe HousingPost do
  describe "set_geo_coords" do
    it "assigns latitude and longitude on an object with street, city, state and zip attrs" do
      post = HousingPost.new({street: "770 Broadway", city: "New York", state: "NY", zip_code: "10003"})
      expect(post.set_geo_coords).to be(true)
      
      expect(post.latitude).to eq("40.7307596")
      expect(post.longitude).to eq("-73.9913105")
    end
    
    it "returns a false lat and lng could not be found/set" do
      post = HousingPost.new({street: "askldfhj", city: "2438dfs", state: "48sdnj"})
      
      expect(post.set_geo_coords).to be(false)
    end
  end
  
  describe "apply_options" do
    it "applies options to post model given an options hash" do
      post = HousingPost.new
      options = ["cats", "dogs", "smoking", "furnished", "wheelchair"]
      post.apply_options(options)
    
      expect(post.cats).to eq("cats")
      expect(post.dogs).to eq("dogs")
      expect(post.smoking).to eq("smoking")
      expect(post.furnished).to eq("furnished")
      expect(post.wheelchair).to eq("wheelchair")
    end
  end


end
