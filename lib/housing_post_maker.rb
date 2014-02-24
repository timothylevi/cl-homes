class HousingPostMaker
  def self.make_data
    poster = User.all.sample
    
    cn = Faker::Name.name
    em = poster.email
    pn = Faker::PhoneNumber.phone_number
    ti = ["Wonderful sunny apartment!", "Your next home!", "Spacious luxury awaits you!", "Great deal, won't last!"].sample
    bo = Faker::Lorem.paragraph + " " + Faker::Lorem.paragraph + " " + Faker::Lorem.paragraph
    br = rand(4) + 2
    bt = br - 1
    ap = Faker::Name.name
    fe = ["Broker fee - 1 months rent", "no fees", "application fee and brokers fee", "credit check"].sample
    ht = HousingPost::HOUSING_TYPES.sample
    rg = User::REGIONS.sample
    sf = (rand(10) + 5) * 100
    re = (rand(40) + 10) * 100
    lt = HousingPost::LISTER_TYPES.sample
    sl = Faker::Address.city
    ld = HousingPost::LAUNDRY.sample
    pk = HousingPost::PARKING.sample
    ca = HousingPost::CATEGORIES.sample
    ct = rand(2) == 0 ? "cats" : nil
    dg = rand(2) == 0 ? "dogs" : nil
    wc = rand(2) == 0 ? "wheelchair" : nil
    zp = Faker::Address.zip_code
    
    
    {contact_name: cn, contact_email: em, contact_phone: pn, title: ti,
    body: bo, rent: re, beds: br, bathrooms: bt, region: rg, sq_feet: sf,
    ad_poster_name: ap, lister_type: lt, specific_location: sl, fees: fe,
    housing_type: ht, category: ca, laundry: ld, parking: pk, user_id: poster.id,
    cats: ct, dogs: dg, wheelchair: wc, zip_code: zp}
  end
  
  def self.make_posts
    locations = PlaceGetter.get_places
    
    until locations[:coords].empty?
      pic_nums = (1..10).to_a.sample(5)
      
      post = HousingPost.new(locations[:coords].pop.merge(HousingPostMaker.make_data))
      
      pic_nums.each do |num|
        post.pictures.build(photo: File.new("lib/assets/seed_pics/apt#{num}.jpg"))
      end
      
      post.save!
    end
  end
end