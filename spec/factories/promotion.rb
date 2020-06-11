FactoryBot.define do
  factory :promotion do
    transient do
      active { false }
    end
    nightclub { create(:nightclub) }
    description { "A free VK" }
  end
end
