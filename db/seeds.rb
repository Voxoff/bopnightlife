User.destroy_all
Promotion.destroy_all
Nightclub.destroy_all

hamish = User.create(
  admin: true,
  email: 'test@test.com',
  password: 'password'
)

pete = Nightclub.create(
  name: "Sneaky Pete's",
  capacity: 100,
  price_house_wine: '4',
  description: "We welcome open minds with open ears",
  style: "Jazz and Dance",
  cheapest_lager: "2.50",
  cheapest_shot: "2",
  cheapest_mixer: "3.50",
  address: Address.create(
    first_line: "73 Cowgate Street",
    city: "Edinburgh",
    postcode: "EH1 1JW"
  )
)

file = File.open("#{Rails.root.join('app', 'assets', 'images', 'sneaky_pete.png')}")
pete.photo.attach(io:file, filename: 'sneakylogo.png', content_type: 'image/png')

bongo = Nightclub.create(
  name: "The Bongo Club",
  capacity: 300,
  price_house_wine: '5',
  description: "Pushing the boundaries of the Edinburgh scene since 1996",
  style: "Garage",
  cheapest_lager: "4",
  cheapest_shot: "3",
  cheapest_mixer: "5",
  address: Address.create(
    first_line: "66 Cowgate Street",
    postcode: "EH1 1JX",
    city: "Edinburgh"
  )
)

file = File.open("#{Rails.root.join('app', 'assets', 'images', 'bongo.jpg')}")
bongo.photo.attach(io:file, filename: 'bongo_logo.png', content_type: 'image/png')

bergain = Nightclub.create(
  name: "Berghain",
  capacity: 1500,
  description: "World capital of techno",
  style: "Austere Techno",
  cheapest_lager: "5",
  cheapest_shot: "6",
  cheapest_mixer: "7",
  address: Address.create(
    first_line: "Am Wriezener Bahnhof",
    postcode: "10243",
    city: "Berlin"
  )
)

file = File.open("#{Rails.root.join('app', 'assets', 'images', 'berghain.png')}")
bergain.photo.attach(io:file, filename: 'b_logo.jpg', content_type: 'image/jpg')

Promotion.create(
  code: "BERG",
  active: true,
  nightclub: Nightclub.first,
  description: "£3 off entry"
)

Promotion.create(
  code: "FREE",
  active: true,
  nightclub: Nightclub.second,
  description: "Free entry"
)

Promotion.create(
  code: "VKx2",
  active: true,
  nightclub: Nightclub.second,
  description: "Free VK"
)

Promotion.create(
  code: "EXP",
  active: false,
  nightclub: Nightclub.second,
  description: "expired"
)



