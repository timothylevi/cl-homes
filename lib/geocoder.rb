require 'addressable/uri'
class Geocoder
  
  def self.set_coords(obj)
    query_string = Addressable::URI.new(
      :scheme => "https",
      :host => "maps.googleapis.com",
      :path => "maps/api/geocode/json",
      :query_values => {
        address: "#{obj.street}, #{obj.city}, #{obj.state} #{obj.zip_code}", 
        sensor: "false", key: ENV["GOECODE_KEY"]
      }
    ).to_s
  
    response = JSON.parse(RestClient.get(query_string))
    
    # make this better for responses that return multiple results
    if response["results"].length > 0 
      coords_hash = response["results"].first["geometry"]["location"]
      obj.latitude = coords_hash["lat"] 
      obj.longitude = coords_hash["lng"]
      obj.save!
    else
      return "Post was saved but we could not find map data for the provided address. Consider editing post address to reflect a more specific address."
    end
  end
  
  def self.set_address(obj, coords)
    query_string = Addressable::URI.new(
      :scheme => "https",
      :host => "maps.googleapis.com",
      :path => "maps/api/geocode/json",
      :query_values => {
        latlng: "#{coords[:latitude]},#{coords[:longitude]}", 
        sensor: "false", key: ENV["GOECODE_KEY"]
      }
    ).to_s
  
    results = JSON.parse(RestClient.get(query_string))["results"]
  
    if results.length > 0
      address = results.first["formatted_address"].split(", ")
      obj.street = address[0]
      obj.city = address[1]
      obj.state = address[2][0..2]
      obj.zip_code = address[2][3..8]
    end
    obj
  end
  
  
end