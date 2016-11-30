# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Offer.destroy_all
Asset.destroy_all
User.destroy_all

 20. times do

   user = User.new({email: Faker::Internet.email,
               password:Faker::Internet.password,
               name:Faker::Name.first_name,

                              last_name: Faker::Name.last_name,
              birthdate: Date.new(2001,2,3)})
   user.save
 end


20. times do

  asset = Asset.new({title: Faker::Address.secondary_address,
            description: Faker::Lorem.paragraph(2),
            price: Faker::Number.decimal(3, 3),
            address: Faker::Address.street_address,
            country: Faker::Address.country,
            city: Faker::Address.city,
            region: Faker::Space.planet,
            condition:Faker::SlackEmoji.custom,
            year_built: Faker::Number.number(4),
            year_reno: Faker::Number.number(4),
            bedrooms: Faker::Number.between(1,5),
            bathrooms: Faker::Number.between(1, 3),
            garage: Faker::Number.between(0, 1),
            lots_size: Faker::Number.decimal(2) ,
            previous_owners: Faker::Name.name_with_middle,
            status: Faker::SlackEmoji.custom,
            user_id: User.all.sample.id})
  asset.save!
end


  20. times do
    offer = Offer.create({user_id: User.all.sample.id,
              asset_id: Asset.all.sample.id,
              offer_date: Faker::Date.between(2.days.ago, Date.today),
              status: "pending",
              offer_type: Faker::Number.decimal(3, 3)})
    offer.save
  end







