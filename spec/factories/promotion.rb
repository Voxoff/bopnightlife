FactoryBot.define do
  factory :promotion do
    active { false }
    nightclub { create(:nightclub) }
    description { "A free VK" }
  end
end
