FactoryBot.define do
  factory :nightclub do
      queue_time { 10 }
    # transient do
    # end
    sequence :name do |n|
      "The Berghain v#{n}"
    end
    description  { "Epic" }
    after(:build) do |nightclub|
      nightclub.address ||= FactoryBot.build(:address, nightclub: nightclub)
    end
    # address { build(:address,  nightclub: nightclub) }
    opening_hour { build(:opening_hour) }
  end
end
