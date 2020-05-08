Nightclub.create(
  name: "Sneaky Pete's",
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

Nightclub.create(
  name: "The Bongo Club",
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

Nightclub.create(
  name: "Berghain",
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
