class Address < ApplicationRecord
  validate :presence, :first_line, :postcode
  has_one :nightclub

  def to_s
    "#{self.first_line}, #{self.city}, #{self.postcode}"
  end

end
