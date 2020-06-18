FactoryBot.define do
  factory :nightclub do
    queue_time { 10 }
    sequence :name do |n|
      "The Berghain v#{n}"
    end
    description  { "Epic" }
    after(:build) do |nightclub|
      nightclub.address ||= FactoryBot.build(:address, nightclub: nightclub)
      nightclub.opening_hour ||= FactoryBot.build(:opening_hour, nightclub: nightclub)
    end
    # opening_hour { build(:opening_hour, nightclub: self)}
  end
end
