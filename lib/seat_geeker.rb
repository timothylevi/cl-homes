require 'addressable/uri'
class SeatGeeker
  
  def self.get_some_nyc_addresses
    bk_query_string = Addressable::URI.new(
      scheme: "http",
      host: "api.seatgeek.com",
      path: "2/venues",
      query_values: {city: "brooklyn", state: "ny"}
    ).to_s
    
    
    mttn_query_string = Addressable::URI.new(
      scheme: "http",
      host: "api.seatgeek.com",
      path: "2/venues",
      query_values: {city: "new york"}
    ).to_s
    
    # lic_query_string = Addressable::URI.new(
    #   scheme: "http",
    #   host: "api.seatgeek.com",
    #   path: "2/venues",
    #   query_values: {city: "long island city", state: "new york"}
    # ).to_s
    
    # astoria_query_string = Addressable::URI.new(
    #   scheme: "http",
    #   host: "api.seatgeek.com",
    #   path: "2/venues",
    #   query_values: {city: "queens", state: "new york"}
    # ).to_s
    
    bk = JSON.parse(RestClient.get(bk_query_string))["venues"]
    mttn = JSON.parse(RestClient.get(mttn_query_string))["venues"]
    # lic = JSON.parse(RestClient.get(lic_query_string))["venues"]
    # astoria = JSON.parse(RestClient.get(astoria_query_string))["venues"]
    
    address_hash = {addresses: []}
    
    (bk + mttn).each do |venue|
      street = venue["address"]
      city = venue["city"]
      state = venue["state"]
      zip = venue["postal_code"]
      # lat = venue["location"]["lat"]
      # lng = venue["location"]["lon"]
      
      address_hash[:addresses] << {street: street, city: city, state: state, zip_code: zip}
      # address_hash[:geocodes] << {latitude: lat, longitude: lng}
    end
    
    address_hash
  end
  
end