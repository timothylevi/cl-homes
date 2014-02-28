require 'addressable/uri'

class PlaceGetter
  
  def self.get_places
    results = []
      query_string = Addressable::URI.new(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "maps/api/place/nearbysearch/json",
        query_values: {
          location: "40.7320767,-73.9865952",
          radius: "5",
          key: ENV["GEOCODE_KEY"],
          sensor: "false",
          keyword: "ice cream"
        }
      ).to_s

     results = JSON.parse(RestClient.get(query_string))["results"]
     
     # locations = {coords: []}
     # 
     # results.each do |result|
     #   coord = {latitude: nil, longitude: nil}
     #   coord[:latitude] = result["geometry"]["location"]["lat"]
     #   coord[:longitude] = result["geometry"]["location"]["lng"]
     #   locations[:coords] << coord
     # end
     
     locations
  end
  
end