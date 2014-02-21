class HousingPostMaker
  def self.make_data
    cn = Faker::Name.name
    em = Faker::Internet.email
    pn = Faker::PhoneNumber.phone_number
    ti = Faker::Company.bs
    bo = Faker::Lorem.paragraph
    re = rand(2000)
    br = rand(9)
    bt = rand(9)
    ap = Faker::Name.name
    fe = "Broker fee... jk!"
    ht = HousingPost::HOUSING_TYPES.sample
    rg = User::REGIONS.sample
    sf = rand(1500)
    lt = HousingPost::LISTER_TYPES.sample
    sl = Faker::Address.city
    ld = HousingPost::LAUNDRY.sample
    pk = HousingPost::PARKING.sample
    si = Category.find_by_name("housing").subcategory_ids.sample
    
    
    {contact_name: cn, contact_email: em, contact_phone: pn, title: ti,
    body: bo, rent: re, beds: br, bathrooms: bt, region: rg, sq_feet: sf,
    ad_poster_name: ap, lister_type: lt, specific_location: sl, fees: fe,
    housing_type: ht, subcategory_id: si, laundry: ld, parking: pk, user_id: 1}
  end
  
  def self.make_posts
    locations = SeatGeeker.get_some_nyc_addresses
    
    until locations[:addresses].empty?
      post = HousingPost.new(locations[:addresses].pop.merge(HousingPostMaker.make_data))
      post.save!
    end
  end
end