require "open-uri"

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
  )
wagon.save!
puts 'Finished!'

puts 'Creating users...'
jo = User.new(
  firstname: "Joseph",
  lastname: "Dulac",
  nickname: "Jo",
  email: "jo@lewagon.org",
  password: "azerty"
  )
jo.save!
gab = User.new(
  firstname: "Gabriel",
  lastname: "Lebrun",
  nickname: "Gab",
  email: "gab@lewagon.org",
  password: "azerty"
  )
gab.save!
kez = User.new(
  firstname: "Keziah",
  lastname: "Smadja",
  nickname: "Kez",
  email: "kez@lewagon.org",
  password: "azerty"
  )
kez.save!
tom = User.new(
  firstname: "Thomas",
  lastname: "Desmoulins",
  nickname: "Tom",
  email: "tom@lewagon.org",
  password: "azerty"
  )
tom.save!
igo = User.new(
  firstname: "Igor",
  lastname: "Murphy",
  nickname: "Igo",
  email: "igo@lewagon.org",
  password: "azerty"
  )
igo.save!
puts 'Finished!'

puts 'Creating user_entities...'
joseph = UserEntity.new(
  user_id: jo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
joseph.save!
gabriel = UserEntity.new(
  user_id: gab.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
gabriel.save!
keziah = UserEntity.new(
  user_id: kez.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
keziah.save!
thomas = UserEntity.new(
  user_id: tom.id,
  entity_id: wagon.id,
  role: "teacher",
  status: 0
  )
thomas.save!
igor = UserEntity.new(
  user_id: igo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )
igor.save!
puts 'Finished!'

# Category taken from the Le Wagon list:
# Asian, Bistrot, Burger, Kebab, Coffee Shop, Hawaiian, Health, Lebanese, Mexican, Pizza, Sandwich, Supermarket, Sushi

puts 'Creating locations...'
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614345946/kxte5hbmithmbiytpnid.jpg')
barracao = Location.new(
  address: "108 Rue Oberkampf, 75011 Paris",
  name: "Barracao",
  category: "Bar",
  entity_id: wagon.id
  )
barracao.photo.attach(io: file, filename: 'barracao.jpg', content_type: 'image/jpg')
barracao.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614346845/julihkwh5xovuoe7suqs.jpg')
surpriz = Location.new(
  address: "110 Rue Oberkampf, 75011 Paris",
  name: "Surpriz",
  category: "Kebab",
  entity_id: wagon.id
  )
surpriz.photo.attach(io: file, filename: 'surpriz.jpg', content_type: 'image/jpg')
surpriz.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614346974/t4hopi5pjxyrrvztjbdk.jpg')
raftel = Location.new(
  address: "16 Villa Gaudelet, 75011 Paris",
  name: "Raftel",
  category: "Coffee Shop",
  entity_id: wagon.id
  )
raftel.photo.attach(io: file, filename: 'raftel.jpg', content_type: 'image/jpg')
raftel.save!
favori = Location.new(
  address: "112 Rue Saint-Maur, 75011 Paris",
  name: "Le Favori",
  category: "Sandwich",
  entity_id: wagon.id
  )
favori.save!
tchai = Location.new(
  address: "115 Rue Oberkampf, 75011 Paris",
  name: "Esprit Tchai",
  category: "Health",
  entity_id: wagon.id
  )
tchai.save!
alicheur = Location.new(
  address: "96 Rue Saint-Maur, 75011 Paris",
  name: "Alicheur",
  category: "Health",
  entity_id: wagon.id
  )
alicheur.save!
thai = Location.new(
  address: "121 rue Oberkampf, 75011 Paris",
  name: "Thai Wok House",
  category: "Asian",
  entity_id: wagon.id
  )
thai.save!
jbun = Location.new(
  address: "126 Rue Oberkampf, 75011 Paris",
  name: "James Bún",
  category: "Asian",
  entity_id: wagon.id
  )
jbun.save!
pokawa = Location.new(
  address: "56 bis Rue Oberkampf, 75011 Paris",
  name: "Pokawa",
  category: "Hawaiian",
  entity_id: wagon.id
  )
pokawa.save!
justine = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "Chez Justine",
  category: "Pizza",
  entity_id: wagon.id
  )
justine.save!
pny = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "PNY",
  category: "Burger",
  entity_id: wagon.id
  )
pny.save!
camion = Location.new(
  address: "66 Rue Oberkampf, 75011 Paris",
  name: "Le Camion Qui Fume",
  category: "Burger",
  entity_id: wagon.id
  )
camion.save!
nakagawa = Location.new(
  address: "142 Rue Oberkampf, 75011 Paris",
  name: "Nakagawa",
  category: "Sushi",
  entity_id: wagon.id
  )
nakagawa.save!
brigade = Location.new(
  address: "103 Rue Oberkampf, 75011 Paris",
  name: "La Brigade",
  category: "Bistrot",
  entity_id: wagon.id
  )
brigade.save!
phenicien = Location.new(
  address: "101 Rue Oberkampf, 75011 Paris",
  name: "Le Petit Phénicien",
  category: "Lebanese",
  entity_id: wagon.id
  )
phenicien.save!
bocamexa = Location.new(
  address: "95 Rue Oberkampf, 75011 Paris",
  name: "Bocamexa",
  category: "Lebanese",
  entity_id: wagon.id
  )
bocamexa.save!
monoprix = Location.new(
  address: "89 Rue Oberkampf, 75011 Paris",
  name: "Monoprix",
  category: "Supermarket",
  entity_id: wagon.id
  )
monoprix.save!
psang = Location.new(
  address: "55 Rue Oberkampf, 75011 Paris",
  name: "Pierre Sang",
  category: "Asian",
  entity_id: wagon.id
  )
psang.save!
puts 'Finished!'

puts 'Creating events...'
lunch_two = Event.new(
  location_id: favori.id,
  user_id: jo.id,
  start_at: Time.now,
  public: false,
  capacity: 2
  )
lunch_two.save!
lunch_three = Event.new(
  location_id: favori.id,
  user_id: jo.id,
  start_at: Time.now,
  public: false,
  capacity: 2
  )
lunch_three.save!
lunch_public = Event.new(
  location_id: surpriz.id,
  user_id: kez.id,
  start_at: Time.now,
  public: true,
  capacity: rand(2..12)
  )
lunch_public.save!
puts 'Finished!'

puts 'Creating attendees...'
lunch_two_attendee_one = Attendee.new(
  user_id: jo.id,
  event_id: lunch_two.id,
  status: 1
  )
lunch_two_attendee_one.save!
lunch_two_attendee_two = Attendee.new(
  user_id: gab.id,
  event_id: lunch_two.id,
  status: 1
  )
lunch_two_attendee_two.save!
lunch_three_attendee_one = Attendee.new(
  user_id: jo.id,
  event_id: lunch_three.id,
  status: 0
  )
lunch_three_attendee_one.save!
lunch_public_attendee_one = Attendee.new(
  user_id: kez.id,
  event_id: lunch_public.id,
  status: 1
  )
lunch_public_attendee_one.save!
lunch_public_attendee_two = Attendee.new(
  user_id: jo.id,
  event_id: lunch_public.id,
  status: 0
  )
lunch_public_attendee_two.save!
lunch_public_attendee_three = Attendee.new(
  user_id: gab.id,
  event_id: lunch_public.id,
  status: 2
  )
lunch_public_attendee_three.save!
puts 'Finished!'

puts 'Creating reviews...'
barracao_review = Review.new(
  location_id: barracao.id,
  comment: "Take away beer does the trick.",
  rating: 4,
  user_id: jo.id
  )
barracao_review.save!
surpriz_review = Review.new(
  location_id: surpriz.id,
  comment: "The best Berlin style Kebab house in Paris.",
  rating: 4,
  user_id: jo.id
  )
surpriz_review.save!
favori_review = Review.new(
  location_id: favori.id,
  comment: "Great Ham & English Cheddar Cheese sandwich.",
  rating: 3,
  user_id: gab.id
  )
favori_review.save!
tchai_review = Review.new(
  location_id: tchai.id,
  comment: "Good value for money.",
  rating: 4,
  user_id: kez.id
  )
tchai_review.save!
thai_review = Review.new(
  location_id: thai.id,
  comment: "Really good Loc Lac.",
  rating: 4,
  user_id: igo.id
  )
thai_review.save!
puts 'Finished!'
