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
apple = Entity.new(
  address: "12 Rue Halévy, 75009 Paris",
  name: "Apple"
  )
file = URI.open('https://static.lexpress.fr/medias_9606/w_1600,h_696,c_crop,x_0,y_285/w_480,h_270,c_fill,g_north/v1402566386/apple-logo-pomme_4918775.jpeg')
apple.photo.attach(io: file, filename: 'apple.jpg', content_type: 'image/jpg')
apple.save!



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
  entity_id: apple.id,
  role: "Demo guy",
  status: 0
  )

UserEntity.create!(
  user_id: jo.id,
  entity_id: apple.id,
  role: "student",
  status: 0
  )


UserEntity.create!(
  user_id: gab.id,
  entity_id: apple.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: kez.id,
  entity_id: apple.id,
  role: "student",
  status: 0
  )

UserEntity.create!(
  user_id: tom.id,
  entity_id: apple.id,
  role: "teacher",
  status: 0
  )

UserEntity.create!(
  user_id: igo.id,
  entity_id: apple.id,
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

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614346974/t4hopi5pjxyrrvztjbdk.jpg')
raftel = Location.new(
  address: "16 Villa Gaudelet, 75011 Paris",
  name: "Raftel",
  category: "Coffee Shop",
  entity_id: wagon.id
  )
raftel.photo.attach(io: file, filename: 'raftel.jpg', content_type: 'image/jpg')
raftel.save!

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
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352331/zmvcm4iiydjbxgcxyrqf.jpg')
alicheur = Location.new(
  address: "96 Rue Saint-Maur, 75011 Paris",
  name: "Alicheur",
  category: "Health",
  entity_id: wagon.id
  )
alicheur.photo.attach(io: file, filename: 'alicheur.jpg', content_type: 'image/jpg')
alicheur.save!
thai = Location.new(
  address: "121 rue Oberkampf, 75011 Paris",
  name: "Thai Wok House",
  category: "Asian",
  entity_id: wagon.id
  )
thai.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614351804/qy62ky380bbeptoijunq.jpg')
jbun = Location.new(
  address: "126 Rue Oberkampf, 75011 Paris",
  name: "James Bún",
  category: "Asian",
  entity_id: wagon.id
  )
jbun.photo.attach(io: file, filename: 'jbun.jpg', content_type: 'image/jpg')
jbun.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614351796/rogwedj8ly0unzlbzibg.jpg')
pokawa = Location.new(
  address: "56 bis Rue Oberkampf, 75011 Paris",
  name: "Pokawa",
  category: "Hawaiian",
  entity_id: wagon.id
  )
pokawa.photo.attach(io: file, filename: 'pokawa.jpg', content_type: 'image/jpg')
pokawa.save!

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352269/w04cm0gy2yhc31k901o9.jpg')
justine = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "Chez Justine",
  category: "Pizza",
  entity_id: wagon.id
  )
justine.photo.attach(io: file, filename: 'justine.jpg', content_type: 'image/jpg')
justine.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352193/og7ydrcrws0mfptwh4v2.jpg')

pny = Location.new(
  address: "96 Rue Oberkampf, 75011 Paris",
  name: "PNY",
  category: "Burger",
  entity_id: wagon.id
  )
pny.photo.attach(io: file, filename: 'pny.jpg', content_type: 'image/jpg')
pny.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352176/dlqu1xk5slubj05obn6t.jpg')
camion = Location.new(
  address: "66 Rue Oberkampf, 75011 Paris",
  name: "Le Camion Qui Fume",
  category: "Burger",
  entity_id: wagon.id
  )
camion.photo.attach(io: file, filename: 'camion.jpg', content_type: 'image/jpg')
camion.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352120/f0mdibdbadqavxuvnh1e.jpg')
nakagawa = Location.new(
  address: "142 Rue Oberkampf, 75011 Paris",
  name: "Nakagawa",
  category: "Sushi",
  entity_id: wagon.id
  )
nakagawa.photo.attach(io: file, filename: 'nakagawa.jpg', content_type: 'image/jpg')
nakagawa.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352104/mxyeri6tcp7n3i1j2jjz.jpg')
brigade = Location.new(
  address: "103 Rue Oberkampf, 75011 Paris",
  name: "La Brigade",
  category: "Bistrot",
  entity_id: wagon.id
  )
brigade.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352093/p42phpta6mddrndpmikq.jpg')
phenicien = Location.new(
  address: "101 Rue Oberkampf, 75011 Paris",
  name: "Le Petit Phénicien",
  category: "Lebanese",
  entity_id: wagon.id
  )
phenicien.photo.attach(io: file, filename: 'phenicien.jpg', content_type: 'image/jpg')
phenicien.save!
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352081/bwsisjppbeduvughtuiv.jpg')
bocamexa = Location.new(
  address: "95 Rue Oberkampf, 75011 Paris",
  name: "Bocamexa",
  category: "Lebanese",
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

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352193/og7ydrcrws0mfptwh4v2.jpg')
hippopotamus = Location.new(
  address: "1 Boulevard des Capucines, 75002 Paris",
  name: "Hippopotamus",
  category: "Burger",
  entity_id: apple.id
  )
hippopotamus.photo.attach(io: file, filename: 'hippopotamus.jpg', content_type: 'image/jpg')
hippopotamus.save!

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352193/og7ydrcrws0mfptwh4v2.jpg')
hanoicaphe = Location.new(
  address: "30 Boulevard des Italiens, 75009 Paris",
  name: "Hanoï Cà Phê",
  category: "Asian",
  entity_id: apple.id
  )
hanoicaphe.photo.attach(io: file, filename: 'hanoicaphe.jpg', content_type: 'image/jpg')
hanoicaphe.save!

operasandwich = Location.new(
  address: "1 Rue de Marivaux, 75002 Paris",
  name: "Opera Sandwich",
  category: "Sandwich",
  entity_id: apple.id
  )
operasandwich.save!

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352193/og7ydrcrws0mfptwh4v2.jpg')
cafeopera = Location.new(
  address: "9 Rue de Mogador, 75009 Paris",
  name: "Café de l'Opéra",
  category: "Bistrot",
  entity_id: apple.id
  )
cafeopera.photo.attach(io: file, filename: 'cafeopera.jpg', content_type: 'image/jpg')
cafeopera.save!

puts 'Finished!'

puts 'Creating events...'
lunch_two = Event.new(
  location_id: favori.id,
  user_id: jo.id,
  start_at: Time.strptime('02/27/2021 12:45', '%m/%d/%Y %H:%M'),
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
  user_id: demoman.id,
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

Review.create!(
  location_id: thai.id,
  comment: "Really good Loc Lac.",
  rating: 4,
  user_id: igo.id
  )

puts 'Finished!'
