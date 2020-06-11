FactoryBot.define do
  factory :nightclub do
    transient do
      queue_time { 10 }
    end
    name { "The Berghain" }
    description  { "Epic" }
    after(:build) do |nightclub|
      nightclub.address ||= FactoryBot.build(:address, nightclub, nightclub)
    end
    # address { build(:address,  nightclub: nightclub) }
    opening_hour { build(:opening_hour) }
  end
end
