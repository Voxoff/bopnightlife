class Address < ApplicationRecord
  validate :presence, :first_line, :postcode
  has_one :nightclub
end
