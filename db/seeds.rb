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
jo = User.new(
  firstname: "Joseph",
  lastname: "Dulac",
  nickname: "Jo",
  email: "jo@lewagon.org",
  password: "azerty"
  )
jo.save
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
tom = User.new(
  firstname: "Thomas",
  lastname: "Desmoulins",
  nickname: "Tom",
  email: "tom@lewagon.org",
  password: "azerty"
  )
tom.save
igo = User.new(
  firstname: "Igor",
  lastname: "Murphy",
  nickname: "Igo",
  email: "igo@lewagon.org",
  password: "azerty"
  )
igo.save
puts 'Finished!'

puts 'Creating user_entities...'
joseph = UserEntity.new(
  user_id: jo.id,
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
thomas = UserEntity.new(
  user_id: tom.id,
  entity_id: wagon.id,
  role: "teacher",
  status: 0
  )
thomas.save
igor = UserEntity.new(
  user_id: igo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
igor.save
puts 'Finished!'

# Category taken from the Le Wagon list:
# Asian, Bistrot, Burger, Kebab, Coffee Shop, Hawaiian, Health, Lebanese, Mexican, Pizza, Sandwich, Supermarket, Sushi

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
  category: "Health",
  latitude: 48.865980,
  longitude: 2.378420,
  entity_id: wagon.id
  )
tchai.save
alicheur = Location.new(
  address: "96 Rue Saint-Maur, 75011 Paris",
  name: "Alicheur",
  category: "Health",
  latitude: 48.865540,
  longitude: 2.377520,
  entity_id: wagon.id
  )
alicheur.save
thai = Location.new(
  address: "121 rue Oberkampf, 75011 Paris",
  name: "Thai Wok House",
  category: "Asian",
  latitude: 48.866080,
  longitude: 2.378870,
  entity_id: wagon.id
  )
thai.save
jbun = Location.new(
  address: "126 Rue Oberkampf, 75011 Paris",
  name: "James Bún",
  category: "Asian",
  latitude: 48.866190,
  longitude: 2.379970,
  entity_id: wagon.id
  )
jbun.save
pokawa = Location.new(
  address: "56 bis Rue Oberkampf, 75011 Paris",
  name: "Pokawa",
  category: "Hawaiian",
  latitude: 48.864740,
  longitude: 2.373330,
  entity_id: wagon.id
  )
pokawa.save
justine = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "Chez Justine",
  category: "Pizza",
  latitude: 48.8656521,
  longitude: 2.3777638,
  entity_id: wagon.id
  )
justine.save
pny = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "PNY",
  category: "Burger",
  latitude: 48.8656521,
  longitude: 2.3777638,
  entity_id: wagon.id
  )
pny.save
camion = Location.new(
  address: "66 Rue Oberkampf, 75011 Paris",
  name: "Le Camion Qui Fume",
  category: "Burger",
  latitude: 48.8649671,
  longitude: 2.3745277,
  entity_id: wagon.id
  )
camion.save
nakagawa = Location.new(
  address: "142 Rue Oberkampf, 75011 Paris",
  name: "Nakagawa",
  category: "Sushi",
  latitude: 48.866417,
  longitude: 2.3808259,
  entity_id: wagon.id
  )
nakagawa.save
brigade = Location.new(
  address: "142 Rue Oberkampf, 75011 Paris",
  name: "La Brigade",
  category: "Bistrot",
  latitude: 48.865643,
  longitude: 2.3769627,
  entity_id: wagon.id
  )
brigade.save
phenicien = Location.new(
  address: "101 Rue Oberkampf, 75011 Paris",
  name: "Le Petit Phénicien",
  category: "Lebanese",
  latitude: 48.8655866,
  longitude: 2.3767246,
  entity_id: wagon.id
  )
phenicien.save
bocamexa = Location.new(
  address: "95 Rue Oberkampf, 75011 Paris",
  name: "Bocamexa",
  category: "Lebanese",
  latitude: 48.8654268,
  longitude: 2.3759715,
  entity_id: wagon.id
  )
bocamexa.save
monoprix = Location.new(
  address: "89 Rue Oberkampf, 75011 Paris",
  name: "Monoprix",
  category: "Supermarket",
  latitude: 48.8652769,
  longitude: 2.3754365,
  entity_id: wagon.id
  )
monoprix.save
psang = Location.new(
  address: "55 Rue Oberkampf, 75011 Paris",
  name: "Pierre Sang",
  category: "Asian",
  latitude: 48.8647,
  longitude: 2.3723457,
  entity_id: wagon.id
  )
psang.save
puts 'Finished!'

puts 'Creating events...'
lunch_two = Event.new(
  location_id: favori.id,
  user_id: jo.id,
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
  user_id: jo.id,
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
  user_id: jo.id,
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
  user_id: jo.id
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
