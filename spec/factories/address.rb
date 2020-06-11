FactoryBot.define do
  factory :address do
    first_line { "Am Wauss" }
    postcode { "OX22" }

    after(:build) do |address|
      address.nightclub ||= FactoryBot.build(:nightclub, address: address)
    end
  end
end
