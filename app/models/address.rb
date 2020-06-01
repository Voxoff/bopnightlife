class Address < ApplicationRecord
  validates :first_line, :postcode, presence: true

  belongs_to :nightclub

  def to_s
    "#{self.first_line}, #{self.city}, #{self.postcode}"
  end

end
