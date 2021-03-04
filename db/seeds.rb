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
philou = User.new(
  firstname: "phil",
  lastname: "Man",
  nickname: "philipp",
  email: "phil@lewagon.org",
  password: "azerty"
  )
avatar_api_response = JSON.parse(open('https://randomuser.me/api/?gender=male').read)
avatar_url = avatar_api_response['results'].first['picture']['thumbnail']
file = URI.open(avatar_url)
philou.photo.attach(io: file, filename: 'philou.jpg', content_type: 'image/jpg')
philou.save!

jo = User.new(
  firstname: "Joseph",
  lastname: "Dulac",
  nickname: "Jo",
  email: "jo@lewagon.org",
  password: "azerty"
  )

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614779955/dychum6hnnadtdhbws1b.jpg')
jo.photo.attach(io: file, filename: 'jo.jpg', content_type: 'image/jpg')
jo.save!

gab = User.new(
  firstname: "Gabriel",
  lastname: "Lebrun",
  nickname: "Gab",
  email: "gab@lewagon.org",
  password: "azerty"
  )
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614779989/pfldxp9wkrydk1c5f3wn.jpg')
gab.photo.attach(io: file, filename: 'gab.jpg', content_type: 'image/jpg')
gab.save!

kez = User.new(
  firstname: "Keziah",
  lastname: "Smadja",
  nickname: "Kez",
  email: "kez@lewagon.org",
  password: "azerty"
  )
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614780017/iwvdnlofh6y5ihksskmd.jpg')
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
file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614780042/oeauebvo6vy4aqrakqse.jpg')
igo.photo.attach(io: file, filename: 'igor.jpg', content_type: 'image/jpg')
igo.save!

puts 'Finished!'

puts 'Creating user_entities...'
UserEntity.create!(
  user_id: philou.id,
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
  user_id: philou.id,
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
  address: "104 Rue Oberkampf, 75011 Paris",
  name: "Barracao",
  category: "Bar",
  bar: true,
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

file = URI.open('https://res.cloudinary.com/dz1ndp7wi/image/upload/v1614352314/pjlcbkatupodl8drntmf.jpg')
psang = Location.new(
  address: "55 Rue Oberkampf, 75011 Paris",
  name: "Pierre Sang",
  category: "Asian",
  entity_id: wagon.id
  )
psang.photo.attach(io: file, filename: 'psang.jpg', content_type: 'image/jpg')
psang.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614851220/btdkicmovcddjppttmp1.png')
kazbar = Location.new(
  address: "86 Ave Parmentier, 75011 Paris",
  name: "Le KazBar",
  category: "Bar",
  bar: true,
  entity_id: wagon.id
  )
kazbar.photo.attach(io: file, filename: 'kazbar.jpg', content_type: 'image/jpg')
kazbar.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614870998/tnmbsbibfy5s2dezorhj.jpg')
murphy = Location.new(
  address: "128 Rue Oberkampf, 75011 Paris",
  name: "Le Murphy's",
  category: "Bar",
  bar: true,
  entity_id: wagon.id
  )
murphy.photo.attach(io: file, filename: 'murphy.png', content_type: 'image/png')
murphy.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614871162/tcgnzma2qftcluu4wvv7.jpg')
gardette = Location.new(
  address: "24 Rue Saint-Ambroise, 75011 Paris",
  name: "Le Square Gardette",
  category: "Bistrot",
  entity_id: wagon.id
  )
gardette.photo.attach(io: file, filename: 'gardette.png', content_type: 'image/png')
gardette.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614868941/kfn9s19giaum9vlm6ix5.jpg')
cuivres = Location.new(
  address: "68 Avenue de la République, 75011 Paris",
  name: "Les cuivres",
  category: "Bistrot",
  entity_id: wagon.id
  )
cuivres.photo.attach(io: file, filename: 'cuivres.jpg', content_type: 'image/png')
cuivres.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614869307/w1mwrmc4rmwqxpsxop0r.jpg')
onze = Location.new(
  address: "83 Rue Jean-Pierre Timbaud, 75011 Paris",
  name: "Onze Bar",
  category: "Bar",
  bar: true,
  entity_id: wagon.id
  )
onze.photo.attach(io: file, filename: 'onze.jpg', content_type: 'image/png')
onze.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614869823/ej68qpvdc1ep4j9zvhjx.jpg')
canon = Location.new(
  address: "57 Rue de la Fontaine au Roi, 75011 Paris",
  name: "La Canonnière",
  bar: true,
  entity_id: wagon.id
  )
canon.photo.attach(io: file, filename: 'canon.jpg', content_type: 'image/png')
canon.save!

file = URI.open ('http://res.cloudinary.com/dz1ndp7wi/image/upload/v1614870009/virpd45aamwpvhijymsy.jpg')
ledixsept = Location.new(
  address: "17 Rue de la Folie Méricourt, 75011 Paris",
  name: "Le 17",
  bar: true,
  entity_id: wagon.id
  )
ledixsept.photo.attach(io: file, filename: 'ledixsept.jpg', content_type: 'image/png')
ledixsept.save!

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
  user_id: philou.id,
  start_at: Time.strptime('03/05/2021 20:30', '%m/%d/%Y %H:%M'),
  public: true,
  capacity: rand(2..6)
  )
lunch_public.save!


lunch_public_two = Event.new(
  location_id: murphy.id,
  user_id: kez.id,
  start_at: Time.strptime('03/05/2021 21:30', '%m/%d/%Y %H:%M'),
  public: true,
  capacity: rand(2..6)
  )
lunch_public_two.save!

lunch_public_three = Event.new(
  location_id: kazbar.id,
  user_id: gab.id,
  start_at: Time.strptime('03/05/2021 22:30', '%m/%d/%Y %H:%M'),
  public: true,
  capacity: rand(2..6)
  )
lunch_public_three.save!

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
lunch_three_attendee_one.save!


lunch_public_attendee_one = Attendee.new(
  user_id: kez.id,
  event_id: lunch_public.id,
  status: 0
  )
lunch_public_attendee_one.save!

lunch_public_attendee_two = Attendee.new(
  user_id: gab.id,
  event_id: lunch_public.id,
  status: 2
  )
lunch_public_attendee_two.save!

puts 'Finished!'

puts 'Creating reviews...'

Review.create!(
  location_id: barracao.id,
  comment: "Take away beer does the trick.",
  rating: 4,
  user_id: jo.id
  )

Review.create!(
  location_id: bocamexa.id,
  comment: "Not bad.",
  rating: 4,
  user_id: tom.id
  )

Review.create!(
  location_id: cuivres.id,
  comment: "Very good place to eat.",
  rating: 5,
  user_id: igo.id
  )

Review.create!(
  location_id: favori.id,
  comment: "The n°75 is decent Paris style ham sandwich.",
  rating: 4,
  user_id: gab.id
  )

Review.create!(
  location_id: onze.id,
  comment: "If you like cocktails!",
  rating: 5,
  user_id: gab.id
  )

Review.create!(
  location_id: favori.id,
  comment: "The Special sandwich is really great.",
  rating: 5,
  user_id: jo.id
  )
Review.create!(
  location_id: surpriz.id,
  comment: "The best Berlin style Kebab house in Paris.",
  rating: 4,
  user_id: jo.id
  )

Review.create!(
  location_id: surpriz.id,
  comment: "I've been going for years.",
  rating: 5,
  user_id: tom.id
  )

Review.create!(
  location_id: tchai.id,
  comment: "Good value for money.",
  rating: 4,
  user_id: kez.id
  )

Review.create!(
  location_id: tchai.id,
  comment: "A decent biriani.",
  rating: 3,
  user_id: igo.id
  )

Review.create!(
  location_id: canon.id,
  comment: "Simply canon!",
  rating: 5,
  user_id: igo.id
  )

Review.create!(
  location_id: ledixsept.id,
  comment: "One for the road.",
  rating: 5,
  user_id: igo.id
  )

Review.create!(
  location_id: gardette.id,
  comment: "For special occassions.",
  rating: 4,
  user_id: tom.id
  )

puts 'Finished!'
