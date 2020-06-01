FactoryBot.define do
  factory :nightclub do
    name { "Berhain" }
    description  { "Epic" }
    address { build(:address) }
  end
end
