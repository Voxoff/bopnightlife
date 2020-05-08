require 'open-uri'

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

file = URI.open("https://lh3.googleusercontent.com/proxy/8d-vzMJxrwtO4MA4qGRMc-SA_7JKau2nM6zPXd46fF2Qh63dPpUshBccm4MoA5jnuRFjAZPWHVia2NNSPfsb7qtw8l9IMGtdihVuDGmAd4tiFpoBKvC2e3nKEQCSt6jyK-SQyw")
pete.photo.attach(io:file, filename: 'logo.png', content_type: 'image/png')

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

file = URI.open("https://www.thebongoclub.co.uk/wp-content/themes/twentythirteen-bc/images/bongo/Bongo_logo_white.png")
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

file = URI.open("https://cdn.berghain.berlin/static/berghain/og-image.b855a38944f6.jpg")
bergain.photo.attach(io:file, filename: 'b_logo.png', content_type: 'image/jpg')

