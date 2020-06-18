FactoryBot.define do
  factory :code do
    promotion
    activated { true }
  end
end
