require 'addressable/uri'
class Geocoder
  
  def self.set_coords(obj)
    if obj.valid?
      query_string = Addressable::URI.new(
        :scheme => "https",
        :host => "maps.googleapis.com",
        :path => "maps/api/geocode/json",
        :query_values => {
          address: "#{obj.street} and #{obj.cross_street}, #{obj.city}, #{obj.state} #{obj.zip_code}", 
          sensor: "false", key: ENV["GOECODE_KEY"]
        }
      ).to_s
    
      response = JSON.parse(RestClient.get(query_string))
      
      # make this better for responses that return multiple results
      if response["results"].length > 0 
        puts response["results"]
        coords_hash = response["results"].first["geometry"]["location"]
        obj.latitude = coords_hash["lat"] 
        obj.longitude = coords_hash["lng"]
      else
        flash[:errors] = ["Post was saved but we could not find map data for the provided address. Consider editing post address to reflect a more specific address."]
      end
    end
  end
end