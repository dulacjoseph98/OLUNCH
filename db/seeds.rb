puts 'Cleaning up local db...'
# To be added in reverse order of the creation have to remove the dependent tables first
Attendee.destroy_all
Event.destroy_all
Review.destroy_all
Location.destroy_all
UserEntity.destroy_all
User.destroy_all
Entity.destroy_all
puts 'Finished'


# creation of data in the tables starting with those with no dependencies
puts 'Creating entities...'
wagon = Entity.new(
  address: "16 Villa Gaudelet, 75011 Paris",
  name: "Le Wagon",
  latitude: 48.864930,
  longitude: 2.380070
  )
wagon.save
puts 'Finished!'

puts 'Creating users...'
jojo = User.new(
  firstname: "Joseph",
  lastname: "Dulac",
  nickname: "Jojo",
  email: "jojo@lewagon.org",
  password: "azerty"
  )
jojo.save
gab = User.new(
  firstname: "Gabriel",
  lastname: "Lebrun",
  nickname: "Gab",
  email: "gab@lewagon.org",
  password: "azerty"
  )
gab.save
kez = User.new(
  firstname: "Keziah",
  lastname: "Smadja",
  nickname: "Kez",
  email: "kez@lewagon.org",
  password: "azerty"
  )
kez.save
puts 'Finished!'

puts 'Creating user_entities...'
joseph = UserEntity.new(
  user_id: jojo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
joseph.save
gabriel = UserEntity.new(
  user_id: gab.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
gabriel.save
keziah = UserEntity.new(
  user_id: kez.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
keziah.save
puts 'Finished!'

# Possible categories taken from the Le Wagon list:
# category = Asian, Burgers, Kebab, Coffee Shop, Hawaiian, Lebanese, Mexican, Pizza, Sandwich, Sushi, Supermarket

# Le Wagon list
# done - Pour les amateurs de Kebab : Surpriz - [110 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/ZTugDwjeY524Pcb47)
# done - Raftel Coffee Shop - [16 Villa Gaudelet, 75011 Paris](https://goo.gl/maps/gtFyJbGH7keawLzU8)
# done - Sandwichs et Salades   : Le Favori - [112 Rue Saint-Maur, 75011 Paris](https://goo.gl/maps/Avc2dwEDV1q1ZH6q9)
# done - Health : Esprit Tchai - [115 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/WBbZW1XmmRyrvtzeA)
# to do - Cuisine sans friture : Alicheur - [96 Rue Saint-Maur, 75011 Paris](https://goo.gl/maps/JsLYUT7ohxESojxS8)
# to do - Cuisine un peu asiatique : Thai Wok House - [121 rue Oberkampf, 75011 Paris](https://goo.gl/maps/NZdyPzFWYodqEL5j6)
# to do - Cuisine asiatique : James Bún - [126 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/su7TG9TTmfgiKhyF8)
# to do - Cuisine Hawaïenne : Pokawa - [56 bis Rue Oberkampf, 75011 Paris](https://g.page/pokawa-oberkampf?share)
# to do - Bistrot, Pizza : Chez Justine - [96 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/fuzYfGdMN4nNAErb9)
# to do - Burgers : PNY - [96 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/dGg53pMWpmVYxcNG6)
# to do - Burgers : Le Camion Qui Fume - [66 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/Htu44AiGkkidLomSA)
# to do - Sushis : Nakagawa - [142 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/tVxRSbZVUohXPtjm8)
# to do - Viande : La Brigade - [103 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/m26VPxoKsM1po3sT8)
# to do - Libanais : Le Petit Phénicien - [101 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/Kfn3PYaG9byXCJU99)
# to do - Mexicain : Bocamexa - [95 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/Rk1HgMgqZLTxvwm57)
# to do - Monoprix : [89 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/zrXG3o6KgAVjrcz18)
# to do - Cuisine asiatique : Pierre Sang - [55 Rue Oberkampf, 75011 Paris](https://goo.gl/maps/RLhNsk3VYuocDsCWA)

puts 'Creating locations...'
surpriz = Location.new(
  address: "110 Rue Oberkampf, 75011 Paris",
  name: "Surpriz",
  category: "Kebab",
  # latitude: 48.865960,
  # longitude: 2.378970,
  entity_id: wagon.id
  )
surpriz.save
raftel = Location.new(
  address: "16 Villa Gaudelet, 75011 Paris",
  name: "Raftel",
  category: "Coffee Shop",
  latitude: 48.864930,
  longitude: 2.380070,
  entity_id: wagon.id
  )
raftel.save
favori = Location.new(
  address: "112 Rue Saint-Maur, 75011 Paris",
  name: "Le Favori",
  category: "Sandwich",
  latitude: 48.866829,
  longitude: 2.376430,
  entity_id: wagon.id
  )
favori.save
tchai = Location.new(
  address: "115 Rue Oberkampf, 75011 Paris",
  name: "Esprit Tchai",
  category: "Asian",
  latitude: 48.865980,
  longitude: 2.378420,
  entity_id: wagon.id
  )
tchai.save
puts 'Finished!'

puts 'Creating events...'
lunch_two = Event.new(
  location_id: favori.id,
  user_id: jojo.id,
  start_at: Time.now,
  public: false,
  capacity: 2
  )
lunch_two.save
lunch_public = Event.new(
  location_id: surpriz.id,
  user_id: kez.id,
  start_at: Time.now,
  public: true,
  capacity: rand(2..12)
  )
lunch_two.save
puts 'Finished!'

puts 'Creating attendees...'
lunch_two_attendee_one = Attendee.new(
  user_id: jojo.id,
  event_id: lunch_two.id,
  status: 1
  )
lunch_two_attendee_one.save
lunch_two_attendee_two = Attendee.new(
  user_id: gab.id,
  event_id: lunch_two.id,
  status: 1
  )
lunch_two_attendee_two.save
lunch_public_attendee_one = Attendee.new(
  user_id: kez.id,
  event_id: lunch_public.id,
  status: 1
  )
lunch_public_attendee_one.save
lunch_public_attendee_two = Attendee.new(
  user_id: jojo.id,
  event_id: lunch_public.id,
  status: 0
  )
lunch_public_attendee_two.save
lunch_public_attendee_three = Attendee.new(
  user_id: gab.id,
  event_id: lunch_public.id,
  status: 2
  )
lunch_public_attendee_three.save
puts 'Finished!'

puts 'Creating reviews...'
surpriz_review = Review.new(
  location_id: surpriz.id,
  comment: "The best Berlin style Kebab house in Paris.",
  rating: 4,
  user_id: jojo.id
  )
surpriz_review.save
favori_review = Review.new(
  location_id: favori.id,
  comment: "Great Ham & English Cheddar Cheese sandwich.",
  rating: 3,
  user_id: gab.id
  )
favori_review.save
tchai_review = Review.new(
  location_id: tchai.id,
  comment: "Good value for money.",
  rating: 4,
  user_id: kez.id
  )
tchai_review.save
puts 'Finished!'
