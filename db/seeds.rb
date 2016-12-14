# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'nokogiri'
require 'open-uri'

# Offer.destroy_all
Asset.destroy_all
User.destroy_all
Appointment.delete_all


20.times do
  user = User.create(
          email: Faker::Internet.email,
          password:123456,
          first_name:Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birthdate: Date.new(2001,2,3)
        )

  # asset = Asset.create(
  #           title: Faker::Address.secondary_address,
  #           description: Faker::Lorem.paragraph(2),
  #           price: Faker::Number.decimal(3, 3),
  #           address: Faker::Address.street_address,
  #           country: Faker::Address.country,
  #           post_code: Faker::Address.postcode,
  #           city: Faker::Address.city,
  #           region: Faker::Space.planet,
  #           condition:Faker::SlackEmoji.custom,
  #           year_built: Faker::Number.number(4),
  #           year_reno: Faker::Number.number(4),
  #           bedrooms: Faker::Number.between(1,5),
  #           bathrooms: Faker::Number.between(1, 3),
  #           garage: Faker::Number.between(0, 1),
  #           lots_size: Faker::Number.decimal(2) ,
  #           previous_owners: Faker::Name.name_with_middle,
  #           status: Faker::SlackEmoji.custom,
  #           user_id: user.id
  #         )

  # offer = Offer.create(
  #           user_id: user.id,
  #           id: asset.id,
  #           offer_date: Faker::Date.between(30.days.ago, Date.today),
  #           status: "pending",
  #           offer_type: Faker::Number.decimal(3, 3)
  #         )
end



# Asset.destroy_all
assets_attributes = [
  {
    title: "Beautiful Apartment",
    description: "This stylish residence is nestled on a large level block in a desirably tranquil cul-de-sac location.
                  The house comes complete with two living rooms, a welcoming kitchen/dining area, two bathrooms, three bedrooms,
                  a study and a laundry, and retains the value of peaceful living while being conveniently close to shops, school and transport. ",
    price: "200000",
    address: "Avenida Beira Mar, 3470",
    country: "Brasil",
    post_code: "60165-120",
    city: "Fortaleza",
    region: "Ceará",
    condition: "Good",
    year_built: 1985,
    year_reno: 2013,
    bedrooms: 3,
    bathrooms: 2,
    garage: 1,
    lots_size: 90,
    previous_owners: "1 previous owner",
    status: "New",
    photos: "http://www.hotel-r.net/im/hotel/au/beach-apartment-1.jpg",
    user_id: User.all.sample.id

  },
  {
    title: "Lovely Condo",
    description: "Tweet Bucktown studio condo - spacious 800 s/f loft with high ceilings, exposed brick walls and concrete floors. Unbeatable location.
                  Close to the subway station and a fabulous Park is across the street. In-unit Laundry is an unexpected bonus - and the private patio in back is perfect for grilling or a cocktail after work.
                  The building is pet-friendly - fido and fluffy are welcome! Nothing like it on the market . ",
    price: "280000",
    address: "Av. Sen. Salgado Filho, 1906",
    country: "Brasil",
    post_code: "59075-000",
    city: "Natal",
    region: "Rio Grande do Norte",
    condition: "Good",
    year_built: 1999,
    year_reno: 2000,
    bedrooms: 4,
    bathrooms: 2,
    garage: 2,
    lots_size: 125,
    previous_owners: " First owner",
    status: "Reduced",
    photos: "http://www.hotel-r.net/im/hotel/au/beach-apartment-10.jpg",
    user_id: User.all.sample.id
  },
  {
    title: "Spacious House",
    description: "This 5 bedroom, 3 bath tri-level home is absolutely beautiful.
                  The kitchen was remodeled down to the studs and added spray foam insulation, cabinets,
                  high resolution counter tops and hardwood flooring that continues into the living room.
                  The master bedrooms master bath was redone in 2016 with new drywall, vanity, flooring and toilet.
                  The living room has a gorgeous fireplace and large windows with view of the spaciously fenced in backyard.",
    price: "480000",
    address: "Avenida Engenheiro Roberto Freire 5620",
    country: "Brasil",
    post_code: "59090-000",
    city: "Natal",
    region: "Rio Grande do Norte",
    condition: "Newly Renovated",
    year_built: 2006,
    year_reno: 2016,
    bedrooms: 5,
    bathrooms: 3,
    garage: 3,
    lots_size: 1250,
    previous_owners: " First owner",
    status: "New",
    photos: "http://www.hotel-r.net/im/hotel/au/beach-apartment-11.jpg",
    user_id: User.all.sample.id
   },
   {
    title: "Bright Studio",
    description: "Beautiful studio, with a full bathroom and a fully equipped kitchen.
                  The studio is 2 minutes walk from the Central Station and the Grand-Place,
                  accessible by stairs and is on the fifth floor.",
    price: "220000",
    address: "Av. Álvaro Otacílio, 5500",
    country:  "Brasil",
    post_code: "57036-850",
    city: "Maceió",
    region: "Paraíba",
    condition: "good",
    year_built: 1934,
    year_reno: 2010,
    bedrooms: 0,
    bathrooms: 1,
    garage: 0,
    lots_size: 35,
    previous_owners: " 4 previous owner",
    status: "Sold",
    photos: "http://imageprocessor.websimages.com/width/449/busterservicesgroup.webs.com/Sea-View-Apartments-for-sale-in-Alanya-7.jpg",
    user_id: User.all.sample.id
  },
  {
     title: "Apt. Building",
    description: "Great investment opportunity a 4 unit apartment building in a prime location,
                  up and coming neighbourhood, ideal for a real estate unterpreneur with a great project,
                  area with governmental cooperation, especial tax breaks and facilitated approval of renovation plans.",
    price: "1000000",
    address: "Av. Beira Mar, 2450",
    country: "Brasil",
    post_code: "60165-121",
    city: "Fortaleza",
    region: "Ceará",
    condition: "Needs Work",
    year_built: 1950,
    year_reno: 1965,
    bedrooms: 8,
    bathrooms: 4,
    garage: 4,
    lots_size: 450,
    previous_owners: " 2 previous owner",
    status: "Sold",
    photos: "http://www.seaviewresort.com.au/mooloolaba-accommodation/wp-content/uploads/2012/05/PRINT_DSC_1365.jpg",
    user_id: User.all.sample.id
  },
  {
     title: "Amazing Duplex",
    description: "Newly remodeled Duplex, hardwood flooring, new appliances, renovated baths & kitchens
                  w/ granite counters & backsplash, and much more.
                  Turnkey sale w/ home fully tenanted and property management in place.",
    price: "275000",
    address: "Rua Waldemar Falcão, 1524",
    country: "Brasil",
    post_code: "40296-700",
    city: "Salvador",
    region: "Bahia",
    condition: "good",
    year_built: 1995,
    year_reno: 2015,
    bedrooms: 3,
    bathrooms: 2,
    garage: 1,
    lots_size: 70,
    previous_owners: " 1 previous owner",
    status: "Price Changed",
    photos: "https://s3-eu-west-1.amazonaws.com/tt-test-hotels-data/HotelsData/0/21479/e0e66865-6e15-4ac4-9332-1a80b0b5a5dc.jpg",
    user_id: User.all.sample.id
  },
  {
     title: "Great Apartment ",
    description: "Loft style apartment on the top floor that is flooded with natural light, forced air gas and central air conditioning, 1 bedroom, 1 bathroom, skylights.
                  The first floor is also a loft space and basement is unfinished with a 6+ foot ceiling.
                  Walk to the central station and fun restaurants and night life.",
    price: "175000",
    address: "Av. Boa Viagem, 4070",
    country: "Brasil",
    post_code: "51021-100",
    city: "Recife",
    region: "Pernambuco",
    condition: "new",
    year_built: 1998,
    year_reno: 2006,
    bedrooms: 1,
    bathrooms: 1,
    garage: 0,
    lots_size: 60,
    previous_owners: " 1 previous owner",
    status: "Reduced",
    photos: "http://www.seaviewresort.com.au/gallery/lge/mooloolaba_accommodation_18.jpg",
    user_id: User.all.sample.id
  },
    {
     title: "2 Floor House",
    description: "This 5 Bedroom 3 Bath is Very Nicely Done With Wainscoting and Crown Moldings in the Living/Dining/Foyer.
                  Tall Espresso Cabinets with Soft Close Doors and Drawers, Granite Counters and Stainless Steel Appliances.
                  It Has a Great Enclosed Porch Off the Kitchen With Double Doors to the Cedar Deck.
                  2 Bedrooms on the First Floor and 3 Bedrooms on the Second Floor. ",
    price: "475000",
    address: "Av. Delfim Moreira, 630 ",
    country: "Brasil",
    post_code: "22441-000",
    city: "Rio de Janeiro",
    region: "Leblon",
    condition: "great",
    year_built: 2004,
    year_reno: 2012,
    bedrooms: 5,
    bathrooms: 3,
    garage: 3,
    lots_size: 950,
    previous_owners: " first owner",
    status: "new",
    photos: "http://www.hotel-r.net/im/hotel/au/beach-apartment-15.jpg",
    user_id: User.all.sample.id
  },

     {
     title: "Spacious Apartment",
    description: "Beautifully greystone flat with finished basement, hardwood floors, in Walking distance to the city center, Medical Dist. UIC & public trans.
                  Many restaurants and other shops nearby",
    price: " 315000",
    address: "Av. Atlântica, 1702 ",
    country: "Brasil",
    post_code: "22021-001",
    city: "Rio de Janeiro",
    region: "Copacabana",
    condition: "great",
    year_built: 2000,
    year_reno: 2013,
    bedrooms: 1,
    bathrooms: 1,
    garage: 0,
    lots_size: 60,
    previous_owners: " first owner",
    status: "new",
    photos: "http://www.hotel-r.net/im/hotel/au/beach-apartment-16.jpg",
    user_id: User.all.sample.id
  },

   {
     title: "Holiday Home",
    description: "Well cared for 2 bedroom condo within walking distance of many shops and restaurants.
                  First floor offers kitchen, living room with fireplace, half bath and private deck.
                  Second floor offers 2 bedrooms, full bath, and stack washer/dryer. ",
    price: "285000",
    address: " Rua Doutor Eurico Sodré, 194",
    country: "Brasil",
    post_code: "12460-000",
    city: "Campos do Jordão",
    region: "São Paulo",
    condition: "great",
    year_built: 2009,
    year_reno: 0,
    bedrooms: 2,
    bathrooms: 1,
    garage: 1,
    lots_size: 100,
    previous_owners: " 2 previous owners",
    status: "new",
    photos: "http://interiordesignfiles.com/wp-content/uploads/2012/07/big-family-house-in-mountains-family-house-design-6.jpg",
    user_id: User.all.sample.id
  },

  {
     title: "Cool Apartment",
    description: "This beautiful 1 bedroom apartment has been well maintained.
                  Has wooden cabinets in kitchen, all new appliances, full bathroom,
                  Hardwood floors, 9' ceilings. The apartment is ideally located and wlking distance,
                  to most shops and ammenities. Near public transport and near the historic center of this beautiful medieval city.
                  Downstairs unit has electric heat and pellet stove. Built in cabinet in Dining room. ",
    price: "225000",
    address: "Av. das Nações Unidas, 13301",
    country: "Brasil",
    post_code: "04795-100",
    city: "São Paulo",
    region: "Itaim Bibi",
    condition: "good",
    year_built: 1997,
    year_reno: 2011,
    bedrooms: 1,
    bathrooms: 1,
    garage: 0,
    lots_size: 50,
    previous_owners: " 3 previous owners",
    status: "sold",
    photos: "http://interiordesignfiles.com/wp-content/uploads/2012/07/big-family-house-in-mountains-family-house-design-2.jpg",
    user_id: User.all.sample.id
  },

  {
     title: "Beach front Apartment",
    description: "This a beachfront apartment in Guarapari's Hill Beach is a well spaced 2 bedroom unit with large lounge and dining room.
                  Has an enclosed balcony with good sea views. Kitchen is tilled with BIC and granite. bedrooms have BIC.
                  1 lock up garage and very conveniently located close to a school, hospital, shops, the beach and public transport. ",
    price: "415000",
    address: "Av. Oceânica, 160",
    country: "Brasil",
    post_code: "29216-610",
    city: "Guarapari",
    region: "Praia do Morro",
    condition: "good",
    year_built: 1997,
    year_reno: 2011,
    bedrooms: 2,
    bathrooms: 1,
    garage: 1,
    lots_size: 60,
    previous_owners: " 2 previous owners",
    status: "reduced",
    photos:  "http://www.hotel-r.net/im/hotel/au/beach-apartment-14.jpg",
    user_id: User.all.sample.id
  }

]
assets_attributes.each { |params| Asset.create!(params) }
