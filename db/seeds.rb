# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.destroy_all
Entity.destroy_all

lewagon = Entity.create!(name: "Le Wagon", address: "16 villa Gaudelet, Paris")

pitaya = Location.create!(name: "Pitaya", address: "140 rue Oberkampf, Paris", entity: lewagon)
labrigade = Location.create!(name: "La Brigade", address: "103 rue Oberkampf, Paris", entity: lewagon)
