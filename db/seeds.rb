# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.destroy_all
Asset.destroy_all
User.destroy_all



User.create(email: "kostas1@gmail.com", password:"123456", name: "Kostas", last_name: "Sofianopoulos", birthdate: Date.new(2001,2,3))
Asset.create(title: "Lucas' house", description: "In the jungle", price: "125000", address: "453 Amazon way", country: "Brasil", city: "Parana", region: "Don't know", condition: "good", year_built: 1990, year_reno: 1995, bedrooms: 2, bathrooms: 2, garage: "NO", lots_size: 300, previous_owners: "Lucas' mom and dad", status: "Junk", user_id: User.first.id)
Asset.create(title: "Lucas' house", description: "In the jungle", price: "125000", address: "452 Amazon way", country: "Brasil", city: "Parana", region: "Don't know", condition: "good", year_built: 1990, year_reno: 1995, bedrooms: 2, bathrooms: 2, garage: "YES", lots_size: 300, previous_owners: "Lucas' mom and dad", status: "Junk", user_id: User.first.id)

Offer.create(user_id: User.first.id, asset_id: Asset.first.id, offer_date: Date.today, status: "pending", offer_type: "300,000 all cash")
