require 'addressable/uri'

class PlaceGetter
  
  def self.get_places
    results = []
    # 100.times do |i|
      query_string = Addressable::URI.new(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "maps/api/place/nearbysearch/json",
        query_values: {
          location: "40.7320767,-73.9865952",
          radius: "10000",
          key: ENV["GEOCODE_KEY"],
          sensor: "false",
          keyword: "public school",
          pagetoken: "true",
        }
      ).to_s
    
      puts query_string
     results += JSON.parse(RestClient.get(query_string))["results"]
    # end
    
    # results
  end
  
end