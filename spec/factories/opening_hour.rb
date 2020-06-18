FactoryBot.define do
  factory :opening_hour do
    after(:build) do |opening_hour|
      opening_hour.nightclub ||= FactoryBot.build(:nightclub, opening_hour: opening_hour)
    end
    monday  { true }
    tuesday  { true }
    wednesday  { true }
    thursday  { true }
    friday  { true }
    saturday  { true }
    sunday  { true }
  end
end
