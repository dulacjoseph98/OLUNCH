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
jojobande = Entity.new(
  address: "Unit 22 Tooley St, London SE1 2HD, Royaume-Uni",
  name: "Joseph's crew"
  )
file = URI.open('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614786328/lv9pxubcuzbnfvaeo68x.jpg')
jojobande.photo.attach(io: file, filename: 'jojo.jpg', content_type: 'image/jpg')
jojobande.save!



wagon = Entity.new(
  address: "16 Villa Gaudelet, 75011 Paris",
  name: "Le Wagon",
  )
file = URI.open('https://dwj199mwkel52.cloudfront.net/assets/lewagon-logo-square-b6124eb974be375884558e4464efce48a9b5664f18422768156364363ecdd1fc.png')
wagon.photo.attach(io: file, filename: 'wagon.jpg', content_type: 'image/jpg')
wagon.save!
puts 'Finished!'


puts 'Creating users...'
demoman = User.new(
  firstname: "Demo",
  lastname: "Man",
  nickname: "Rfif",
  email: "demo@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
demoman.photo.attach(io: file, filename: 'demoman.jpg', content_type: 'image/jpg')
demoman.save!

jo = User.new(
  firstname: "Joseph",
  lastname: "Dulac",
  nickname: "Jo",
  email: "jo@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
jo.photo.attach(io: file, filename: 'jo.jpg', content_type: 'image/jpg')
jo.save!

gab = User.new(
  firstname: "Gabriel",
  lastname: "Lebrun",
  nickname: "Gab",
  email: "gab@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=female').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
gab.photo.attach(io: file, filename: 'gab.jpg', content_type: 'image/jpg')
gab.save!

kez = User.new(
  firstname: "Keziah",
  lastname: "Smadja",
  nickname: "Kez",
  email: "kez@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
kez.photo.attach(io: file, filename: 'kez.jpg', content_type: 'image/jpg')
kez.save!

tom = User.new(
  firstname: "Thomas",
  lastname: "Desmoulins",
  nickname: "Tom",
  email: "tom@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
tom.photo.attach(io: file, filename: 'tom.jpg', content_type: 'image/jpg')
tom.save!

igo = User.new(
  firstname: "Igor",
  lastname: "Murphy",
  nickname: "Igo",
  email: "igo@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
igo.photo.attach(io: file, filename: 'igor.jpg', content_type: 'image/jpg')
igo.save!

puts 'Finished!'

puts 'Creating user_entities...'
UserEntity.create!(
  user_id: demoman.id,
  entity_id: wagon.id,
  role: "Demo guy",
  status: 0
  )

UserEntity.create!(
  user_id: jo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )


UserEntity.create!(
  user_id: gab.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: kez.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: tom.id,
  entity_id: wagon.id,
  role: "teacher",
  status: 0
  )

UserEntity.create!(
  user_id: igo.id,
  entity_id: wagon.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: demoman.id,
  entity_id: jojobande.id,
  role: "Demo guy",
  status: 0
  )

UserEntity.create!(
  user_id: jo.id,
  entity_id: jojobande.id,
  role: "student",
  status: 0
  )


UserEntity.create!(
  user_id: gab.id,
  entity_id: jojobande.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: kez.id,
  entity_id: jojobande.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: tom.id,
  entity_id: jojobande.id,
  role: "teacher",
  status: 0
  )

UserEntity.create!(
  user_id: igo.id,
  entity_id: jojobande.id,
  role: "student",
  status: 0
  )

puts 'Finished!'

# Category taken from the Le Wagon list:
# Asian, Bistrot, Burger, Kebab, Coffee Shop, Hawaiian, Health, Lebanese, Mexican, Pizza, Sandwich, Supermarket, Sushi

puts 'Creating locations...'
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614596772/yqrxpq0ydvuozt9ya4gz.jpg')
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

# file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614346974/t4hopi5pjxyrrvztjbdk.jpg')
# raftel = Location.new(
#   address: "16 Villa Gaudelet, 75011 Paris",
#   name: "Raftel",
#   category: "Coffee Shop",
#   entity_id: wagon.id
#   )
# raftel.photo.attach(io: file, filename: 'raftel.jpg', content_type: 'image/jpg')
# raftel.save!

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352378/wcu86rkjvcnowbjjzou2.jpg')
favori = Location.new(
  address: "112 Rue Saint-Maur, 75011 Paris",
  name: "Le Favori",
  category: "Sandwich",
  entity_id: wagon.id
  )
favori.photo.attach(io: file, filename: 'favori.jpg', content_type: 'image/jpg')
favori.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352353/xut2d2qnafq7cjc2ipo0.jpg')
tchai = Location.new(
  address: "115 Rue Oberkampf, 75011 Paris",
  name: "Esprit Tchai",
  category: "Health",
  entity_id: wagon.id
  )
tchai.photo.attach(io: file, filename: 'tachai.jpg', content_type: 'image/jpg')
tchai.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352081/bwsisjppbeduvughtuiv.jpg')
bocamexa = Location.new(
  address: "95 Rue Oberkampf, 75011 Paris",
  name: "Bocamexa",
  category: "Mexican",
  entity_id: wagon.id
  )
bocamexa.photo.attach(io: file, filename: 'bocamexa.jpg', content_type: 'image/jpg')
bocamexa.save!
monoprix = Location.new(
  address: "89 Rue Oberkampf, 75011 Paris",
  name: "Monoprix",
  category: "Supermarket",
  entity_id: wagon.id
  )
monoprix.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352314/pjlcbkatupodl8drntmf.jpg')
psang = Location.new(
  address: "55 Rue Oberkampf, 75011 Paris",
  name: "Pierre Sang",
  category: "Asian",
  entity_id: wagon.id
  )
psang.photo.attach(io: file, filename: 'psang.jpg', content_type: 'image/jpg')
psang.save!


puts 'Finished!'

puts 'Creating events...'
lunch_two = Event.new(
  location_id: favori.id,
  user_id: kez.id,
  start_at: Time.strptime('03/08/2021 20:30', '%m/%d/%Y %H:%M'),
  public: false,
  capacity: 2
  )
lunch_two.save!
lunch_three = Event.new(
  location_id: barracao.id,
  user_id: gab.id,
  start_at: Time.strptime('03/08/2021 22:30', '%m/%d/%Y %H:%M'),
  public: false,
  capacity: 2
  )
lunch_three.save!
lunch_public = Event.new(
  location_id: barracao.id,
  user_id: demo.id,
  start_at: Time.strptime('03/05/2021 20:30', '%m/%d/%Y %H:%M'),
  public: true,
  capacity: rand(2..6)
  )
lunch_public.save!
puts 'Finished!'

puts 'Creating attendees...'
lunch_two_attendee_one = Attendee.new(
  user_id: jo.id,
  event_id: lunch_two.id,
  status: 0
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
lunch_public_attendee_one.save!
lunch_public_attendee_two = Attendee.new(
  user_id: kez.id,
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

Review.create!(
  location_id: barracao.id,
  comment: "Take away beer does the trick.",
  rating: 4,
  user_id: jo.id
  )

Review.create!(
  location_id: surpriz.id,
  comment: "The best Berlin style Kebab house in Paris.",
  rating: 4,
  user_id: jo.id
  )

Review.create!(
  location_id: favori.id,
  comment: "Great Ham & English Cheddar Cheese sandwich.",
  rating: 3,
  user_id: gab.id
  )

Review.create!(
  location_id: tchai.id,
  comment: "Good value for money.",
  rating: 4,
  user_id: kez.id
  )

puts 'Finished!'
